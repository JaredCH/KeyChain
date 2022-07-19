gosub, Top

Top:
Toggle := !Toggle
Loop {
PixelSearch, X, Y, 212, 530, 1856, 1019, 0x0000FF, , Fast
If ErrorLevel {
    mouseclick, left, 220, 220
    break
Sleep 250 ; edit this to how long you want to hold the button
}
else {
	X:=X+20
	Y:=Y+20
	MouseMove, 795, %Y%
Click, Left 
sleep, 200
send, 0
send, {Up}{down}
sleep, 500
goto, Top
}
Sleep 2000 ; Less sleep = do more often. More sleep = do less often. edit this to any value you prefer
If not Toggle 
	break
}
;~ sleep, 2500
;~ goto, F1
