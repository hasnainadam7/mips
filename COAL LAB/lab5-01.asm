.data
array1: .byte 'D','H','A','s','u','f','f','a'
#num: .word 12,14,16,18,20
.text
.globl main
main:
 li $t1, 0
 li $t2, 7
 lb $t0, array1 #int *a=&b # load base address of array into register $t0
Loop:
beq $t1, $t2, exit
lb $t3,($t0) #a=*b
li $v0, 1
move $a0, $t3
syscall
addi $t1, $t1, 1
addi $t0, $t0, 1
b Loop

exit:
li $v0, 10
syscall