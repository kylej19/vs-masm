; test.asm
; author: kyle johnson
; description: template using irvine lib
;----------------------------------------

INCLUDE irvine32.inc

.data                               ;data
;----------------------------------------
buffer BYTE 33 DUP(0)

.code                               ;code
;----------------------------------------
main PROC
    mov eax,7fffffffh
    mov ecx,20h
    mov esi,OFFSET buffer
L1:    
    shl eax,1
    mov BYTE PTR [esi],'0'
    jnc L2
    mov BYTE PTR [esi],'1'
L2:
    inc esi
    loop L1

    mov edx,OFFSET buffer
    call WriteString

    call Crlf
    exit
main ENDP

END main