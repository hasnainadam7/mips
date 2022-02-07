.data

inta: .asciiz "Enter A value: "
intb: .asciiz "Enter B value: "

printa: .asciiz "A="
printb: .asciiz "B="

.text

li $v0, 4
la $a0, inta
syscall

li $v0, 5
syscall

move $t0, $v0


li $v0, 4
la $a0, intb
syscall

li $v0, 5
syscall

move $t1, $v0

add $t0, $t0, $t1

mul $t1, $t1, $t0

	li $v0, 4
	la $a0, printa
	syscall
	
	li $v0, 1

	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, printb
	syscall
	
	li $v0, 1

	move $a0, $t1
	syscall