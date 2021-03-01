.data
number: .asciz "%d"


.text
namestring: .asciz "Giovanni Fernando, Rafael Pinto - Lab 22\n"
assignmentstring: .asciz "Assignment 2: inout\n"
numberprompt: .asciz "Input a number\n"

.global main
main:
  pushq %rbp
  movq %rsp, %rbp
  movq $0, %rbx                   
  movq $1, %rax                   # sys_write
  movq $1, %rdi                   # sys_write
  movq $namestring, %rsi          # sys_write
  movq $42, %rdx                  # sys_write
  syscall                         # sys_write "Giovanni Fernando, Rafael Pinto - Lab 22"
  call inout                      # call function "inout"

  end:
  movq $60, %rax
  mov $0, %rdi
  call exit


inout:
  # output name
  movq $1, %rax                    # sys_write
  movq $1, %rdi                    # sys_write
  movq $assignmentstring, %rsi     # sys_write  "Assignment 2: inout"
  movq $21, %rdx                   # sys_write
  syscall                          # sys_write
  # get number 
  movq $1, %rax                    # sys_write
  movq $1, %rdi                    # sys_write
  movq $numberprompt, %rsi         # sys_write 
  movq $16, %rdx                   # sys_write
  syscall                          # sys_write  "Input a number"
  # read input
  movq $0, %rax                    # get user input(0)
  movq $0, %rdi                    # standard input
  movq $number, %rsi               # store in number
  movq $16, %rdx                   # length of input
  syscall
  incq -8(%rsi)
  syscall


  # output(Old fashion) init:  number: .asciz "%d"


  movq $1, %rax                    # sys_write
  movq $1, %rdi                    # sys_write
  movq $number, %rsi               # sys_write 
  movq $16, %rdx                   # sys_write
  syscall                          # sys_write  "Output a number"

 # incq -8(%rdx)

  ret                              # return to main
