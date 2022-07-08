SetKeyDelay, 0
InputBox, UserInput, Shoe w/Banding, 'W' 'T-W' 'H' ex:  8 6 .5, , 250, 125
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
send,0 0{enter}%word_array1% %word_array1%{enter}{escape}{escape}{escape}{escape}
sleep, 200
send,2
sleep, 200
send,{backspace}
sleep, 200
diff:=(word_array1-word_array2)/2

sendraw,%diff% %diff%`n%word_array3%`n %diff% (%word_array1%-%diff%)`n%word_array3%`n(%word_array1%-%diff%) %diff% `n%word_array3%`n(%word_array1%-%diff%) (%word_array1%-%diff%)`n%word_array3%`n