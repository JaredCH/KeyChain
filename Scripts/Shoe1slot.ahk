SetKeyDelay, 0
InputBox, UserInput, Shoe w/Banding, 'W' 'H' 'BH' 'BW' ex:  4 18 3 1, , 250, 125
if ErrorLevel
    ExitApp
else
StringSplit, word_array, UserInput, %A_Space%,
mouseclick, left
sleep, 200
send,1
sleep, 200
send,{backspace}
sleep, 200
send,0 0{enter}%word_array1% %word_array2%{enter}{escape}{escape}{escape}{escape}
sleep, 200
send,3
sleep, 200
send,{backspace}
sleep, 200
start:=word_array1-word_array3
end:=word_array1-start/2
sendraw,(%start%/2) (%word_array2%/2)`n(%start%/2) (%word_array2%/2+%word_array4%/2)`n(%start%/2) (%word_array2%/2)`n(%start%/2) (%word_array2%/2-%word_array4%/2)`n(%start%/2) (%word_array2%/2+%word_array4%/2)`n%end% (%word_array2%/2+%word_array4%/2)`n(%start%/2) (%word_array2%/2-%word_array4%/2)`n%end% (%word_array2%/2-%word_array4%/2)`n%end% (%word_array2%/2-%word_array4%/2)`n%end% (%word_array2%/2+%word_array4%/2)`n
send,{esc}
sleep, 150
send,2
sleep, 200
send,{backspace}
sendraw,(%end%-%word_array4%/2) (%word_array2%/2)`n1`n 
return