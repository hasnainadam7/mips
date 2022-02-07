.data
array1: .byte 'D','H','A','s','u','f','f','a'
.text 
.globl main
main:
	la $t0,array1

	add $t2, $t2, 7

loop:

 	mul $t3,$t2,1

	addu $t3,$t3 ,$t0
	lb $t4,0($t3)
	li $v0,11
	move $a0,$t4
	syscall

	subi  $t2,$t2,1
	
	beq  $t2,0,exit
	b loop
	

exit: 
	lb $t4,0($t0)
	li $v0,11
	move $a0,$t4
	syscall
	
	li $v0,10
	syscall
	
	
