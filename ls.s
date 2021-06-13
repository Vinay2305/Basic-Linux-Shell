	.file	"ls.c"
	.text
	.section	.rodata
.LC0:
	.string	"ls -1"
.LC1:
	.string	"\033[0;33m"
.LC2:
	.string	"."
.LC3:
	.string	".."
.LC4:
	.string	"\033[0m"
.LC5:
	.string	"ls -a"
.LC6:
	.string	"%s "
.LC7:
	.string	"ls"
.LC8:
	.string	"\033[1;31m"
.LC9:
	.string	"Wrong Input"
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
	subq	$296, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -324(%rbp)
	movq	%rsi, -336(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-336(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -288(%rbp)
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
	movq	%rax, -280(%rbp)
	movq	-336(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	-280(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-280(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L5
	leaq	-272(%rbp), %rax
	movl	$100, %esi
	movq	%rax, %rdi
	call	getcwd@PLT
	leaq	-296(%rbp), %rsi
	leaq	-272(%rbp), %rax
	movq	alphasort@GOTPCREL(%rip), %rdx
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	scandir@PLT
	movl	%eax, -300(%rbp)
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -312(%rbp)
	jmp	.L6
.L8:
	movq	-296(%rbp), %rax
	movl	-312(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	19(%rax), %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-160(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L7
	leaq	-160(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L7
	movq	-296(%rbp), %rax
	movl	-312(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movzbl	19(%rax), %eax
	cmpb	$46, %al
	je	.L7
	movq	-296(%rbp), %rax
	movl	-312(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	$19, %rax
	movq	%rax, %rdi
	call	puts@PLT
.L7:
	addl	$1, -312(%rbp)
.L6:
	movl	-312(%rbp), %eax
	cmpl	-300(%rbp), %eax
	jl	.L8
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L9
.L5:
	movq	-280(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L10
	leaq	-272(%rbp), %rax
	movl	$100, %esi
	movq	%rax, %rdi
	call	getcwd@PLT
	leaq	-296(%rbp), %rsi
	leaq	-272(%rbp), %rax
	movq	alphasort@GOTPCREL(%rip), %rdx
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	scandir@PLT
	movl	%eax, -304(%rbp)
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -316(%rbp)
	jmp	.L11
.L13:
	movq	-296(%rbp), %rax
	movl	-316(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	19(%rax), %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-160(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L12
	leaq	-160(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L12
	movq	-296(%rbp), %rax
	movl	-316(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	$19, %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L12:
	addl	$1, -316(%rbp)
.L11:
	movl	-316(%rbp), %eax
	cmpl	-304(%rbp), %eax
	jl	.L13
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L9
.L10:
	movq	-280(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L14
	leaq	-272(%rbp), %rax
	movl	$100, %esi
	movq	%rax, %rdi
	call	getcwd@PLT
	leaq	-296(%rbp), %rsi
	leaq	-272(%rbp), %rax
	movq	alphasort@GOTPCREL(%rip), %rdx
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	scandir@PLT
	movl	%eax, -308(%rbp)
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -320(%rbp)
	jmp	.L15
.L17:
	movq	-296(%rbp), %rax
	movl	-320(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	leaq	19(%rax), %rdx
	leaq	-160(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-160(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L16
	leaq	-160(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L16
	movq	-296(%rbp), %rax
	movl	-320(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	movzbl	19(%rax), %eax
	cmpb	$46, %al
	je	.L16
	movq	-296(%rbp), %rax
	movl	-320(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	addq	$19, %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L16:
	addl	$1, -320(%rbp)
.L15:
	movl	-320(%rbp), %eax
	cmpl	-308(%rbp), %eax
	jl	.L17
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L9
.L14:
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L9:
	movl	$0, %eax
	movq	%rbx, %rsp
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
