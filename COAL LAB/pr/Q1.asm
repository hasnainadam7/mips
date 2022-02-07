
.data 
	msg1: .asciiz "Enter the width of Rectangle: "
	msg2: .asciiz "Enter the length of Rectangle: "
	Area: .asciiz "Area of Rectangle is: "
	
	Length: .word 1
	Width: .word 1
.text
.globl main
main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
		
	sw $v0, Width
	lw $t1, Width
	
	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 5
	syscall

	sw $v0, Length
	lw $t2, Length
	
	li $v0, 4
	la $a0, Area
	syscall

	mul $t3, $t1, $t2
	move $a0, $t3
	li $v0, 1
	syscall

	li $v0, 10
	syscall
