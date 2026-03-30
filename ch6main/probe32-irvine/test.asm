; test.asm
; author: kyle johnson
; description: template using irvine lib
;----------------------------------------

INCLUDE irvine32.inc

.data                               ;data
;----------------------------------------
helloMsg BYTE "hello, moon!",0Dh,0Ah,0
lines DWORD 20

.code                               ;code
;----------------------------------------
main PROC
    call Randomize
    mov ecx,lines
L1:
    mov eax,0Ah         ; max = 10
    call RandomRange    ; [0 - 9]

    cmp eax,4           
    jae G3              ; green >= 4
    cmp eax,3
    je B2               ; blue == 3
    cmp eax,2
    jbe W1              ; white <= 2


B2:                     ; change color to 
                        ; blue and write message
    mov eax,blue
    call SetTextColor
    call sendMessage
    jmp brk             
G3:                     ; change color to 
                        ; green and write message
    mov eax,green
    call SetTextColor
    call sendMessage
    jmp brk
W1:                     ; change color to 
                        ; white and write message
    mov eax,white
    call SetTextColor
    call sendMessage
    jmp brk
brk:
    loop L1
    
    call Crlf
    exit
main ENDP

sendMessage PROC        ; generates random color
;----------------------------------------
    pushad
    mov edx,OFFSET helloMsg
    call WriteString
    popad
    ret
sendMessage ENDP

END main