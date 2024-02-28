 
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
	
ControlClick, x542 y535, Shop Floor Workbench,, Right
sleep, 500
ControlClick, x592 y672, Shop Floor Workbench,,
sleep, 2000
ControlClick, x222 y222, Shop Floor Workbench,,
;~ }
}
return


Numpadmult::
WinGetActiveTitle, Title
Ifinstring, Title, Workbench
{
send, ^!O
sleep, 2000
ControlClick, x542 y535, Shop Floor Workbench,, Left
sleep, 1000
send, 40
sleep, 250
send, ^!O
}
return




