.globl main
.text
main:
	li $v0,4
	la $a0,input  
	syscall
	
	la $a0,space
	li $a1,64
	li $v0,8
	syscall
	
	la $t0,space
	jal len
.globl len 
len:
	beq $t2,'\n',len_end
	lb $t2,($t0)
	
	addu $t0,$t0,1
	beq $t2,'\n',loop1
	beq $t2,' ',loop1
	addi $t1,$t1,1
	
	j len
loop1:
	bgt $t1,$t3,loop2
	li $t1,0
	beq $t2,'\n',len_end
	j len
loop2: 
	move $t3,$t1
	move $t4,$t0
	sub $t4,$t4,$t3
	li $t1,0
	j len
len_end:
	la $t0,space
	subi $t4,$t4,1
	move $t0,$t4
	
	li $v0,4
	la $a0,output1
	syscall
print:
	lb $t2,($t0)
	beq $t2,'\n',end
	addu $t0,$t0,1
	beq $t2,' ',end
	li $v0,11
	move $a0,$t2
	syscall
	
	j print
end:
	li $v0,10
	syscall
	jr $ra
.data
input: .asciiz "Input a sentence: "
space: .space 64
output1: .asciiz "Longest word: "
 
