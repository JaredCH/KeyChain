WinGetActiveTitle, win ;get current title
InputBox, UserInput, Times to Loop, Please enter a number., , 200, 125
if ErrorLevel
    return
else
WinActivate, %win%	
Loop, %UserInput%
{
SEND, {SPACE}{BACKSPACE}{DOWN}
sleep, 50
}
RETURN