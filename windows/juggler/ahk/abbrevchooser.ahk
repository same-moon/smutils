SendMode, Input

F12::
    allfiles=
    Loop, c:\home\benru\smutils\windows\juggler\defns\*.*, 0, 1
    {
        If (StrLen(allfiles) = 0)
        {
            allfiles=%A_LoopFileName%
        }
        else
        {
            allfiles=%allfiles%|%A_LoopFileName%
        }
    }
    Sort allfiles, D|
    Gui, Add, ListBox, x6 y30 w220 h340 vChosenAbbrev, %allfiles%
    Gui, Add, Button, Default w80 gHandleSubmit, OK
    Gui, Show,, Choose Abbrev
    return

HandleSubmit:
    Gui, Submit
    Gui, Destroy
    ;;    MsgBox, "You chose %ChosenAbbrev%"

    ;; trigger the hotkey
    SendLevel 1
    Send, %ChosenAbbrev%{Space}
    SendLevel 0
    return
