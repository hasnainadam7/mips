.data 
array1: .space 20
.text
.globl main
main:
	la $t0,array1
	li $t1,11
	sw $t1,($t0)
	li $t1,12
	sw $t1,4($t0)
	li $t1,13
	sw $t1,8($t0)
	li $t1,14
	sw $t1,12($t0)
	li $t1,15
	sw $t1,16($t0)
	
	add $t4,$t4,0
	
	mul $t3,$t3,0
loop:
	bge  $t2,5,exit

 	mul $t3,$t2,4
	
	addu $t3,$t3 ,$t0
	
	lw $t4,0($t3)
	li $v0,1
	move $a0,$t4
	syscall
	
	addi $t2,$t2,1
	b loop

exit:
	li $v0,10
	syscall
	