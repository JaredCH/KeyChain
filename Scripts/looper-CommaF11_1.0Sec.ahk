F11::
    Loop, Parse, clipboard, `n, `r 
    {
		send %A_LoopField%,
		sleep, 1000
	}
	return
	
	F12::
	ExitApp
	