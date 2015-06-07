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
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\acceptx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:argparseargx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\argparseargx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:argparseoptx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\argparseoptx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:argparsex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\argparsex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:classx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\classx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:elapsedx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\elapsedx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:elseifx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\elseifx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:elsex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\elsex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:exceptx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\exceptx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:fileexistsx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\fileexistsx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:forkx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\forkx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:forx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\forx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:funcx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\funcx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:hostnamex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\hostnamex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:ifx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\ifx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:importx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\importx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:joinx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\joinx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:mainx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\mainx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:mkdirx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\mkdirx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:pdbx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\pdbx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:printx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\printx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:raisex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\raisex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:rmtreex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\rmtreex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:serversocketx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\serversocketx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:signalx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\signalx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:sleepx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\sleepx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:socketx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\socketx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:t1x::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\t1x`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:t2x::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\t2x`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:tempdirx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\tempdirx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:threadclassx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\threadclassx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:timex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\timex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:tryx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\tryx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:unittestx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\unittestx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
#IfWinActive
#IfWinActive ahk_exe devenv.exe
:R:acceptx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\acceptx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:argparseargx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\argparseargx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:argparseoptx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\argparseoptx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:argparsex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\argparsex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:classx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\classx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:elapsedx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\elapsedx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:elseifx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\elseifx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:elsex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\elsex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:exceptx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\exceptx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:fileexistsx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\fileexistsx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:forkx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\forkx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:forx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\forx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:funcx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\funcx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:hostnamex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\hostnamex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:ifx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\ifx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:importx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\importx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:joinx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\joinx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:mainx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\mainx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:mkdirx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\mkdirx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:pdbx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\pdbx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:printx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\printx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:raisex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\raisex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:rmtreex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\rmtreex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:serversocketx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\serversocketx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:signalx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\signalx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:sleepx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\sleepx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:socketx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\socketx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:t1x::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\t1x`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:t2x::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\t2x`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:tempdirx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\tempdirx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:threadclassx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\threadclassx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:timex::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\timex`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:tryx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\tryx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:unittestx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\python\unittestx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
#IfWinActive


;; Begin globals
#IfWinActive Emacs/
:R:arrowsx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\global\arrowsx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:awkcx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\global\awkcx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:htmlx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\global\htmlx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
:R:shebangpyx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  SendInput, !xjuggler-copy-start-of-line-context{Enter}
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := Contents
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\global\shebangpyx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^y
  Sleep 1000
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
  return
#IfWinActive
#IfWinActive ahk_exe devenv.exe
:R:arrowsx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\global\arrowsx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:awkcx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\global\awkcx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:htmlx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\global\htmlx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
:R:shebangpyx::
  AutoTrim Off
  ClipboardOld = %ClipboardAll%
  Clipboard =  ; Enable ClipWait to work
  Send, {Space}+{Home}+{Home}^c
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait1 timed out.
    return
  }
  Contents := Clipboard
  StartOfLineContext := SubStr(Contents, 1, -1)
  Send, ^v{Backspace}
  Fn := "c:\\temp\\jugglerbot\\triggers\\" . A_Now
  FileContents := "c:\Users\ruttbe\Documents\GitHub\smutils\windows\juggler\defns\global\shebangpyx`n" . StartOfLineContext
  Clipboard =  ; Enable ClipWait to work
  FileAppend, %FileContents%, %Fn%
  ClipWait 2
  if ErrorLevel
  {
    MsgBox, ClipWait2 timed out.
    return
  }
  Send, ^v
  Sleep 1000
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
  return
#IfWinActive
;; JUGGLER CONTROL BLOCK STOP

::ftw::free zeroN whales



