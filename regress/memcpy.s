.text
_memcpy:
L1:
	pushq %rbp
	movq %rsp,%rbp
L12:
	movq %rdi,%rax
	movq %rax,%rdi
	cmpq $0,%rdx
	jz L3
L4:
	addq $1,%rdx
L7:
	addq $-1,%rdx
	cmpq $0,%rdx
	jbe L3
L8:
	movq %rsi,%rcx
	addq $1,%rsi
	movzbl (%rcx),%ecx
	movq %rdi,%r8
	addq $1,%rdi
	movb %cl,(%r8)
	jmp L7
L3:
	popq %rbp
	ret
L14:
.globl _memcpy
