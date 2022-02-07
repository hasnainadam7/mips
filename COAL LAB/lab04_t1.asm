.data
a: .word 1
c: .word 1
num: .word 1

msg: .asciiz "Enter the table number:\n"
msg1: .asciiz "\n"
m: .asciiz "*"
m1: .asciiz "="

.text

lw $t0, a
lw $t1, c
lw $t2, num

la $a0, msg
li $v0, 4
syscall

li $v0, 5
syscall
move $t0, $v0

loop:
beq $t1, 11, Exit

mul $t2, $t0, $t1

li $v0, 1
move $a0, $t0
syscall

la $a0, m
li $v0, 4
syscall

li $v0,1 
move $a0, $t1
syscall

la $a0, m1
li $v0, 4
syscall

add $t1, $t1, 1
la $a0, msg1
li $v0,4
syscall

j loop
Exit:
li $v0,10
syscall
