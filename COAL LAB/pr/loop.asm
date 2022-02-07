.data
	InputChArray: .space 20
	Output:	.space 20
.text
.globl main
main:
	li $v0, 8
	la $a0, InputChArray
	li $a1, 20
	syscall
	
	add $t1, $zero, $v0
	add $t2, $zero, $a0
	add $a0, $zero, $v0
	li $v0, 1
LoopReverse:
	add $t3, $t2, $t0
	lb $t4, 0($t3)
	beqz $t4, exit
	sb $t4, Output($t1)
	subi $t1, $t1, 1
	addi $t0, $t0, 1
	b LoopReverse
exit:
	li $v0, 4
	la $a0, Output
	syscall	
	li $v0, 10	
	syscall
	
