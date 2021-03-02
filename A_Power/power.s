.data
number: .asciz "%d"


.text
teststring: .asciz "Works\n"
num1: .asciz "2"
pow1: .asciz "2"


.global main
main:
  pushq %rbp
  movq %rsp, %rbp
  movq $0, %rbx                   
  movq $1, %rax                   # sys_write
  movq $1, %rdi                   # sys_write
  movq $teststring, %rsi          # sys_write
  movq $7, %rdx                  # sys_write
  syscall                         # sys_write "Giovanni Fernando, Rafael Pinto - Lab 22"
  call pow                      # call function "pow"

  end:
  movq $60, %rax
  mov $0, %rdi
  call exit


pow:
  

  ret                              # return to main
