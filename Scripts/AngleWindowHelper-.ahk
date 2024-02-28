
Eval(x)
{
   StringGetPos i, x, +, R
   StringGetPos j, x, -, R
   If (i > j)
      Return Left(x,i)+Right(x,i)
   If (j > i)
      Return Left(x,j)-Right(x,j)
   StringGetPos i, x, *, R
   StringGetPos j, x, /, R
   If (i > j)
      Return Left(x,i)*Right(x,i)
   If (j > i)
      Return Left(x,j)/Right(x,j)
   Return x
}
Left(x,i)
{
   StringLeft x, x, i
   Return Eval(x)
}
Right(x,i)
{
   StringTrimLeft x, x, i+1
   Return Eval(x)
}




SetTitleMatchMode, 2 ;Means match partial title
InputBox, UserInput, Count and width, Please enter Count and width seperated by a comma., ,
if ErrorLevel
    Return
else
    StringSplit, amount, UserInput, `,
    totaldim:=-amount2/2
Loop, %amount1%
{
    ControlClick, x53 y402, ahk_exe Bend-Tech Dragon.exe
WinWait, Add New Hole,, 3
if ErrorLevel
{
    MsgBox, WinWait timed out.
    return
}
else
    ControlClick, x153 y75, ahk_exe Bend-Tech Dragon.exe
mousegetpos, xVar, yVar
mousemove, 0, 0
send, s{Enter}
mousemove, xVar, yVar
sleep, 300
    ControlClick, x233 y131, ahk_exe Bend-Tech Dragon.exe
	sleep, 300
	ControlClick, x170 y373, ahk_exe Bend-Tech Dragon.exe
		sleep, 100
	ControlClick, x250 y189, ahk_exe Bend-Tech Dragon.exe	
	sleep, 100
	send, ^a %amount2%{tab}
		InputBox, UserInputDim, Dim from Start, Please enter dimensions in decimal inch., ,
if ErrorLevel
    Return
else
	totaldim:=totaldim+Eval(UserInputDim)
    send, {tab 3}%totaldim%
sleep, 300
}

return
