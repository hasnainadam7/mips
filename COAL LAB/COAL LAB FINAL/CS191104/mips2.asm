.data
i:.byte 
Write:.space 1024
Write1:.space 50
space1: .asciiz "\n"
fileName: .asciiz "c:/Users/ALI/Documents/evensum.txt"
fileWords: .space 1024
.text
.globl main
main:	
	la $a0, Write
	li $a1,1024
	li $v0,8
	syscall
	
	la $t0,Write
	la $t5,Write1
counter:
 	beq $t4,5,end 
 	addu $t1, $t0, $t4
   	lb $t2, 0($t1)      
   	rem $t7,$t2,2    
   	beq $t7,0,end1
	addi $t4,$t4,1     
   	b counter
end1:
	sb $t2,0($t5) 
	add $t5,$t5,1
	addi $t4,$t4,1
	b counter
end:
	
	li $v0,13
	la $a0,fileName
	li $a1,1
	syscall
	
	move $s1,$v0
	
	li $v0,15
	move $a0,$s1
	la $a1,Write1
	la $a2,50
	syscall
	
	li $v0,16
	move $a0,$s1
	syscall
	li $v0,10
	syscall
	
	
