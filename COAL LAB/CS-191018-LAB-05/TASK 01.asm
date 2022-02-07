.data
 num: .word 11,12,13,14,15
 new: .asciiz "\n"
 index: .asciiz "Value of array index"
 is: .asciiz "is "
 string1: .asciiz " ["
 string2: .asciiz "] "

 i:.word 0

 .text
 .globl main
 main:

 lw $t5, i
 li $t1,0
 li $t2,5
 li $t3, 10
 la $t0, num #load base address

 Loop:
beq $t1,$t2, exit

 lw $t4,($t0)

 mul $t4, $t4, $t3

 li $v0,4
 la $a0, index
 syscall
 


li $v0, 4
 la $a0, string1
 syscall
 
 li, $v0, 1
 move $a0, $t5
 syscall  
    
 li $v0, 4
 la $a0, string2
 syscall 
      
li $v0, 4
la $a0, is
 syscall 
         
          move $a0, $t4 
            
li $v0, 4
la $a0, new
syscall

addi $t1, $t1, 1
 addi $t0, $t0, 4
  addi $t5, $t5, 1 

 b Loop
 exit: 
 li $v0, 10 
  syscall
