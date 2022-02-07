.data
	Input: .asciiz " "
	Max: .space 1024
.text
.globl main
main:
	li $v0, 4
	la $a0, Input
	syscall
	
	la $a0, Max
	li $a1, 1024
	li $v0, 8
	syscall
	
	la $t6, Max
.globl Length1
Length1:
	beq $t4, '\n', Length1
	lb $t4, ($t6)
	addu $t6, $t6, 1
	beq $t4, '\n', Loop1
	beq $t4, ' ', Loop1
	addi $t5, $t5, 1
	j Length1
Loop1:
	bgt $t5, $t7, Loop2
	li $t5, 0
	beq $t4, '\n', Length2
	j Length1
Loop2: 
	move $t7, $t5
	move $t2, $t6
	sub $t2, $t2, $t7
	li $t5, 0
	j Length1
Length2:
	la $t6, Max
	subi $t2, $t2, 1
	move $t6, $t2
Output:
	lb $t4, ($t6)
	beq $t4, '\n', Exit
	addu $t6, $t6, 1
	beq $t4, ' ', Exit
	li $v0, 11
	move $a0, $t4
	syscall
	j Output
Exit:
	li $v0, 10
	syscall
