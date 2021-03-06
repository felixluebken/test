.text
outstring: .asciz "The new total is: %d\n"
teststring: .asciz "Expo %d\n"



.global main
main:
  pushq %rbp
  movq %rsp, %rbp

  # test init 
  movq $5, %rsi                  # add base to %rsi
  movq $3, %rdx                  # add exponent to %rdx
  # test init 


  call pow                       # call function "pow"

#  movq $699, %rax
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
  pushq %rbp                     # init
  movq %rsp, %rbp    

  movq %rsi, %rax                # set rax with base

  pushq %rdx
  cmpq $0, %rdx                  # compare 0 and power
  je loopzero                    # if power = 0 then set base to 1     


  loopbegin:
   
    cmpq $1, -8(%rbp )               # compare 1 and power
    je loopend                   # if power = 1 then end loop
    
    mulq %rsi                    # multiply base to with %rax
    subq $1, -8(%rbp )               # deduct power
  

    jmp loopbegin                # restart loop 

   loopzero:                      # power is 0
     movq $1, %rax             # set base to 1
    
  loopend:                       # calculation finished 


  movq %rbp, %rsp     
  popq %rbp                      # exit              
        

  ret                            # return to main



#  movq $10, %rsi                 # add base to %rsi
#  movq $1200, %rdx               # add exponent to %rdx
#  addq %rdx, %rsi                # rsi = rsi + rdx







 # loopplus:                      # power is neg
