; test.asm
; author: kyle johnson
; description: template using irvine lib
;----------------------------------------

INCLUDE irvine32.inc

.code
main PROC
    mov ax,0ffd0h
    mov bx,1000h
    imul bx
    call dumpregs
    call crlf
    shl eax,10h
    shrd eax,edx,10h
    call dumpregs
    call crlf
    exit
main ENDP
END main