import os, sys, collections, shutil, subprocess, threading

# -------------------------- possible customization section - start
# os.environ['JUGGLER_DEFNS'] = r'c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns'
# os.environ['JUGGLER_AUTOHOTKEY_SCRIPT'] = r'c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\ahk\juggler.ahk'
# -------------------------- possible customization section - end

JUGGLER_DEFNS = os.getenv("JUGGLER_DEFNS")
JUGGLER_AUTOHOTKEY_SCRIPT = os.getenv("JUGGLER_AUTOHOTKEY_SCRIPT")

VS_window_signature = 'ahk_exe devenv.exe'
# VS_window_signature = 'ahk_class HwndWrapper'
# VS_window_signature = 'Microsoft Visual Studio'

# --------------------------


assert JUGGLER_DEFNS
assert JUGGLER_AUTOHOTKEY_SCRIPT

langs = 'global python javascript'.split()

# map from lang to abbrev to the file the backs the abbrev
autohotkey_defns = collections.defaultdict(dict)

def process_lang(lang):
    for fn in os.listdir(os.path.join(JUGGLER_DEFNS, lang)):
        fn2 = os.path.join(JUGGLER_DEFNS, lang, fn)
        autohotkey_defns[lang][fn] = fn2
    local_dir = os.path.join(JUGGLER_DEFNS, lang, 'local')
    if os.path.exists(local_dir):
        for fn in os.listdir(local_dir):
            fn2 = os.path.join(local_dir, fn)
            autohotkey_defns[lang][fn] = fn2
    print autohotkey_defns

def get_single_expansion(editor, lang, abbrev):
    cblk = ''
    cblk += ':R:%s::\n' % (abbrev)
    cblk += '  Handle_%s("%s", "%s")\n' % \
            (editor, lang, autohotkey_defns[lang][abbrev].replace('\\','\\\\'))
    cblk += '  return\n'
    return cblk

def writeout_ahk_scripts():
    with open(JUGGLER_AUTOHOTKEY_SCRIPT) as f:
        lines = []
        magic = 0
        blockstart = -1
        for line in f:
            if line == ';; JUGGLER CONTROL BLOCK START\n':
                lines.append(line)
                blockstart = len(lines)
                magic += 1
            elif line == ';; JUGGLER CONTROL BLOCK STOP\n':
                lines.append(line)
                magic += 1
            else:
                if magic != 1:
                    lines.append(line)
        assert magic == 2

    cblk = ''
    langs = list(sorted(autohotkey_defns.keys()))
    langs.remove('global')
    langs.append('global')

    def createAutohotkeyFunc(editor):
        out = 'Handle_%s(lang, abbrev)' % (editor)
        out += """
{
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
"""
        if editor == 'emacs':
            out += '  SendInput, !xjuggler-copy-start-of-line-context{Enter}\n'
        elif editor == 'VS':
            out += '  Send, X+{Home}+{Home}^c\n'
        out += """
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, first ClipWait timed out.
    return
  }
  Contents := Clipboard
"""
        if editor == 'emacs':
            out += '  StartOfLineContext := Contents\n'
        elif editor == 'VS':
            out += '  StartOfLineContext := SubStr(Contents, 1, -1)\n'
            out += '  Send, ^v{Backspace}\n'
        out += '  Fn := "c:\\\\temp\\\\jugglerbot\\\\triggers\\\\" . A_Now\n'
        out += '  FileContents := abbrev . "`n" . StartOfLineContext\n'
        out += '  Clipboard =  ; Enable ClipWait to work\n'
        out += '  FileAppend, %FileContents%, %Fn%\n'
        out += """  ClipWait 2
  if ErrorLevel
  {
    MsgBox, second ClipWait timed out.
    return
  }
"""
        if editor == 'emacs':
            out += '  Send, ^y\n'
        else:
            out += '  Send, ^v\n'
        out += '  Sleep 500\n' # wait for paste op to take effect 
        out += '  Clipboard = %ClipboardOld%\n'

        # figure out how many spaces to go back
        out += """
  LapFile := Fn . ".lap"
  IfExist, %LapFile%
  {
;    MsgBox, Reading Lapfile of %LapFile%
    FileReadLine, LeftArrowPresses, %LapFile%, 1
;    MsgBox, LeftArrowPresses is %LeftArrowPresses%
    Loop %LeftArrowPresses% {
      SendInput {Left}
    }
  }
}
"""    
        return out

    cblk += createAutohotkeyFunc('emacs')
    cblk += createAutohotkeyFunc('VS')

    for lang in langs:
        abbrevs = autohotkey_defns[lang]
        if lang == 'python':
            cblk += '\n\n;; Begin python\n'
            cblk += '#IfWinActive Emacs/Python\n'
            for abbrev in sorted(abbrevs.keys()):
                cblk += get_single_expansion('emacs', lang, abbrev)
            cblk += '#IfWinActive\n'
            cblk += '#IfWinActive %s\n' % (VS_window_signature)
            for abbrev in sorted(abbrevs.keys()):
                cblk += get_single_expansion('VS', lang, abbrev)
            cblk += '#IfWinActive\n'
        elif lang == 'global':
            cblk += '\n\n;; Begin globals\n'
            cblk += '#IfWinActive Emacs/\n'
            for abbrev in sorted(abbrevs.keys()):
                cblk += get_single_expansion('emacs', lang, abbrev)
            cblk += '#IfWinActive\n'
            cblk += '#IfWinActive %s\n' % (VS_window_signature)
            for abbrev in sorted(abbrevs.keys()):
                cblk += get_single_expansion('VS', lang, abbrev)
            cblk += '#IfWinActive\n'

    print cblk

    with open(JUGGLER_AUTOHOTKEY_SCRIPT + '.tmp', 'w') as f:
        lineno = 1
        for line in lines:
            f.write(line)
            if lineno == blockstart:
                f.write(cblk)
            lineno += 1
        f.flush()
    shutil.move(JUGGLER_AUTOHOTKEY_SCRIPT + '.tmp', JUGGLER_AUTOHOTKEY_SCRIPT)

    trigger_file = JUGGLER_AUTOHOTKEY_SCRIPT + '.trigger'
    if os.access(trigger_file,os.F_OK):
        os.remove(trigger_file)
    with open(trigger_file+'.tmp','w') as f:
        f.write('hello, world\n')
        f.close()
    shutil.move(trigger_file + '.tmp', trigger_file)

def main():
    for lang in os.listdir(JUGGLER_DEFNS):
        if lang in langs:
            process_lang(lang)
    writeout_ahk_scripts()

if __name__ == "__main__": # when run as a script
    main()
