.text
assignmentstring: .asciz "Assignment 4: Factorial\n"
numberprompt: .asciz "Input a number\n"
inputnmbr: .asciz "%ld"
outputstr: .asciz "The new number is: %ld\n"


.global main
main:
  pushq %rbp                      
  movq  %rsp, %rbp    
  subq  $16, %rsp             

  movq $0, %rax                 
  movq $assignmentstring, %rdi  
  call printf                   

  call inout

  movq %rbp, %rsp     
  popq %rbp 
  
end:
  mov  $0, %rdi
  call exit    

inout:
  pushq %rbp
  movq  %rsp, %rbp   
  subq  $16, %rsp            

  movq $0, %rax                 
  movq $numberprompt, %rdi     
  call printf                    
 
  leaq -8(%rbp), %rsi  
  movq $0, %rax          
  movq $inputnmbr, %rdi           
  call scanf                         
   
  movq -8(%rbp), %rax
  
  call factorial

  movq %rax, %rsi
  movq $0, %rax
  movq $outputstr, %rdi
  call printf    
    
  movq %rbp, %rsp     
  popq %rbp                 # output incremented number               

  ret                              # return to main

factorial:


  cmpq $1, -8(%rbp)  # if 1 jump to basecase
  je   basecase

  decq -8(%rbp)
  mulq -8(%rbp)                     

  call factorial

basecase:
  
  ret
                   
  

  