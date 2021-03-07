.text
assignmentstring: .asciz "Assignment 2: inout\n"
numberprompt: .asciz "Input a number\n"
inputstr: .asciz "%d"
outputstr: .asciz "The new number is: %d\n"


.global main
main:
  pushq %rbp                      # initilise base pointer and stack pointer
  movq %rsp, %rbp                 # initilise base pointer and stack pointer

  movq $0, %rax                   # no vector registers in use for printf  
  movq $assignmentstring, %rdi    # place $assignmentstring into %rdi
  call printf                     # output

  call inout                      # call function "inout"

  movq %rbp, %rsp     
  popq %rbp 
  end:
  mov $0, %rdi
  call exit


inout:
   pushq %rbp
   movq %rsp, %rbp                 # init

   movq $0, %rax                   # no vector registers in use for printf  
   movq $numberprompt, %rdi        # move string to register %rdi
   call printf                     # output
 
   leaq -16(%rbp), %rsi            # reserve memory for input
   movq $0, %rax                   # no vector registers in use for printf
   movq $inputstr, %rdi            # place $inputstr into %rdi
   call scanf                      # get input  
   addq $8, %rsp                   # adjust stack pointer for increment below  

   call factorial           

factorial:

    pushq %rbp # Prologue : push the base p o i n t e r .
    movq %rsp , %rbp # and copy s tack po int e r to RBP.

    movq %rdi, %rax
    movq $outputstr, %rdi
    movq $0, %rax
    call printf                    # output factorial number    

    movq %rbp , %r sp # Epi logue : c l e a r l o c a l v a r i a b l e s from s t a c k .
    popq %rbp # Re s tor e c a l l e r ' s base p o i n t e r .

    ret main