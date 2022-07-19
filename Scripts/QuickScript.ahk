Gui,Add,Edit,x1 y1 w500 h500 vscript,
Gui,Add,Button,x393 y508 w43 h23 gstop,Stop
Gui,Add,Button,x453 y508 w43 h23 grun,Run
Gui,Show,w505 h540,Script Runner
return


run:
Gui, submit, nohide
FileDelete, Quicktest.ahk
fileappend,%script%,Quicktest.ahk
Run, Quicktest.ahk
return

stop:
DetectHiddenWindows, On 
WinClose, %A_WorkingDir%\Quicktest.ahk ahk_class AutoHotkey
return