	.file	"rm.c"
	.text
	.section	.rodata
.LC0:
	.string	" "
.LC1:
	.string	"-i"
.LC2:
	.string	"rm: remove regular file '%s'?"
.LC3:
	.string	"%c"
.LC4:
	.string	"rm: cannot remove '%s'\n"
.LC5:
	.string	"-d"
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
	subq	$72, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -72(%rbp)
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
	movq	%rax, -64(%rbp)
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-64(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -80(%rbp)
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L5
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -80(%rbp)
	jmp	.L6
.L11:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	chdir@PLT
	testl	%eax, %eax
	je	.L7
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-81(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-81(%rbp), %eax
	cmpb	$121, %al
	je	.L8
	movzbl	-81(%rbp), %eax
	cmpb	$89, %al
	jne	.L10
.L8:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	remove@PLT
	testl	%eax, %eax
	je	.L10
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L10
.L7:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L10:
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -80(%rbp)
.L6:
	cmpq	$0, -80(%rbp)
	jne	.L11
	jmp	.L12
.L5:
	movq	-80(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L13
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -80(%rbp)
	jmp	.L14
.L16:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	remove@PLT
	testl	%eax, %eax
	je	.L15
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L15:
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -80(%rbp)
.L14:
	cmpq	$0, -80(%rbp)
	jne	.L16
	jmp	.L12
.L13:
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	chdir@PLT
	testl	%eax, %eax
	je	.L17
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	remove@PLT
	testl	%eax, %eax
	je	.L12
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L12
.L17:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L12:
	movq	%rbx, %rsp
	movl	$0, %eax
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L19
	call	__stack_chk_fail@PLT
.L19:
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
