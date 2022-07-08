#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Mouse, Screen
Gui, Add, Text, x12 y9 w420 h80 , 1.) Copy the list of Work Order numbers.`n2.) Click in JDE so the window is active`n3.) Mouse over the text box where the work order needs to be typed.`n4.) Press F1 to save the mouse location`n5.) Type in one work order number manually and search for it.`n6.) Move the mouse over the checkbox that appears for the work order and press F2.
Gui, Add, Button, x322 y95 w100 h30 gstart, Begin
Gui, Add, Radio, x12 y100 w70 h20 vrslow checked, Slow
Gui, Add, Radio, x92 y100 w70 h20 vrmed, Medium
Gui, Add, Radio, x172 y100 w70 h20 vrfast, Fast
Gui, Add, Edit, x260 y100 w30 h20 vstatus, 86
Gui, Show, x127 y87 h131 w442, Status Updater (F12 - Emergency Stop)
Return



wintitle = 
f1coordx = 
f1coordy = 
f2coordx = 
f2coordy = 
sleep1 = 300
sleep2 = 500
sleep3 = 900


F12::
ExitApp
return

f1::

WinGetTitle, wintitle, A
MouseGetPos, f1coordx, f1coordy 
return

f2::
WinGetTitle, wintitle, A
MouseGetPos, f2coordx, f2coordy 
return


start:
GuiControlGet, statusnum ,, status
Gui, Submit, noHide 
sleep, 1000
If (rslow) {
	sleep1 = 700
	sleep2 = 1000
	sleep3 = 1300
	}
	If (rmed) {
		sleep1 = 500
		sleep2 = 800
		sleep3 = 1100
	}
	If (rfast) {
		sleep1 = 300
		sleep2 = 500
		sleep3 = 900
	}
		
	if WinExist(wintitle)
		WinActivate ; Use the window found by WinExist.
	else
		msgbox, "Can not find JDE Window / or window was not selected prior to saving the coordinates (F1, F2....etc)"
	Loop, parse, clipboard,  `n, `r
	{
		if (A_LoopField <> "")
		{
			DllCall("SetCursorPos", "int", f1coordx, "int", f1coordy) ;
			sleep, 100
			Click
			;mouseclick, Left, %f1coordx%, %f1coordy%, , 7
			sleep, %sleep1%
			send, ^a %A_LoopField%
			sleep, %sleep1%
			send,^!i
			sleep, %sleep2%
			DllCall("SetCursorPos", "int", f2coordx, "int", f2coordy) ;
			sleep, 100
			Click, 2
			;mousemove, %f2coordx%, %f2coordy%, 7
			;send,{LButton 2}
			sleep, %sleep3%
			send, %statusnum%
			sleep, %sleep3%
			send,^!o
			sleep, %sleep3%
		}
	}
Msgbox, Task complete
	return
	
	
	GuiClose:
	ExitApp