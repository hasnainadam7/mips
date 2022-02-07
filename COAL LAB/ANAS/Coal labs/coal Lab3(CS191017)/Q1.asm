.data
massage1: .asciiz"width " 
massage2: .asciiz"length" 
massage3: .asciiz"area "

w: .word 5 

l: .word 6
.text
.global main
main:
	li $v0,4
	la $a0,massage1
	syscall
	li $v0,5
	syscall
	sw $v0,w
	lw $t0,w
	move $t0,$v0
	li $v0,4
	la $a0,massage2
	syscall
	li $v0,5
	syscall
	sw $v0,l
	lw $t1,l
	move $t1,$v0
	mul $s0,$t1,$t0
	li $v0,4
	la $a0,massage3
	syscall
		li $v0,1
	move $a0,$s0
	syscall
	li $v0,10
	syscall
