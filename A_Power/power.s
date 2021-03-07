.text
outstring: .asciz "The new total is: %d\n"
baseprompt: .asciz "Please input a base\n"
inbase: .asciz "%ld"
expprompt: .asciz "Please input a exponent\n"
inexp: .asciz "%ld"

testout1: .asciz "The test base is: %d\n"
testout2: .asciz "The test expo is: %d\n"
testtot: .asciz "The total is: %d\n"



# comments 
# -16 is for base
# -24 is for expo
# rax is for result

.global main
main:
  pushq %rbp              # -8
  movq %rsp, %rbp
  

  movq $0, %rax             
  movq $baseprompt, %rdi
  call printf             # prompt input

  leaq -16(%rbp), %rsi    # reserves memory space
  movq $0, %rax
  movq $inbase, %rdi
  call scanf             
  

  movq $0, %rax             
  movq $expprompt, %rdi
  call printf             # prompt input

  leaq -24(%rbp), %rsi    # reserves memory space
  movq $0, %rax
  movq $inbase, %rdi
  call scanf             
  
# output from here
  call pow                       # call function "pow"
 
  movq %rax,  %rsi

  movq $outstring, %rdi
  movq $0, %rax             
  call printf



  movq %rbp, %rsp     
  popq %rbp 
  end:
  mov $0, %rdi
  call exit


pow:
#  pushq %rbp                         # Prologue
#  movq %rsp, %rbp                    # Copy stack pointer to RBP


  movq -16(%rbp), %rax                # set rax with base

  cmpq $0, -24(%rbp)                 # compare 0 and power
  je loopzero                    # if power = 0 then set base to 1     

  loopbegin:

    cmpq $1, -24(%rbp)              # compare 1 and power
    je loopend                   # if power = 1 then end loop
    
    mulq -16(%rbp)                   # multiply base to with %rax
    decq -24(%rbp)             # deduct power

   
    
    jmp loopbegin                # restart loop 

  loopzero:                      # power is 0
    movq $1, %rax             # set base to 1
    
  loopend:                       # calculation finished 


#  movq %rbp, %rsp     
#  popq %rbp                      # exit              
        

  ret                            # return to main

