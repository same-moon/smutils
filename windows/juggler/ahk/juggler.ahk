#Persistent
SetTimer, JugglerCheckForRefresh, 10000
return
JugglerCheckForRefresh:
    EnvGet, JugglerRefreshFile, JUGGLER_AUTOHOTKEY_SCRIPT
    JugglerRefreshFile2 := JugglerRefreshFile . ".trigger"
    IfExist, %JugglerRefreshFile2%
        Reload
    IfExist, %JugglerRefreshFile2%
        FileDelete, %JugglerRefreshFile2%
    return

;; JUGGLER CONTROL BLOCK START


;; Begin python
#IfWinActive Emacs/Python
:R:argparseargx::
  SendInput, parser.add_argument("!xjuggler-make-endpoint-marker{Enter}",{Space}type=str,{Space}help="")
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:argparseoptx::
  SendInput, parser.add_argument("-!xjuggler-make-endpoint-marker{Enter}",{Space}"--",{Space}action="store_true",{Space}help="")
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:argparsex::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, import{Space}argparse^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, parser{Space}={Space}argparse.ArgumentParser()^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, parser.add_argument("-v",{Space}"--verbose",{Space}help="increase{Space}output{Space}verbosity",{Space}action="store_true")^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, args{Space}={Space}parser.parse_args()!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:classx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, class{Space}!xjuggler-make-endpoint-marker{Enter}(object)^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}def{Space}__init__(self)^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}{Space}{Space}{Space}{Space}pass
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:elapsedx::
  SendInput, elapsed{Space}={Space}t2{Space}-{Space}t1!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:elseifx::
  SendInput, elif{Space}!xjuggler-make-endpoint-marker{Enter}^q:
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:funcx::
  SendInput, def{Space}!xjuggler-make-endpoint-marker{Enter}()^q:
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:ifx::
  SendInput, if{Space}!xjuggler-make-endpoint-marker{Enter}^q:
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:mainx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, if{Space}__name__{Space}=={Space}"__main__"^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:pdbx::
  SendInput, import{Space}pdb;{Space}pdb.set_trace()!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:sleepx::
  SendInput, time.sleep(!xjuggler-make-endpoint-marker{Enter})
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:t1x::
  SendInput, t1{Space}={Space}time.time()!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:t2x::
  SendInput, t2{Space}={Space}time.time()!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:timex::
  SendInput, time.time()!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
#IfWinActive
#IfWinActive ahk_exe devenv.exe
:R:argparseargx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("parser.add_argument(""\e"", type=str, help="""")")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:argparseoptx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("parser.add_argument(""-\e"", ""--"", action=""store_true"", help="""")")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:argparsex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, {Space}+{Home}+{Home}^c
  ClipWait 1
  if ErrorLevel  ; ClipWait timed out.
    return
  Contents := Clipboard
  Contents2 := SubStr(Contents, 1, -1)
  SendInput, ^v{Backspace}
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("import argparse`r`n")
  tempf.Write(Contents2)
  tempf.Write("parser = argparse.ArgumentParser()`r`n")
  tempf.Write(Contents2)
  tempf.Write("parser.add_argument(""-v"", ""--verbose"", help=""increase output verbosity"", action=""store_true"")`r`n")
  tempf.Write(Contents2)
  tempf.Write("args = parser.parse_args()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:classx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, {Space}+{Home}+{Home}^c
  ClipWait 1
  if ErrorLevel  ; ClipWait timed out.
    return
  Contents := Clipboard
  Contents2 := SubStr(Contents, 1, -1)
  SendInput, ^v{Backspace}
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("class \e(object):`r`n")
  tempf.Write(Contents2)
  tempf.Write("    def __init__(self):`r`n")
  tempf.Write(Contents2)
  tempf.Write("        pass")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:elapsedx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("elapsed = t2 - t1\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:elseifx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("elif \e:")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:funcx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("def \e():")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:ifx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("if \e:")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:mainx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, {Space}+{Home}+{Home}^c
  ClipWait 1
  if ErrorLevel  ; ClipWait timed out.
    return
  Contents := Clipboard
  Contents2 := SubStr(Contents, 1, -1)
  SendInput, ^v{Backspace}
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("if __name__ == ""__main__"":`r`n")
  tempf.Write(Contents2)
  tempf.Write("    \e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:pdbx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("import pdb; pdb.set_trace()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:sleepx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("time.sleep(\e)")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:t1x::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("t1 = time.time()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:t2x::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("t2 = time.time()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:timex::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("time.time()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
#IfWinActive


;; Begin globals
#IfWinActive Emacs/
:R:awkcx::
  SendInput, awk{Space}'{{}print{Space}$!xjuggler-make-endpoint-marker{Enter}1{}}'
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:htmlx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, <{!}DOCTYPE{Space}html>{Space}<{!}--{Space}html{Space}5{Space}doctype{Space}-->^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, <html>^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, <head>^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, <title>!xjuggler-make-endpoint-marker{Enter}</title>^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, </head>^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, <body>^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, </body>^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, </html>^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
#IfWinActive
#IfWinActive ahk_exe devenv.exe
:R:awkcx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("awk '{print $\e1}'")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  return
:R:htmlx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, {Space}+{Home}+{Home}^c
  ClipWait 1
  if ErrorLevel  ; ClipWait timed out.
    return
  Contents := Clipboard
  Contents2 := SubStr(Contents, 1, -1)
  SendInput, ^v{Backspace}
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("<!DOCTYPE html> <!-- html 5 doctype -->`r`n")
  tempf.Write(Contents2)
  tempf.Write("<html>`r`n")
  tempf.Write(Contents2)
  tempf.Write("<head>`r`n")
  tempf.Write(Contents2)
  tempf.Write("<title>\e</title>`r`n")
  tempf.Write(Contents2)
  tempf.Write("</head>`r`n")
  tempf.Write(Contents2)
  tempf.Write("<body>`r`n")
  tempf.Write(Contents2)
  tempf.Write("</body>`r`n")
  tempf.Write(Contents2)
  tempf.Write("</html>`r`n")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
#IfWinActive
;; JUGGLER CONTROL BLOCK STOP

::ftw::free zeroN whales



