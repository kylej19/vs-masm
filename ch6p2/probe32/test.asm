; test.asm
; author: kyle johnson
; description: 
;----------------------------------------

INCLUDE irvine32.inc

;----------------------------------------
.data
setX DWORD 9E4Ah
setY DWORD 4CCAh

;----------------------------------------
.code
main PROC
    mov eax,0
    mov eax,setX
    xor eax,setY
    and eax,setX
    call WriteHex
    
    exit
main ENDP
END main