.data
var1 : .asciiz "Enter the first value\n"
var2 : .asciiz "Enter the second value\n"
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
move $t2 , $t0
printNow:
move $a0 , $t2
li $v0, 1
syscall
li $v0 , 10
syscall