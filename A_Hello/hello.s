.text
mystring: .asciz "Assignment 1 - Your first simple program.\nGiovanni Fernando 2696357, Rafael Pinto 2695949 - Lab 22\n"

.global main
main:
  pushq %rax              # base pointer 
  movq $0, %rax           # no vector register in use for printf
  movq $mystring, %rdi    # load string address
  call printf             # call the printf routine

  end:
  mov $0, %rdi            # load exit code
  call exit               # exit program
