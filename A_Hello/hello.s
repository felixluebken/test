.text
mystring: .asciz "Giovanni Fernando, Rafael Pinto - Lab 22\nOur first simple program.\n"
.global main
main:
  pushq %rbp
  movq %rsp, %rbp
  movq $0, %rbx
  movq $1, %rax
  movq $1, %rdi
  movq $mystring, %rsi
  movq $66, %rdx
  syscall
  movq $60, %rax
  xorq %rdi, %rdi
  syscall

  end:
  mov $0, %rdi
  call exit
