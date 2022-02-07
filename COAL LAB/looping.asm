.data 
a: .asciiz "Enter first number:"
ba: .asciiz "Enter second number:"

string1: .asciiz "This is "
string2: .asciiz "\n"
#num1: .word 1
#num2: .word 6 
.text
li $v0, 4
la $a0, a
syscall

li $v0, 5
syscall
move $t0, $v0

li $v0, 4
la $a0, ba
syscall

li $v0, 5
syscall 
move $t1, $v0

#lw $t0, num1
#lw $t1, num2
Loop:
beq $t0, $t1, Exit
la $a0, string1
li $v0, 4
syscall
move $a0, $t0
li $v0, 1
syscall
add $t0, $t0, 1
la $a0, string2
li $v0, 4
syscall
b Loop
Exit:
li $v0, 10
syscall
