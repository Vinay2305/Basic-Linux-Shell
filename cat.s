	.file	"cat.c"
	.text
	.section	.rodata
.LC0:
	.string	" "
.LC1:
	.string	"%[^\n]%*c"
.LC2:
	.string	"-n"
.LC3:
	.string	"-E"
.LC4:
	.string	"r"
.LC5:
	.string	"Unable to open the file"
.LC6:
	.string	"cat: %s: Is a directory\n"
.LC7:
	.string	"\n"
.LC8:
	.string	"%d\t"
.LC9:
	.string	"\033[1;31m"
.LC10:
	.string	"Wrong Input"
.LC11:
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
	subq	$1096, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -1124(%rbp)
	movq	%rsi, -1136(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-1136(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -1104(%rbp)
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
	movq	%rax, -1096(%rbp)
	movq	-1136(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	-1096(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-1096(%rbp), %rax
	leaq	.LC0(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1088(%rbp)
	leaq	.LC0(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1088(%rbp)
	cmpq	$0, -1088(%rbp)
	jne	.L5
.L6:
	leaq	-1056(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L6
.L5:
	movq	-1088(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L7
	movq	-1088(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L7
	movq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	chdir@PLT
	testl	%eax, %eax
	je	.L8
	movq	-1088(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1080(%rbp)
	cmpq	$0, -1080(%rbp)
	jne	.L9
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L13
.L9:
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -1114(%rbp)
	jmp	.L11
.L12:
	movsbl	-1114(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -1114(%rbp)
.L11:
	cmpb	$-1, -1114(%rbp)
	jne	.L12
	movl	$10, %edi
	call	putchar@PLT
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L13
.L8:
	movq	-1088(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L13
.L7:
	movq	-1088(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L14
	leaq	.LC7(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1088(%rbp)
	movq	-1088(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1064(%rbp)
	cmpq	$0, -1064(%rbp)
	jne	.L15
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L13
.L15:
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -1115(%rbp)
	movl	$1, -1112(%rbp)
	movl	-1112(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, -1108(%rbp)
	jmp	.L16
.L18:
	movsbl	-1115(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	cmpb	$10, -1115(%rbp)
	jne	.L17
	addl	$1, -1112(%rbp)
	movl	$0, -1108(%rbp)
.L17:
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -1115(%rbp)
	cmpb	$-1, -1115(%rbp)
	je	.L16
	cmpl	$0, -1108(%rbp)
	jne	.L16
	movl	$-1, -1108(%rbp)
	movl	-1112(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L16:
	cmpb	$-1, -1115(%rbp)
	jne	.L18
	movl	$10, %edi
	call	putchar@PLT
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L13
.L14:
	movq	-1088(%rbp), %rax
	leaq	.LC3(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L19
	leaq	.LC7(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1088(%rbp)
	movq	-1088(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -1072(%rbp)
	cmpq	$0, -1072(%rbp)
	jne	.L20
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L13
.L20:
	movq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -1113(%rbp)
	jmp	.L21
.L22:
	movsbl	-1113(%rbp), %eax
	movl	%eax, %edi
	call	putchar@PLT
	movq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc@PLT
	movb	%al, -1113(%rbp)
	cmpb	$-1, -1113(%rbp)
	je	.L21
	cmpb	$10, -1113(%rbp)
	jne	.L21
	movl	$36, %edi
	call	putchar@PLT
.L21:
	cmpb	$-1, -1113(%rbp)
	jne	.L22
	movl	$10, %edi
	call	putchar@PLT
	movq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	jmp	.L13
.L19:
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L13:
	movl	$0, %eax
	movq	%rbx, %rsp
	movq	-56(%rbp), %rbx
	xorq	%fs:40, %rbx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
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
