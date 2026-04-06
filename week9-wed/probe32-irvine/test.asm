; test.asm
; author: kyle johnson
; description: template using irvine lib
;----------------------------------------

INCLUDE irvine32.inc

.data                               ;data
;----------------------------------------
str1 BYTE "found! :)",0
str2 BYTE "not found :(",0
array SWORD -3,-6,-1,-10,10,30,40,4
sentinel SWORD -6

.code                               ;code
;----------------------------------------
main PROC
    mov esi,OFFSET array
    mov ecx,LENGTHOF array
    mov bx,WORD PTR sentinel
next:
    cmp WORD PTR[esi],bx
    pushfd
    add esi,TYPE array
    popfd
    loopnz next

    jnz not_found

    sub esi,TYPE array
    movsx eax,WORD PTR[esi]
    call WriteInt
    call Crlf

    mov edx,OFFSET str1
    call WriteString
    jmp quit

not_found:
    mov edx,OFFSET str2
    call WriteString

quit:
    exit
main ENDP

END main