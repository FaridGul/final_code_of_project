section .data
    ; Messages
    msg1        db      10,'-Calculator-',10,0
    lmsg1       equ     $ - msg1
    msg2        db      10,'Enter your first number : ',0
    lmsg2       equ     $ - msg2
    msg3        db      'Enter your second number : ',0
    lmsg3       equ     $ - msg3
    msg4        db      10,'1. For addetion',10,0
    lmsg4       equ     $ - msg4
    msg5        db      '2. For subtraction',10,0
    lmsg5       equ     $ - msg5
    msg6        db      '3. For multiplication',10,0
    lmsg6       equ     $ - msg6
    msg7        db      '4. For divition',10,0
    lmsg7       equ     $ - msg7
    msg8        db      ' Operation : ',0
    lmsg8       equ     $ - msg8
    msg9        db      10,' Result : ',0
    lmsg9       equ     $ - msg9
    msg10       db      10,' Invalid Option',10,0
    lmsg10      equ     $ - msg10
    msg11       db      10,' Division by zero',10,0
    lmsg11      equ     $ - msg11
    nlinea      db      10,10,0
    lnlinea     equ     $ - nlinea

section .bss
    ; Spaces reserved for storing the values provided by the user.
    opc:        resb    2
    num1:       resb    10
    num2:       resb    10
    result:     resb    16

section .text
    global _start

_start:
    ; Print on screen the message 1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, lmsg1
    int 80h

    ; Print on screen the message 2
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, lmsg2
    int 80h

    ; We get num1 value.
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 10
    int 80h

    ; Print on screen the message 3
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, lmsg3
    int 80h

    ; We get num2 value.
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 10
    int 80h

    ; Print on screen the message 4
    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, lmsg4
    int 80h

    ; Print on screen the message 5
    mov eax, 4
    mov ebx, 1
    mov ecx, msg5
    mov edx, lmsg5
    int 80h

    ; Print on screen the message 6
    mov eax, 4
    mov ebx, 1
    mov ecx, msg6
    mov edx, lmsg6
    int 80h

    ; Print on screen the message 7
    mov eax, 4
    mov ebx, 1
    mov ecx, msg7
    mov edx, lmsg7
    int 80h

    ; Print on screen the message 8
    mov eax, 4
    mov ebx, 1
    mov ecx, msg8
    mov edx, lmsg8
    int 80h

    ; We get the option selected.
    mov ebx, 0
    mov ecx, opc
    mov edx, 2
    mov eax, 3
    int 80h

    mov al, [opc]       ; Move the selected option to the registry al

    cmp al, '1'
    je add_numbers
    cmp al, '2'
    je subtract_numbers
    cmp al, '3'
    je multiply_numbers
    cmp al, '4'
    je divide_numbers
    jmp invalid_option

add_numbers:
    ; Convert num1 from ASCII to integer
    xor ebx, ebx
    mov bl, byte [num1]
    sub bl, 0x30
    movzx eax, bl

    ; Convert num2 from ASCIIto integer
    xor ebx, ebx
    mov bl, byte [num2]
    sub bl, 0x30
    add eax, ebx

    ; Convert the sum result to ASCII
    add al, 0x30
    mov [result], al

    ; Print on screen the message 9
    mov eax, 4
    mov ebx, 1
    mov ecx, msg9
    mov edx, lmsg9
    int 80h

    ; Print the result on screen
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 20
   int 80h

    jmp exit_program

subtract_numbers:
    ; Convert num1 from ASCII to integer
    xor ebx, ebx
    mov bl, byte [num1]
    sub bl, 0x30
    movzx eax, bl

    ; Convert num2 from ASCII to integer
    xor ebx, ebx
    mov bl, byte [num2]
    sub bl, 0x30
    sub eax, ebx

    ; Convert the difference result to ASCII
    add al, 0x30
    mov [result], al

    ; Print on screen the message 9
    mov eax, 4
    mov ebx, 1
    mov ecx, msg9
    mov edx, lmsg9
    int 80h

    ; Print the result on screen
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 20
    int 80h

    jmp exit_program

multiply_numbers:
    ; Convert num1 from ASCII to integer
    xor ebx, ebx
    mov bl, byte [num1]
    sub bl, 0x30
    movzx eax, bl

    ; Convert num2 from ASCII to integer
    xor ebx, ebx
    mov bl, byte [num2]
    sub bl, 0x30
    imul eax, ebx

    ; Convert the product result to ASCII
    add al, 0x30
    mov [result], al

    ; Print on screen the message 9
    mov eax, 4
    mov ebx, 1
    mov ecx, msg9
    mov edx, lmsg9
    int 80h

    ; Print the result on screen
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 20
    int 80h

    jmp exit_program

divide_numbers:
    ; Convert num1 from ASCII to integer
    xor ebx, ebx
    mov bl, byte [num1]
    sub bl, 0x30
    movzx eax, bl

    ; Convert num2 from ASCII to integer
    xor ebx, ebx
    mov bl, byte [num2]
    sub bl, 0x30

    cmp bl, 0
    je division_by_zero

    xor edx, edx
    div bl

    ; Convert the quotient result to ASCII
    add al, 0x30
    mov [result], al

    ; Print on screen the message 9
    mov eax, 4
    mov ebx, 1
    mov ecx, msg9
    mov edx, lmsg9
    int 80h

    ; Print the result on screen
    mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 20
    int 80h

    jmp exit_program

invalid_option:
    ; Print on screen the message 10
    mov eax, 4
    mov ebx, 1
    mov ecx, msg10
    mov edx, lmsg10
    int 80h

exit_program:
    ; Print new line characters
    mov eax, 4
    mov ebx, 1
    mov ecx, nlinea
    mov edx, lnlinea
    int 80h

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 80h

division_by_zero:
    ; Print on screen the message 11
    mov eax, 4
    mov ebx, 1
    mov ecx, msg11
    mov edx, lmsg11
    int 80h

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 80h

