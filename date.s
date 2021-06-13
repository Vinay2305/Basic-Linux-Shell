	.file	"date.c"
	.text
	.section	.rodata
.LC0:
	.string	"date"
.LC1:
	.string	"%s"
.LC2:
	.string	" "
.LC3:
	.string	"\033[1;31m"
.LC4:
	.string	"Wrong Input"
.LC5:
	.string	"\033[0m"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -148(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movabsq	$7216221396072161636, %rax
	movq	%rax, -74(%rbp)
	movb	$0, -66(%rbp)
	movabsq	$6423587861654954340, %rax
	movq	%rax, -65(%rbp)
	movb	$0, -57(%rbp)
	movq	-160(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L2
	leaq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	leaq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L3
.L2:
	movq	-160(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-74(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L4
	movq	%rsp, %rax
	movq	%rax, %rbx
	leaq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	leaq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -104(%rbp)
	movq	%rax, -176(%rbp)
	movq	$0, -168(%rbp)
	movq	%rax, -192(%rbp)
	movq	$0, -184(%rbp)
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
.L5:
	cmpq	%rdx, %rsp
	je	.L6
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L5
.L6:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L7
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L7:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -96(%rbp)
	leaq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-96(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -88(%rbp)
	leaq	.LC2(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -88(%rbp)
	leaq	.LC2(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -88(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movq	%rbx, %rsp
	jmp	.L3
.L4:
	movq	-160(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-65(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L8
	movq	%rsp, %rax
	movq	%rax, %rbx
	leaq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	time@PLT
	leaq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -128(%rbp)
	movq	%rax, %r14
	movl	$0, %r15d
	movq	%rax, %r12
	movl	$0, %r13d
	movl	$16, %edx
	subq	$1, %rdx
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
.L9:
	cmpq	%rdx, %rsp
	je	.L10
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L9
.L10:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L11
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L11:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -120(%rbp)
	leaq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	ctime@PLT
	movq	%rax, %rdx
	movq	-120(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-120(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -112(%rbp)
	leaq	.LC2(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -112(%rbp)
	leaq	.LC2(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -112(%rbp)
	leaq	.LC2(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -112(%rbp)
	leaq	.LC2(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	%rbx, %rsp
	jmp	.L3
.L8:
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:
	movl	$0, %eax
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
