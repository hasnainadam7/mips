.data



msg: .ascii "Total marks out of 400: "
math: .word 
chem: .word 
phy: .word 
eng: .word 

.text
.globl main
main:
	#loading registers
	li $t0, 78
	li $t1, 85
	li $t2, 68
	li $t3, 82
	
	#adding all register values
	add $t4, $t0, $t1
	add $t5, $t2, $t3
	add $t6, $t5, $t4
	
	#printig label on Run I/O
	li $v0,4
	la $a0,msg
	syscall

	#displaying total marks
	li $v0, 1
	move $a0, $t6	
	syscall
	
	#exit 
	li $v0,10
	syscall
