.data
var1: .byte 'a'
.text lw $t0, var1
move $a0, $t0
li $v0, 11
syscall
li $t0, 'b'
sw $t0, var1
lw $t1, var1
move $a0, $t1
li $v0, 11
syscall
li $v0, 10
syscall