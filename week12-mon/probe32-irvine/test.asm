; test.asm
; author: kyle johnson
; description: template using irvine lib
;----------------------------------------

INCLUDE irvine32.inc

.data                               ;data
;----------------------------------------

.code                               ;code
;----------------------------------------
main PROC
;           EXERCISE #1
;----------------------------------------   
    xor eax,eax         ; zero out eax
    mov ebx,1           ; move the type into ebx for WriteBinB/WriteHexB

    mov al,13h          ; AL = 00010011b
    
    call writebinb      
    call crlf

    ror al,2            ; AL = 11000100b

    call writebinb
    call crlf

    rol al,3            ; AL = 00100110b

    call writebinb
    call crlf

    mov al,6bh          
    ror al,4            
    call writehexb      ; AL = b6h
    call crlf

;           EXERCISE #2
;---------------------------------------- 
    xor eax,eax         ; zero out eax
    mov ebx,1           ; move type into ebx for writehexb/writebinb

    mov al,2
    shl al,2
    shl al,1

    call writedec       ; AL = 16
    call crlf

    
;           EXERCISE #3
;---------------------------------------- 
    xor eax,eax         ; zero out eax
    mov ebx,1           ; move type into ebx for writehexb/writebinb

    mov al,40
    shr al,1            ; AL = 20
    call writedec
    call crlf
    shr al,1            ; AL = 10
    call writedec
    call crlf


;           EXERCISE #4
;---------------------------------------- 
    xor eax,eax         ; zero out eax
    mov ebx,1           ; move type into ebx for writehexb/writebinb

    clc
    mov al,4bh
    rcl al,2            ; AL = 2c, CF = 1

    pushfd
    call writehexb
    call crlf
    popfd

    rcr al,1            ; AL = 96, CF = 0

    pushfd
    call writehexb
    call crlf
    popfd


;           EXERCISE #5
;---------------------------------------- 
    xor eax,eax         ; zero out eax
    mov ebx,1           ; move type into ebx for writehexb/writebinb

    stc
    mov al,4bh
    rcl al,2            ; AL = 2e, CF = 1

    pushfd
    call writehexb
    call crlf
    popfd

    rcr al,1            ; AL = 97, CF = 0

    pushfd
    call writehexb
    call crlf
    popfd


;           EXERCISE #6
;---------------------------------------- 
    xor eax,eax         ; zero out eax
    xor edx,edx         ; zero out edx
    mov ebx,2           ; move type into ebx for writehexb/writebinb

    mov ax,0ba7ch
    mov dx,89f5h
    shld ax,dx,4        ; AX = a7c8h

    call writehexb
    call crlf

    shrd ax,dx,8        ; AX = f5a7

    call writehexb
    call crlf
    call Crlf

    exit
main ENDP

END main