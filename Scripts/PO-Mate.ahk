Gui, Add, Button, x2 y29 w130 h30 gPhase1, Phase 1 (PST Entry)
Gui, Add, Button, x2 y79 w130 h30 gPhase2, Phase 2 (Reports)
Gui, Add, Button, x2 y129 w130 h30 gPhase3, Phase 3 (JDE PO Create)
Gui, Add, Button, x2 y179 w130 h30 gPhase4, Phase 4 (Bom Upload)
Gui, Add, Button, x2 y229 w130 h30 , Phase 5
Gui, Add, Button, x2 y279 w130 h30 gPhase6, Phase 6 (Mass Set Req's)
Gui, Add, Button, x2 y329 w130 h30 gPhase7, Phase 7 (Mass Item Upload)
Gui, Add, ListBox, x282 y29 w180 h140 glistboxaction vlist, 
Gui, Add, Button, x383 y165 w80 h30 grefreshlist, Refresh List
Gui, Add, Text, x282 y199 w180 h80 vStatus, Idle
; Generated using SmartGUI Creator for SciTE
Gui, Show, w479 h379, PO-Mate
return

GuiClose:
ExitApp


refreshlist:
;~ Grab Active Folders for name match
	GuiControl,, list, |
titles =
WinGet, explorer, List, ahk_class CabinetWClass ahk_exe explorer.exe
Loop, %explorer% {
 WinGetTitle, wTitle, % "ahk_id " explorer%A_Index%
 titles .= "`n" wTitle

}

foldersopen= % titles := SubStr(titles, 2)

;~ Select Which folder to base info off of
;~ Gui, Show, w479 h379, Untitled GUI
;~ Gui Add, ListBox, w200 h200 glistboxaction vlist, 

Loop, parse, foldersopen, `n, `r
{
	;~ msgbox, %A_LoopField%
	Result := StrReplace(A_LoopField, """", All)
	Result :=Trim(Result)
	GuiControl,, list,%Result%|
}	
return





Phase1:
GuiControl,, Status, % "Phase 1 starting"
ReqNum=%Clipboard%
;~ Navigate E P S D E
WinActivate, Epic Pipe Supports Data Entry
ControlClick, x170 y 80, Epic Pipe Supports Data Entry
sleep, 500
ControlClick, x178 y122, Epic Pipe Supports Data Entry
Sleep, 200
send, ^a {Backspace 30}
sleep, 200
Send, %ReqNum%
sleep, 500
ControlClick2(194, 209, "Epic Pipe Supports Data Entry")

;~ Grab Active Folders for name match
GuiControl,, list, |
titles =
WinGet, explorer, List, ahk_class CabinetWClass ahk_exe explorer.exe
Loop, %explorer% {
 WinGetTitle, wTitle, % "ahk_id " explorer%A_Index%
 titles .= "`n" wTitle

}

foldersopen= % titles := SubStr(titles, 2)

;~ Select Which folder to base info off of
;~ Gui, Show, w479 h379, Untitled GUI
;~ Gui Add, ListBox, w200 h200 glistboxaction vlist, 

Loop, parse, foldersopen, `n, `r
{
	;~ msgbox, %A_LoopField%
	Result := StrReplace(A_LoopField, """", All)
	Result :=Trim(Result)
	GuiControl,, list,%Result%|
}	
GuiControl,, Status, % "Phase 1 - Select the correct Folder"
	WinActivate, PO-Mate
	Trigger=1
return



listboxaction:
if (Trigger=1)
{
if A_GuiControlEvent <> DoubleClick
	GuiControlGet, list
Selected = %List%
StringReplace, Job_WO, List, -, _, All


Sleep, 200
ControlClick, x174 y157, Epic Pipe Supports Data Entry
sleep, 100
Send, %Job_WO%
sleep, 200
ControlClick, Update, Epic Pipe Supports Data Entry
sleep, 200
GuiControl,, Status, % "Phase 1 - Completed`n Next: Manually upload BOM"
Gui, Show
WinActivate, ahk_exe Epic PS.exe
ControlClick, OK, Save Complete
Trigger=0
}
if (Trigger=0)
{
}
Return


;~ Generates Reports.
Phase2:
GuiControl,, Status, % "Phase 2 starting PO Upload Report."
Winactivate, ahk_exe Epic PS.exe
;~ BOM Report


ControlClick, x50 y44, ahk_exe Epic PS.exe
sleep, 400
Send, {down 2}
sleep, 300
Send, {right}
sleep, 300
Send, {Down 3}
sleep, 300
Send, {Enter}
WinWait, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 200
ControlClick, x219 y73, Epic Pipe Supports Data Entry - [SQL Reports]
loop {
 	PixelGetColor, avail, 1850, 530, rgb
 	Sleep, 50
 } until avail = 0xFFFFFF
 sleep, 300
send, %Job_WO%
sleep, 300
ControlClick, x622 y73, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 300
Send, RM
sleep, 500
ControlClick, View Report, Epic Pipe Supports Data Entry - [SQL Reports]


loop {
 	PixelGetColor, avail, 93, 147, rgb
 	Sleep, 50
 } until avail = 0xFFA500
 Winactivate, ahk_exe Epic PS.exe
sleep, 500
Click, 340, 126, Left
sleep, 400
send, {down 2}
sleep, 300
send, {enter}
GuiControl,, Status, % "Phase 2 Waiting for Folder to be set."
MsgBox, 48, Set Path, Manually set the path, 1
Winactivate, ahk_exe Epic PS.exe
loop {
            GuiControl,, Status, % "Phase 2 Waiting for Folder to be set"
 	 	Sleep, 150
            GuiControl,, Status, % "Phase 2 Waiting for Folder to be set."
 	 	Sleep, 150
            GuiControl,, Status, % "Phase 2 Waiting for Folder to be set.."
 	 	Sleep, 150
            GuiControl,, Status, % "Phase 2 Waiting for Folder to be set..."
 	 	Sleep, 150
 } until !WinExist("Save As")

sleep, 300

ControlClick, x1915 y40, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 500
GuiControl,, Status, % "Phase 2 starting Bom Report."

ControlClick, x50 y44, ahk_exe Epic PS.exe
sleep, 400
Send, {down 2}
sleep, 300
Send, {right}
sleep, 300
Send, {Up}
sleep, 300
Send, {Enter}
WinWait, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 200
ControlClick, x188 y73, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 300
send, %Job_WO%
sleep, 300
ControlClick, x651 y73, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 300
Send, {Enter}
sleep, 300
ControlClick, x331 y99, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 300
MsgBox, 48, Continue, Set the Date and export the report manually, 1
GuiControl,, Status, % "Phase 2 Complete."
return


Phase3:
GuiControl,, Status, % "Phase 3 starting."
SetKeyDelay, 50
StringTrimRight, JobOnly, Job_WO, 6
WinActivate, ahk_exe msedge.exe
ControlClick, x283 y225, ahk_exe msedge.exe
loop {
 	PixelGetColor, avail, 673, 348, rgb
 	Sleep, 50
 } until avail = 0xDDDDDD
 sleep, 1000
ControlClick, x352 y271, Enter Support Order Int - SM - SO/WO Header Main
Send, 31800
sleep, 200
send, {TAB}
sleep, 200
send, 310%Jobonly%
sleep, 500
ControlClick, x462 y461, Enter Support Order Int - SM - SO/WO Header Main
send, %job_WO%{Tab}SUPPORTS{Tab}31500{Tab}31500{tab 3}
MsgBox, 48, Continue, Set the Date and export the report manually, 1
GuiControl,, Status, % "Phase 3 Complete."
return



Phase4:
GuiControl,, Status, % "Phase 4 Starting"
CoordMode, Mouse, Screen

msgbox, F1 and F2 for locations, CTRL D to save BOM List, 3 to activate per W.O.

F1::
CoordMode, Mouse, Screen
WinGetTitle, wintitle, A
MouseGetPos, f1coordx, f1coordy 
GuiControl,, Status, % "Phase 4 Starting: F1 Set"
return

F2::
CoordMode, Mouse, Screen
WinGetTitle, wintitle, A
MouseGetPos, f2coordx, f2coordy 
GuiControl,, Status, % "Phase 4 Starting: F2 Set"
return



^d::
CoordMode, Mouse, Screen
GuiControl,, Status, % "Phase 4 Starting: BOM Parsed"
myCopiedClipboard := Trim(clipboard)
Sleep 100

linesInArraySeperatedbyNewLine := []

Loop, Parse, myCopiedClipboard, `n, `r
	if Trim(A_LoopField)
		linesInArraySeperatedbyNewLine.Push(A_LoopField)
return

NumLock::
CoordMode, Mouse, Screen
GuiControl,, Status, % "Phase 4: Pasting BOM"
if (f1coordx = "")
{
	Msgbox, Co-ords not set
	return
	}

DllCall("SetCursorPos", "int", f1coordx, "int", f1coordy)
sleep, 150
send, {LButton 3}
sleep, 300
send, ^c
tooltip, %Clipboard%
sleep, 300
masterstring:=
Loop, % linesInArraySeperatedbyNewLine.MaxIndex()
{
	haybail:= linesInArraySeperatedbyNewLine[A_index]
	IfInString, haybail, %Clipboard%
	{
		tooltip, Found: %Clipboard%
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
GuiControl,, Status, % "Phase 4 Selecting Next Part"
	PixelSearch, Px, Py, 216, 449, 808, 1019, 0xCF693C, 3, Fast
    downone:=Py+30
if ErrorLevel
    MsgBox, That color was not found in the specified region.
else
    controlclick, x234 y%Py%, Enter Support Order Int - SM - SO,,Left
    sleep, 300
    controlclick, x234 y%downone%, Enter Support Order Int - SM - SO,,Left
	sleep, 500
    controlclick, x419 y223, Enter Support Order Int - SM - SO,,Left
	sleep, 500
    controlclick, x485 y316, Enter Support Order Int - SM - SO,,Left
RETURN


RemoveToolTip:
ToolTip
GuiControl,, Status, % "Phase 4 Completed"

return



;~ Mass Set PO's
Phase6:
CoordMode, Mouse, Window
GuiControl,, Status, % "Phase 6 starting"
Arraymouse := []
return

#IfWinActive Epic Pipe Supports Data Entry - [Transmittal Add/Edit]
^LButton::
CoordMode, Mouse, Window
{
  MouseGetPos, CurX, CurY
  Arraymouse.Push([CurX, CurY])
}
return
#IfWinActive Epic Pipe Supports Data Entry - [Transmittal Add/Edit]

^q::
CoordMode, Mouse, Window
    For each, element in Arraymouse
    {
        ControlClick, x170 y 80, Epic Pipe Supports Data Entry
        sleep, 500
        items .= element[1] ", " element[2] "`n"
        XLoc .= element[1]
        YLoc .= element[2]
        MouseClick, Left, %XLoc%,  %YLoc%, 2
        XLoc = 
        YLoc = 
        sleep, 1000
        ControlClick, x178 y122, Epic Pipe Supports Data Entry
Sleep, 200
send, ^a {Backspace 30}
sleep, 200
Send, MASS
sleep, 500
ControlClick, Update, Epic Pipe Supports Data Entry
sleep, 1500
send, {Enter}
    }
ControlClick, x170 y 80, Epic Pipe Supports Data Entry
sleep, 500
Job_WO=MASS
goto, Phase7
return



removemass:
CoordMode, Mouse, Window
    For each, element in Arraymouse
    {
        ControlClick, x170 y 80, Epic Pipe Supports Data Entry
        sleep, 500
        items .= element[1] ", " element[2] "`n"
        XLoc .= element[1]
        YLoc .= element[2]
        MouseClick, Left, %XLoc%,  %YLoc%, 2
        XLoc = 
        YLoc = 
        sleep, 1000
        ControlClick, x178 y122, Epic Pipe Supports Data Entry
Sleep, 200
send, ^a {Backspace 30}
sleep, 500
ControlClick, Update, Epic Pipe Supports Data Entry
sleep, 1500
send, {Enter}
    }
ControlClick, x170 y 80, Epic Pipe Supports Data Entry
sleep, 500
return



;~ Mass Create Codes
Phase7:
GuiControl,, Status, % "Phase 7 Starting: ItemMaster Report"
Winactivate, ahk_exe Epic PS.exe
;~ Master Report
ControlClick, x50 y44, ahk_exe Epic PS.exe
sleep, 400
Send, {down 2}
sleep, 300
Send, {right}
sleep, 300
Send, {Down 1}
sleep, 300
Send, {Enter}
WinWait, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 200
ControlClick, x219 y73, Epic Pipe Supports Data Entry - [SQL Reports]
loop {
 	PixelGetColor, avail, 1850, 530, rgb
 	Sleep, 50
 } until avail = 0xFFFFFF

 sleep, 300
send, %Job_WO%
sleep, 500
ControlClick, View Report, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 1000

loop {
 	PixelGetColor, avail, 785, 152, rgb
 	Sleep, 50
 } until avail = 0x4C68A2

 Winactivate, ahk_exe Epic PS.exe
sleep, 500
Click, 340, 126, Left
sleep, 400
send, {down 2}
sleep, 300
send, {enter}
MsgBox, 48, Set Path, Manually set the path, 1
sleep, 3000
WinWaitClose, Save As
sleep, 300

ControlClick, x1915 y40, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 500


GuiControl,, Status, % "Phase 7 Starting: Branch Report"
Winactivate, ahk_exe Epic PS.exe
;~ Branch Report
ControlClick, x50 y44, ahk_exe Epic PS.exe
sleep, 400
Send, {down 2}
sleep, 300
Send, {right}
sleep, 300
Send, {Down 2}
sleep, 300
Send, {Enter}
WinWait, Epic Pipe Supports Data Entry - [SQL Reports]
sleep, 200
ControlClick, x219 y73, Epic Pipe Supports Data Entry - [SQL Reports]
loop {
 	PixelGetColor, avail, 1850, 530, rgb
 	Sleep, 50
 } until avail = 0xFFFFFF
 sleep, 300
send, %Job_WO%
sleep, 300
sleep, 500
ControlClick, View Report, Epic Pipe Supports Data Entry - [SQL Reports]

loop {
 	PixelGetColor, avail, 785, 153, rgb
 	Sleep, 50
 } until avail = 0x4C68A2
 
 Winactivate, ahk_exe Epic PS.exe
sleep, 500
Click, 340, 126, Left
sleep, 400
send, {down 2}
sleep, 300
send, {enter}
sleep, 500
WinWait, Save As

WinWaitClose, Save As
sleep, 300

ControlClick, x1915 y40, Epic Pipe Supports Data Entry - [SQL Reports]
GuiControl,, Status, % "Phase 7 Completed."
sleep, 1000


MsgBox, 36, Remove Mass?, Was this a Mass Item Upload?
IfMsgBox, No 
Exit
IfMsgBox, Yes
    goto, RemoveMass


return




pause::
reload


; ================== Example of usage =================

;~ F11::
    ;~ ControlClick2(60, 116, "ahk_class Notepad")
;~ Return


; ====================== Functions =========================

ControlClick2(X, Y, WinTitle="", WinText="", ExcludeTitle="", ExcludeText="") 
{ 
  hwnd:=ControlFromPoint(X, Y, WinTitle, WinText, cX, cY 
                             , ExcludeTitle, ExcludeText) 
  PostMessage, 0x201, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONDOWN 
  PostMessage, 0x202, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONUP 
  PostMessage, 0x203, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONDBLCLCK 
  PostMessage, 0x202, 0, cX&0xFFFF | cY<<16,, ahk_id %hwnd% ; WM_LBUTTONUP 
} 

; Retrieves the control at the specified point. 
; X         [in]    X-coordinate relative to the top-left of the window. 
; Y         [in]    Y-coordinate relative to the top-left of the window. 
; WinTitle  [in]    Title of the window whose controls will be searched. 
; WinText   [in] 
; cX        [out]   X-coordinate relative to the top-left of the control. 
; cY        [out]   Y-coordinate relative to the top-left of the control. 
; ExcludeTitle [in] 
; ExcludeText  [in] 
; Return Value:     The hwnd of the control if found, otherwise the hwnd of the window. 
ControlFromPoint(X, Y, WinTitle="", WinText="", ByRef cX="", ByRef cY="", ExcludeTitle="", ExcludeText="") 
{ 
    static EnumChildFindPointProc=0 
    if !EnumChildFindPointProc 
        EnumChildFindPointProc := RegisterCallback("EnumChildFindPoint","Fast") 
    
    if !(target_window := WinExist(WinTitle, WinText, ExcludeTitle, ExcludeText)) 
        return false 
    
    VarSetCapacity(rect, 16) 
    DllCall("GetWindowRect","uint",target_window,"uint",&rect) 
    VarSetCapacity(pah, 36, 0) 
    NumPut(X + NumGet(rect,0,"int"), pah,0,"int") 
    NumPut(Y + NumGet(rect,4,"int"), pah,4,"int") 
    DllCall("EnumChildWindows","uint",target_window,"uint",EnumChildFindPointProc,"uint",&pah) 
    control_window := NumGet(pah,24) ? NumGet(pah,24) : target_window 
    DllCall("ScreenToClient","uint",control_window,"uint",&pah) 
    cX:=NumGet(pah,0,"int"), cY:=NumGet(pah,4,"int") 
    return control_window 
} 

; Ported from AutoHotkey::script2.cpp::EnumChildFindPoint() 
EnumChildFindPoint(aWnd, lParam) 
{ 
    if !DllCall("IsWindowVisible","uint",aWnd) 
        return true 
    VarSetCapacity(rect, 16) 
    if !DllCall("GetWindowRect","uint",aWnd,"uint",&rect) 
        return true 
    pt_x:=NumGet(lParam+0,0,"int"), pt_y:=NumGet(lParam+0,4,"int") 
    rect_left:=NumGet(rect,0,"int"), rect_right:=NumGet(rect,8,"int") 
    rect_top:=NumGet(rect,4,"int"), rect_bottom:=NumGet(rect,12,"int") 
    if (pt_x >= rect_left && pt_x <= rect_right && pt_y >= rect_top && pt_y <= rect_bottom) 
    { 
        center_x := rect_left + (rect_right - rect_left) / 2 
        center_y := rect_top + (rect_bottom - rect_top) / 2 
        distance := Sqrt((pt_x-center_x)**2 + (pt_y-center_y)**2) 
        update_it := !NumGet(lParam+24) 
        if (!update_it) 
        { 
            rect_found_left:=NumGet(lParam+8,0,"int"), rect_found_right:=NumGet(lParam+8,8,"int") 
            rect_found_top:=NumGet(lParam+8,4,"int"), rect_found_bottom:=NumGet(lParam+8,12,"int") 
            if (rect_left >= rect_found_left && rect_right <= rect_found_right 
                && rect_top >= rect_found_top && rect_bottom <= rect_found_bottom) 
                update_it := true 
            else if (distance < NumGet(lParam+28,0,"double") 
                && (rect_found_left < rect_left || rect_found_right > rect_right 
                 || rect_found_top < rect_top || rect_found_bottom > rect_bottom)) 
                 update_it := true 
        } 
        if (update_it) 
        { 
            NumPut(aWnd, lParam+24) 
            DllCall("RtlMoveMemory","uint",lParam+8,"uint",&rect,"uint",16) 
            NumPut(distance, lParam+28, 0, "double") 
        } 
    } 
    return true 
}