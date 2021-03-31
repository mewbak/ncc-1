.text
_error:
L3:
	pushq %rbp
	movq %rsp,%rbp
L4:
	movq _input_stack(%rip),%rsi
	cmpq $0,%rsi
	jz L7
L6:
	movq _input_stack(%rip),%rsi
	leaq 8(%rsi),%rsi
	movl (%rsi),%esi
	shll $31,%esi
	sarl $31,%esi
	cmpl $0,%esi
	jz L11
L10:
	movq _input_stack(%rip),%rsi
	leaq 8(%rsi),%rsi
	leaq 1(%rsi),%rsi
	jmp L12
L11:
	movq _input_stack(%rip),%rsi
	leaq 8(%rsi),%rsi
	movq 16(%rsi),%rsi
L12:
	pushq %rsi
	pushq $L9
	pushq $___stderr
	call _fprintf
	addq $24,%rsp
	movq _input_stack(%rip),%rsi
	movl 32(%rsi),%esi
	cmpl $0,%esi
	jz L8
L13:
	movq _input_stack(%rip),%rsi
	movl 32(%rsi),%esi
	pushq %rsi
	pushq $L16
	pushq $___stderr
	call _fprintf
	addq $24,%rsp
	jmp L8
L7:
	pushq $L17
	pushq $___stderr
	call _fprintf
	addq $16,%rsp
L8:
	pushq $L18
	pushq $___stderr
	call _fprintf
	addq $16,%rsp
	leaq 24(%rbp),%rdx
	movq 16(%rbp),%rsi
	movq $___stderr,%rdi
	call _vfprintf
	movl $10,%edi
	movq $___stderr,%rsi
	call _fputc
	movq _out_fp(%rip),%rsi
	cmpq $0,%rsi
	jz L21
L19:
	movq _out_fp(%rip),%rdi
	call _fclose
	movq _out_path(%rip),%rdi
	call _remove
L21:
	movl $1,%edi
	call _exit
L5:
	popq %rbp
	ret
L25:
_safe_malloc:
L26:
	pushq %rbp
	movq %rsp,%rbp
	pushq %rbx
L27:
	call _malloc
	movq %rax,%rbx
	cmpq $0,%rbx
	jnz L31
L29:
	pushq $L32
	call _error
	addq $8,%rsp
L31:
	movq %rbx,%rax
L28:
	popq %rbx
	popq %rbp
	ret
L37:
_parentheses:
L39:
	pushq %rbp
	movq %rsp,%rbp
	pushq %rbx
	pushq %r12
	pushq %r13
	pushq %r14
L85:
	movq %rdi,%r12
	movq %rsi,%r14
L40:
	movl $0,%ebx
	movq _input_stack(%rip),%rsi
	movl 32(%rsi),%r13d
L44:
	movq %r14,%rsi
	leaq 32(%rsi),%rsi
	movq (%rsi),%rdi
	movl $0,%esi
	movl $0,%eax
L47:
	cmpq $0,%rdi
	jz L49
L50:
	movq %rdi,%rcx
	movl (%rcx),%ecx
	cmpl $48,%ecx
	jnz L49
L48:
	leaq 32(%rdi),%rdi
	movq (%rdi),%rdi
	addl $1,%eax
	jmp L47
L49:
	cmpq $0,%rdi
	jnz L56
L54:
	movl $0,%edi
	movq %r12,%rsi
	call _input_tokens
	cmpl $-1,%eax
	jnz L59
L57:
	movl %ebx,%eax
	jmp L41
L59:
	movl $-1,%ebx
	jmp L44
L56:
	movq %rdi,%rcx
	movl (%rcx),%ecx
	cmpl $536870927,%ecx
	jz L66
L62:
	movl %ebx,%eax
	jmp L41
L66:
	cmpq $0,%rdi
	jnz L71
L69:
	movl $0,%edi
	movq %r12,%rsi
	call _input_tokens
	cmpl $-1,%eax
	jnz L44
L72:
	movq _input_stack(%rip),%rsi
	movl %r13d,32(%rsi)
	pushq $L75
	call _error
	addq $8,%rsp
	jmp L44
L71:
	movq %rdi,%rcx
	movl (%rcx),%ecx
	cmpl $536870927,%ecx
	jnz L79
L77:
	addl $1,%esi
L79:
	movq %rdi,%rcx
	movl (%rcx),%ecx
	cmpl $536870928,%ecx
	jnz L82
L80:
	addl $-1,%esi
L82:
	leaq 32(%rdi),%rdi
	movq (%rdi),%rdi
	addl $1,%eax
	cmpl $0,%esi
	jnz L66
L41:
	popq %r14
	popq %r13
	popq %r12
	popq %rbx
	popq %rbp
	ret
L87:
_replace:
L89:
	pushq %rbp
	movq %rsp,%rbp
	subq $16,%rsp
	pushq %rbx
	pushq %r12
	pushq %r13
L131:
	movq %rdi,%rbx
L90:
	leaq -16(%rbp),%rdi
	movl $16,%ecx
	xorl %eax,%eax
	rep
	stosb
	leaq -16(%rbp),%rsi
	movq %rsi,-8(%rbp)
	movl $0,%r13d
	movq %rbx,%rsi
	movq (%rsi),%r12
	movq %r12,%rsi
	movl (%rsi),%esi
	cmpl $49,%esi
	jz L94
L92:
	movl $0,%eax
	jmp L91
L94:
	leaq 8(%r12),%rdi
	call _macro_lookup
	cmpq $0,%rax
	jz L96
L99:
	movl 24(%rax),%esi
	andl $1,%esi
	cmpl $0,%esi
	jz L98
L96:
	movl $0,%eax
	jmp L91
L98:
	movl 24(%rax),%esi
	andl $2147483648,%esi
	cmpl $0,%esi
	jz L111
L104:
	movq %rbx,%rdi
	movq %r12,%rsi
	call _parentheses
	movl %eax,%r13d
	cmpl $0,%r13d
	jg L111
L107:
	movl %r13d,%eax
	jmp L91
L111:
	movq %rbx,%rsi
	movq (%rsi),%rsi
	cmpq $0,%rsi
	jz L112
L114:
	movq %rbx,%rsi
	movq (%rsi),%rsi
	movq -8(%rbp),%rdi
	movq %rsi,(%rdi)
	movq -8(%rbp),%rsi
	movq %rbx,%rdi
	movq (%rdi),%rdi
	movq %rsi,40(%rdi)
	movq 8(%rbx),%rsi
	movq %rsi,-8(%rbp)
	movq %rbx,%rsi
	movq $0,(%rsi)
	movq %rbx,%rsi
	movq %rsi,8(%rbx)
L112:
	leal 1(%r13),%edx
	leaq -16(%rbp),%rsi
	movq %rbx,%rdi
	call _list_move
	movq %rbx,%rdi
	call _macro_replace
	leaq -16(%rbp),%rsi
	movq (%rsi),%rsi
	cmpq $0,%rsi
	jz L121
L123:
	leaq -16(%rbp),%rsi
	movq (%rsi),%rsi
	movq 8(%rbx),%rdi
	movq %rsi,(%rdi)
	movq 8(%rbx),%rsi
	leaq -16(%rbp),%rdi
	movq (%rdi),%rdi
	movq %rsi,40(%rdi)
	movq -8(%rbp),%rsi
	movq %rsi,8(%rbx)
	leaq -16(%rbp),%rsi
	movq $0,(%rsi)
	leaq -16(%rbp),%rsi
	movq %rsi,-8(%rbp)
L121:
	movl $1,%eax
L91:
	popq %r13
	popq %r12
	popq %rbx
	movq %rbp,%rsp
	popq %rbp
	ret
L133:
_output:
L135:
	pushq %rbp
	movq %rsp,%rbp
	pushq %rbx
L136:
	movq %rdi,%rsi
	movq (%rsi),%rbx
	leaq 32(%rbx),%rsi
	movq (%rsi),%rsi
	cmpq $0,%rsi
	jz L142
L141:
	movq 40(%rbx),%rsi
	leaq 32(%rbx),%rdi
	movq (%rdi),%rdi
	movq %rsi,40(%rdi)
	jmp L143
L142:
	movq 40(%rbx),%rsi
	movq %rsi,8(%rdi)
L143:
	leaq 32(%rbx),%rsi
	movq (%rsi),%rsi
	movq 40(%rbx),%rdi
	movq %rsi,(%rdi)
	movq %rbx,%rsi
	movl (%rsi),%esi
	andl $2147483648,%esi
	cmpl $0,%esi
	jz L146
L144:
	movq %rbx,%rsi
	movl (%rsi),%esi
	pushq %rsi
	pushq $L147
	call _error
	addq $16,%rsp
L146:
	movl _last_class(%rip),%esi
	cmpl $0,%esi
	jz L150
L151:
	movq %rbx,%rsi
	movl (%rsi),%esi
	movl _last_class(%rip),%edi
	call _token_separate
	cmpl $0,%eax
	jz L150
L148:
	movq _out_fp(%rip),%rsi
	movl $32,%edi
	call _fputc
L150:
	leaq 8(%rbx),%rsi
	movl (%rsi),%esi
	shll $31,%esi
	sarl $31,%esi
	cmpl $0,%esi
	jz L159
L158:
	leaq 8(%rbx),%rsi
	movl (%rsi),%esi
	shll $24,%esi
	sarl $25,%esi
	movslq %esi,%rsi
	jmp L160
L159:
	leaq 8(%rbx),%rsi
	movq 8(%rsi),%rsi
L160:
	cmpq $0,%rsi
	jz L157
L155:
	leaq 8(%rbx),%rsi
	movl (%rsi),%esi
	shll $31,%esi
	sarl $31,%esi
	cmpl $0,%esi
	jz L162
L161:
	leaq 8(%rbx),%rsi
	leaq 1(%rsi),%rdi
	jmp L163
L162:
	leaq 8(%rbx),%rsi
	movq 16(%rsi),%rdi
L163:
	movq _out_fp(%rip),%rsi
	call _fputs
	movq %rbx,%rsi
	movl (%rsi),%esi
	movl %esi,_last_class(%rip)
L157:
	movq %rbx,%rdi
	call _token_free
L137:
	popq %rbx
	popq %rbp
	ret
L167:
.data
.align 4
L172:
	.int 1
.text
_sync:
L169:
	pushq %rbp
	movq %rsp,%rbp
L170:
	movzbl _need_sync(%rip),%esi
	movzbl %sil,%esi
	cmpl $0,%esi
	jnz L173
L180:
	movq _input_stack(%rip),%rsi
	movl 32(%rsi),%esi
	movl L172(%rip),%edi
	cmpl %esi,%edi
	jg L173
L176:
	movq _input_stack(%rip),%rsi
	movl 32(%rsi),%esi
	subl $20,%esi
	movl L172(%rip),%edi
	cmpl %esi,%edi
	jge L188
L173:
	movq _input_stack(%rip),%rsi
	movl 32(%rsi),%esi
	movl %esi,L172(%rip)
	movq _input_stack(%rip),%rsi
	leaq 8(%rsi),%rsi
	movl (%rsi),%esi
	shll $31,%esi
	sarl $31,%esi
	cmpl $0,%esi
	jz L186
L185:
	movq _input_stack(%rip),%rsi
	leaq 8(%rsi),%rsi
	leaq 1(%rsi),%rsi
	jmp L187
L186:
	movq _input_stack(%rip),%rsi
	leaq 8(%rsi),%rsi
	movq 16(%rsi),%rsi
L187:
	movq _out_fp(%rip),%rdi
	movl L172(%rip),%eax
	pushq %rsi
	pushq %rax
	pushq $L184
	pushq %rdi
	call _fprintf
	addq $32,%rsp
	movb $0,_need_sync(%rip)
	movl $0,_last_class(%rip)
L188:
	movq _input_stack(%rip),%rsi
	movl 32(%rsi),%esi
	movl L172(%rip),%edi
	cmpl %esi,%edi
	jge L171
L189:
	movq _out_fp(%rip),%rsi
	movl $10,%edi
	call _fputc
	movl L172(%rip),%esi
	addl $1,%esi
	movl %esi,L172(%rip)
	movl $0,_last_class(%rip)
	jmp L188
L171:
	popq %rbp
	ret
L194:
_loop:
L196:
	pushq %rbp
	movq %rsp,%rbp
	subq $16,%rsp
	pushq %rbx
L197:
	leaq -16(%rbp),%rdi
	movl $16,%ecx
	xorl %eax,%eax
	rep
	stosb
	leaq -16(%rbp),%rsi
	movq %rsi,-8(%rbp)
	movq _input_stack(%rip),%rsi
	leaq 8(%rsi),%rsi
	movl (%rsi),%esi
	shll $31,%esi
	sarl $31,%esi
	cmpl $0,%esi
	jz L201
L200:
	movq _input_stack(%rip),%rsi
	leaq 8(%rsi),%rsi
	leaq 1(%rsi),%rsi
	jmp L202
L201:
	movq _input_stack(%rip),%rsi
	leaq 8(%rsi),%rsi
	movq 16(%rsi),%rsi
L202:
	movq _out_fp(%rip),%rdi
	pushq %rsi
	pushq $L199
	pushq %rdi
	call _fprintf
	addq $24,%rsp
	movb $0,_need_sync(%rip)
L204:
	leaq -16(%rbp),%rsi
	movq (%rsi),%rsi
	cmpq $0,%rsi
	jnz L215
L210:
	leaq -16(%rbp),%rsi
	movl $1,%edi
	call _input_tokens
	cmpl $-1,%eax
	jnz L215
L207:
	movq _out_fp(%rip),%rsi
	movl $10,%edi
	call _fputc
L198:
	popq %rbx
	movq %rbp,%rsp
	popq %rbp
	ret
L215:
	leaq -16(%rbp),%rsi
	movq (%rsi),%rsi
	cmpq $0,%rsi
	jz L204
L216:
	leaq -16(%rbp),%rdi
	call _directive
L218:
	leaq -16(%rbp),%rsi
	movq (%rsi),%rsi
	cmpq $0,%rsi
	jz L215
L219:
	call _sync
	leaq -16(%rbp),%rdi
	call _replace
	movl %eax,%ebx
	cmpl $1,%ebx
	jz L218
L223:
	leaq -16(%rbp),%rdi
	call _output
	cmpl $-1,%ebx
	jnz L218
	jz L215
L232:
_main:
L233:
	pushq %rbp
	movq %rsp,%rbp
	pushq %rbx
	pushq %r12
L276:
	movq %rsi,%r12
	movl %edi,%ebx
L234:
	call _macro_predef
	addl $-1,%ebx
	addq $8,%r12
L236:
	movq (%r12),%rsi
	cmpq $0,%rsi
	jz L238
L239:
	movq (%r12),%rsi
	movzbl (%rsi),%esi
	movzbl %sil,%esi
	cmpl $45,%esi
	jnz L238
L237:
	movq (%r12),%rsi
	movzbl 1(%rsi),%esi
	movzbl %sil,%esi
L273:
	cmpl $68,%esi
	jz L254
L274:
	cmpl $73,%esi
	jnz L251
L247:
	movq (%r12),%rsi
	addq $2,%rsi
	movq %rsi,(%r12)
	movq (%r12),%rsi
	movzbl (%rsi),%esi
	movzbl %sil,%esi
	cmpl $0,%esi
	jz L251
L250:
	movq (%r12),%rdi
	call _input_dir
	jmp L245
L254:
	movq (%r12),%rsi
	addq $2,%rsi
	movq %rsi,(%r12)
	movq (%r12),%rdi
	call _macro_cmdline
	cmpl $0,%eax
	jz L251
L245:
	addq $8,%r12
	addl $-1,%ebx
	jmp L236
L238:
	cmpl $2,%ebx
	jz L263
L251:
	pushq $L271
	pushq $___stderr
	call _fprintf
	addq $16,%rsp
	movl $1,%edi
	call _exit
	jmp L235
L263:
	movq 8(%r12),%rsi
	movq %rsi,_out_path(%rip)
	movq _out_path(%rip),%rdi
	movq $L265,%rsi
	call _fopen
	movq %rax,_out_fp(%rip)
	movq _out_fp(%rip),%rsi
	cmpq $0,%rsi
	jnz L268
L266:
	movq _out_path(%rip),%rsi
	pushq %rsi
	pushq $L269
	call _error
	addq $16,%rsp
L268:
	movq (%r12),%rdi
	movl $0,%esi
	call _input_open
	call _loop
	movq _out_fp(%rip),%rdi
	call _fclose
	movl $0,%eax
L235:
	popq %r12
	popq %rbx
	popq %rbp
	ret
L278:
L18:
	.byte 32,69,82,82,79,82,58,32
	.byte 0
L75:
	.byte 117,110,116,101,114,109,105,110
	.byte 97,116,101,100,32,109,97,99
	.byte 114,111,32,97,114,103,117,109
	.byte 101,110,116,32,108,105,115,116
	.byte 0
L147:
	.byte 67,80,80,32,73,78,84,69
	.byte 82,78,65,76,58,32,97,116
	.byte 116,101,109,112,116,32,116,111
	.byte 32,111,117,116,112,117,116,32
	.byte 110,111,110,45,116,101,120,116
	.byte 32,116,111,107,101,110,32,37
	.byte 120,0
L16:
	.byte 32,40,37,100,41,0
L199:
	.byte 35,32,49,32,34,37,115,34
	.byte 10,0
L184:
	.byte 10,35,32,37,100,32,34,37
	.byte 115,34,10,0
L17:
	.byte 99,112,112,0
L269:
	.byte 99,97,110,39,116,32,111,112
	.byte 101,110,32,111,117,116,112,117
	.byte 116,32,39,37,115,39,0
L265:
	.byte 119,0
L9:
	.byte 39,37,115,39,0
L32:
	.byte 111,117,116,32,111,102,32,109
	.byte 101,109,111,114,121,0
L271:
	.byte 99,112,112,58,32,105,110,118
	.byte 97,108,105,100,32,99,111,109
	.byte 109,97,110,100,45,108,105,110
	.byte 101,32,115,121,110,116,97,120
	.byte 10,10,117,115,97,103,101,58
	.byte 32,99,112,112,32,123,60,111
	.byte 112,116,105,111,110,62,125,32
	.byte 60,105,110,112,117,116,62,32
	.byte 60,111,117,116,112,117,116,62
	.byte 10,10,111,112,116,105,111,110
	.byte 115,58,10,45,73,60,100,105
	.byte 114,62,32,32,32,32,32,32
	.byte 32,32,32,32,32,32,32,32
	.byte 32,32,32,97,100,100,32,60
	.byte 100,105,114,62,32,116,111,32
	.byte 115,121,115,116,101,109,32,105
	.byte 110,99,108,117,100,101,32,112
	.byte 97,116,104,115,10,45,68,60
	.byte 110,97,109,101,62,91,61,60
	.byte 118,97,108,117,101,62,93,32
	.byte 32,32,32,32,32,100,101,102
	.byte 105,110,101,32,109,97,99,114
	.byte 111,32,40,100,101,102,97,117
	.byte 108,116,32,118,97,108,117,101
	.byte 32,105,115,32,49,41,10,0
.globl _macro_lookup
.globl _input_dir
.globl _error
.comm _last_class, 4, 4
.globl _last_class
.comm _need_sync, 1, 1
.globl _need_sync
.globl _fputc
.globl _exit
.globl _macro_cmdline
.globl _directive
.globl _list_move
.globl _token_separate
.globl _remove
.globl _vfprintf
.globl _fprintf
.local _out_path
.comm _out_path, 8, 8
.local _out_fp
.comm _out_fp, 8, 8
.globl ___stderr
.globl _input_tokens
.globl _safe_malloc
.globl _malloc
.globl _fputs
.globl _macro_replace
.globl _token_free
.globl _fclose
.globl _macro_predef
.globl _input_stack
.globl _main
.globl _input_open
.globl _fopen