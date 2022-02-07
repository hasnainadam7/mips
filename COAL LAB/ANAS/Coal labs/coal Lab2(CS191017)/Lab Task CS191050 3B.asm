.data



math: .asciiz "Enter Math marks: "
chem: .asciiz "Enter Chemistry marks: "
phy: .asciiz "Enter Physics marks:  "
eng: .asciiz "Enter English marks: "

math1: .asciiz "\nDouble of Maths marks: "
chem1: .asciiz "\nDouble of Chemistry marks: "
phy1: .asciiz "\nDouble of Physics marks:  "
eng1: .asciiz "\nDouble of English marks: "

msg1: .asciiz "\n\nOriginal marks out of 400: "
msg2: .asciiz "\nTotal marks out of 800: "

marks_math: .byte
marks_chem: .byte 
marks_phy: .byte 
marks_eng: .byte 

.text
.globl main
main:
	#displaying string on Run I/O
	li $v0, 4 
        la $a0, math
        syscall
       
       #taking input
        li $v0,5  
	syscall
	#storing to register
	sb $v0,marks_math
	#loading from register
	lb $t0,marks_math
	
	#displaying string on Run I/O
	li $v0, 4 
        la $a0, chem 
        syscall
        
   	 #taking input
	li $v0,5  
	syscall
	sb $v0,marks_chem
	lb $t1,marks_chem
	
	#displaying string on Run I/O
	li $v0, 4 
        la $a0, phy 
        syscall
        
         #taking input
	li $v0,5  
	syscall
	sb $v0,marks_phy
	lb $t2,marks_phy
	
	#displaying string on Run I/O
	li $v0, 4 
        la $a0, eng
        syscall
        
         #taking input
	li $v0,5  
	syscall
	sb $v0,marks_eng
	lb $t3,marks_eng
	
	#mult every original input by 2
	mul $t4, $t0, 2
	mul $t5, $t1, 2
	mul $t6, $t2, 2
	mul $t7, $t3, 2	
	
	#displaying string and marks on Run I/O
	li $v0, 4 
        la $a0, math1
        syscall
	li $v0, 1
	move $a0, $t4
	syscall
	
	#displaying string and marks on Run I/O
	li $v0, 4 
        la $a0, chem1
        syscall
	li $v0, 1
	move $a0, $t5
	syscall
	
	#displaying string and marks on Run I/O
	li $v0, 4 
        la $a0, phy1
        syscall
	li $v0, 1
	move $a0, $t6
	syscall
	
	#displaying string and marks  on Run I/O
	li $v0, 4 
        la $a0, eng1
        syscall
	li $v0, 1
	move $a0, $t7
	syscall
	
	#displaying string on Run I/O
	li $v0, 4 
        la $a0, msg1
        syscall
        
        #adding all marks
  	add $s0, $t0, $t1
  	add $s1, $t2, $t3
  	add $s2, $s0, $s1
  	
  	li $v0, 1
	move $a0, $s2
	syscall

	li $v0, 4 
        la $a0, msg2
        syscall
       
       #doubling original marks
       	mul $s3, $s2, 2
       	
       	li $v0, 1
       	move $a0, $s3
       	syscall
	
	#exiting program
	li $v0,10
	syscall
