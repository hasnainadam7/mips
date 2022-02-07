.globl main
.data
array: .word 10,28,30,41,54,61,75,83,90,999
new: .asciiz "\n"

gap: .asciiz "  "

.text
main:
	
	
	li $t1,0     #t1=0
        addi $t0,$zero,0   #t0=0
       
	 
	
recursion:
        lw $t6,array($t0)    #load 1st index element of array in t6
        
        beq $t1,10,reverse
       
        mtc1 $t6,$f2 #f2=t6    #conversion
        cvt.s.w $f2,$f2
       
        s.s $f2,array($t0)  #store the conversion
       
       
       
        li $v0 ,1         #print the value on that index
        move $a0,$t6
        syscall 
       
        li $v0 , 4     #print gap string on run I/0
        la $a0 , gap
        syscall
       
       addi $t0,$t0,4   #index increment
        sub $t2,$t2,4 
       addi $t1,$t1,1  #recursion increment
       
       b recursion
       
reverse:
      
       li $v0 , 4     #print string on run I/0
       la $a0 ,new
       syscall
       
       li $t1,0     #t1=0
       li $t2,36     #t2=36 last index of array
       
      
recursion2:  
      
       l.s $f6,array($t2)    #load last index element of array in t6 
       
       bgt $t1,9,end
       
       li $v0 ,2         #print the value on that index
       mov.s $f12,$f6
       syscall 
        
       li $v0 , 4     #print string on run I/0
       la $a0 , gap
       syscall
      
       sub $t2,$t2,4   #index decrement
        
       
       add $t1,$t1,1  #recursion increment
       
       b recursion2

end:
        li $v0 ,10
        syscall 