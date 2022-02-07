.data
	EnterString: .space 256
	StringCount: .space 256
	StirngOutput: .space 256
	StringLength: .word 0
	String: .asciiz "Enter items list: "
	FileName: .asciiz "F:/DHA Suffa University/Semester III/Computer Organization and Assembly Language/Lab/Lab 10/cs191071_Lab 10_3B/Assignment.txt"
	NewLine: .asciiz "\n"
.text
.globl main
main:	
	li $v0, 4
	la $a0, String
	syscall
	
	li $v0, 8
	la $a0, EnterString
	li $a1, 256
	syscall
	
	li $t0, 0
	li $t1, 1
	li $t4, 1
	li $t3, 0
StringLoop1:
	lb $t0, EnterString($t4)
	beq $t0, '.', ExitLoop2	
	beq $t0, ';', ExitLoop1
	addi $t1, $t1, 1
	addi $t4, $t4, 1 
	j StringLoop1
ExitLoop1:
	sw $t1, StringCount($t3)
	li $t1, 0
	addi $t4, $t4, 1
	addi $t3, $t3, 4
	j StringLoop1
ExitLoop2:
	sw $t1, StringCount($t3)
	sw $t4, StringLength
	li $v0, 13
	la $a0, FileName
	li $a1, 1
	syscall
	
	move $s0, $v0
	lw $t0, StringLength
	li $t1, 0
	li $t2, 0	
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
StringLoop2:
	bge $t1, $t0, ExitLoop4
	lw $t3, StringCount($t2)
StringLoop3:
	beq $t5, $t3, ExitLoop3
	lb $t6, EnterString($t1)
	sb $t6, StirngOutput($t5)
	addi $t5, $t5, 1
	addi $t1, $t1, 1
	j StringLoop3
ExitLoop3:
	li $t5, 0
	li $v0, 15
	move $a0, $s0
	la $a1, StirngOutput
	move $a2, $t3
	syscall
	
	li $v0, 15
	move $a0, $s0
	la $a1, NewLine
	li $a2, 1
	syscall
	
	addi $t1, $t1, 1
	addi $t2, $t2, 4
	j StringLoop2
ExitLoop4:
	li $v0, 16
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall