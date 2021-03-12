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
 
  movq $assignmentstring, %rdi  # place string into rdi
  movq $0, %rax                 # no vector registers in use
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

  movq $0, %rax                 # no vector registers in use    
  movq $numberprompt, %rdi      # place string into rdi   
  call printf                   # print
  
  subq $16, %rsp
  leaq -8(%rbp), %rsi           # loads address of stack var in rsi
  movq $inputnmbr, %rdi         # load argument of scanf
  movq $0, %rax                 # no vector registers in use     
  call scanf                    # call scanf         
   
  movq -8(%rbp), %rdi           # move value at rbp to rax
  
  call factorial                # call factorial subroutine

  movq %rax, %rsi               # copy rax content into rsi
  movq $outputstr, %rdi         # place string into rdi
  movq $0, %rax                 # no vector registers in use
  call printf                   # print
    
  movq %rbp, %rsp               # epilogue
  popq %rbp                     #                

  jmp end                       # jump to end

factorial:
  
  pushq %rbp                    # Prologue
  movq  %rsp, %rbp              # Copy stack pointer to RBP  

  pushq %rdi                    # push rdi into the stack
  movq  -8(%rbp), %rax          # copy the value into rax
  subq  $8, %rsp

  cmpq  $0, %rax                # compare if value is 0
  je ifstate                    # jump to ifstate if value is 1
  jmp elsestate                 # jump to elsestate

ifstate:

  movq $1, %rax                 # move 1 into rax
  jmp  endstatement             # jump to endstatement

elsestate:
  
  movq %rax, -16(%rbp)          # move value in rax 
  decq %rax                     # decrease value
  movq %rax, %rdi               # move rax value into rdi
  call factorial                # call factorial
  imul -16(%rbp), %rax          # multiply the value by rax and store into rax
  jmp endstatement              # jump to endstatement 

endstatement:

    movq %rbp, %rsp             # epilogue
    popq %rbp
    ret                         # return to inout
                   
  