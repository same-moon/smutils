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
:R:acceptx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, (csock,{Space}addr){Space}={Space}ssock.accept()^j!xjuggler-insert-start-of-line-context{Enter}
  return
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
:R:elsex::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, else^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:exceptx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, except{Space}Exception{Space}as{Space}e^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}msg{Space}={Space}"got{Space}exception{Space}of{Space}-->`%s<--^q:{Space}traceback{Space}is{Space}-->`%s<--"{Space}`%{Space}(e,{Space}traceback.format_exc())!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:forkx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, pid{Space}={Space}os.fork()^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, if{Space}pid{Space}=={Space}0^q:{Space}{#}{Space}child^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}!xjuggler-make-endpoint-marker{Enter}sys.stdout.write("I{Space}am{Space}child{Space}pid{Space}`%d\n"{Space}`%{Space}(os.getpid()))^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}os._exit(0)^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, else^q:{Space}{Space}{Space}{Space}{Space}{Space}{Space}{Space}{#}{Space}parent^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}sys.stdout.write("I{Space}am{Space}parent{Space}of{Space}child{Space}pid{Space}`%d\n"{Space}`%{Space}(pid))^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:forx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, for{Space}!xjuggler-make-endpoint-marker{Enter}{Space}in{Space}^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:funcx::
  SendInput, def{Space}!xjuggler-make-endpoint-marker{Enter}()^q:
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:hostnamex::
  SendInput, socket.gethostname()
  return
:R:ifx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, if{Space}!xjuggler-make-endpoint-marker{Enter}^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:importx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, from{Space}__future__{Space}import{Space}division,{Space}print_function,{Space}unicode_literals^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, ^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, import{Space}os^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, import{Space}socket^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, import{Space}subprocess^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, import{Space}sys^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, import{Space}tempfile^j!xjuggler-insert-start-of-line-context{Enter}
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
:R:printx::
  SendInput, print(!xjuggler-make-endpoint-marker{Enter})
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:rmtreex::
  SendInput, shutil.rmtree(!xjuggler-make-endpoint-marker{Enter})
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:serversocketx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, ssock{Space}={Space}socket.socket(socket.AF_INET,{Space}socket.SOCK_STREAM)^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {#}{Space}ssock.setsockopt(socket.SOL_SOCKET,{Space}socket.SO_REUSEADDR,{Space}1)^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {#}{Space}ssock.setsockopt(socket.SOL_SOCKET,{Space}socket.SO_REUSEPORT,{Space}1)^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, ssock.bind(('',{Space}!xjuggler-make-endpoint-marker{Enter}PORT))^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, ssock.listen(5)
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:signalx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, import{Space}signal^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, ^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, def{Space}handler(signum,{Space}frame)^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}print('Signal{Space}handler{Space}called{Space}with{Space}signal',{Space}signum)^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, signal.signal(signal.SIG!xjuggler-make-endpoint-marker{Enter},{Space}handler)
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:sleepx::
  SendInput, time.sleep(!xjuggler-make-endpoint-marker{Enter})
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:socketx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, s{Space}={Space}socket.socket(socket.AF_INET,{Space}socket.SOCK_STREAM)^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, s.connect((!xjuggler-make-endpoint-marker{Enter}HOSTNAME,{Space}PORT))^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, f{Space}={Space}s.makefile(){Space}{#}{Space}optional
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
:R:tempdirx::
  SendInput, tempdirname{Space}={Space}tempfile.mkdtemp()!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:threadclassx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, class{Space}!xjuggler-make-endpoint-marker{Enter}(threading.Thread)^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}def{Space}__init__(self)^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}{Space}{Space}{Space}{Space}threading.Thread.__init__(self)^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}def{Space}run(self)^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}{Space}{Space}{Space}{Space}pass^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:timex::
  SendInput, time.time()!xjuggler-make-endpoint-marker{Enter}
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:tryx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, try^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}!xjuggler-make-endpoint-marker{Enter}^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, except{Space}Exception{Space}as{Space}e^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}msg{Space}={Space}"got{Space}exception{Space}of{Space}-->`%s<--^q:{Space}traceback{Space}is{Space}-->`%s<--"{Space}`%{Space}(e,{Space}traceback.format_exc())
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
:R:unittestx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, import{Space}unittest^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, ^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, class{Space}!xjuggler-make-endpoint-marker{Enter}MyTest(unittest.TestCase)^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, ^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}def{Space}test_foo(self)^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}{Space}{Space}self.assertEqual('foo'.upper(),{Space}'FOO')^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, ^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, if{Space}__name__{Space}=={Space}'__main__'^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}suite{Space}={Space}unittest.TestLoader().loadTestsFromTestCase(MyTest)^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}if{Space}unittest.TextTestRunner(verbosity=2).run(suite).wasSuccessful()^q:^j!xjuggler-insert-start-of-line-context{Enter}
  SendInput, {Space}{Space}{Space}{Space}{Space}{Space}{Space}{Space}pass{Space}{#}{Space}cleanup{Space}temp{Space}dirs{Space}etc.{Space}here
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
#IfWinActive
#IfWinActive ahk_exe devenv.exe
:R:acceptx::
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
  tempf.Write("(csock, addr) = ssock.accept()`r`n")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  Clipboard = %ClipboardOld%
  return
:R:argparseargx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("parser.add_argument(""\e"", type=str, help="""")")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:argparseoptx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("parser.add_argument(""-\e"", ""--"", action=""store_true"", help="""")")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
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
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
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
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:elapsedx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("elapsed = t2 - t1\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:elseifx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("elif \e:")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:elsex::
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
  tempf.Write("else:`r`n")
  tempf.Write(Contents2)
  tempf.Write("    \e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:exceptx::
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
  tempf.Write("except Exception as e:`r`n")
  tempf.Write(Contents2)
  tempf.Write("    msg = ""got exception of -->%s<--: traceback is -->%s<--"" % (e, traceback.format_exc())\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:forkx::
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
  tempf.Write("pid = os.fork()`r`n")
  tempf.Write(Contents2)
  tempf.Write("if pid == 0: # child`r`n")
  tempf.Write(Contents2)
  tempf.Write("    \esys.stdout.write(""I am child pid %d\n"" % (os.getpid()))`r`n")
  tempf.Write(Contents2)
  tempf.Write("    os._exit(0)`r`n")
  tempf.Write(Contents2)
  tempf.Write("else:        # parent`r`n")
  tempf.Write(Contents2)
  tempf.Write("    sys.stdout.write(""I am parent of child pid %d\n"" % (pid))`r`n")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:forx::
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
  tempf.Write("for \e in :`r`n")
  tempf.Write(Contents2)
  tempf.Write("    ")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:funcx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("def \e():")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:hostnamex::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("socket.gethostname()")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  return
:R:ifx::
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
  tempf.Write("if \e:`r`n")
  tempf.Write(Contents2)
  tempf.Write("    ")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:importx::
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
  tempf.Write("from __future__ import division, print_function, unicode_literals`r`n")
  tempf.Write(Contents2)
  tempf.Write("`r`n")
  tempf.Write(Contents2)
  tempf.Write("import os`r`n")
  tempf.Write(Contents2)
  tempf.Write("import socket`r`n")
  tempf.Write(Contents2)
  tempf.Write("import subprocess`r`n")
  tempf.Write(Contents2)
  tempf.Write("import sys`r`n")
  tempf.Write(Contents2)
  tempf.Write("import tempfile`r`n")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  Clipboard = %ClipboardOld%
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
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:pdbx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("import pdb; pdb.set_trace()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:printx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("print(\e)")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:rmtreex::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("shutil.rmtree(\e)")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:serversocketx::
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
  tempf.Write("ssock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)`r`n")
  tempf.Write(Contents2)
  tempf.Write("# ssock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)`r`n")
  tempf.Write(Contents2)
  tempf.Write("# ssock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)`r`n")
  tempf.Write(Contents2)
  tempf.Write("ssock.bind(('', \ePORT))`r`n")
  tempf.Write(Contents2)
  tempf.Write("ssock.listen(5)")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:signalx::
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
  tempf.Write("import signal`r`n")
  tempf.Write(Contents2)
  tempf.Write("`r`n")
  tempf.Write(Contents2)
  tempf.Write("def handler(signum, frame):`r`n")
  tempf.Write(Contents2)
  tempf.Write("    print('Signal handler called with signal', signum)`r`n")
  tempf.Write(Contents2)
  tempf.Write("signal.signal(signal.SIG\e, handler)")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:sleepx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("time.sleep(\e)")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:socketx::
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
  tempf.Write("s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)`r`n")
  tempf.Write(Contents2)
  tempf.Write("s.connect((\eHOSTNAME, PORT))`r`n")
  tempf.Write(Contents2)
  tempf.Write("f = s.makefile() # optional")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:t1x::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("t1 = time.time()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:t2x::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("t2 = time.time()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:tempdirx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("tempdirname = tempfile.mkdtemp()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:threadclassx::
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
  tempf.Write("class \e(threading.Thread):`r`n")
  tempf.Write(Contents2)
  tempf.Write("    def __init__(self):`r`n")
  tempf.Write(Contents2)
  tempf.Write("        threading.Thread.__init__(self)`r`n")
  tempf.Write(Contents2)
  tempf.Write("    def run(self):`r`n")
  tempf.Write(Contents2)
  tempf.Write("        pass`r`n")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:timex::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("time.time()\e")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:tryx::
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
  tempf.Write("try:`r`n")
  tempf.Write(Contents2)
  tempf.Write("    \e`r`n")
  tempf.Write(Contents2)
  tempf.Write("except Exception as e:`r`n")
  tempf.Write(Contents2)
  tempf.Write("    msg = ""got exception of -->%s<--: traceback is -->%s<--"" % (e, traceback.format_exc())")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:unittestx::
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
  tempf.Write("import unittest`r`n")
  tempf.Write(Contents2)
  tempf.Write("`r`n")
  tempf.Write(Contents2)
  tempf.Write("class \eMyTest(unittest.TestCase):`r`n")
  tempf.Write(Contents2)
  tempf.Write("`r`n")
  tempf.Write(Contents2)
  tempf.Write("  def test_foo(self):`r`n")
  tempf.Write(Contents2)
  tempf.Write("      self.assertEqual('foo'.upper(), 'FOO')`r`n")
  tempf.Write(Contents2)
  tempf.Write("`r`n")
  tempf.Write(Contents2)
  tempf.Write("if __name__ == '__main__':`r`n")
  tempf.Write(Contents2)
  tempf.Write("    suite = unittest.TestLoader().loadTestsFromTestCase(MyTest)`r`n")
  tempf.Write(Contents2)
  tempf.Write("    if unittest.TextTestRunner(verbosity=2).run(suite).wasSuccessful():`r`n")
  tempf.Write(Contents2)
  tempf.Write("        pass # cleanup temp dirs etc. here")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
#IfWinActive


;; Begin globals
#IfWinActive Emacs/
:R:arrowsx::
  SendInput, -->!xjuggler-make-endpoint-marker{Enter}<--
  SendInput, !xjuggler-goto-endpoint-marker{Enter}
  return
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
:R:shebangpyx::
  SendInput, !xjuggler-get-start-of-line-context{Enter}
  SendInput, {#}{!}/usr/bin/python^j!xjuggler-insert-start-of-line-context{Enter}
  return
#IfWinActive
#IfWinActive ahk_exe devenv.exe
:R:arrowsx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("-->\e<--")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  return
:R:awkcx::
  tempf := FileOpen("c:\temp\juggler-for-VS.txt", "w")
  tempf.Write("awk '{print $\e1}'")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
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
  SendInput, ^F\e`tCurrent Document!p!p{Esc}{Backspace}
  Clipboard = %ClipboardOld%
  return
:R:shebangpyx::
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
  tempf.Write("#!/usr/bin/python`r`n")
  tempf.Close()
  SendInput, !ex
  Sleep, 500
  SendInput, c:\temp\juggler-for-VS.txt{Enter}
  Clipboard = %ClipboardOld%
  return
#IfWinActive
;; JUGGLER CONTROL BLOCK STOP

::ftw::free zeroN whales



