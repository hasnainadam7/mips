.data 
array1: .space 12
Question:.asciiz "\Enter integers"
Result:.asciiz "\The result is"
.text
.globl main
main:
	la $t0,array1
	
loop:
	beq  $t2,3,loop1
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
	beq $t4,3,result
	mul $t5,$t4,4
	addu $t5,$t5,$t0
	lw $t6,0($t5) 
	add $t7,$t4,1
	add $t4,$t4,1
	
loop2:
	beq $t7,3,loop1
	mul $t8,$t7,4
	addu $t8,$t8,$t0
	lw $t9,0($t8)
	add $t7,$t7,1
	blt $t6,$t9,Shuffle
	
	b loop2
	
Shuffle:
	move $s0,$t6
	move $t6,$t9
	move $t9,$s0
	sw $t6,0($t5)
	sw $t9,0($t8)
	b loop2
result:
	li $v0,4
	la $a0,Result
	syscall
	b printIntegers
	
printIntegers:	
	beq $s1,3,End
	mul $s2,$s1,4
	addu $s2,$s2,$t0
	lw $s3,0($s2)
	li $v0,1
	move $a0,$s3
	syscall
	addi $s1,$s1,1
	b printIntegers
	
End:

	li $v0,10
	syscall
	
