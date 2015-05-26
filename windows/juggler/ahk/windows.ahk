#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#IfWinActive ahk_exe cmd.exe
    ^n::Send, {Down}
    ^p::Send, {Up}
    ^a::Send, {Home}
    ^e::Send, {End}
    ^f::Send, {Right}
    ^b::Send, {Left}
    ^d::Send, {Delete}    
    !b::Send, ^{Left}
    !f::Send, ^{Right}
#IfWinActive