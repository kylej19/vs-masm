; test.asm (Finite State Machine)
; author: kip irvine / scribe: kyle johnson 
; description: an example of a finite state machine from chapter 6
;----------------------------------------
; INCLUDE: "B:\lib\Irvine"

INCLUDE irvine32.inc

ENTER_KEY = 13

;----------------------------------------
.data
InvalidInputMsg BYTE "Invalid input",0Dh,0Ah,0
;----------------------------------------
.code
main PROC
    call Clrscr

StateA:
    call Getnext                ; read next character into AL
    cmp al,'+'                  ; leading '+' sign?
    je StateB                   ; go to State B
    cmp al,'-'                  ; leading '-' sign?
    je StateB                   ; go to State B
    call IsDigit                ; ZF=1 if AL contains a digit
    jz StateC                   ; go to State C
    call DisplayErrorMsg        ; invalid input found
    jmp Quit

StateB:
    call Getnext                ; read next character into AL
    call IsDigit                ; ZF=1 if AL contains digit
    jz StateC                   ; go to State C
    call DisplayErrorMsg        ; invalid input found
    jmp Quit

StateC:
    call Getnext                ; read next character into AL
    call IsDigit                ; ZF=1 if AL contains digit
    jz StateC                   ; go to State C (top)
    cmp al,ENTER_KEY            ; enter key pressed?
    je Quit                     ; yes: quit
    call DisplayErrorMsg        ; no: invalid input found
    jmp Quit

Quit:
    call Crlf
    exit
    
;    INVOKE ExitProcess,0
main ENDP

;----------------------------------------
Getnext PROC
;
; Reads a character from standard input
; Recieves: nothing
; Returns: AL contains character
;----------------------------------------
    call ReadChar           ; input from keyboard
    call WriteChar          ; echo on screen
    ret
Getnext ENDP

;----------------------------------------
DisplayErrorMsg PROC
;
; Displaysan error message indicating that
; the input stream contains invalid input
; Receives: nothing
; Returns: nothing
;----------------------------------------
    push edx
    mov edx,OFFSET InvalidInputMsg
    call WriteString
    pop edx
    ret
DisplayErrorMsg ENDP
END main