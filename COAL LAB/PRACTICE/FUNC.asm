.data
array1: .space 12 # declare 12 bytes of storage to hold array of 3 integers
.text
.globl main
main:
la $t0, array1 # load base address of array into register $t0

li $t1, 5 # $t1 = 5 ("load immediate")
sw $t1, ($t0) # first array element set to 5; indirect addressing

li $t1, 13 # $t1 = 13
sw $t1, 4($t0) # second array element set to 13

li $t1, -7 # $t1 = -7
sw $t1, 8($t0)

li $t1, -7 # $t1 = -7
sw $t1, 12($t0)

la $t4, array1
lw $t1, 0($t4)

li $v0, 1
move $a0, $t1
syscall

lw $t1, 4($t4)
li $v0, 1
move $a0, $t1
syscall

lw $t1, 8($t4)
li $v0, 1
move $a0, $t1
syscall

lw $t1, 12($t4)
li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall