; test.asm
; author: kyle johnson
; description: template using irvine lib
;----------------------------------------

INCLUDE irvine32.inc

.data                               ;data
;----------------------------------------
msg1 BYTE "BL, some bits set",0
msg2 BYTE "BL, all bits set",0
msg3 BYTE "AL even parity",0
msg4 BYTE "EAX is negative",0
msg5 BYTE "EBX > ECX",0 

.code                               ;code
;----------------------------------------
main PROC
    mov bl,30h
    test bl,70h
    jnz L1
Q2:
    mov bl,70h
    and bl,70h
    xor bl,70h
    jz L2
Q3:
    mov al,30h
    xor al,0
    jp L3
Q4:
    mov eax,0ffffffffh
    test eax,8000000h
    jnz L4
Q5:
    mov ebx,8
    mov ecx,4
    cmp ebx,ecx
    jg L5
L1:
    mov edx,OFFSET msg1
    call WriteString
    call Crlf
    jmp Q2
L2:
    mov edx,OFFSET msg2
    call WriteString
    call Crlf
    jmp Q3
L3:
    mov edx,OFFSET msg3
    call WriteString
    call Crlf
    jmp Q4
L4:
    mov edx,OFFSET msg4
    call WriteString
    call Crlf
    jmp Q5
L5:
    mov edx,OFFSET msg5
    call WriteString
    call Crlf
    jmp quit

quit:

    exit
main ENDP

END main