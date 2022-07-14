;~ KeyChain was developed on 7/1/2022 by Jared Hicks.
;~ The purpose of this application is to allow the user to setup, save,
;~ and re use macros
;~ The application allows the user to input any plain text string, and some ahk character mappings
;~ as well as the full name of any script located in the 'Scripts' directory outlined below.
;~ Upon activation via hotkey, the user defined string or AHK script will be sent or executed.
;~ v2.00 - Support for 62 key combinations & 11 Scripts
;~ //////////////////////////////////////////////////////////////
;~ ====developer notes | TODO
;~ ====Build interpreter for omniwin defined keys vs Keychain keys
;~ //////////////////////////////////////////////////////////////
;~ Copyright (C) [2022] [Jared Hicks]
;~ GNU General Public License
;~ <https://www.gnu.org/licenses>
;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////Installation Setup
;~ //////////////////////////////////////////////////////////////

IfNotExist, %A_AppData%\KeyChain
SplashTextOn, 225, 50, Loading Keychain settings, This may take a few moments.
   FileCreateDir, %A_AppData%\KeyChain
   
IfNotExist, %A_AppData%\KeyChain\Scripts
   FileCopyDir, Z:\Development\KeyChain\Scripts, %A_AppData%\KeyChain\Scripts ,
   
	FileCopyDir, Z:\Development\KeyChain\Icon, %A_AppData%\KeyChain\Icon ,

IfNotExist, %A_AppData%\KeyChain\Inifile.ini
	FileCopy, Z:\Development\KeyChain\Inifile.ini, %A_AppData%\KeyChain\Inifile.ini ,
   
Loop, 18{
IniRead, f%A_Index%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F%A_Index%
}

Loop, 9{
IniRead, C%A_Index%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C%A_Index%
IniRead, S%A_Index%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S%A_Index%
IniRead, A%A_Index%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A%A_Index%
IniRead, W%A_Index%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W%A_Index%
}
IniRead, Ctilde, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C~
IniRead, Stilde, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S~
IniRead, Atilde, %A_AppData%\KeyChain\inifile.ini, AltKeys, A~
IniRead, Wtilde, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W~
Loop, 5	{
	IniRead, ctrl%A_Index%, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl%A_Index%
	IniRead, alt%A_Index%, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt%A_Index%
	IniRead, shift%A_Index%, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift%A_Index%
	IniRead, dropdown%A_Index%, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown%A_Index%
	IniRead, string%A_Index%, %A_AppData%\KeyChain\inifile.ini, String, string%A_Index%
	}
;~ ////////////////////////GUI SETUP - FUNCTION KEYS
Gui, Add, GroupBox, x30 y9 w175 h560 , Function Keys
Gui, Add, Text, x42 y29 w30 h20 vtF1, F1
Gui, Add, Edit, x75 y28 w120 h20 vf1, %F1%
Gui, Add, Text, x42 y59 w30 h20 , F2
Gui, Add, Edit, x75 y58 w120 h20 vf2, %F2%
Gui, Add, Text, x42 y89 w30 h20 , F3
Gui, Add, Edit, x75 y88 w120 h20 vf3, %F3%
Gui, Add, Text, x42 y119 w30 h20 , F4
Gui, Add, Edit, x75 y118 w120 h20 vf4, %F4%
Gui, Add, Text, x42 y149 w30 h20 , F5
Gui, Add, Edit, x75 y148 w120 h20 vf5, %F5%
Gui, Add, Text, x42 y179 w30 h20 , F6
Gui, Add, Edit, x75 y178 w120 h20 vf6, %F6%
Gui, Add, Text, x42 y209 w30 h20 , F7
Gui, Add, Edit, x75 y208 w120 h20 vf7, %F7%
Gui, Add, Text, x42 y239 w30 h20 , F8
Gui, Add, Edit, x75 y238 w120 h20 vf8, %F8%
Gui, Add, Text, x42 y269 w30 h20 , F9
Gui, Add, Edit, x75 y268 w120 h20 vf9, %F9%
Gui, Add, Text, x42 y299 w30 h20 , F10
Gui, Add, Edit, x75 y298 w120 h20 vf10, %F10%
Gui, Add, Text, x42 y329 w30 h20 , F11
Gui, Add, Edit, x75 y328 w120 h20 vf11, %F11%
Gui, Add, Text, x42 y359 w150 h20 , F12  -   Emergency Exit
;~ Gui, Add, Edit, x75 y358 w120 h20 vf12, %F12%
Gui, Add, Text, x42 y389 w30 h20 , F13
Gui, Add, Edit, x75 y388 w120 h20 vf13, %F13%
Gui, Add, Text, x42 y419 w30 h20 , F14
Gui, Add, Edit, x75 y418 w120 h20 vf14, %F14%
Gui, Add, Text, x42 y449 w30 h20 , F15
Gui, Add, Edit, x75 y448 w120 h20 vf15, %F15%
Gui, Add, Text, x42 y479 w30 h20 , F16
Gui, Add, Edit, x75 y478 w120 h20 vf16, %F16%
Gui, Add, Text, x42 y509 w30 h20 , F17
Gui, Add, Edit, x75 y508 w120 h20 vf17, %F17%
Gui, Add, Text, x42 y539 w30 h20 , F18
Gui, Add, Edit, x75 y538 w120 h20 vf18, %F18%
;~ ////////////////////////GUI SETUP - CONTROL KEYS
Gui, Add, GroupBox, x220 y9 w175 h325 , Control Keys
Gui, Add, Text, x232 y29 w30 h20 , ^~
Gui, Add, Edit, x265 y28 w120 h20 vctilde, %Ctilde%
Gui, Add, Text, x232 y59 w30 h20 , ^1
Gui, Add, Edit, x265 y58 w120 h20 vc1, %C1%
Gui, Add, Text, x232 y89 w30 h20 , ^2
Gui, Add, Edit, x265 y88 w120 h20 vc2, %C2%
Gui, Add, Text, x232 y119 w30 h20 , ^3
Gui, Add, Edit, x265 y118 w120 h20 vc3, %C3%
Gui, Add, Text, x232 y149 w30 h20 , ^4
Gui, Add, Edit, x265 y148 w120 h20 vc4, %C4%
Gui, Add, Text, x232 y179 w30 h20 , ^5
Gui, Add, Edit, x265 y178 w120 h20 vc5, %C5%
Gui, Add, Text, x232 y209 w30 h20 , ^6
Gui, Add, Edit, x265 y208 w120 h20 vc6, %C6%
Gui, Add, Text, x232 y239 w30 h20 , ^7
Gui, Add, Edit, x265 y238 w120 h20 vc7, %C7%
Gui, Add, Text, x232 y269 w30 h20 , ^8
Gui, Add, Edit, x265 y268 w120 h20 vc8, %C8%
Gui, Add, Text, x232 y299 w30 h20 , ^9
Gui, Add, Edit, x265 y298 w120 h20 vc9, %C9%
;~ ////////////////////////GUI SETUP - CONTROL + SHIFT KEYS
Gui, Add, GroupBox, x410 y9 w175 h325 , Control + Shift Keys
Gui, Add, Text, x422 y29 w30 h20 , ^↑~
Gui, Add, Edit, x455 y28 w120 h20 vstilde, %Stilde%
Gui, Add, Text, x422 y59 w30 h20 , ^↑1
Gui, Add, Edit, x455 y58 w120 h20 vs1, %S1%
Gui, Add, Text, x422 y89 w30 h20 , ^↑2
Gui, Add, Edit, x455 y88 w120 h20 vs2, %S2%
Gui, Add, Text, x422 y119 w30 h20 , ^↑3
Gui, Add, Edit, x455 y118 w120 h20 vs3, %S3%
Gui, Add, Text, x422 y149 w30 h20 , ^↑4
Gui, Add, Edit, x455 y148 w120 h20 vs4, %S4%
Gui, Add, Text, x422 y179 w30 h20 , ^↑5
Gui, Add, Edit, x455 y178 w120 h20 vs5, %S5%
Gui, Add, Text, x422 y209 w30 h20 , ^↑6
Gui, Add, Edit, x455 y208 w120 h20 vs6, %S6%
Gui, Add, Text, x422 y239 w30 h20 , ^↑7
Gui, Add, Edit, x455 y238 w120 h20 vs7, %S7%
Gui, Add, Text, x422 y269 w30 h20 , ^↑8
Gui, Add, Edit, x455 y268 w120 h20 vs8, %S8%
Gui, Add, Text, x422 y299 w30 h20 , ^↑9
Gui, Add, Edit, x455 y298 w120 h20 vs9, %S9%
;~ ////////////////////////GUI SETUP - ALT KEYS
Gui, Add, GroupBox, x600 y9 w175 h325 , Alt Keys
Gui, Add, Text, x612 y29 w30 h20 , ⎇~
Gui, Add, Edit, x645 y28 w120 h20 vatilde, %Atilde%
Gui, Add, Text, x612 y59 w30 h20 , ⎇1
Gui, Add, Edit, x645 y58 w120 h20 va1, %A1%
Gui, Add, Text, x612 y89 w30 h20 , ⎇2
Gui, Add, Edit, x645 y88 w120 h20 va2, %A2%
Gui, Add, Text, x612 y119 w30 h20 , ⎇3
Gui, Add, Edit, x645 y118 w120 h20 va3, %A3%
Gui, Add, Text, x612 y149 w30 h20 , ⎇4
Gui, Add, Edit, x645 y148 w120 h20 va4, %A4%
Gui, Add, Text, x612 y179 w30 h20 , ⎇5
Gui, Add, Edit, x645 y178 w120 h20 va5, %A5%
Gui, Add, Text, x612 y209 w30 h20 , ⎇6
Gui, Add, Edit, x645 y208 w120 h20 va6, %A6%
Gui, Add, Text, x612 y239 w30 h20 , ⎇7
Gui, Add, Edit, x645 y238 w120 h20 va7, %A7%
Gui, Add, Text, x612 y269 w30 h20 , ⎇8
Gui, Add, Edit, x645 y268 w120 h20 va8, %A8%
Gui, Add, Text, x612 y299 w30 h20 , ⎇9
Gui, Add, Edit, x645 y298 w120 h20 va9, %A9%
;~ ////////////////////////GUI SETUP - WINDOWS KEYS
Gui, Add, GroupBox, x790 y9 w175 h325 , Windows Keys
Gui, Add, Text, x802 y29 w30 h20 , Ω~
Gui, Add, Edit, x835 y28 w120 h20 vwtilde, %Wtilde%
Gui, Add, Text, x802 y59 w30 h20 , Ω1
Gui, Add, Edit, x835 y58 w120 h20 vw1, %W1%
Gui, Add, Text, x802 y89 w30 h20 , Ω2
Gui, Add, Edit, x835 y88 w120 h20 vw2, %W2%
Gui, Add, Text, x802 y119 w30 h20 , Ω3
Gui, Add, Edit, x835 y118 w120 h20 vw3, %W3%
Gui, Add, Text, x802 y149 w30 h20 , Ω4
Gui, Add, Edit, x835 y148 w120 h20 vw4, %W4%
Gui, Add, Text, x802 y179 w30 h20 , Ω5
Gui, Add, Edit, x835 y178 w120 h20 vw5, %W5%
Gui, Add, Text, x802 y209 w30 h20 , Ω6
Gui, Add, Edit, x835 y208 w120 h20 vw6, %W6%
Gui, Add, Text, x802 y239 w30 h20 , Ω7
Gui, Add, Edit, x835 y238 w120 h20 vw7, %W7%
Gui, Add, Text, x802 y269 w30 h20 , Ω8
Gui, Add, Edit, x835 y268 w120 h20 vw8, %W8%
Gui, Add, Text, x802 y299 w30 h20 , Ω9
Gui, Add, Edit, x835 y298 w120 h20 vw9, %W9%

;~ ////////////////////////GUI SETUP - MISC SETUP
Menu, Tray, Icon, %A_AppData%\KeyChain\Icon\KeyChain.ico
Gui, Add, Button, x880 y560 w110 h20 gHide, Hide
Gui, Add, Button, x740 y560 w110 h20 gsave, Save

DDList= Null|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|0|1|2|3|4|5|6||7|8|9|[|]|;|'|,|.|/|-|=|MButton|Lbutton|Rbutton

Gui, Add, CheckBox, x250 y370 w50 h20 0 vctrl1, CTRL
Gui, Add, CheckBox, x305 y370 w40 h20 valt1, ALT
Gui, Add, CheckBox, x350 y370 w50 h20 vshift1, SHIFT
Gui, Add, DropDownList, x400 y370 w50 h200 vdropdown1, %DDList%
Gui, Add, Edit, x475 y370 w120 h20 vstring1, %string1%

Gui, Add, CheckBox, x250 y410 w50 h20 vctrl2, CTRL
Gui, Add, CheckBox, x305 y410 w40 h20 valt2, ALT
Gui, Add, CheckBox, x350 y410 w50 h20 vshift2, SHIFT
Gui, Add, DropDownList, x400 y410 w50 h200 vdropdown2, %DDList%
Gui, Add, Edit, x475 y410 w120 h20 vstring2, %string2%

Gui, Add, CheckBox, x250 y450 w50 h20 vctrl3, CTRL
Gui, Add, CheckBox, x305 y450 w40 h20 valt3, ALT
Gui, Add, CheckBox, x350 y450 w50 h20 vshift3, SHIFT
Gui, Add, DropDownList, x400 y450 w50 h200 vdropdown3, %DDList%
Gui, Add, Edit, x475 y450 w120 h20 vstring3, %string3%

Gui, Add, CheckBox, x250 y490 w50 h20 vctrl4, CTRL
Gui, Add, CheckBox, x305 y490 w40 h20 valt4, ALT
Gui, Add, CheckBox, x350 y490 w50 h20 vshift4, SHIFT
Gui, Add, DropDownList, x400 y490 w50 h200 vdropdown4, %DDList%
Gui, Add, Edit, x475 y490 w120 h20 vstring4, %string4%

Gui, Add, CheckBox, x250 y530 w50 h20 vctrl5, CTRL
Gui, Add, CheckBox, x305 y530 w40 h20 valt5, ALT
Gui, Add, CheckBox, x350 y530 w50 h20 vshift5, SHIFT
Gui, Add, DropDownList, x400 y530 w50 h200 vdropdown5, %DDList%
Gui, Add, Edit, x475 y530 w120 h20 vstring5, %string5%

Loop, 5{
GuiControl,,ctrl%A_Index%,% ctrl%A_Index%
GuiControl,,alt%A_Index%,% alt%A_Index%
GuiControl,,shift%A_Index%,% shift%A_Index%
guiControl, ChooseString, dropdown%A_Index%,% dropdown%A_Index%
}

Loop, 5{
if (dropdown%A_Index% != "Null" and string%A_Index% != "")
		{
				if(ctrl%A_Index%=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift%A_Index%=1)
			{
				prestring =%prestring%+
			}
			if(alt%A_Index%=1)
			{
				prestring =%prestring%!
			}
			key:= % dropdown%A_Index%
			Hotkey, %prestring%%Key%, hotkey%A_Index%, On
			prestring=
		}
}

Gui, Add, ListView, x645 y375 w300 h170 Grid glistview, Script Name      ~double click to copy~|Type
Loop, %A_AppData%\KeyChain\Scripts\*.*
  LV_Add("",A_LoopFileName, A_LoopFileExt)
  LV_ModifyCol(2, 50)
  LV_ModifyCol(1, 225)
  LV_ModifyCol(2, "SortDesc")
SplashTextOff		
toggle := "OFF"
Gui, Show, w1000 h600, KeyChain
Menu, Tray, Add, Reset Config, ResetConfig
Menu, Tray, Add, Help Documentation, help
Menu, Tray, Add, AHK Keys Guide, ahkkeys
Menu, Tray, Add, Update Scripts, UpdateScripts
Menu, Tray, Add, Show Interface, ShowGui

return


RemoveToolTip:
ToolTip
return

ResetConfig:
  MSGBox, 273, KeyChain - Reset Config, Are you sure you want to do this?`n`nProceeding will reset all of your saved settings within this application.
  IfMsgBox, Cancel 
   return
  Else
	TrayTip KeyChain, Resetting configuration please wait.,
Sleep 5000  
HideTrayTip()
	FileCopyDir, Z:\Development\KeyChain\Icon, %A_AppData%\KeyChain\Icon ,1
	FileCopy, Z:\Development\KeyChain\Inifile.ini, %A_AppData%\KeyChain\Inifile.ini ,1
	reload
return


listview:
if (A_GuiEvent = "DoubleClick")
{
	tooltip
    LV_GetText(RowText, A_EventInfo) 
	clipboard= Script %RowText%
    Tooltip Coppied "Script %RowText%" to clipboard
SetTimer, RemoveToolTip, -2000
}
return

help:
run, %A_AppData%\KeyChain\Icon\KeyChain Help.png
return

ahkkeys:
run, https://www.autohotkey.com/docs/commands/Send.htm
return

ShowGui:
Gui, Show,
return


hotkey1:
send, %string1%
return
hotkey2:
send, %string2%
return
hotkey3:
send, %string3%
return
hotkey4:
send, %string4%
return
hotkey5:
send, %string5%
return

UpdateScripts:
FileRemoveDir,  %A_AppData%\KeyChain\Scripts.old\, 1
FileCopyDir, %A_AppData%\KeyChain\Scripts\, %A_AppData%\KeyChain\Scripts.old\
FileRemoveDir, %A_AppData%\KeyChain\Scripts\, 1
FileCreateDir, %A_AppData%\KeyChain\Scripts\
Loop, Z:\Development\KeyChain\Scripts\*.*
{
   step = %A_Index%
}

stepincrement = 1
Progress, h100 R0-%Step%, , Updating..., Updateding Script Repository
Loop, Z:\Development\KeyChain\Scripts\*.*
{
FileCopy, %a_loopfilefullpath%, %A_AppData%\KeyChain\Scripts\%a_loopfilename%, 1
Progress, %stepincrement%, %a_loopfilename%, Updating..., Updateding Script Repository %a_index% of %step%
Sleep, 50
stepincrement += 1 
IfEqual, a_index, %step%, Progress, Off
}
LV_Delete()
Loop, %A_AppData%\KeyChain\Scripts\*.*
  LV_Add("",A_LoopFileName, A_LoopFileExt)
  LV_ModifyCol(2, 40)
  LV_ModifyCol(1, 200)
  LV_ModifyCol(2, "SortDesc")

TrayTip KeyChain, Scripts Repository Updated Successfully!
Sleep 4000  
HideTrayTip()
return



HideTrayTip() {
    TrayTip  
    if SubStr(A_OSVersion,1,3) = "10." {
        Menu Tray, NoIcon
        Sleep 200 
        Menu Tray, Icon
    }
}


Hide:
WinHide
TrayTip KeyChain, Hidden but not closed!
Sleep 2500  
HideTrayTip()
return


Save:
Loop, 18
{
GuiControlGet, f%A_Index% ,, f%A_Index%
}

Loop, 9
{
GuiControlGet, c%A_Index% ,, C%A_Index%
GuiControlGet, s%A_Index% ,, s%A_Index%
GuiControlGet, a%A_Index% ,, a%A_Index%
GuiControlGet, w%A_Index% ,, w%A_Index%
}
GuiControlGet, ctilde ,, Ctilde
GuiControlGet, stilde ,, stilde
GuiControlGet, atilde ,, atilde
GuiControlGet, wtilde ,, wtilde
Loop, 5
{
GuiControlGet, ctrl%A_Index% ,, ctrl%A_Index%
GuiControlGet, alt%A_Index% ,, alt%A_Index%
GuiControlGet, shift%A_Index% ,, shift%A_Index%
GuiControlGet, dropdown%A_Index% ,, dropdown%A_Index%
GuiControlGet, string%A_Index% ,, string%A_Index%
}

Loop, 18
{
	FuncVar:= f%A_Index%
	IniWrite, %FuncVar%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F%A_Index%
}
Loop, 9
{
	ContVar:= C%A_Index%
	ShiftVar:= S%A_Index%
	AltVar:= A%A_Index%
	WinVar:= W%A_Index%
	IniWrite, %ContVar%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C%A_Index%
	IniWrite, %ShiftVar%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S%A_Index%
	IniWrite, %AltVar%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A%A_Index%
	IniWrite, %WinVar%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W%A_Index%
}
IniWrite, %Ctilde%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C~
IniWrite, %Stilde%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S~
IniWrite, %Atilde%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A~
IniWrite, %Wtilde%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W~
Loop, 5
{
	ContbVar:= ctrl%A_Index%
	AltbVar:= alt%A_Index%
	ShiftbVar:= shift%A_Index%
	DropdownVar:= dropdown%A_Index%
	StringVar:= String%A_Index%	
IniWrite, %ContbVar%, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl%A_Index%
IniWrite, %AltbVar%, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt%A_Index%
IniWrite, %ShiftbVar%, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift%A_Index%
IniWrite, %DropdownVar%, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown%A_Index%
IniWrite, %StringVar%, %A_AppData%\KeyChain\inifile.ini, String, String%A_Index%
}


TrayTip KeyChain, Settings Saved! Reloading.
Sleep 2000
reload
return


ExecuteAction(string_name, string_contents)
{
	if !string_contents
	{
		hotkey, %string_name%, Off		
		;~ send, {%string_name%}
		hotkey, %string_name%, On
		return
	}
	else
IfInString, string_contents, Click
{
	StringSplit, ScriptArray, string_contents, %A_Space%,
    MouseClick, Left, %ScriptArray2%, %ScriptArray3%
    return
}
	else
IfInString, string_contents, Script
{
	StringSplit, ScriptArray, string_contents, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
	else
IfInString, string_contents, Internal
{
	StringSplit, ScriptArray, string_contents, %A_Space%,
    gosub, %ScriptArray2%
    return
}
else
	IfInString, string_contents, Run
	{
	StringSplit, ScriptArray, string_contents, %A_Space%,
    Run, %ScriptArray2%
    return
}
else
	IfInString, string_contents, Google
	{
	oldclip :=clipboard
	 Send, ^c
	Sleep 50
    Run, https://www.google.com/search?q=%clipboard%
	clipboard := oldclip
    return
}
else
send, %string_contents%
}

ShowXY:
global toggle
 if (toggle = "OFF")
 {
	toggle := "ON"
	SetTimer, WatchCursor, 100
}
else
{
	toggle := "OFF"
	SetTimer, WatchCursor, Off
	ToolTip
}
RETURN

WatchCursor:
MouseGetPos, xpos, ypos
ToolTip, %xpos% : %ypos%
return

F1::ExecuteAction("F1", F1)
F2::ExecuteAction("F2", F2)
F3::ExecuteAction("F3", F4)
F4::ExecuteAction("F4", F4)
F5::ExecuteAction("F5", F5)
F6::ExecuteAction("F6", F6)
F7::ExecuteAction("F7", F7)
F8::ExecuteAction("F8", F8)
F9::ExecuteAction("F9", F9)
F10::ExecuteAction("F10", F10)
F11::ExecuteAction("F11", F11)
F13::ExecuteAction("F13", F13)
F14::ExecuteAction("F14", F14)
F15::ExecuteAction("F15", F15)
F16::ExecuteAction("F16", F16)
F17::ExecuteAction("F17", F17)
F18::ExecuteAction("F18", F18)

^`::ExecuteAction("^`", Ctilde)
^1::ExecuteAction("^1", C1)
^2::ExecuteAction("^2", C2)
^3::ExecuteAction("^3", C3)
^4::ExecuteAction("^4", C4)
^5::ExecuteAction("^5", C5)
^6::ExecuteAction("^6", C6)
^7::ExecuteAction("^7", C7)
^8::ExecuteAction("^8", C8)
^9::ExecuteAction("^9", C9)

^+`::ExecuteAction("^+`", Stilde)
^+1::ExecuteAction("^+1", S1)
^+2::ExecuteAction("^+2", S2)
^+3::ExecuteAction("^+3", S3)
^+4::ExecuteAction("^+4", S4)
^+5::ExecuteAction("^+5", S5)
^+6::ExecuteAction("^+6", S6)
^+7::ExecuteAction("^+7", S7)
^+8::ExecuteAction("^+8", S8)
^+9::ExecuteAction("^+9", S9)

!`::ExecuteAction("!`", Atilde)
!1::ExecuteAction("!1", A1)
!2::ExecuteAction("!2", A2)
!3::ExecuteAction("!3", A3)
!4::ExecuteAction("!4", A4)
!5::ExecuteAction("!5", A5)
!6::ExecuteAction("!6", A6)
!7::ExecuteAction("!7", A7)
!8::ExecuteAction("!8", A8)
!9::ExecuteAction("!9", A9)

#`::ExecuteAction("#`", Wtilde)
#1::ExecuteAction("#1", W1)
#2::ExecuteAction("#2", W2)
#3::ExecuteAction("#3", W3)
#4::ExecuteAction("#4", W4)
#5::ExecuteAction("#5", W5)
#6::ExecuteAction("#6", W6)
#7::ExecuteAction("#7", W7)
#8::ExecuteAction("#8", W8)
#9::ExecuteAction("#9", W9)

GuiClose:
ExitApp

F12::
Reload
return
