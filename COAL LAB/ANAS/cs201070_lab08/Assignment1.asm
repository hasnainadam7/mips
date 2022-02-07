.data
arr:	.space	256

msg0: .asciiz " \n Provide string \n "
msg1: .asciiz " \n Largest Word " 
abc: .asciiz "\n" 
	.text
	.globl main
main:
         
         li $v0 , 4     
         la $a0 , msg0
         syscall
         
	 li	$v0, 8			
	 la	$a0, arr		
	 li	$a1, 256		
	 syscall
	
         li $t1,0     #t1=0
         addi $t0,$zero,0   #t0=0
         addi $t3,$zero,0   #t3=0
	
	
	
loop: 
       lb $t6,arr($t0)    
       
       beq $t6,0,first_word
       
       li $v0 ,11         
       move $a0,$t6
       syscall 
       
       addi $t0,$t0,1   
       addi $t1,$t1,1  
       
       b loop
       
first_word:
           li $t8,0     #t8=0
           addi $t0,$zero,0   #t0=0
           li $s1,0     #s1=0
   loop_first: 
       lb $t6,arr($t0)    
       
       beq $t6,32,verify  
       
       addi $s1,$s1,1
       addi $t8,$t8,1  #loop increment
       addi $t0,$t0,1   #index increment
       
       move $t9,$s1
       
       b loop_first
verify:     
        li $t7,0     #t7=0
        li $t4,0     #t4=0
        li $t5,0     #t5=0
        addi $t0,$zero,0   #t0=0
       
verify_largestword: 
        bgt $t4,$t1,print
        lb $t6,arr($t0)   
        
        beq $t6,0,word_length
        
        addi $t5,$t5,1   
        
        beq $t6,32,word_length  
        
wordverify:        
        
       addi $t0,$t0,1   
       addi $t4,$t4,1  
       
       b verify_largestword
       
word_length:  

         sub $t7,$t5,1  
        
         bgt $t7,$t8,largest_word
largest:  
               
         li $t5,0     
          
         b wordverify
         
largest_word:  

         move $t9,$t4
         move $t8,$t7
        
         b largest

print:  

         li $v0 , 4     
         la $a0 , msg1
         syscall 
         
         
         
         sub $s2,$t9,1  
         
         sub $s3,$s2,$t8
         
         
         
print_loop:         
        
         
       
      bgt $s3,$t9,exit  
      
      li $v0 ,11         #print 
      move $a0,$t6
      syscall 
      
      lb $t6,arr($s3)    
       
       
        
       addi $s3,$s3,1   
       b print_loop
        
        
exit:        
         li $v0 ,10
         syscall
