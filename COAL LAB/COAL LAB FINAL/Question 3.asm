.data 
array1: .space 40
Result: .asciiz "\Sum of Numbers Divisible by 2 is:"
Question:.asciiz "\Enter integers"

.text
.globl main
main:
	la $t0,array1
	
loop:
	beq  $t2,10,loop1
	
	li $v0,4
	la $a0,Question
	syscall
	mul $t3,$t2,4
	addu $t3,$t3,$t0
	li $v0,5
	syscall
	sw $v0,0($t3)
	
	addi $t2,$t2,1
	b loop
loop1:
	beq $t4,10,result
	mul $t5,$t4,4
	addu $t5,$t5,$t0
	lw $t6,0($t5) 
	rem $t7,$t6,2
	move $a1,$t7
	jal isEligible
	add $t4,$t4,1
	b loop1
	
sum:
	move $a1,$t6
	jal Sum
	add $t4,$t4,1
	b loop1
result:
	
	li $v0,4
	la $a0,Result
	syscall
	
	li $v0,1
	move $a0,$v1
	syscall
End:

	li $v0,10
	syscall

.globl Sum
Sum:
	add $v1,$v1,$a1
Return:
	jr $ra
	
.globl isEligible
isEligible:
	beq $a1,0,sum
Return1:
	jr $ra