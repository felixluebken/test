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


    movq -16(%rbp), %rbx           
    incq %rbx                      # increment input value
    movq %rbx, %rsi

    movq $outputstr, %rdi
    movq $0, %rax
    call printf                    # output incremented number               

  ret                              # return to main
