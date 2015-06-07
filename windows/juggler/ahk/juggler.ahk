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
Handle_emacs(lang, abbrev)
{
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}

  ClipWait 2
  if ErrorLevel
  {
    MsgBox, first ClipWait timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\\Users\\ruttbe\\Documents\\GitHub\\smutils\\windows\\juggler\\defns\" . lang . "\" . abbrev . "`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, second ClipWait timed out.
    return
  }
  Send, ^y
  Sleep 500
  Clipboard = %ClipboardOld%

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
Handle_VS(lang, abbrev)
{
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c

  ClipWait 2
  if ErrorLevel
  {
    MsgBox, first ClipWait timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\\Users\\ruttbe\\Documents\\GitHub\\smutils\\windows\\juggler\\defns\" . lang . "\" . abbrev . "`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, second ClipWait timed out.
    return
  }
  Send, ^v
  Sleep 500
  Clipboard = %ClipboardOld%

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


;; Begin python
#IfWinActive Emacs/Python
:R:acceptx::
  Handle_emacs("python", "acceptx")
  return
:R:argparseargx::
  Handle_emacs("python", "argparseargx")
  return
:R:argparseoptx::
  Handle_emacs("python", "argparseoptx")
  return
:R:argparsex::
  Handle_emacs("python", "argparsex")
  return
:R:classx::
  Handle_emacs("python", "classx")
  return
:R:elapsedx::
  Handle_emacs("python", "elapsedx")
  return
:R:elseifx::
  Handle_emacs("python", "elseifx")
  return
:R:elsex::
  Handle_emacs("python", "elsex")
  return
:R:exceptx::
  Handle_emacs("python", "exceptx")
  return
:R:fileexistsx::
  Handle_emacs("python", "fileexistsx")
  return
:R:forkx::
  Handle_emacs("python", "forkx")
  return
:R:forx::
  Handle_emacs("python", "forx")
  return
:R:funcx::
  Handle_emacs("python", "funcx")
  return
:R:hostnamex::
  Handle_emacs("python", "hostnamex")
  return
:R:ifx::
  Handle_emacs("python", "ifx")
  return
:R:importx::
  Handle_emacs("python", "importx")
  return
:R:joinx::
  Handle_emacs("python", "joinx")
  return
:R:mainx::
  Handle_emacs("python", "mainx")
  return
:R:mkdirx::
  Handle_emacs("python", "mkdirx")
  return
:R:pdbx::
  Handle_emacs("python", "pdbx")
  return
:R:printx::
  Handle_emacs("python", "printx")
  return
:R:raisex::
  Handle_emacs("python", "raisex")
  return
:R:rmtreex::
  Handle_emacs("python", "rmtreex")
  return
:R:serversocketx::
  Handle_emacs("python", "serversocketx")
  return
:R:signalx::
  Handle_emacs("python", "signalx")
  return
:R:sleepx::
  Handle_emacs("python", "sleepx")
  return
:R:socketx::
  Handle_emacs("python", "socketx")
  return
:R:t1x::
  Handle_emacs("python", "t1x")
  return
:R:t2x::
  Handle_emacs("python", "t2x")
  return
:R:tempdirx::
  Handle_emacs("python", "tempdirx")
  return
:R:threadclassx::
  Handle_emacs("python", "threadclassx")
  return
:R:timex::
  Handle_emacs("python", "timex")
  return
:R:tryx::
  Handle_emacs("python", "tryx")
  return
:R:unittestx::
  Handle_emacs("python", "unittestx")
  return
#IfWinActive
#IfWinActive ahk_exe devenv.exe
:R:acceptx::
  Handle_VS("python", "acceptx")
  return
:R:argparseargx::
  Handle_VS("python", "argparseargx")
  return
:R:argparseoptx::
  Handle_VS("python", "argparseoptx")
  return
:R:argparsex::
  Handle_VS("python", "argparsex")
  return
:R:classx::
  Handle_VS("python", "classx")
  return
:R:elapsedx::
  Handle_VS("python", "elapsedx")
  return
:R:elseifx::
  Handle_VS("python", "elseifx")
  return
:R:elsex::
  Handle_VS("python", "elsex")
  return
:R:exceptx::
  Handle_VS("python", "exceptx")
  return
:R:fileexistsx::
  Handle_VS("python", "fileexistsx")
  return
:R:forkx::
  Handle_VS("python", "forkx")
  return
:R:forx::
  Handle_VS("python", "forx")
  return
:R:funcx::
  Handle_VS("python", "funcx")
  return
:R:hostnamex::
  Handle_VS("python", "hostnamex")
  return
:R:ifx::
  Handle_VS("python", "ifx")
  return
:R:importx::
  Handle_VS("python", "importx")
  return
:R:joinx::
  Handle_VS("python", "joinx")
  return
:R:mainx::
  Handle_VS("python", "mainx")
  return
:R:mkdirx::
  Handle_VS("python", "mkdirx")
  return
:R:pdbx::
  Handle_VS("python", "pdbx")
  return
:R:printx::
  Handle_VS("python", "printx")
  return
:R:raisex::
  Handle_VS("python", "raisex")
  return
:R:rmtreex::
  Handle_VS("python", "rmtreex")
  return
:R:serversocketx::
  Handle_VS("python", "serversocketx")
  return
:R:signalx::
  Handle_VS("python", "signalx")
  return
:R:sleepx::
  Handle_VS("python", "sleepx")
  return
:R:socketx::
  Handle_VS("python", "socketx")
  return
:R:t1x::
  Handle_VS("python", "t1x")
  return
:R:t2x::
  Handle_VS("python", "t2x")
  return
:R:tempdirx::
  Handle_VS("python", "tempdirx")
  return
:R:threadclassx::
  Handle_VS("python", "threadclassx")
  return
:R:timex::
  Handle_VS("python", "timex")
  return
:R:tryx::
  Handle_VS("python", "tryx")
  return
:R:unittestx::
  Handle_VS("python", "unittestx")
  return
#IfWinActive


;; Begin globals
#IfWinActive Emacs/
:R:arrowsx::
  Handle_emacs("global", "arrowsx")
  return
:R:awkcx::
  Handle_emacs("global", "awkcx")
  return
:R:htmlx::
  Handle_emacs("global", "htmlx")
  return
:R:shebangpyx::
  Handle_emacs("global", "shebangpyx")
  return
#IfWinActive
#IfWinActive ahk_exe devenv.exe
:R:arrowsx::
  Handle_VS("global", "arrowsx")
  return
:R:awkcx::
  Handle_VS("global", "awkcx")
  return
:R:htmlx::
  Handle_VS("global", "htmlx")
  return
:R:shebangpyx::
  Handle_VS("global", "shebangpyx")
  return
#IfWinActive
;; JUGGLER CONTROL BLOCK STOP

::ftw::free zeroN whales



