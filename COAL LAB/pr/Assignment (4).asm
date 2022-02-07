.data
	Array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    	Max: .word 40
    	NewLine: .asciiz "\n"
    	Output: .asciiz ", "
.text
.globl main
main:
	li $t5, 0 
        lw $t6, Max
IntegerArrayLoop:
     	beq $t5, 40, BeforeArrayLoop
      	lw $t7, Array($t5)
	li $v0, 1
	move $a0, $t7
	syscall
	     
	li $v0, 4
	la $a0, Output
	syscall
	
  	add $t5, $t5, 4
   	b IntegerArrayLoop
BeforeArrayLoop:
	li $t5, 0
ReversingLoop1:
	sub $t6, $t6, 4
	bgt $t5, $t6, ReversingLoop2   
	lw $t7, Array($t5) 
	lw $t2, Array($t6)  
	mtc1 $t7, $f1
	cvt.s.w $f1, $f1
	mtc1 $t2, $f4
	cvt.s.w $f4, $f4   
	s.s $f4, Array($t5)
	s.s $f1, Array($t6)
    	add $t5, $t5, 4 
 	b ReversingLoop1        
 ReversingLoop2:
	li $t5, 0
	li $v0, 4
	la $a0, NewLine
	syscall	
AfterArrayLoop:
  	beq $t5, 40, Exit
	l.s $f1, Array($t5)
	li $v0, 2
	mov.s $f12, $f1
	syscall
            
  	li $v0, 4
	la $a0, Output
	syscall   
 	add $t5, $t5, 4
	b AfterArrayLoop
  Exit:
    	li $v0, 10
      	syscall
