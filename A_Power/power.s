.text
outstring: .asciz "The new total is: %d\n"
baseprompt: .asciz "Please input a base\n"
inbase: .asciz "%ld"
expprompt: .asciz "Please input a exponent\n"
inexp: .asciz "%ld"

.global main
main:
  pushq %rbp              # Prologue
  movq %rsp, %rbp         # Copy stack pointer to RBP
  

  movq $0, %rax           # no vector registers in use
  movq $baseprompt, %rdi  # load address of prompt
  call printf             # prompt input

  leaq -16(%rbp), %rsi    # reserves memory space
  movq $0, %rax           # load address of stack var in rsi
  movq $inbase, %rdi      # load first argument of scanf
  call scanf              # call scanf
  

  movq $0, %rax           # repeat of above
  movq $expprompt, %rdi   
  call printf             

  leaq -24(%rbp), %rsi    
  movq $0, %rax           
  movq $inbase, %rdi      
  call scanf  


  movq -16(%rbp), %rdi    # store values for copy later(rbp gets cleared)
  movq -24(%rbp), %rsi

  call pow                # call function "pow"
 
  movq %rax,  %rsi        # move contents of RAX to RSI for output

  movq $outstring, %rdi   # load format for output
  movq $0, %rax              
  call printf             # output answer

  movq %rbp, %rsp         # Epilogue: clear variables from stack
  popq %rbp               # Restore base pointer
  end:
  mov $0, %rdi            # load program exit code
  call exit               # exit program


pow:
  pushq %rbp              # Prologue
  movq %rsp, %rbp         # Copy stack pointer to RBP

  push %rdi               # copy values back into rbp
  push %rsi

  movq -8(%rbp), %rax     # set rax with base

  cmpq $0, -16(%rbp)      # compare 0 and power
  je loopzero             # if power = 0 then set base to 1     

  loopbegin:

    cmpq $1, -16(%rbp)    # compare 1 and power
    je loopend            # if power = 1 then end loop
    
    mulq -8(%rbp)         # multiply base to with %rax
    decq -16(%rbp)        # deduct power

    jmp loopbegin         # restart loop 

  loopzero:               # power is 0
    movq $1, %rax         # set base to 1
    
  loopend:                # calculation finished 

  movq %rbp, %rsp         # Epilogue: clear variables from stack
  popq %rbp               # Restore base pointer
  
  ret                     # return to main

