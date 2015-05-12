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
    endpoint = False
    expansion_has_newline = '\n' in expansion
    if editor == 'emacs' and expansion_has_newline:
        cblk += '  SendInput, !xjuggler-get-start-of-line-context{Enter}\n'
    elif editor == 'VS' and expansion_has_newline:
        cblk += '  AutoTrim Off\n'
        cblk += '  ClipboardOld = %ClipboardAll%\n'
        cblk += '  Clipboard =  ; Enable ClipWait to work\n'
        cblk += '  SendInput, {Space}+{Home}+{Home}^c\n'
        cblk += '  ClipWait 1\n'
        cblk += '  if ErrorLevel  ; ClipWait timed out.\n    return\n'
        cblk += '  Contents := Clipboard\n'
        cblk += '  Contents2 := SubStr(Contents, 1, -1)\n'
        cblk += '  SendInput, ^v{Backspace}\n'
    tempfn = r'c:\temp\juggler-for-VS.txt'
    if editor == 'VS':
        cblk += '  tempf := FileOpen("%s", "w")\n' % (tempfn)
    loop_steps = 0
    for line in expansion.splitlines(True):
        loop_steps += 1
        if '\\e' in line:
            endpoint = True
        if editor == 'VS': # augment temp file to insert literally
            if loop_steps > 1:
                cblk += '  tempf.Write(Contents2)\n'
            line = line.replace('`','``')
            line = line.replace('"','""')
            line = line.replace('\r\n','`r`n')
            line = line.replace('\n','`r`n')
            line = line.replace('\t','`t')
            cblk += '  tempf.Write("%s")\n' % (line)
            continue
        line = line.replace('!', 'TEMP-BANG-PLACEHOLDER')
        line = line.replace('#', 'TEMP-POUND-PLACEHOLDER')
        line = line.replace('+', 'TEMP-PLUS-PLACEHOLDER')
        line = line.replace('^', 'TEMP-CARET-PLACEHOLDER')
        line = line.replace('{', 'TEMP-LBRACE-PLACEHOLDER')
        line = line.replace('}', 'TEMP-RBRACE-PLACEHOLDER')
        if editor == 'emacs':
            line = line.replace('\n', '^j!xjuggler-insert-start-of-line-context{Enter}')
        else:
            assert editor == 'VS'
            # last backspace is to counteract the extra space in the clipboard (which was done so shift-home works reliably)
            line = line.replace('\n', '{Enter}+{Backspace}{Backspace}^v{Backspace}')
        # line = line.replace('<in>', '    ')
        # line = line.replace('\\l', '{Left}')
        # line = line.replace('\\r', '{Right}')
        # line = line.replace('\\u', '{Up}')
        # line = line.replace('\\d', '{Down}')
        line = line.replace(' ', '{Space}')
        line = line.replace('TEMP-BANG-PLACEHOLDER', '{!}')
        line = line.replace('TEMP-POUND-PLACEHOLDER', '{#}')
        line = line.replace('TEMP-PLUS-PLACEHOLDER', '{+}')
        line = line.replace('TEMP-CARET-PLACEHOLDER', '{^}')
        line = line.replace('TEMP-LBRACE-PLACEHOLDER', '{{}')
        line = line.replace('TEMP-RBRACE-PLACEHOLDER', '{}}')

        # make emacs' : less electric
        if editor == 'emacs':
            line = line.replace(':', '^q:')

        if '\\e' in line:
            pos = line.find('\\e')
            if editor == 'emacs':
                line = line[0:pos] + '!xjuggler-make-endpoint-marker{Enter}' + line[pos+2:]
        cblk += '  SendInput, ' + line + '\n'
    if editor == 'VS':
        cblk += '  tempf.Close()\n'
        cblk += '  SendInput, !ex\n'
        cblk += '  Sleep, 500\n'
        cblk += '  SendInput, %s{Enter}\n' % (tempfn)
    if endpoint:
        if editor == 'emacs':
            cblk += '  SendInput, !xjuggler-goto-endpoint-marker{Enter}\n'
        elif editor == 'VS':
            cblk += '  SendInput, ^F\e!p!p{Esc}{Backspace}\n'
    if editor == 'VS' and expansion_has_newline:
        cblk += '  Clipboard = %ClipboardOld%\n'  

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
