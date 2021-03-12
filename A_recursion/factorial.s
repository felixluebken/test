.text
assignmentstring: .asciz "Assignment 4: Factorial\n"
numberprompt: .asciz "Input a number\n"
inputnmbr: .asciz "%ld"
outputstr: .asciz "The factorial is: %ld\n"


.global main
main:
  pushq %rbp                    # Prologue 
  movq  %rsp, %rbp              # Copy stack pointer to RBP 
  subq  $16, %rsp               
 
  movq $assignmentstring, %rdi  # place string into rdi
  movq $0, %rax                 # no vector registers in use
  call printf                   # print  

  call inout                    # call inout subroutine

  movq %rbp, %rsp               # epilogue
  popq %rbp                     #
  
inout:
  pushq %rbp                    # Prologue
  movq  %rsp, %rbp              # Copy stack pointer to RBP 
  subq  $16, %rsp            

  movq $0, %rax                 # no vector registers in use    
  movq $numberprompt, %rdi      # place string into rdi   
  call printf                   # print
 
  leaq -8(%rbp), %rsi           # loads address of stack var in rsi
  movq $inputnmbr, %rdi         # load argument of scanf
  movq $0, %rax                 # no vector registers in use     
  call scanf                    # call scanf         
   
  movq -8(%rbp), %rax          # move value at rbp to rax
  
  call factorial                # call factorial subroutine

  movq %rax, %rsi               # copy rax content into rsi
  movq $outputstr, %rdi         # place string into rdi
  movq $0, %rax                 # no vector registers in use
  call printf                   # print
    
  movq %rbp, %rsp               # epilogue
  popq %rbp                     #                

  jmp end                       # jump to end

factorial:

  cmpq $1, -8(%rbp)             # if value is 1 jump to basecase
  je basecase 
  cmpq $0, -8(%rbp)             # if value is 0 jump to zerocase
  je zerocase

  decq -8(%rbp)                 # decrease value by 1
  mulq -8(%rbp)                 # multiply by the value       

  call factorial                # call factorial again

basecase:
  
  ret                           # return to inout
                   
zerocase:

  movq $1, %rax                 # copy 1 into rax
  jmp  basecase                 # jump to basecase to return  

end:
  mov  $0, %rdi                 # loads exit code
  call exit                     # exits the program


  