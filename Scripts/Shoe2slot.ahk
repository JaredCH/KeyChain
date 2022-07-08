SetKeyDelay, 0
InputBox, UserInput, Shoe w/ 2xBanding, 'W' 'H' 'BH' 'BW' 'BL ex:  4 18 3 1 4.5, , 250, 125
if ErrorLevel
    ExitApp
else
StringSplit, word_array, UserInput, %A_Space%, .
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
start:=word_array1
starthalf:=word_array1/2
mid:=start/2+word_array4
end:=word_array1-(word_array1-word_array3)/2
sendraw,(%start%/2-%word_array3%/2) (%word_array2%-%word_array5%)`n(%start%/2-%word_array3%/2) (%word_array2%-%word_array5%+%word_array4%/2)`n(%start%/2-%word_array3%/2) (%word_array2%-%word_array5%)`n(%start%/2-%word_array3%/2) (%word_array2%-%word_array5%-%word_array4%/2)`n(%end%) (%word_array2%-%word_array5%-%word_array4%/2)`n(%start%/2-%word_array3%/2) (%word_array2%-%word_array5%-%word_array4%/2)`n (%end%) (%word_array2%-%word_array5%-%word_array4%/2)`n%end% (%word_array2%-%word_array5%+%word_array4%/2)`n%end% (%word_array2%-%word_array5%+%word_array4%/2)`n(%start%/2-%word_array3%/2) (%word_array2%-%word_array5%+%word_array4%/2)`n(%starthalf%-%word_array3%/2) (%word_array2%-%word_array5%)`n(%starthalf%-%word_array3%/2+%word_array4%/2) (%word_array2%-%word_array5%)`n(%start%/2) (%word_array2%)`n(%start%/2) (%word_array2%/2)`n