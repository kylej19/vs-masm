; test.asm
; author: kyle johnson
; description: chapter 7 assignment
;----------------------------------------
include irvine32.inc
.data                                           ;reserved address data
;----------------------------------------
title1 BYTE 0dh,0ah,"Exercise #1",0dh,0ah,"-------------",0dh,0ah,0
title2 BYTE 0dh,0ah,"Exercise #2",0dh,0ah,"-------------",0dh,0ah,0
title3 BYTE 0dh,0ah,"Exercise #3",0dh,0ah,"-------------",0dh,0ah,0
title4 BYTE 0dh,0ah,"Exercise #4",0dh,0ah,"-------------",0dh,0ah,0
title5 BYTE 0dh,0ah,"Exercise #5",0dh,0ah,"-------------",0dh,0ah,0
msg1 BYTE "EAX= ",0
msg2 BYTE "AL= ",0
msg3 BYTE "AX= ",0
msg4 BYTE "(val2 / val3) * (val1 + val2)= ",0
msg5 BYTE "Buffer=",0
wVal1 WORD -5
dVal1 DWORD -1
dval2 DWORD -6
dval3 DWORD 3
numArr DWORD 12345678h,23459876h,23848572h,96847321h
buffer BYTE 9 dup(0)

.code                           ;executable code
;----------------------------------------
main PROC
;             Exercise #1
;----------------------------------------
    mov edx,offset title1       ;output title
    call writestring
    mov edx,offset msg3        
    call writestring
    xor eax,eax                 ;clear out eax
    mov ebx,type word           ;for writehexb
    mov ax,0fffch
    call writehexb              ; display ax before the shift
    call crlf

    shl eax,16                  ;shift ax to the end of eax
    sar eax,16                  ;shift ax down arithmetically (keep the sign)

    pushad                      ;store our registers
    mov edx,offset msg1        
    call writestring            ;display a message
    popad                       ;pop the registers we intend to display

    call writehex               ;display eax after the shift
    call crlf

;             Exercise #2
;----------------------------------------
    mov edx,offset title2       ;display the title
    call writestring
    mov edx,offset msg2
    call writestring
    mov ebx,type byte           ;for writehexb
    xor eax,eax                 ;clear eax
    clc                         ;clear the carry flag
    mov al,99h
    call writehexb              ;display al
    call crlf
    shr al,1                    ;shift right 1
    jnc E2                      ;skip the next instruction if nothing in the carry(no 1 to rotate)
    or al,80h                   ;if there is 1 in the carry, we need to replace the 1 we shifted off the end
E2:
    pushad                      ;store the registers
    mov edx,offset msg2
    call writestring            ;display a message
    popad                       ;pop the registers we intend to display

    call writehexb              ;display al, again
    call crlf

;             Exercise #3
;----------------------------------------
    mov edx,offset title3
    call writestring                ;display the title
    mov edx,offset msg3
    call writestring                ;display a message
    xor eax,eax                     ;clear eax
    mov eax,-5                      ;mov our first operand in eax
    mov ebx,3                       ;mov our second operand into ebx
    imul ebx                        ;multiply eax by ebx
    call writeint                   ;display the result
    mov dVal1,eax                   ;store it in dVal1
    call crlf

;             Exercise #4
;----------------------------------------
    mov edx,offset title4
    call writestring                ;display the title
    mov edx,offset msg4
    call writestring                ;display a message
    cdq                             ;sign-extend the upper half of our dividend
    mov eax,dVal2                   ;place dVal2 into eax
    idiv dVal3                      ;divide by dVal3
    mov ebx,dVal1                   ;mov dVal1 into ebx
    add ebx,dVal2                   ;add dVal2 to ebx
    imul ebx                        ;multiply (dVal2/dVal3)*(dVal1+dVal2)
    call writeint                   ;display the product
    mov dVal1,eax                   ;move our product into dVal1
    call crlf

;             Exercise #5
;----------------------------------------

    mov edx,offset title5
    call writestring                ;display the title for exercise 5
    mov edx,offset msg5
    call writestring                ;help display output
    
    ;Exercise 5 calls
    mov edi,offset buffer           ;move a pointer to our buffer in edx         
    mov esi,offset numArr           ;point esi to our array of nums
    mov edx,[esi]                   ;dereference the first dword val in nums

    call packed2asc
    mov edx,offset buffer           ;place the offset of buffer in edx
    call writestring                ;use writestring to write the buffer to stdout
    call crlf       

    exit
main ENDP

;----------------------------------------
; packed2asc - converts 4 byte packed decimal to ascii and displays
; input= edx:packed decimal binary doubleword,
;        edi:address of the buffer to hold our number
; output: stdout
packed2asc PROC
    mov ecx,lengthof buffer - 1
L1:
    xor eax,eax                 ;clear out eax
    shld eax,edx,4              ;shift the upper nybble 
    shl edx,4
    or al,30h
    mov byte ptr [edi],al
    add edi,type buffer
    loop L1
    mov byte ptr [edi],0
    ret
packed2asc ENDP

END main