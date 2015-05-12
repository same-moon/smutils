#IfWinActive ahk_exe devenv.exe
    ^n::Send, {Down}
    ^p::Send, {Up}
    ^a::Send, {Home}
    ^e::Send, {End}
    ^f::Send, {Right}
    ^b::Send, {Left}
    ^d::Send, {Delete}
    ^Enter::
        Send, {Home}
        Send, {Home}
        Send, +{End}
        Send, ^c
        Send, {End}
        Send, {Enter}
        Send, +{Home}
	Send, ^v
        Return
    ^+p::
        Send, {Home}
        Send, +{End}
        Send, +{Right}
        Send, ^x
        Send, {Home}
        Send, {Up}
        Send, ^v
        Send, {Up}
        Send, {End}
        Return
    ^+n::
        Send, {Home}
        Send, +{End}
        Send, +{Right}
        Send, ^x
        Send, {Home}
        Send, {Down}
        Send, ^v
        Send, {Up}
        Send, {End}
        Return
    
    !b::Send, ^{Left}
    !f::Send, ^{Right}
    !d::Send, ^+{Right}{Delete}
    !k::Send, {Home}+{End}+{Right}{Delete}
    !>::
        Send, !^a
	Sleep 500
 	Send, Edit.IncreaseLineIndent{Return}{Esc}
	Send {Left}{Right}
	Return
    !<::
        Send, !^a
	Sleep 500
 	Send, Edit.DecreaseLineIndent{Return}{Esc}
	Send {Right}{Left}
	Return
    !q::
        Send, !^a
	Sleep 500
 	Send, Python.FillCommentParagraph{Return}{Esc}
	Return
#IfWinActive
