CoordMode, Mouse, Screen
CoordMode, Pixel, Screen
NumpadSub::
WinGetActiveTitle, Title
Ifinstring, Title, Nitro
{
MouseGetPos, MouseX, MouseY
string=
mouseclick, left, 80, 100
sleep, 100
mousemove, 419, 376
Mouseclick, left,,,3
sleep, 100
send, ^c
ClipSize := strlen(clipboard)
if (ClipSize > 30)
{
	msgbox, too large, marge - %ClipSize% -
	reload
}
sleep, 300
mouseclick, left, 1386, 19
string=%clipboard%
StringReplace, string, string,  `r`n,%A_Space%, All 
send, %string%
sleep, 300
PixelSearch, Px, Py, 1150 , 212, 1781, 1018, 0xffe8cc, 3, Fast
Px:=Px+100
Py:=Py+10
mousemove, %Px%, %Py%
sleep, 300
MouseClickDrag, Left, %Px%, %Py%, %MouseX%, %Mousey%, 5
}
return
