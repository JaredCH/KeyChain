 
NumpadDiv::

WinGetActiveTitle, Title
Ifinstring, Title, Workbench
{
;~ loop, parse, clipboard,`r`n
;~ {
	;~ ControlClick, x493 y483, Shop Floor Workbench,, Left
	;~ sleep, 200
	;~ send, ^a
	;~ sleep, 200
	;~ Send, %A_LoopField%{Enter}
	;~ sleep, 1000
	
ControlClick, x535 y541, Shop Floor Workbench,, Right
sleep, 500
ControlClick, x590 y699, Shop Floor Workbench,, Left
loop {
 	PixelGetColor, avail, 1382, 197, rgb
 	Sleep, 50
 } until avail = 0xF3F3F3
ControlClick, x221 y226, Shop Floor Workbench,,
SLEEP, 250
}
return


Numpadmult::
WinGetActiveTitle, Title
Ifinstring, Title, Workbench
{
send, ^!O
loop {
 	PixelGetColor, avail, 1382, 197, rgb
 	Sleep, 50
 } until avail = 0xFFFFFF
  sleep, 500
ControlClick, x535 y541, Shop Floor Workbench,, Left
sleep, 200
loop {
 	PixelGetColor, avail, 941, 400, rgb
 	Sleep, 50
 } until avail = 0xFFFFFF
 sleep, 1000
send, 40
sleep, 250
send, ^!O
}
return




