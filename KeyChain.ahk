;~ KeyChain was developed on 7/1/2022 by Jared Hicks
;~ The purpose of this application is to allow the user to setup, save,
;~ and re use macros
;~ The application allows the user to input any plain text string, and some ahk character mappings
;~ as well as the full name of any script located in the 'Scripts' directory outlined below.
;~ Upon activation via hotkey, the user defined string or AHK script will be sent or executed.
;~ //////////////////////////////////////////////////////////////
;~ //////////////////////////////////////////////////////////////
;~ //////////////////////////////////////////////////////////////
;~ //////////////////////////////////////////////////////////////
;~ //////////////////////////////////////////////////////////////
;~ Copyright (C) [2022] [Jared Hicks]
;~ GNU General Public License
;~ <https://www.gnu.org/licenses>
;~ //////////////////////////////////////////////////////////////
;~ //////////////////////////////////////////////////////////////
;~ //////////////////////////////////////////////////////////////
;~ //////////////////////////////////////////////////////////////
;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////Installation Setup
;~ //////////////////////////////////////////////////////////////
IfNotExist, %A_AppData%\KeyChain
   FileCreateDir, %A_AppData%\KeyChain
   
IfNotExist, %A_AppData%\KeyChain\Scripts
   FileCopyDir, Z:\Development\KeyChain\Scripts, %A_AppData%\KeyChain\Scripts ,
   
IfNotExist, %A_AppData%\KeyChain\Icon
	FileCopyDir, Z:\Development\KeyChain\Icon, %A_AppData%\KeyChain\Icon ,

IfNotExist, %A_AppData%\KeyChain\Inifile.ini
	FileCopy, Z:\Development\KeyChain\Inifile.ini, %A_AppData%\KeyChain\Inifile.ini ,
   
;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI READ - FUNCTION KEYS
;~ //////////////////////////////////////////////////////////////
IniRead, f1, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F1
IniRead, f2, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F2
IniRead, f3, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F3
IniRead, f4, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F4
IniRead, f5, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F5
IniRead, f6, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F6
IniRead, f7, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F7
IniRead, f8, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F8
IniRead, f9, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F9
IniRead, f10, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F10
IniRead, f11, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F11
;~ IniRead, f12, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F12
IniRead, f13, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F13
IniRead, f14, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F14
IniRead, f15, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F15
IniRead, f16, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F16
IniRead, f17, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F17
IniRead, f18, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F18

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI READ - CONTROL KEYS
;~ //////////////////////////////////////////////////////////////
IniRead, Ctilde, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C~
IniRead, C1, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C1
IniRead, C2, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C2
IniRead, C3, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C3
IniRead, C4, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C4
IniRead, C5, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C5
IniRead, C6, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C6
IniRead, C7, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C7
IniRead, C8, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C8
IniRead, C9, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI READ - CONTROL+ SHIFT KEYS
;~ //////////////////////////////////////////////////////////////
IniRead, Stilde, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S~
IniRead, S1, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S1
IniRead, S2, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S2
IniRead, S3, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S3
IniRead, S4, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S4
IniRead, S5, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S5
IniRead, S6, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S6
IniRead, S7, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S7
IniRead, S8, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S8
IniRead, S9, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI READ - ALT KEYS
;~ //////////////////////////////////////////////////////////////
IniRead, Atilde, %A_AppData%\KeyChain\inifile.ini, AltKeys, A~
IniRead, A1, %A_AppData%\KeyChain\inifile.ini, AltKeys, A1
IniRead, A2, %A_AppData%\KeyChain\inifile.ini, AltKeys, A2
IniRead, A3, %A_AppData%\KeyChain\inifile.ini, AltKeys, A3
IniRead, A4, %A_AppData%\KeyChain\inifile.ini, AltKeys, A4
IniRead, A5, %A_AppData%\KeyChain\inifile.ini, AltKeys, A5
IniRead, A6, %A_AppData%\KeyChain\inifile.ini, AltKeys, A6
IniRead, A7, %A_AppData%\KeyChain\inifile.ini, AltKeys, A7
IniRead, A8, %A_AppData%\KeyChain\inifile.ini, AltKeys, A8
IniRead, A9, %A_AppData%\KeyChain\inifile.ini, AltKeys, A9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI READ - WINDOWS KEYS
;~ //////////////////////////////////////////////////////////////
IniRead, Wtilde, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W~
IniRead, W1, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W1
IniRead, W2, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W2
IniRead, W3, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W3
IniRead, W4, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W4
IniRead, W5, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W5
IniRead, W6, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W6
IniRead, W7, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W7
IniRead, W8, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W8
IniRead, W9, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI READ -CHECK BOX
;~ //////////////////////////////////////////////////////////////
IniRead, ctrl1, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl1
IniRead, alt1, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt1
IniRead, shift1, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift1
IniRead, ctrl2, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl2
IniRead, alt2, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt2
IniRead, shift2, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift2
IniRead, ctrl3, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl3
IniRead, alt3, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt3
IniRead, shift3, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift3
IniRead, ctrl4, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl4
IniRead, alt4, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt4
IniRead, shift4, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift4
IniRead, ctrl5, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl5
IniRead, alt5, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt5
IniRead, shift5, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift5

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI READ -DROPDOWN BOX
;~ //////////////////////////////////////////////////////////////
IniRead, dropdown1, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown1
IniRead, dropdown2, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown2
IniRead, dropdown3, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown3
IniRead, dropdown4, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown4
IniRead, dropdown5, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown5


;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI READ -String
;~ //////////////////////////////////////////////////////////////
IniRead, string1, %A_AppData%\KeyChain\inifile.ini, String, string1
IniRead, string2, %A_AppData%\KeyChain\inifile.ini, String, string2
IniRead, string3, %A_AppData%\KeyChain\inifile.ini, String, string3
IniRead, string4, %A_AppData%\KeyChain\inifile.ini, String, string4
IniRead, string5, %A_AppData%\KeyChain\inifile.ini, String, string5

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////GUI SETUP - FUNCTION KEYS
;~ //////////////////////////////////////////////////////////////
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



;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////GUI SETUP - CONTROL KEYS
;~ //////////////////////////////////////////////////////////////
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

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////GUI SETUP - CONTROL + SHIFT KEYS
;~ //////////////////////////////////////////////////////////////
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

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////GUI SETUP - ALT KEYS
;~ //////////////////////////////////////////////////////////////
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

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////GUI SETUP - WINDOWS KEYS
;~ //////////////////////////////////////////////////////////////
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


;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////GUI SETUP - MISC SETUP
;~ //////////////////////////////////////////////////////////////
Menu, Tray, Icon, %A_AppData%/KeyChain/Icon/KeyChain.ico
Gui, Add, Button, x880 y560 w110 h20 gHide, Hide
Gui, Add, Button, x740 y560 w110 h20 gsave, Save


Gui, Add, CheckBox, x250 y370 w50 h20 0 vctrl1, CTRL
Gui, Add, CheckBox, x305 y370 w40 h20 valt1, ALT
Gui, Add, CheckBox, x350 y370 w50 h20 vshift1, SHIFT
Gui, Add, DropDownList, x400 y370 w50 h200 vdropdown1, Null|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|0|1|2|3|4|5|6||7|8|9|[|]|;|'|,|.|/|-|=
Gui, Add, Edit, x475 y370 w120 h20 vstring1, %string1%

Gui, Add, CheckBox, x250 y410 w50 h20 vctrl2, CTRL
Gui, Add, CheckBox, x305 y410 w40 h20 valt2, ALT
Gui, Add, CheckBox, x350 y410 w50 h20 vshift2, SHIFT
Gui, Add, DropDownList, x400 y410 w50 h200 vdropdown2, Null|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|0|1|2|3|4|5|6||7|8|9|[|]|;|'|,|.|/|-|=
Gui, Add, Edit, x475 y410 w120 h20 vstring2, %string2%

Gui, Add, CheckBox, x250 y450 w50 h20 vctrl3, CTRL
Gui, Add, CheckBox, x305 y450 w40 h20 valt3, ALT
Gui, Add, CheckBox, x350 y450 w50 h20 vshift3, SHIFT
Gui, Add, DropDownList, x400 y450 w50 h200 vdropdown3, Null|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|0|1|2|3|4|5|6||7|8|9|[|]|;|'|,|.|/|-|=
Gui, Add, Edit, x475 y450 w120 h20 vstring3, %string3%

Gui, Add, CheckBox, x250 y490 w50 h20 vctrl4, CTRL
Gui, Add, CheckBox, x305 y490 w40 h20 valt4, ALT
Gui, Add, CheckBox, x350 y490 w50 h20 vshift4, SHIFT
Gui, Add, DropDownList, x400 y490 w50 h200 vdropdown4, Null|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|0|1|2|3|4|5|6||7|8|9|[|]|;|'|,|.|/|-|=
Gui, Add, Edit, x475 y490 w120 h20 vstring4, %string4%

Gui, Add, CheckBox, x250 y530 w50 h20 vctrl5, CTRL
Gui, Add, CheckBox, x305 y530 w40 h20 valt5, ALT
Gui, Add, CheckBox, x350 y530 w50 h20 vshift5, SHIFT
Gui, Add, DropDownList, x400 y530 w50 h200 vdropdown5, Null|A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|0|1|2|3|4|5|6||7|8|9|[|]|;|'|,|.|/|-|=
Gui, Add, Edit, x475 y530 w120 h20 vstring5, %string5%


GuiControl,,ctrl1, %ctrl1%
guicontrol,,ctrl2, %ctrl2%
guicontrol,,ctrl3, %ctrl3%
guicontrol,,ctrl4, %ctrl4%
guicontrol,,ctrl5, %ctrl5%
GuiControl,,alt1, %alt1%
guicontrol,,alt2, %alt2%
guicontrol,,alt3, %alt3%
guicontrol,,alt4, %alt4%
guicontrol,,alt5, %alt5%
GuiControl,,shift1, %shift1%
guicontrol,,shift2, %shift2%
guicontrol,,shift3, %shift3%
guicontrol,,shift4, %shift4%
guicontrol,,shift5, %shift5%

guiControl, ChooseString, dropdown1, %dropdown1%
guiControl, ChooseString, dropdown2, %dropdown2%
guiControl, ChooseString, dropdown3, %dropdown3%
guiControl, ChooseString, dropdown4, %dropdown4%
guiControl, ChooseString, dropdown5, %dropdown5%

if dropdown1 != null
		{
				if(ctrl1=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift1=1)
			{
				prestring =%prestring%+
			}
			if(alt1=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown1%, hotkey1, On
			prestring=
		}
if dropdown2 != null
		{
				if(ctrl2=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift2=1)
			{
				prestring =%prestring%+
			}
			if(alt2=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown2%, hotkey2, On
			prestring=
		}
if dropdown3 != null
		{
				if(ctrl3=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift3=1)
			{
				prestring =%prestring%+
			}
			if(alt3=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown3%, hotkey3, On
			prestring=
		}
if dropdown4 != null
		{
				if(ctrl4=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift4=1)
			{
				prestring =%prestring%+
			}
			if(alt4=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown4%, hotkey4, On
			prestring=
		}
if dropdown5 != null
		{
				if(ctrl5=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift5=1)
			{
				prestring =%prestring%+
			}
			if(alt5=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown5%, hotkey5, On
			prestring=
		}
		
		
Gui, Show, w1000 h600, KeyChain
Menu, Tray, Add, Show, ShowGui
Menu, Tray, Add, Update Scripts, UpdateScripts

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
   FileCopyDir, Z:\Development\KeyChain\Scripts, %A_AppData%\KeyChain\Scripts , 1
   Msgbox, Scripts Updated.
   return


Hide:
WinHide
return

Save:
;~ Hotkey, %dropdown1%, Off
;~ Hotkey, %dropdown2%, Off
;~ Hotkey, %dropdown3%, Off
;~ Hotkey, %dropdown4%, Off
;~ Hotkey, %dropdown5%, Off

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////READ VARIABLES - FUNCTION KEYS
;~ //////////////////////////////////////////////////////////////
GuiControlGet, f1 ,, f1
GuiControlGet, f2 ,, f2
GuiControlGet, f3 ,, f3
GuiControlGet, f4 ,, f4
GuiControlGet, f5 ,, f5
GuiControlGet, f6 ,, f6
GuiControlGet, f7 ,, f7
GuiControlGet, f8 ,, f8
GuiControlGet, f9 ,, f9
GuiControlGet, f10 ,, f10
GuiControlGet, f11 ,, f11
GuiControlGet, f12 ,, f12
GuiControlGet, f13 ,, f13
GuiControlGet, f14 ,, f14
GuiControlGet, f15 ,, f15
GuiControlGet, f16 ,, f16
GuiControlGet, f17 ,, f17
GuiControlGet, f18 ,, f18

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////READ VARIABLES - CONTROL KEYS
;~ //////////////////////////////////////////////////////////////
GuiControlGet, ctilde ,, Ctilde
GuiControlGet, c1 ,, C1
GuiControlGet, c2 ,, C2
GuiControlGet, c3 ,, C3
GuiControlGet, c4 ,, C4
GuiControlGet, c5 ,, C5
GuiControlGet, c6 ,, C6
GuiControlGet, c7 ,, C7
GuiControlGet, c8 ,, C8
GuiControlGet, c9 ,, C9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////READ VARIABLES - CONTROL + SHIFT KEYS
;~ //////////////////////////////////////////////////////////////
GuiControlGet, stilde ,, stilde
GuiControlGet, s1 ,, s1
GuiControlGet, s2 ,, s2
GuiControlGet, s3 ,, s3
GuiControlGet, s4 ,, s4
GuiControlGet, s5 ,, s5
GuiControlGet, s6 ,, s6
GuiControlGet, s7 ,, s7
GuiControlGet, s8 ,, s8
GuiControlGet, s9 ,, s9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////READ VARIABLES - ALT KEYS
;~ //////////////////////////////////////////////////////////////
GuiControlGet, atilde ,, atilde
GuiControlGet, a1 ,, a1
GuiControlGet, a2 ,, a2
GuiControlGet, a3 ,, a3
GuiControlGet, a4 ,, a4
GuiControlGet, a5 ,, a5
GuiControlGet, a6 ,, a6
GuiControlGet, a7 ,, a7
GuiControlGet, a8 ,, a8
GuiControlGet, a9 ,, a9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////READ VARIABLES - WINDOWS KEYS
;~ //////////////////////////////////////////////////////////////
GuiControlGet, wtilde ,, wtilde
GuiControlGet, w1 ,, w1
GuiControlGet, w2 ,, w2
GuiControlGet, w3 ,, w3
GuiControlGet, w4 ,, w4
GuiControlGet, w5 ,, w5
GuiControlGet, w6 ,, w6
GuiControlGet, w7 ,, w7
GuiControlGet, w8 ,, w8
GuiControlGet, w9 ,, w9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////READ VARIABLES - CHECKBOX
;~ //////////////////////////////////////////////////////////////
GuiControlGet, ctrl1 ,, ctrl1
GuiControlGet, alt1 ,, alt1
GuiControlGet, shift1 ,, shift1
GuiControlGet, ctrl2 ,, ctrl2
GuiControlGet, alt2 ,, alt2
GuiControlGet, shift2 ,, shift2
GuiControlGet, ctrl3 ,, ctrl3
GuiControlGet, alt3 ,, alt3
GuiControlGet, shift3 ,, shift3
GuiControlGet, ctrl4 ,, ctrl4
GuiControlGet, alt4 ,, alt4
GuiControlGet, shift4 ,, shift4
GuiControlGet, ctrl5 ,, ctrl5
GuiControlGet, alt5 ,, alt5
GuiControlGet, shift5 ,, shift5

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////READ VARIABLES - Dropdown
;~ //////////////////////////////////////////////////////////////
GuiControlGet, dropdown1 ,, dropdown1
GuiControlGet, dropdown2 ,, dropdown2
GuiControlGet, dropdown3 ,, dropdown3
GuiControlGet, dropdown4 ,, dropdown4
GuiControlGet, dropdown5 ,, dropdown5

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////READ VARIABLES - String
;~ //////////////////////////////////////////////////////////////
GuiControlGet, string1 ,, string1
GuiControlGet, string2 ,, string2
GuiControlGet, string3 ,, string3
GuiControlGet, string4 ,, string4
GuiControlGet, string5 ,, string5

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI WRITE - FUNCTION KEYS
;~ //////////////////////////////////////////////////////////////
IniWrite, %f1%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F1
IniWrite, %f2%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F2
IniWrite, %f3%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F3
IniWrite, %f4%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F4
IniWrite, %f5%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F5
IniWrite, %f6%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F6
IniWrite, %f7%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F7
IniWrite, %f8%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F8
IniWrite, %f9%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F9
IniWrite, %f10%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F10
IniWrite, %f11%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F11
IniWrite, %f12%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F12
IniWrite, %f13%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F13
IniWrite, %f14%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F14
IniWrite, %f15%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F15
IniWrite, %f16%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F16
IniWrite, %f17%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F17
IniWrite, %f18%, %A_AppData%\KeyChain\inifile.ini, FunctionKeys, F18

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI WRITE - CONTROL KEYS
;~ //////////////////////////////////////////////////////////////
IniWrite, %Ctilde%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C~
IniWrite, %C1%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C1
IniWrite, %C2%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C2
IniWrite, %C3%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C3
IniWrite, %C4%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C4
IniWrite, %C5%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C5
IniWrite, %C6%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C6
IniWrite, %C7%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C7
IniWrite, %C8%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C8
IniWrite, %C9%, %A_AppData%\KeyChain\inifile.ini, ControlKeys, C9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI WRITE - CONTROL + SHIFT KEYS
;~ //////////////////////////////////////////////////////////////
IniWrite, %Stilde%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S~
IniWrite, %S1%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S1
IniWrite, %S2%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S2
IniWrite, %S3%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S3
IniWrite, %S4%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S4
IniWrite, %S5%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S5
IniWrite, %S6%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S6
IniWrite, %S7%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S7
IniWrite, %S8%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S8
IniWrite, %S9%, %A_AppData%\KeyChain\inifile.ini, ShiftKeys, S9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI WRITE - ALT KEYS
;~ //////////////////////////////////////////////////////////////
IniWrite, %Atilde%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A~
IniWrite, %A1%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A1
IniWrite, %A2%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A2
IniWrite, %A3%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A3
IniWrite, %A4%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A4
IniWrite, %A5%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A5
IniWrite, %A6%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A6
IniWrite, %A7%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A7
IniWrite, %A8%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A8
IniWrite, %A9%, %A_AppData%\KeyChain\inifile.ini, AltKeys, A9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI WRITE - WINDOWS KEYS
;~ //////////////////////////////////////////////////////////////
IniWrite, %Wtilde%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W~
IniWrite, %W1%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W1
IniWrite, %W2%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W2
IniWrite, %W3%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W3
IniWrite, %W4%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W4
IniWrite, %W5%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W5
IniWrite, %W6%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W6
IniWrite, %W7%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W7
IniWrite, %W8%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W8
IniWrite, %W9%, %A_AppData%\KeyChain\inifile.ini, WindowsKeys, W9

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI WRITE - CHECK BOX
;~ //////////////////////////////////////////////////////////////
IniWrite, %ctrl1%, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl1
IniWrite, %alt1%, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt1
IniWrite, %shift1%, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift1
IniWrite, %ctrl2%, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl2
IniWrite, %alt2%, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt2
IniWrite, %shift2%, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift2
IniWrite, %ctrl3%, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl3
IniWrite, %alt3%, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt3
IniWrite, %shift3%, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift3
IniWrite, %ctrl4%, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl4
IniWrite, %alt4%, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt4
IniWrite, %shift4%, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift4
IniWrite, %ctrl5%, %A_AppData%\KeyChain\inifile.ini, Checkbox, ctrl5
IniWrite, %alt5%, %A_AppData%\KeyChain\inifile.ini, Checkbox, alt5
IniWrite, %shift5%, %A_AppData%\KeyChain\inifile.ini, Checkbox, shift5

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI WRITE - Dropdown
;~ //////////////////////////////////////////////////////////////
IniWrite, %dropdown1%, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown1
IniWrite, %dropdown2%, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown2
IniWrite, %dropdown3%, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown3
IniWrite, %dropdown4%, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown4
IniWrite, %dropdown5%, %A_AppData%\KeyChain\inifile.ini, Dropdown, dropdown5

;~ //////////////////////////////////////////////////////////////
;~ ////////////////////////INI WRITE - String
;~ //////////////////////////////////////////////////////////////
IniWrite, %String1%, %A_AppData%\KeyChain\inifile.ini, String, String1
IniWrite, %String2%, %A_AppData%\KeyChain\inifile.ini, String, String2
IniWrite, %String3%, %A_AppData%\KeyChain\inifile.ini, String, String3
IniWrite, %String4%, %A_AppData%\KeyChain\inifile.ini, String, String4
IniWrite, %String5%, %A_AppData%\KeyChain\inifile.ini, String, String5
prestring=
if dropdown1 != null
		{
				if(ctrl1=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift1=1)
			{
				prestring =%prestring%+
			}
			if(alt1=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown1%, hotkey1, On
			prestring=
		}
if dropdown2 != null
		{
				if(ctrl2=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift2=1)
			{
				prestring =%prestring%+
			}
			if(alt2=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown2%, hotkey2, On
			prestring=
		}
if dropdown3 != null
		{
				if(ctrl3=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift3=1)
			{
				prestring =%prestring%+
			}
			if(alt3=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown3%, hotkey3, On
			prestring=
		}
if dropdown4 != null
		{
				if(ctrl4=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift4=1)
			{
				prestring =%prestring%+
			}
			if(alt4=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown4%, hotkey4, On
			prestring=
		}
if dropdown5 != null
		{
				if(ctrl5=1)
			{
				prestring =%prestring%^
			}
			else
				prestring=
			if(shift5=1)
			{
				prestring =%prestring%+
			}
			if(alt5=1)
			{
				prestring =%prestring%!
			}
			Hotkey, %prestring%%dropdown5%, hotkey5, On
			prestring=
		}

FormatTime, CurrentDateTime,, MM-dd-yy hh:mm
Gui, Show, , KeyChain                                                                                                                                                                                                           Last Saved at %CurrentDateTime%
return



F1::
	if !F1
	{
		hotkey, F1, Off		
		send, {F1}
	}
	else
IfInString, F1, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f1%
		hotkey, F1, On
return

F2::
	if !F2
	{
		hotkey, F2, Off
		send, {F2}
	}
	else
IfInString, F2, Script
{
	StringSplit, ScriptArray, F2, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f2%
		hotkey, F2, On
return



F3::
	if !F3
	{
		hotkey, F3, Off
		send, {F3}
	}
	else
IfInString, F3, Script
{
	StringSplit, ScriptArray, F3, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f3%
		hotkey, F3, On
return

F4::
	if !F4
	{
		hotkey, F4, Off
		send, {F4}
	}
	else
IfInString, F4, Script
{
	StringSplit, ScriptArray, F4, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f4%
		hotkey, F4, On
return

F5::
	if !F5
	{
		hotkey, F5, Off
		send, {F5}
	}
	else
IfInString, F5, Script
{
	StringSplit, ScriptArray, F5, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f5%
		hotkey, F5, On
return


F6::
	if !F6
	{
		hotkey, F6, Off
		send, {F6}
	}
	else
IfInString, F6, Script
{
	StringSplit, ScriptArray, F6, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f6%
		hotkey, F6, On
return

F7::
	if !F7
	{
		hotkey, F7, Off
		send, {F7}
	}
	else
IfInString, F7, Script
{
	StringSplit, ScriptArray, F7, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f7%
		hotkey, F7, On
return

F8::
	if !F8
	{
		hotkey, F8, Off
		send, {F8}
	}
	else
IfInString, F8, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f8%
		hotkey, F8, On
return

F9::
	if !F9
	{
		hotkey, F9, Off
		send, {F9}
	}
	else
IfInString, F9, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f9%
		hotkey, F9, On
return


F10::
	if !F10
	{
		hotkey, F10, Off
		send {F10}
	}
	else
IfInString, F10, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f10%
		hotkey, F10, On
return

F11::
	if !F11
	{
		hotkey, F11, Off
		send {F11}
	}
	else

IfInString, F11, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f11%
		hotkey, F11, On
return


F13::
;~ send, {escape 2}^n
IfInString, F13, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f13%
return

F14::
;~ send, {escape 2}3
IfInString, F14, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f14%
return

F15::
;~ send, {escape 2}t
IfInString, F15, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f15%
return

F16::
;~ send, {escape 2}d{BackSpace}0{Enter}
IfInString, F16, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f16%
return

F17::
;~ send, {escape 2}1{BackSpace}0{Enter}
IfInString, F17, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f17%
return

F18::
;~ send, {escape 2}{Shift}{L}
IfInString, F18, Script
{
	StringSplit, ScriptArray, F1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %f18%
return

^`::
	if !Ctilde
	{
		send, {^`}
	}
	else
IfInString, Ctilde, Script
{
	StringSplit, ScriptArray, Ctilde, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %Ctilde%
return


^1::
	if !C1
	{
		send, {^1}
	}
	else
IfInString, C1, Script
{
	StringSplit, ScriptArray, C1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %C1%
RETURN

^2::
	if !C2
	{
		send, {^2}
	}
	else
IfInString, C2, Script
{
	StringSplit, ScriptArray, C2, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %C2%
RETURN

^3::
	if !C3
	{
		send, {^3}
	}
	else
IfInString, C3, Script
{
	StringSplit, ScriptArray, C3, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %C3%
RETURN

^4::
	if !C4
	{
		send, {^4}
	}
	else
IfInString, C4, Script
{
	StringSplit, ScriptArray, C4, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %C4%
RETURN

^5::
	if !C5
	{
		send, {^5}
	}
	else
IfInString, C5, Script
{
	StringSplit, ScriptArray, C5, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %C5%
RETURN

^6::
	if !C6
	{
		send, {^6}
	}
	else
IfInString, C6, Script
{
	StringSplit, ScriptArray, C6, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %C6%
RETURN

^7::
	if !C7
	{
		send, {^7}
	}
	else
IfInString, C7, Script
{
	StringSplit, ScriptArray, C7, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %C7%
RETURN

^8::
	if !C8
	{
		send, {^8}
	}
	else
IfInString, C8, Script
{
	StringSplit, ScriptArray, C8, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %C8%
RETURN

^9::
	if !C9
	{
		send, {^9}
	}
	else
IfInString, C9, Script
{
	StringSplit, ScriptArray, C9, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %C9%
RETURN


^+`::
	if !Stilde
	{
		send, {^+`}
	}
	else
IfInString, Stilde, Script
{
	StringSplit, ScriptArray, Stilde, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %Stilde%
RETURN

^+1::
	if !S1
	{
		send, {^+1}
	}
	else
IfInString, S1, Script
{
	StringSplit, ScriptArray, S1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %S1%
RETURN

^+2::
	if !S2
	{
		send, {^+2}
	}
	else
IfInString, S2, Script
{
	StringSplit, ScriptArray, S2, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %S2%
RETURN

^+3::
	if !S3
	{
		send, {^+3}
	}
	else
IfInString, S3, Script
{
	StringSplit, ScriptArray, S3, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %S3%
RETURN

^+4::
	if !S4
	{
		send, {^+4}
	}
	else
IfInString, S4, Script
{
	StringSplit, ScriptArray, S4, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %S4%
RETURN

^+5::
	if !S5
	{
		send, {^+5}
	}
	else
IfInString, S5, Script
{
	StringSplit, ScriptArray, S5, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %S5%
RETURN

^+6::
	if !S6
	{
		send, {^+6}
	}
	else
IfInString, S6, Script
{
	StringSplit, ScriptArray, S6, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %S6%
RETURN

^+7::
	if !S7
	{
		send, {^+7}
	}
	else
IfInString, S7, Script
{
	StringSplit, ScriptArray, S7, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %S7%
RETURN

^+8::
	if !S8
	{
		send, {^+8}
	}
	else
IfInString, S8, Script
{
	StringSplit, ScriptArray, S8, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %S8%
RETURN

^+9::
	if !S9
	{
		send, {^+9}
	}
	else
IfInString, S9, Script
{
	StringSplit, ScriptArray, S9, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %S9%
RETURN


!`::
	if !Atilde
	{
		send, {Lalt Down}`{Lalt Up}
	}
	else
IfInString, Atilde, Script
{
	StringSplit, ScriptArray, Atilde, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %Atilde%
RETURN

!1::
	if !A1
	{
		send, {!1}
	}
	else
IfInString, A1, Script
{
	StringSplit, ScriptArray, A1, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %A1%
RETURN

!2::
	if !A2
	{
		send, {!2}
	}
	else
IfInString, A2, Script
{
	StringSplit, ScriptArray, A2, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %A2%
RETURN

!3::
	if !A3
	{
		send, {!3}
	}
	else
IfInString, A3, Script
{
	StringSplit, ScriptArray, A3, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %A3%
RETURN

!4::
	if !A4
	{
		send, {!4}
	}
	else
IfInString, A4, Script
{
	StringSplit, ScriptArray, A4, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %A4%
RETURN

!5::
	if !A5
	{
		send, {!5}
	}
	else
IfInString, A5, Script
{
	StringSplit, ScriptArray, A5, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %A5%
RETURN

!6::
	if !A6
	{
		send, {!6}
	}
	else
IfInString, A6, Script
{
	StringSplit, ScriptArray, A6, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %A6%
RETURN

!7::
	if !A7
	{
		send, {!7}
	}
	else
IfInString, A7, Script
{
	StringSplit, ScriptArray, A7, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %A7%
RETURN

!8::
	if !A8
	{
		send, {!8}
	}
	else
IfInString, A8, Script
{
	StringSplit, ScriptArray, A8, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %A8%
RETURN

!9::
	if !A9
	{
		send, {!9}
	}
	else
IfInString, A9, Script
{
	StringSplit, ScriptArray, A9, %A_Space%,
    Run %A_AppData%/KeyChain/Scripts/%ScriptArray2%
    return
}
else
send, %A9%
RETURN


#`::
	if !Wtilde
	{
		send, {LWin Down}`{LWin Up}
	}
	else
IfInString, Wtilde, Script
{
	StringSplit, ScriptArray, Wtilde, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %Wtilde%
RETURN

#1::
	if !W1
	{
		send, {LWin Down}1{LWin Up}
	}
	else
IfInString, W1, Script
{
	StringSplit, ScriptArray, W1, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %W1%
RETURN

#2::
	if !W2
	{
		send, {LWin Down}2{LWin Up}
	}
	else
IfInString, W2, Script
{
	StringSplit, ScriptArray, W2, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %W2%
RETURN

#3::
	if !W3
	{
		send, {LWin Down}3{LWin Up}
	}
	else
IfInString, W3, Script
{
	StringSplit, ScriptArray, W3, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %W3%
RETURN

#4::
	if !W4
	{
		send, {LWin Down}4{LWin Up}
	}
	else
IfInString, W4, Script
{
	StringSplit, ScriptArray, W4, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %W4%
RETURN

#5::
	if !W5
	{
		send, {LWin Down}5{LWin Up}
	}
	else
IfInString, W5, Script
{
	StringSplit, ScriptArray, W5, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %W5%
RETURN

#6::
	if !W6
	{
		send, {LWin Down}6{LWin Up}
	}
	else
IfInString, W6, Script
{
	StringSplit, ScriptArray, W6, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %W6%
RETURN

#7::
	if !W7
	{
		send, {LWin Down}7{LWin Up}
	}
	else
IfInString, W7, Script
{
	StringSplit, ScriptArray, W7, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %W7%
RETURN

#8::
	if !W8
	{
		send, {{LWin Down}8{LWin Up}
	}
	else
IfInString, W8, Script
{
	StringSplit, ScriptArray, W8, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %W8%
RETURN

#9::
	if !W9
	{
		send, {LWin Down}9{LWin Up}
	}
	else
IfInString, W9, Script
{
	StringSplit, ScriptArray, W9, %W_Space%,
    Run %W_WorkingDir%/Scripts/%ScriptArray2%
    return
}
else
send, %W9%
RETURN


	GuiClose:
  MSGBox, 4, , Would you like to save any changes?
  IfMsgBox, No 
    ExitApp 
  Else
    GoSub, Save
		ExitApp
Return
	ExitApp
	


F12::
Reload
return