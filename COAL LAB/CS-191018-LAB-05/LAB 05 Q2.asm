.data
suffa: .asciiz " DHA Suffa "
string: .asciiz " \nString after reverse = "

.text
.globl main
main:


la $a0, suffa  
li $v0, 4     
syscall

la $a0, string
li $v0, 4   
syscall

li $t2, 0

loop:                

lb $t1, suffa($t2)  
add $t2, $t2, 1

bne $t1, 0, loop
sub $t2, $t2, 1
 
print:

li $v0, 11
la $t1, suffa($t2)  
lb $a0, ($t1)
syscall

sub $t2, $t2, 1
bne $t2, 0, print

li $v0, 10            
syscall
