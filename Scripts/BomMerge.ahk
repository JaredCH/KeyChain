Loop, 1
{
SetTitleMatchMode, 1
SetTitleMatchMode Fast
CoordMode, Mouse, Screen
tt = PS Bill of Material ahk_class XLMAIN
WinWait, %tt%
IfWinNotActive, %tt%,, WinActivate, %tt%
Sleep, 300
MouseClick, L, 210, 999
Sleep, 300
MouseClick, L, 25, 313
Sleep, 117
Send, {Blind}{Ctrl Down}{Shift Down}{Down}{Shift Up}{Ctrl Up}{Ctrl Down}c{Ctrl Up}
Sleep, 300
MouseClick, L, 132, 999
Sleep, 300
MouseClick, L, 59, 304
Sleep, 195
Send, {Blind}{Ctrl Down}{Down}{Ctrl Up}{Down}{Ctrl Down}v{Ctrl Up}
Sleep, 300
MouseClick, L, 16, 273
Sleep, 300
MouseClick, L, 125, 276,,, D
Sleep, 300
MouseClick, L, 85, 274,,, U
Sleep, 300
MouseClick, L, 244, 21
Sleep, 300
MouseClick, L, 1304, 295
tt = ahk_class Net UI Tool Window
WinWait, %tt%
IfWinNotActive, %tt%,, WinActivate, %tt%
Sleep, 300
MouseClick, L, 1126, 571
Sleep, 300
MouseClick, L, 1187, 712
Sleep, 300
}