
.data

testInteger: .word 
print: .asciiz "Enter an integer:"
number: .asciiz "\nnumber:"

.text
lw $t0, testInteger


li $v0, 4
la $a0, print
syscall

li $v0, 5
syscall
move $t0, $v0


mul $t0, $t0, $t0
li $v0, 4
la $a0, number
syscall

li $v0,1
move $a0,$t0
syscall

li $v0, 10
syscall

