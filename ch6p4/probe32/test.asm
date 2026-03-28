; test.asm
; author: kyle johnson
; description: test template for working with x86 assembly
;----------------------------------------

INCLUDE irvine32.inc

;----------------------------------------
.data
test1 BYTE 3
test2 BYTE 18h
mask1 BYTE 0FCh
zeroMsg BYTE "Equal to zero",0
notZeroMsg BYTE "Not equal to zero",0

;----------------------------------------
.code
main PROC
    mov eax,0                   ; test #1
    mov al,test1
    and al,mask1
    jz L3
    jnz L4
L3:
    mov edx, OFFSET zeroMsg
    call WriteString
    jmp L5
L4:
    mov edx,OFFSET notZeroMsg
    call WriteString
L5:
    call Crlf
    call WriteBin

    call Crlf                   ; \n 
    call Crlf                   ; \n

    mov eax,0                   ; test #2             
    mov al,test2
    and al,mask1
    jz L6
    jnz L7
L6:
    mov edx, OFFSET zeroMsg
    call WriteString
    jmp L8
L7:
    mov edx,OFFSET notZeroMsg
    call WriteString
L8:
    call Crlf
    call WriteBin

    call Crlf
    call Crlf
    exit
main ENDP
END main