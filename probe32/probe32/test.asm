; test.asm
; author: kyle johnson
; description: test template for working 
; with x86 assembly
;----------------------------------------

INCLUDE irvine32.inc

;----------------------------------------
.data
grades DWORD 100h,90h,85h,100h
var1 SBYTE 1
;----------------------------------------
.code
main PROC
    mov eax,0
    mov al,11001111b
    and al,00111111b
    call WriteBin

    Call Crlf

    mov eax,0
    mov al,6        ; numeric 6
    or al,30h       ; ascii 6
    call WriteChar

    exit

main ENDP

END main