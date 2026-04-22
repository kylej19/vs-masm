; test.asm
; author: kyle johnson
; description: template using irvine lib
;----------------------------------------

INCLUDE irvine32.inc

.data                               ;data
;----------------------------------------
date    WORD    266ah           ; 0010 0110 0110 1010 b

.code                               ;code
;----------------------------------------
main PROC
    mov eax,0

    ;DAY
    mov ax,date
    and ax,1fh          ; 1 1111 b

    call WriteDec
    call Crlf

    ; MONTH
    mov ax,date
    shr ax,5
    and ax,0fh          ; 1111 b

    call WriteDec
    call Crlf

    mov ax,date
    shr ax,9

    call WriteDec
    call Crlf

    exit
main ENDP

END main