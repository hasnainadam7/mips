.data
num: .asciiz "enter 2 number:\n"

.globl main

.text
main:

jal product

li $v0 ,10
syscall


product:
li $v0, 4
la $a0, num
syscall

li $v0, 5

syscall
move $t0, $v0
li $v0, 5

syscall
move $t1, $v0
mul $t0, $t0, $t1

li $v0, 1
move $a0, $t0
syscall

jr $ra
