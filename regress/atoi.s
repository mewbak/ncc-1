.text
_atoi:
L1:
	pushq %rbp
	movq %rsp,%rbp
L2:
	xorl %edx,%edx
	xorl %eax,%eax
L4:
	movq %rdi,%rsi
	addq $1,%rdi
	movzbl (%rsi),%esi
	movl %esi,%ecx
	movslq %esi,%r8
	movzbl ___ctype+1(%r8),%r8d
	testl $8,%r8d
	jnz L4
L6:
	cmpl $45,%esi
	jnz L8
L7:
	movl $1,%edx
	movq %rdi,%rsi
	addq $1,%rdi
	movzbl (%rsi),%ecx
	jmp L13
L8:
	cmpl $43,%esi
	jnz L13
L10:
	movq %rdi,%rsi
	addq $1,%rdi
	movzbl (%rsi),%ecx
L13:
	leal -48(%rcx),%esi
	cmpl $10,%esi
	jae L16
L14:
	imull $10,%eax
	leal -48(%rax,%rcx),%eax
	movq %rdi,%rsi
	addq $1,%rdi
	movzbl (%rsi),%ecx
	jmp L13
L16:
	cmpl $0,%edx
	jz L3
L17:
	negl %eax
L3:
	popq %rbp
	ret
L24:
.globl ___ctype
.globl _atoi
