section .data
    prompt1 db 'Enter the first Arushee number: ', 0
    prompt2 db 'Enter the Second number: ', 0
    ; prompt_len equ $ - prompt1
    input_format db '%d', 0
    output_format db 'Sum: %d', 10, 0

section .bss
    num1 resd 1
    num2 resd 1
    sum resd 1

section .text
    global _main
    extern _printf, _scanf, _getch, _GetStdHandle, _ReadConsoleA

_main:
    ; Prompt for the first number
    push prompt1
    call _printf
    add esp, 4

    ; Read the first number
    lea eax, [num1]
    push eax
    push input_format
    call _scanf
    add esp, 8

    ; Prompt for the second number
    push prompt2
    call _printf
    add esp, 4

    ; Read the second number
    lea eax, [num2]
    push eax
    push input_format
    call _scanf
    add esp, 8

    ; Add the numbers
    mov eax, [num1]
    add eax, [num2]
    mov [sum], eax

    ; Display the result
    push dword [sum]
    push output_format
    call _printf
    add esp, 8

    ; Pause to keep the console open
    call _getch

    ; Exit the program
    mov eax, 0
    ret

    ; ./nasm.exe -f win32 A:\demo.asm -o A:\demo.obj
    ;gcc .\demo.obj -o demo.exe