.text
_execvpe:
L1:
	pushq %rbp
	movq %rsp,%rbp
	subq $256,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
	pushq %r15
L44:
	movq %rsi,%r14
	movq %rdx,%r15
	movq %rdi,%r13
	movq $L7,%rdi
	call _getenv
	movq %rax,%rbx
	cmpq $0,%rax
	jnz L6
L4:
	movq $L8,%rbx
L6:
	movq %r13,%rdi
	movl $47,%esi
	call _strchr
	cmpq $0,%rax
	setnz %sil
	movzbl %sil,%r12d
L10:
	cmpl $0,%r12d
	jz L14
L13:
	leaq -256(%rbp),%rdi
	movq %r13,%rsi
	call _strcpy
	jmp L15
L14:
	leaq -256(%rbp),%rsi
L16:
	movzbl (%rbx),%edi
	cmpl $0,%edi
	jz L19
L20:
	cmpl $58,%edi
	jz L19
L17:
	movq %rbx,%rdi
	addq $1,%rbx
	movzbl (%rdi),%edi
	movq %rsi,%rax
	addq $1,%rsi
	movb %dil,(%rax)
	jmp L16
L19:
	leaq -256(%rbp),%rdi
	cmpq %rsi,%rdi
	jz L26
L24:
	movq %rsi,%rdi
	addq $1,%rsi
	movb $47,(%rdi)
L26:
	movq %r13,%rdi
L27:
	movzbl (%rdi),%eax
	cmpl $0,%eax
	jz L30
L28:
	movq %rdi,%rax
	addq $1,%rdi
	movzbl (%rax),%eax
	movq %rsi,%rcx
	addq $1,%rsi
	movb %al,(%rcx)
	jmp L27
L30:
	movb $0,(%rsi)
L15:
	leaq -256(%rbp),%rdi
	movq %r14,%rsi
	movq %r15,%rdx
	call _execve
	cmpl $0,%r12d
	jnz L12
L33:
	movzbl (%rbx),%esi
	cmpl $0,%esi
	jnz L37
L12:
	movl $-1,%eax
L3:
	popq %r15
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp,%rsp
	popq %rbp
	ret
L37:
	cmpl $58,%esi
	jnz L10
L39:
	addq $1,%rbx
	jmp L14
L46:
L8:
	.byte 0
L7:
	.byte 80,65,84,72,0
.globl _execvpe
.globl _execve
.globl _strchr
.globl _getenv
.globl _strcpy