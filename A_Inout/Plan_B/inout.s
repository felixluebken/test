.text
assignmentstring: .asciz "Assignment 2: inout\n"
numberprompt: .asciz "Input a number\n"
informatstr: .asciz "%d"
outstr: .asciz "The new number is: %d\n"


.global main
main:
  pushq %rbp                      # -8 on stack 
  movq %rsp, %rbp

  movq $0, %rax                   # no vector registers in use for printf  
  movq $assignmentstring, %rdi    # move string to register
  call printf                     # print names

  call inout                      # call function "inout"

  end:
  movq $60, %rax
  mov $0, %rdi
  call exit


inout:
   pushq %rbp
   movq %rsp, %rbp                 # -8

   movq $0, %rax                   # no vector registers in use for printf  
   movq $numberprompt, %rdi        # move string to register
   call printf                     # print request
   addq $8, %rsp                   # -8

   subq $8, %rsp                   # -16
   leaq -16(%rbp), %rsi
   movq $0, %rax
   movq $informatstr, %rdi
   call scanf                      # get input  
   addq $8, %rsp                   # -16   

 




    movq -16(%rbp), %rbx
    incq %rbx
    movq %rbx, %rsi

    movq $outstr, %rdi
    movq $0, %rax
    call printf                    # -24                

  ret                              # return to main
