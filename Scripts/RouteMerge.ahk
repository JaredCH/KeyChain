Loop, 1
{
SetTitleMatchMode, 1
SetTitleMatchMode Fast
CoordMode, Mouse, Screen
tt = PS Routing ahk_class XLMAIN
WinWait, %tt%
IfWinNotActive, %tt%,, WinActivate, %tt%
Sleep, 300
MouseClick, L, 210, 999
Sleep, 300
MouseClick, L, 9, 313
Sleep, 117
Send, {Blind}{Ctrl Down}{Shift Down}{Down}{Shift Up}{Ctrl Up}{Ctrl Down}c{Ctrl Up}
Sleep, 300
MouseClick, L, 132, 999
Sleep, 300
MouseClick, L, 53, 304
Sleep, 195
Send, {Blind}{Ctrl Down}{Down}{Ctrl Up}{Down}{Ctrl Down}v{Ctrl Up}
Sleep, 300
MouseClick, L, 16, 273
Sleep, 300
MouseClick, L, 125, 276,,, D
Sleep, 300
MouseClick, L, 85, 274,,, U