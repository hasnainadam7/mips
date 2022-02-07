.data
math: .word 50
phy: .word 50
che: .word 50
com: .word 50

total: .asciiz "total out of 400\n"
.text

lw $t0,math
lw $t1,phy
lw $t2,che
lw $t3, com

add $t0, $t0,$t1
add $t1,$t2,$t3
add $t0,$t1,$t0
li $v0, 4
la $a0,total
syscall
li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall

