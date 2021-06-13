	.file	"mkdir.c"
	.text
	.section	.rodata
.LC0:
	.string	" "
.LC1:
	.string	"-v"
.LC2:
	.string	"-p"
	.align 8
.LC3:
	.string	"mkdir: cannot create directory '%s'\n"
	.align 8
.LC4:
	.string	"mkdir: created directory '%s'\n"
.LC5:
	.string	"/"
.LC6:
	.string	".."
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
	subq	$120, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -88(%rbp)
	movq	%rax, -144(%rbp)
	movq	$0, -136(%rbp)
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
.L2:
	cmpq	%rdx, %rsp
	je	.L3
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L2
.L3:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L4
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L4:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -80(%rbp)
	movq	-128(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-80(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -96(%rbp)
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L5
	movq	-96(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L5
	jmp	.L6
.L8:
	movq	-96(%rbp), %rax
	movl	$511, %esi
	movq	%rax, %rdi
	call	mkdir@PLT
	testl	%eax, %eax
	je	.L7
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L7:
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -96(%rbp)
.L6:
	cmpq	$0, -96(%rbp)
	jne	.L8
	jmp	.L9
.L5:
	movq	-96(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L10
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -96(%rbp)
	jmp	.L11
.L14:
	movq	-96(%rbp), %rax
	movl	$511, %esi
	movq	%rax, %rdi
	call	mkdir@PLT
	testl	%eax, %eax
	jne	.L12
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L13
.L12:
	movq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L13:
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -96(%rbp)
.L11:
	cmpq	$0, -96(%rbp)
	jne	.L14
	jmp	.L9
.L10:
	movq	-96(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L9
	movq	%rsp, %rax
	movq	%rax, %r12
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -72(%rbp)
	movq	%rax, -160(%rbp)
	movq	$0, -152(%rbp)
	movq	%rax, %r14
	movl	$0, %r15d
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
.L15:
	cmpq	%rdx, %rsp
	je	.L16
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L15
.L16:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L17
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L17:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	-96(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-64(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -104(%rbp)
	movq	-96(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L18
	movl	$0, -108(%rbp)
	jmp	.L19
.L22:
	movq	-104(%rbp), %rax
	movl	$511, %esi
	movq	%rax, %rdi
	call	mkdir@PLT
	testl	%eax, %eax
	jne	.L20
	movq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L21
.L20:
	movq	-104(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L21:
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	chdir@PLT
	addl	$1, -108(%rbp)
	leaq	.LC5(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -104(%rbp)
.L19:
	cmpq	$0, -104(%rbp)
	jne	.L22
	jmp	.L23
.L24:
	leaq	.LC6(%rip), %rdi
	call	chdir@PLT
	subl	$1, -108(%rbp)
.L23:
	cmpl	$0, -108(%rbp)
	jg	.L24
.L18:
	movq	%r12, %rsp
.L9:
	movl	$0, %eax
	movq	%rbx, %rsp
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L26
	call	__stack_chk_fail@PLT
.L26:
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
