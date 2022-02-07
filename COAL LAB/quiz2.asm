.data
var1 : .asciiz "Enter the value of A\n"
var2 : .asciiz "Enter the value of B\n"
.globl main
.text
main:
li $v0 , 4
la $a0 , var1
syscall
li $v0 , 5
syscall
move $t0 , $v0
li $v0 , 4
la $a0 , var2
syscall
li $v0 , 5
syscall
move $t1 , $v0
bgt $t0 , $t1 , ifGreater
move $t2 , $t1
b printNow
ifGreater:
mul $t2, $t2, 10
move $a0, $t2
li $v0, 1
syscall

printNow:
add $t1, $t1, 1

move $a0 , $t2


li $v0, 1
syscall
li $v0 , 10
syscall