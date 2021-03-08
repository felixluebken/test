.text
assignmentstring: .asciz "Assignment 4: Factorial\n"
numberprompt: .asciz "Input a number\n"
inputnmbr: .asciz "%ld"
outputstr: .asciz "The new number is: %ld\n"


.global main
main:
  pushq %rbp                    # Prologue 
  movq  %rsp, %rbp              # Copy stack pointer to RBP 
  subq  $16, %rsp               

  movq $0, %rax                 # no vector registers in use   
  movq $assignmentstring, %rdi  # place string into rdi
  call printf                   # print  

  call inout                    # call inout subroutine

  movq %rbp, %rsp               # epilogue
  popq %rbp                     #
  
end:
  mov  $0, %rdi                 # loads exit code
  call exit                     # exits the program

inout:
  pushq %rbp                    # Prologue
  movq  %rsp, %rbp              # Copy stack pointer to RBP 
  subq  $16, %rsp            

  movq $0, %rax                 # no vector registers in use    
  movq $numberprompt, %rdi      # place string into rdi   
  call printf                   # print
 
  leaq -8(%rbp), %rsi           # reserves memory space
  movq $0, %rax                 # load address of stack var in rsi
  movq $inputnmbr, %rdi         # load argument of scanf      
  call scanf                    # call scanf         
   
  movq -8(%rbp), %rax           # move value at rbp to rax
  
  call factorial                # call factorial subroutine

  movq %rax, %rsi               # copy rax content into rsi
  movq $0, %rax                 # no vector registers in use
  movq $outputstr, %rdi         # place string into rdi
  call printf                   # print
    
  movq %rbp, %rsp               # epilogue
  popq %rbp                     #                

  ret                           # return to main

factorial:


  cmpq $1, -8(%rbp)             # if 1 jump to basecase
  je   basecase

  decq -8(%rbp)                 # decrease value by 1
  mulq -8(%rbp)                 # multiply rax by the input value       

  call factorial                # call factorial again

basecase:
  
  ret                           # return to main
                   
  

  