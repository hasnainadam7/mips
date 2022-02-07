.data
msg1: .asciiz "Enter a Number for which you want a factorial :- "
msg2: .asciiz "Factorial of a number is :- "


.text
.globl main
main:

	li $v0,4
	la $a0,msg1
	syscall

	li $v0,5
	syscall

	move $t0,$v0 # Consider $t0 as an input.
	
	li $t1,1
	move $t2,$t0
loop:
	beq $t0,0,basecase
	beq $t1,$t0,exit
	
	
	
	mul $t2,$t2,$t1
	addi $t1,$t1,1
	j loop
basecase:
	li $t2,0
	j exit

exit:	
	li $v0,4
	la $a0,msg2
	syscall

	li $v0,1
	move $a0,$t2
	syscall

	li $v0,10
	syscall
	