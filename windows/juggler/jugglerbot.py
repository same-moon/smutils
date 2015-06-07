# Expand into any app via the clipboard.  Listens for files tossed in
# c:\temp\jugglerbot\triggers, and springs into action.  The first
# line of each trigger file will be the path to the abbreviation file
# to expand from.  The second line of the file, which will not be a
# complete line, will be any leading context to add to the front of
# each line.

import os, time, traceback, shutil

import pyperclip

import win32file
import win32event
import win32con

JUGGLERBOT_BASE_PATH = 'c:\\temp\\jugglerbot'
if not os.path.exists(JUGGLERBOT_BASE_PATH):
    os.mkdir(JUGGLERBOT_BASE_PATH)
JUGGLERBOT_TRIGGER_DIR = os.path.join(JUGGLERBOT_BASE_PATH, 'triggers')
if not os.path.exists(JUGGLERBOT_TRIGGER_DIR):
    os.mkdir(JUGGLERBOT_TRIGGER_DIR)

def handle_trigger(fn):
    if fn.endswith('.tmp') or fn.endswith('.lap'):
        return
    print('new trigger file: %s' % (fn))
    f = None
    last_exc = None
    for tries in range(2):
        try:
            f = open(os.path.join(JUGGLERBOT_TRIGGER_DIR, fn))
            break
        except Exception as e:
            last_exc = e
            time.sleep(1)
            tries += 1
    else:
        msg = "got exception of -->%s<--: traceback is -->%s<--" % (last_exc, traceback.format_exc())
        print 'file %s not openable' % (fn)
        print msg
        return
    abbrev_file = f.readline().strip()
    leading_context = f.read()
    print('leading context is -->%s<--' % (leading_context))
    if not os.path.exists(abbrev_file):
        print('abbrev file of %s does not exist' % (abbrev_file))
        return
    abbrev_text = None
    with open(abbrev_file) as f2:
        abbrev_text = f2.read()
    lines = abbrev_text.splitlines(True)
    lines2 = []
    n = 0
    for line in lines:
        if n == 0:
            lines2.append(line)
        else:
            lines2.append(leading_context + line)
        n += 1
    abbrev_text = ''.join(lines2)

    if r'\e' in abbrev_text:
        # calculate number of left-arrow presses to get back to
        # the endpoint
        pos = abbrev_text.find(r'\e')
        left_arrow_presses = len(abbrev_text) - pos - 2 # take off 2
                                                        # for the
                                                        # deleted \e
        abbrev_text = abbrev_text.replace(r'\e','')
        if left_arrow_presses > 0:
            print 'left arrow presses:  -->%d<--' % (left_arrow_presses)
            with open(os.path.join(JUGGLERBOT_TRIGGER_DIR, fn + '.lap.tmp'),
                      'w') as f3:
                f3.write('%d\n' % (left_arrow_presses))
                f3.close()
            shutil.move(os.path.join(JUGGLERBOT_TRIGGER_DIR, fn + '.lap.tmp'),
                        os.path.join(JUGGLERBOT_TRIGGER_DIR, fn + '.lap'))
        
    print 'abbrev text I calculated is -->%s<--' % (abbrev_text)
    pyperclip.copy(abbrev_text)
        
def watch_forever():
    path_to_watch = JUGGLERBOT_TRIGGER_DIR

    #
    # FindFirstChangeNotification sets up a handle for watching
    #  file changes. The first parameter is the path to be
    #  watched; the second is a boolean indicating whether the
    #  directories underneath the one specified are to be watched;
    #  the third is a list of flags as to what kind of changes to
    #  watch for. We're just looking at file additions / deletions.
    #
    change_handle = win32file.FindFirstChangeNotification (
        path_to_watch,
        0,
        win32con.FILE_NOTIFY_CHANGE_FILE_NAME
    )

    #
    # Loop forever, listing any file changes. The WaitFor... will
    #  time out every half a second allowing for keyboard interrupts
    #  to terminate the loop.
    #
    try:

        old_path_contents = dict ([(f, None) for f in os.listdir (path_to_watch)])
        while 1:
            result = win32event.WaitForSingleObject (change_handle, 500)
    
            #
            # If the WaitFor... returned because of a notification (as
            #  opposed to timing out or some error) then look for the
            #  changes in the directory contents.
            #
            if result == win32con.WAIT_OBJECT_0:
                new_path_contents = dict ([(f, None) for f in os.listdir (path_to_watch)])
                added = [f for f in new_path_contents if not f in old_path_contents]
                deleted = [f for f in old_path_contents if not f in new_path_contents]
                if added:
                    print "Added: ", ", ".join (added)
                    for fn in added:
                        handle_trigger(fn)
                if deleted: print "Deleted: ", ", ".join (deleted)
      
                old_path_contents = new_path_contents
                win32file.FindNextChangeNotification (change_handle)
  
    finally:
        win32file.FindCloseChangeNotification (change_handle)

if __name__ == "__main__":
    watch_forever()
