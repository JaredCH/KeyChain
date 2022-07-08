
;Number formatting, decimals, and groupbox dividers
Gui, Margin, -2, -2
Gui, Add, GroupBox, x-5 y-8 w298 h93 cblack,
Gui, Add, GroupBox, x-5 y-7 w298 h93 cblack,



;Top GUI control - quanitity dropdown list
Gui, Add, DropDownList, x75 y4 w145 h20 r26 gunits vunits, Area||

;Middle GUI controls, from and to units
Gui, Add, DropDownList, x6 y28 w125 h20 r30 vfrom gcalc,
Gui, Add, Text, x138 y28 w17 h20 gswap vswap +Center, To:
Gui, Add, DropDownList, x161 y28 w125 h20 r30 vto gcalc,

;Bottom GUI controls, input and result
Gui, Add, Edit, x6 y48 w125 h20 gcalc vtot,
Gui, add, updown,range1-1000 +wrap 0x80 vgoaway,1
Gui, Add, Text, x131 y48 w30 h20 +Center vequal, =
Gui, Add, Edit, x161 y48 w125 h20 vrez +readonly,


gosub, units
gosub reg
Gui, Show, AutoSize, Unit Converter v2.1
Return

GuiClose:
ExitApp

swap:
If units=Physical Constants
   return
If units=Mathematical Constants
   return
Gui, submit, nohide
GuiControlGet, From, , Combobox4
GuiControlGet, To, , Combobox5
ControlGet, List ,List, List, Combobox4
StringReplace, List, List, `n, |, all
List .= "|"
StringReplace, FromList, List, %From%|, %From%||
StringReplace, ToList, List, %To%|, %To%||
GuiControl, , Combobox4, |
GuiControl, , Combobox4, %ToList%
GuiControl, , Combobox5, |
GuiControl, , Combobox5, %FromList%
gosub calc
Return



reg:
     gosub calc
return










units:
Gui, submit, nohide

if units=CALCULATOR
{

Guicontrol,Hide,tot
Guicontrol,Hide,rez
Guicontrol,Hide,from
Guicontrol,Hide,to
Guicontrol,Hide,To:

}
else
{

Guicontrol,show,tot
Guicontrol,show,rez
Guicontrol,show,from
Guicontrol,show,to
Guicontrol,show,To:

}


if units=Area
{
Guicontrol,, from, |
Guicontrol,, from, in²||ft²
Guicontrol,, to, |
Guicontrol,, to, ft²||in²
}


gosub, calc
return

calc:
gui, submit, nohide
SetFormat, Float,3.4



;Area from
If From=in²
From=0.00064516
If From=ft²
From=0.09290304
;Area to
If To=ft²
To=0.09290304
If To=in²
To=0.00064516


val:=(from/to)*tot


if pre
   SetFormat, float, 3.4
else
   SetFormat, float, 3.4
val := val + 0
guicontrol,, rez, %val%
return


