.data 
tablenum: .word 1
counter: .word 1
result: .word 1
printmsg: .asciiz "Enter the table number:\n"
x: .asciiz "x"
eq: .asciiz "="
new: .asciiz "\n"

.globl main
.text
main:



lw $t0, tablenum
lw $t1, counter
lw $t2, result

li $v0, 4
la $a0 , printmsg
syscall

li $v0, 5
syscall
move $t0, $v0

 loop:
 
beq $t1, 11, Exit
mul $t2, $t0, $t1 

li $v0, 4
la $a0,new
syscall

li $v0, 1	#table name

move $a0, $t0
syscall
li $v0, 4
la $a0,x	# x
syscall

li $v0, 1
move $a0, $t1	#count numebr
syscall

li $v0, 4
la $a0, eq	#=
syscall

li $v0, 1
move $a0,$t2
syscall

add $t1, $t1, 1


b loop
Exit: 
li $v0, 10
syscall

