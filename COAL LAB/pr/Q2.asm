.data 
	msg1: .asciiz "Enter the value of x: "
	msg2: .asciiz "Enter the value of y: "
	msg3: .asciiz "Enter the value of z: "
	msg4: .asciiz "\nValue of a1: "
	msg5: .asciiz "\nValue of b1: "
	msg6: .asciiz "\nValue of c1: "
	
	x: .word 1
	y: .word 1
	z: .word 1
.text
.globl main
main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall

	sw $v0, x
	lw $t1, x
	
	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 5
	syscall
		
	sw $v0, y
	lw $t2, y
	
	li $v0, 4
	la $a0, msg3
	syscall

	li $v0, 5
	syscall

	sw $v0, z
	lw $t3, z
	
	li $v0, 4
	la $a0, msg4
	syscall

	mul $t4, $t1, $t2
	add $t5, $t4, $t3
	move $a0, $t5
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, msg5
	syscall

	mul $t6, $t2, $t3
	add $t7, $t6, $t1
	move $a0, $t7
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, msg6
	syscall

	mul $t4, $t1, $t2
	sub $t5, $t4, $t3
	move $a0, $t5
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall