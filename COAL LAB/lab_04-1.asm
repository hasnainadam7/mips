.data
msg: .asciiz"Enter the table "
msg2: .asciiz"The table is\n"
.text
li $t1,1

li $v0,4
la $a0,msg
syscall
li $v0,5
syscall
move $t0,$v0

li $v0,4
la $a0,msg2
syscall

ble $t1,10,table

table:
mul $t2,$t0,$t1
addi $t0,$t0,1

li $v0,1
move $a0,$t2
syscall

ble $t1,10,table