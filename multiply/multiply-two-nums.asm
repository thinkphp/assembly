section .data
    prompt1 db "Enter the first number: ", 0
    prompt2 db "Enter the second number: ", 0
    fmt_input db "%ld", 0
    fmt_output db "The product is: %ld", 10, 0

section .bss
    num1 resq 1
    num2 resq 1

section .text
    global main
    extern printf
    extern scanf

main:
    ; Prologue
    push rbp
    mov rbp, rsp

    ; Prompt for first number
    mov rdi, prompt1
    xor eax, eax
    call printf

    ; Read first number
    mov rdi, fmt_input
    mov rsi, num1
    xor eax, eax
    call scanf

    ; Prompt for second number
    mov rdi, prompt2
    xor eax, eax
    call printf

    ; Read second number
    mov rdi, fmt_input
    mov rsi, num2
    xor eax, eax
    call scanf

    ; Perform multiplication
    mov rax, [num1]       ; Load first number into rax
    imul rax, [num2]      ; Multiply rax by the second number

    ; Print result
    mov rdi, fmt_output   ; Format string for the output
    mov rsi, rax          ; Result of the multiplication
    xor eax, eax          ; Clear eax as required by printf
    call printf

    ; Epilogue
    mov rsp, rbp
    pop rbp

    ; Exit program
    xor eax, eax
    ret
