.data
message1: .asciiz"input x:"
message2: .asciiz"input y:"
message3: .asciiz"input z:"
message4: .asciiz"al:"
message5: .asciiz"bl:"
message6: .asciiz"cl:"
x: .word 1 
y: .word 2 
z: .word 3 
a1: .word 4 
b1: .word 5 
c1: .word 6
.text
.global main
 main:
 	li $v0,4
 	la $a0,msg1
 	syscall
 	li $v0,5
 	syscall
 
 	sw $v0,x
 	lw $t0,x
 	syscall
 	
 	li $v0,4
 	la $a0,msg2
 	syscall
 	li $v0,5
 	syscall
 	
 	sw $v0,y
 	lw $t1,y
 	syscall
 	li $v0,4
 	la $a0,msg3
 	syscall
 	li $v0,5
 	syscall
 	
 	sw $v0,z
 	lw $t2,z
 	syscall
 	
 	mul $s0,$t2,$t0
 	add $s1,$s0,$t2
 	move $a1, $s1
 	li $v0,4
 	la $a0,msg4
 	syscall
 	
 	li $v0,1
 	move $a0,$t4
 	syscall
 	add $s2,$t0,$t1
 	mul $s3,$s2,$t2
 	move b1,$s3
 	li $v0,4
 	la $a0,msg5
 	syscall
 	li $v0,1
 	move $a0,$t5
 	syscall
 	mul $s4,$t0,$t1		
 	sub $s5,$s4,$t2
 	move c1,$s5
 	li $v0,4
 	la $a0,msg6
 	syscall
 	li $v0,1
 	move $a0,c1
 	syscall
 	li $v0,10
 	syscall
