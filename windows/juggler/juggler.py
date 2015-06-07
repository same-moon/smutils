import os, sys, collections, shutil, subprocess, threading

# os.environ['JUGGLER_DEFNS'] = r'c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns'
# os.environ['JUGGLER_AUTOHOTKEY_SCRIPT'] = r'c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\ahk\juggler.ahk'

JUGGLER_DEFNS = os.getenv("JUGGLER_DEFNS")
JUGGLER_AUTOHOTKEY_SCRIPT = os.getenv("JUGGLER_AUTOHOTKEY_SCRIPT")

assert JUGGLER_DEFNS
assert JUGGLER_AUTOHOTKEY_SCRIPT

langs = 'global python javascript'.split()

# map from lang to abbrev to text
autohotkey_defns = collections.defaultdict(dict)

def process_lang(lang):
    for fn in os.listdir(os.path.join(JUGGLER_DEFNS, lang)):
        fn2 = os.path.join(JUGGLER_DEFNS, lang, fn)
        with open(fn2) as f:
            txt = f.read()
            autohotkey_defns[lang][fn] = txt
    print autohotkey_defns

def get_single_expansion(editor, lang, abbrev, expansion):
    cblk = ''
    cblk += ':R:%s::\n' % (abbrev)
    expansion_has_newline = '\n' in expansion
    cblk += '  AutoTrim Off\n'
    CLIPWAIT1 = """  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
"""
    CLIPWAIT2 = """  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
"""
    cblk += '  ClipboardOld = %ClipboardAll%\n'
    cblk += '  Clipboard =  ; Enable ClipWait to work\n'
    if editor == 'emacs':
        cblk += '  SendInput, !xjuggler-copy-start-of-line-context{Enter}\n'
    else:
        cblk += '  Send, {Space}+{Home}+{Home}^c\n'
    cblk += CLIPWAIT1
    cblk += '  Contents := Clipboard\n'
    if editor == 'emacs':
        cblk += '  StartOfLineContext := Contents\n'
    else:
        cblk += '  StartOfLineContext := SubStr(Contents, 1, -1)\n'
    if editor == 'VS':
        cblk += '  Send, ^v{Backspace}\n'
    cblk += '  Fn := "c:\\\\temp\\\\jugglerbot\\\\triggers\\\\" . A_Now\n'
    cblk += '  FileContents := "%s`n" . StartOfLineContext\n' % \
            (os.path.join(JUGGLER_DEFNS, lang, abbrev))
    # cblk += '  FileContents := "foo`n" . StartOfLineContext\n'
    cblk += '  Clipboard =  ; Enable ClipWait to work\n'
    cblk += '  FileAppend, %FileContents%, %Fn%\n'
    cblk += CLIPWAIT2
    if editor == 'emacs':
        cblk += '  Send, ^y\n'
    else:
        cblk += '  Send, ^v\n'
    cblk += '  Sleep 1000\n' # wait for paste op to take effect 
    cblk += '  Clipboard = %ClipboardOld%\n'

    # figure out how many spaces to go back
    cblk += """
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
"""    
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
    for lang in langs:
        abbrevs = autohotkey_defns[lang]
        if lang == 'python':
            cblk += '\n\n;; Begin python\n'
            cblk += '#IfWinActive Emacs/Python\n'
            for abbrev in sorted(abbrevs.keys()):
                expansion = abbrevs[abbrev]
                cblk += get_single_expansion('emacs', lang, abbrev, expansion)
            cblk += '#IfWinActive\n'
            cblk += '#IfWinActive ahk_exe devenv.exe\n'
            for abbrev in sorted(abbrevs.keys()):
                expansion = abbrevs[abbrev]
                cblk += get_single_expansion('VS', lang, abbrev, expansion)
            cblk += '#IfWinActive\n'
        elif lang == 'global':
            cblk += '\n\n;; Begin globals\n'
            cblk += '#IfWinActive Emacs/\n'
            for abbrev in sorted(abbrevs.keys()):
                expansion = abbrevs[abbrev]
                cblk += get_single_expansion('emacs', lang, abbrev, expansion)
            cblk += '#IfWinActive\n'
            cblk += '#IfWinActive ahk_exe devenv.exe\n'
            for abbrev in sorted(abbrevs.keys()):
                expansion = abbrevs[abbrev]
                cblk += get_single_expansion('VS', lang, abbrev, expansion)
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
