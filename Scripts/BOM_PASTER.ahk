CoordMode, Mouse, Screen

msgbox, F1 and F2 for locations, CTRL D to save BOM List, 3 to activate per W.O.

F1::
WinGetTitle, wintitle, A
MouseGetPos, f1coordx, f1coordy 
return

F2::
WinGetTitle, wintitle, A
MouseGetPos, f2coordx, f2coordy 
return



^d::
myCopiedClipboard := Trim(clipboard)
Sleep 100

linesInArraySeperatedbyNewLine := []

Loop, Parse, myCopiedClipboard, `n, `r
	if Trim(A_LoopField)
		linesInArraySeperatedbyNewLine.Push(A_LoopField)
return

NumLock::
DllCall("SetCursorPos", "int", f1coordx, "int", f1coordy)
sleep, 150
send, {LButton 3}
sleep, 300
send, ^c
tooltip, %Cipboard%
masterstring:=
Loop, % linesInArraySeperatedbyNewLine.MaxIndex()
{
	haybail:= linesInArraySeperatedbyNewLine[A_index]
	IfInString, haybail, %Clipboard%
	{
		tooltip, Found: %Cipboard%
		;~ msgbox, % linesInArraySeperatedbyNewLine[A_index]
		StringSplit, bom, haybail, %A_Tab%
		masterstring =%masterstring%%bom2%%A_Tab%%bom3%%A_Tab%%bom4%%A_Tab%%bom5%%A_Tab%%bom6%`n
    }
}
sleep, 250
SetTimer, RemoveToolTip, -2000
clipboard:=masterstring
DllCall("SetCursorPos", "int", f2coordx, "int", f2coordy)
sleep, 150
send, {LButton}
sleep, 150
send, ^v
sleep, 1500
send, ^!O
sleep, 300
send, ^!O
Return

`::
PixelGetColor, color, 474, 221
PixelGetColor, coor2, 627, 629
if (color = "0xE2B16F")
{
	PixelSearch, Px, Py, 216, 449, 808, 1019, 0XD77800, 3, Fast
if ErrorLevel
    MsgBox, That color was not found in the specified region.
else
    mouseClick, Left,  % 231, Py+5
sleep, 300
	mouseclick, Left, % 231, Py+25
	sleep, 300
	MouseClick, Right, % 231, Py+25
	sleep, 500
	MouseClick, Left, % 231+45, Py+85
}
RETURN



RemoveToolTip:
ToolTip
return
