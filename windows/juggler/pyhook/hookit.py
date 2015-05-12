import os, collections, threading, Queue, time
import win32api
import win32com.client
import pythoncom, pyHook

"""
MessageName: key down
Message: 256
Time: 112416317
Window: 197094
WindowName: Emacs/Python <ruttbe@LAGER>  hookit.py
Ascii: 120 x
Key: X
KeyID: 88
ScanCode: 45
Extended: 0
Injected: 0
Alt 0
Transition 0
"""

# Globals
last_window = None
bufs = { 'Emacs': { 'active_window' : None,
                    'buf': [] },
         'VS':    { 'active_window' : None,
                    'buf': [] } }
valid_abbrev_chars = [chr(x) for x in range(ord('0'), ord('0') + 10)]
valid_abbrev_chars += [chr(x) for x in range(ord('A'), ord('A') + 26)]
valid_abbrev_chars += [chr(x) for x in range(ord('a'), ord('a') + 26)]
shell = win32com.client.Dispatch("WScript.Shell")
JUGGLER_DEFNS = os.getenv("JUGGLER_DEFNS")
JUGGLER_AUTOHOTKEY_SCRIPT = os.getenv("JUGGLER_AUTOHOTKEY_SCRIPT")
assert JUGGLER_DEFNS
assert JUGGLER_AUTOHOTKEY_SCRIPT
langs = 'global python javascript'.split()
expanding_now = False

# map from lang to abbrev to text
defns = collections.defaultdict(dict)

class CommandThread(threading.Thread):
    def __init__(self, cmd):
        threading.Thread.__init__(self)
        self.cmd = cmd
    def run(self):
        (status, output) = commands.getstatusoutput(self.cmd)
        print 'CommandThread: (status, output) of [%s] is (%d, %s)' % \
            (self.cmd, status, output)

class HelperThread(threading.Thread):
    def __init__(self, q):
        threading.Thread.__init__(self)
        self.q = q
    def run(self):
        while True:
            item = q.get()
            if item is None:
                break
            action, arg = item
            if action == 'SendKeys':
                time.sleep(1)
                shell.SendKeys(arg)
q = Queue.Queue()
helper = HelperThread(q)                
helper.setDaemon(True)
helper.start()

def process_lang(lang):
    for fn in os.listdir(os.path.join(JUGGLER_DEFNS, lang)):
        fn2 = os.path.join(JUGGLER_DEFNS, lang, fn)
        with open(fn2) as f:
            txt = f.read()
            defns[lang][fn] = txt
    print defns

def sendkeys(keystrokes):
    print 'sendkeys(%s) called' % (repr(keystrokes))
    shell.SendKeys(keystrokes)

# see http://ss64.com/vb/sendkeys.html or better yet https://msdn.microsoft.com/en-us/library/aa266279%28v=vs.60%29.aspx
def executeAbbrevEmacs(lang, abbrev):
    global expanding_now
    if lang in defns:
        if abbrev in defns[lang]:
            assert not expanding_now
            expanding_now = True
            replacement = defns[lang][abbrev]
            sendkeys("{BACKSPACE}" * len(abbrev))
            replacements = []
            lastChar = None
            for char in replacement:
                if char == '\n':
                    if len(replacements) > 0 and replacements[-1] == '\r':
                        replacements[-1] = '\r\n'
                    else:
                        replacements.append('\n')
                elif char == 'l' and lastChar == '\\':
                    replacements[-1] = '\\l'
                elif char == 'r' and lastChar == '\\':
                    replacements[-1] = '\\r'
                elif char == '>' and len(replacements) >= 9 and replacements[-9:] == ['<','e','n','d','p','o','i','n','t']:
                    replacements[-9:] = ['<endpoint>']
                else:
                    replacements.append(char)
                lastChar = char
            print 'replacements are', replacements
            endpointActive = False
            for sequence in replacements:
                if sequence in ['\n', '\r\n']:
                    sendkeys("^o^f")
                elif sequence == r'\l':
                    sendkeys("{Left}")
                elif sequence == r'\r':
                    sendkeys("{Right}")
                elif sequence == ':':
                    sendkeys("^q:")
                elif sequence in ['{', '}', '[', ']', '+', '^', '%', '~', '(', ')']:
                    sendkeys("{%s}" % (sequence))
                elif sequence == '<endpoint>':
                    sendkeys("%xjuggler-make-endpoint-marker{ENTER}")
                    endpointActive = True
                else:
                    sendkeys(sequence)
            if endpointActive:
                sendkeys("%xjuggler-goto-endpoint-marker{ENTER}")
            expanding_now = False
            return True
    return False

def executeAbbrevVS(lang, abbrev):
    # global executing_now
    # if lang in defns:
    #     if abbrev in defns[lang]:
    #         replacement = defns[lang][abbrev]
    #         executing_now = True
    #         shell.SendKeys("{BACKSPACE}" * len(abbrev))
    #         replacements = []
    #         for char in replacement:
    #             if char == '\n':
    #                 if len(replacements) > 0 and replacements[-1] == '\r':
    #                     replacements[-1] = '\r\n'
    #                 else:
    #                     replacements.append('\n')
    #             else:
    #                 replacements.append(char)
    #         print 'replacements are', replacements
    #         for sequence in replacements:
    #             if sequence in ['\n', '\r\n']:
    #                 shell.SendKeys("{ENTER}")
    #             else:
    #                 shell.SendKeys(sequence)
    #         executing_now = False
    #         return True
    return False

"""
x bar7 foo foo foo foo foo foo 
 bar7
 ff
 lklkjlkj bar7
 bar7
   x y z bar7
 if foo:
"""

def get_editor(event):
    window = event.WindowName
    if window.startswith("Emacs/"):
        return 'Emacs'
    elif 'Microsoft Visual Studio' in window:
        return 'VS'
    return None

# import win32ui
# wnd = win32ui.GetForegroundWindow()
# print wnd.GetWindowText()

def get_lang(event):
    if event.WindowName.startswith("Emacs/") and '<' in event.WindowName:
        return event.WindowName.split('Emacs/')[1].split('<')[0].strip().lower()
    return None

def try_expand_abbrev(editor, candidate, event):
    lang = get_lang(event)
    executed = False
    cmd = 'executeAbbrev' + editor
    execution_cmd = globals()[cmd]
    if lang:
        executed = execution_cmd(lang, candidate)
        print '%s(%s, %s) returned %s' % (cmd, lang, candidate, executed)
    if not executed:
        print '%s(%s, %s) in global returned %s' % (cmd, 'global', candidate, executed)
        executed = execution_cmd('global', candidate)
    return executed

def intercepted_VS_keys(event):
    if event.Ascii == 14: # Ctrl-n
        # sendkeys('{DOWN}')
        q.put(('SendKeys', "{DOWN}"))
    elif event.Ascii == 16: # Ctrl-p
        # sendkeys('{UP}')
        q.put(('SendKeys', "{UP}"))
    else:
        return False
    return True

def OnKeyUp(event):
    print 'key up event:', event
    if not q.empty():
        try:
            item = q.get_nowait()
            action, arg = item
            if action == "SendKeys":
                sendkeys(arg)
        except Queue.Empty:
            pass

def OnKeyDown(event):
    if expanding_now:
        return True
    print 'key down event:', event
    editor = get_editor(event)
    if not editor:
        return True
    global last_window, bufs
    print bufs

    # intercept for VS first
    if editor == 'VS':
        intercepted = intercepted_VS_keys(event)
        if intercepted:
            return False

    prev_window, buf = bufs[editor]['active_window'], bufs[editor]['buf']
    if prev_window is None:
        assert buf == []
        bufs[editor]['active_window'] = event.Window
    elif event.Window != prev_window:
        bufs[editor]['active_window'] = event.Window
        bufs[editor]['buf'] = []
        return True
    k = event.Ascii
    if chr(k) in valid_abbrev_chars:
        buf.append(chr(k))
    else:
        if chr(k) == ' ':
            candidate = ''.join(buf)
            executed = try_expand_abbrev(editor, candidate, event)
            bufs[editor]['buf'] = []
            if executed:
                return False # disable other handlers
            
        bufs[editor]['buf'] = []

    # print 'MessageName:',event.MessageName
    # print 'Message:',event.Message
    # print 'Time:',event.Time
    # print 'Window:',event.Window
    # print 'WindowName:',event.WindowName
    print 'Ascii:', event.Ascii, chr(event.Ascii)
    # print 'Key:', event.Key
    # print 'KeyID:', event.KeyID
    # print 'ScanCode:', event.ScanCode
    # print 'Extended:', event.Extended
    # print 'Injected:', event.Injected
    # print 'Alt', event.Alt
    # print 'Transition', event.Transition
    # print '---'

    # return True to pass the event to other handlers
    return True

def main():
    for lang in os.listdir(JUGGLER_DEFNS):
        if lang in langs:
            process_lang(lang)

    # create a hook manager
    hm = pyHook.HookManager()
    # watch for all key events
    hm.KeyDown = OnKeyDown
    hm.KeyUp = OnKeyUp
    # set the hook
    hm.HookKeyboard()
    # wait forever
    pythoncom.PumpMessages()

if __name__ == "__main__": # when run as a script
    main()

