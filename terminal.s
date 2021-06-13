	.file	"terminal.c"
	.text
	.section	.rodata
.LC0:
	.string	"\033[H\033[J"
.LC1:
	.string	"Welcome to my own shell"
.LC2:
	.string	"\n\n"
	.align 8
.LC3:
	.string	"You can use any of the following commands :"
	.align 8
.LC4:
	.string	"\nInternal Commands: cd , echo , history , pwd , exit"
	.align 8
.LC5:
	.string	"\n \nExternal Commands: ls , cat , date , rm , mkdir"
.LC6:
	.string	"\n "
	.text
	.globl	displayMenu
	.type	displayMenu, @function
displayMenu:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	leaq	.LC3(%rip), %rdi
	call	puts@PLT
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	sleep@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	displayMenu, .-displayMenu
	.section	.rodata
.LC7:
	.string	" "
.LC8:
	.string	"\n"
.LC9:
	.string	"-L"
.LC10:
	.string	"%s"
.LC11:
	.string	"-P"
.LC12:
	.string	"PWD"
.LC13:
	.string	"\033[1;31m"
.LC14:
	.string	"Wrong Input"
.LC15:
	.string	"\033[0m"
	.text
	.globl	printCurrentDirectory
	.type	printCurrentDirectory, @function
printCurrentDirectory:
.LFB7:
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
	subq	$2120, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -2152(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-2152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -2144(%rbp)
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
.L3:
	cmpq	%rdx, %rsp
	je	.L4
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L3
.L4:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L5
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L5:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -2136(%rbp)
	movq	-2136(%rbp), %rax
	movq	-2152(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-2136(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -2128(%rbp)
	leaq	.LC8(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -2128(%rbp)
	cmpq	$0, -2128(%rbp)
	je	.L6
	movq	-2128(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L7
.L6:
	leaq	-2112(%rbp), %rax
	movl	$2048, %esi
	movq	%rax, %rdi
	call	getcwd@PLT
	leaq	-2112(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L8
.L7:
	movq	-2128(%rbp), %rax
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L9
	leaq	.LC12(%rip), %rdi
	call	getenv@PLT
	movq	%rax, -2120(%rbp)
	movq	-2120(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L8
.L9:
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L8:
	movq	%rbx, %rsp
	nop
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
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
.LFE7:
	.size	printCurrentDirectory, .-printCurrentDirectory
	.section	.rodata
.LC16:
	.string	"cd .."
.LC17:
	.string	".."
.LC18:
	.string	"cd"
.LC19:
	.string	"/home/vinay9821"
	.align 8
.LC20:
	.string	"bash: cd: %s: No such file or directory\n"
	.text
	.globl	moveToParent
	.type	moveToParent, @function
moveToParent:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$2096, %rsp
	movq	%rdi, -2088(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-2088(%rbp), %rax
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L12
	leaq	.LC17(%rip), %rdi
	call	chdir@PLT
	jmp	.L18
.L12:
	movq	-2088(%rbp), %rax
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L14
	leaq	-2064(%rbp), %rax
	movl	$2048, %esi
	movq	%rax, %rdi
	call	getcwd@PLT
	jmp	.L15
.L16:
	leaq	.LC17(%rip), %rdi
	call	chdir@PLT
	leaq	-2064(%rbp), %rax
	movl	$2048, %esi
	movq	%rax, %rdi
	call	getcwd@PLT
.L15:
	leaq	-2064(%rbp), %rax
	leaq	.LC19(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L16
	jmp	.L18
.L14:
	movq	-2088(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -2072(%rbp)
	leaq	.LC7(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -2072(%rbp)
	movq	-2072(%rbp), %rax
	movq	%rax, %rdi
	call	chdir@PLT
	testl	%eax, %eax
	je	.L18
	movq	-2072(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L18:
	nop
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	moveToParent, .-moveToParent
	.section	.rodata
.LC21:
	.string	"-n"
.LC22:
	.string	"-e"
.LC23:
	.string	"%c "
.LC24:
	.string	"%s "
	.text
	.globl	ef
	.type	ef, @function
ef:
.LFB9:
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
	movq	%rdi, -152(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -120(%rbp)
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
.L20:
	cmpq	%rdx, %rsp
	je	.L21
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L20
.L21:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L22
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L22:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	movq	-152(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-112(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -128(%rbp)
	leaq	.LC7(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -128(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L23
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L24
.L23:
	movq	-128(%rbp), %rax
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L25
	movq	-128(%rbp), %rax
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L25
	jmp	.L26
.L27:
	movq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC7(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -128(%rbp)
	movl	$32, %edi
	call	putchar@PLT
.L26:
	cmpq	$0, -128(%rbp)
	jne	.L27
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L24
.L25:
	movq	-128(%rbp), %rax
	leaq	.LC21(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L28
	leaq	.LC8(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -128(%rbp)
	cmpq	$0, -128(%rbp)
	jne	.L29
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L24
.L29:
	movq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L24
.L28:
	movq	-128(%rbp), %rax
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L30
	leaq	.LC7(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -128(%rbp)
	jmp	.L31
.L43:
	movl	$660364327, -101(%rbp)
	movb	$0, -97(%rbp)
	movl	$660692007, -96(%rbp)
	movb	$0, -92(%rbp)
	movl	$660757543, -91(%rbp)
	movb	$0, -87(%rbp)
	movl	$660954151, -86(%rbp)
	movb	$0, -82(%rbp)
	movl	$661019687, -81(%rbp)
	movb	$0, -77(%rbp)
	movl	$661543975, -76(%rbp)
	movb	$0, -72(%rbp)
	movl	$661806119, -71(%rbp)
	movb	$0, -67(%rbp)
	movl	$661937191, -66(%rbp)
	movb	$0, -62(%rbp)
	movl	$662068263, -61(%rbp)
	movb	$0, -57(%rbp)
	leaq	-101(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L32
	movb	$92, -129(%rbp)
	movsbl	-129(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L32:
	leaq	-96(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L34
	movb	$7, -130(%rbp)
	movsbl	-130(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L34:
	leaq	-91(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L35
	movb	$8, -131(%rbp)
	movsbl	-131(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L35:
	leaq	-86(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L36
	movb	$27, -132(%rbp)
	movsbl	-132(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L36:
	leaq	-81(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L37
	movb	$12, -133(%rbp)
	movsbl	-133(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L37:
	leaq	-76(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L38
	movb	$10, -134(%rbp)
	movsbl	-134(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L38:
	leaq	-71(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L39
	movb	$13, -135(%rbp)
	movsbl	-135(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L39:
	leaq	-66(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L40
	movb	$9, -136(%rbp)
	movsbl	-136(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L40:
	leaq	-61(%rbp), %rdx
	movq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L41
	movb	$11, -137(%rbp)
	movsbl	-137(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC23(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L33
.L41:
	cmpq	$0, -128(%rbp)
	jne	.L42
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L33
.L42:
	movq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC24(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L33:
	leaq	.LC7(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -128(%rbp)
.L31:
	cmpq	$0, -128(%rbp)
	jne	.L43
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L24
.L30:
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L24:
	movq	%rbx, %rsp
	nop
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L44
	call	__stack_chk_fail@PLT
.L44:
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
.LFE9:
	.size	ef, .-ef
	.globl	i
	.bss
	.align 4
	.type	i, @object
	.size	i, 4
i:
	.zero	4
	.comm	hist_cmd,10000,32
	.section	.rodata
.LC25:
	.string	"%d  "
	.text
	.globl	showHistory
	.type	showHistory, @function
showHistory:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$1, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L46
.L47:
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC25(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	hist_cmd(%rip), %rdx
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	puts@PLT
	addl	$1, -4(%rbp)
	addl	$1, -8(%rbp)
.L46:
	movl	i(%rip), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L47
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	showHistory, .-showHistory
	.globl	storeHistory
	.type	storeHistory, @function
storeHistory:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L49
.L50:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	i(%rip), %eax
	movzbl	(%rdx), %ecx
	movl	-20(%rbp), %edx
	movslq	%edx, %rsi
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	(%rax,%rsi), %rdx
	leaq	hist_cmd(%rip), %rax
	addq	%rdx, %rax
	movb	%cl, (%rax)
	addl	$1, -20(%rbp)
.L49:
	movl	-20(%rbp), %eax
	movslq	%eax, %rbx
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	jbe	.L50
	movl	i(%rip), %eax
	addl	$1, %eax
	movl	%eax, i(%rip)
	nop
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	storeHistory, .-storeHistory
	.globl	deleteHistory
	.type	deleteHistory, @function
deleteHistory:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$0, i(%rip)
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	deleteHistory, .-deleteHistory
	.section	.rodata
.LC26:
	.string	"w"
.LC27:
	.string	"history.txt"
	.text
	.globl	storeinFile
	.type	storeinFile, @function
storeinFile:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	.LC26(%rip), %rsi
	leaq	.LC27(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L53
.L54:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	hist_cmd(%rip), %rdx
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	fputs@PLT
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc@PLT
	addl	$1, -12(%rbp)
.L53:
	movl	i(%rip), %eax
	cmpl	%eax, -12(%rbp)
	jl	.L54
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	storeinFile, .-storeinFile
	.section	.rodata
	.align 8
.LC28:
	.string	"The shell is exiting in 1 second"
.LC29:
	.string	"Thank you for using"
	.text
	.globl	exitMenu
	.type	exitMenu, @function
exitMenu:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC28(%rip), %rdi
	call	puts@PLT
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	movl	$1, %edi
	call	sleep@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	exitMenu, .-exitMenu
	.section	.rodata
.LC30:
	.string	"echo"
.LC31:
	.string	"history"
.LC32:
	.string	"-c"
.LC33:
	.string	"-r"
.LC34:
	.string	"pwd"
.LC35:
	.string	"\033[1;32m"
.LC36:
	.string	"exit"
.LC37:
	.string	"clear"
.LC38:
	.string	"ls"
.LC39:
	.string	"Error fork Failed"
	.align 8
.LC40:
	.string	"/home/vinay9821/Desktop/Assignment_1/Question_2/./ls"
.LC41:
	.string	"created successfully"
.LC42:
	.string	"cat"
	.align 8
.LC43:
	.string	"/home/vinay9821/Desktop/Assignment_1/Question_2/./cat"
.LC44:
	.string	"date"
	.align 8
.LC45:
	.string	"/home/vinay9821/Desktop/Assignment_1/Question_2/./date"
.LC46:
	.string	"rm"
	.align 8
.LC47:
	.string	"/home/vinay9821/Desktop/Assignment_1/Question_2/./rm"
.LC48:
	.string	"mkdir"
	.align 8
.LC49:
	.string	"/home/vinay9821/Desktop/Assignment_1/Question_2/./mkdir"
	.text
	.globl	inputValue
	.type	inputValue, @function
inputValue:
.LFB15:
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
	subq	$168, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rdi, -168(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -128(%rbp)
	movq	%rax, -192(%rbp)
	movq	$0, -184(%rbp)
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
.L57:
	cmpq	%rdx, %rsp
	je	.L58
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L57
.L58:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L59
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L59:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -120(%rbp)
	movq	-120(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-120(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -112(%rbp)
	movq	-112(%rbp), %rax
	leaq	.LC18(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L60
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	moveToParent
	jmp	.L61
.L60:
	movq	-112(%rbp), %rax
	leaq	.LC30(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L62
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	ef
	jmp	.L61
.L62:
	movq	-112(%rbp), %rax
	leaq	.LC31(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L63
	movq	%rsp, %rax
	movq	%rax, %r12
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	subq	$1, %rdx
	movq	%rdx, -104(%rbp)
	movq	%rax, -208(%rbp)
	movq	$0, -200(%rbp)
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
.L64:
	cmpq	%rdx, %rsp
	je	.L65
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L64
.L65:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L66
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L66:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -96(%rbp)
	movq	-96(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-96(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -88(%rbp)
	leaq	.LC7(%rip), %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -88(%rbp)
	cmpq	$0, -88(%rbp)
	jne	.L67
	movl	$0, %eax
	call	showHistory
	jmp	.L68
.L67:
	movq	-88(%rbp), %rax
	leaq	.LC32(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L69
	movl	$0, %eax
	call	deleteHistory
	jmp	.L68
.L69:
	movq	-88(%rbp), %rax
	leaq	.LC33(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L70
	movl	$0, %eax
	call	storeinFile
	jmp	.L68
.L70:
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L68:
	movq	%r12, %rsp
	jmp	.L61
.L63:
	movq	-112(%rbp), %rax
	leaq	.LC34(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L71
	leaq	.LC35(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-168(%rbp), %rax
	movq	%rax, %rdi
	call	printCurrentDirectory
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$10, %edi
	call	putchar@PLT
	jmp	.L61
.L71:
	movq	-112(%rbp), %rax
	leaq	.LC36(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L72
	movl	$0, %eax
	call	exitMenu
	movl	$0, %edi
	call	exit@PLT
.L72:
	movq	-168(%rbp), %rax
	leaq	.LC37(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L73
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L61
.L73:
	movq	-112(%rbp), %rax
	leaq	.LC38(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L74
	call	fork@PLT
	movl	%eax, -132(%rbp)
	cmpl	$-1, -132(%rbp)
	jne	.L75
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L61
.L75:
	cmpl	$0, -132(%rbp)
	jle	.L76
	movl	$0, %edi
	call	wait@PLT
	jmp	.L61
.L76:
	leaq	.LC40(%rip), %rax
	movq	%rax, -80(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	-80(%rbp), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	testl	%eax, %eax
	jne	.L77
	leaq	.LC41(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L77:
	movl	$0, %edi
	call	exit@PLT
.L74:
	movq	-112(%rbp), %rax
	leaq	.LC42(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L78
	call	fork@PLT
	movl	%eax, -136(%rbp)
	cmpl	$-1, -136(%rbp)
	jne	.L79
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L61
.L79:
	cmpl	$0, -136(%rbp)
	jle	.L80
	movl	$0, %edi
	call	wait@PLT
	jmp	.L61
.L80:
	leaq	.LC43(%rip), %rax
	movq	%rax, -80(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	-80(%rbp), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	testl	%eax, %eax
	jne	.L81
	leaq	.LC41(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L81:
	movl	$0, %edi
	call	exit@PLT
.L78:
	movq	-112(%rbp), %rax
	leaq	.LC44(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L82
	call	fork@PLT
	movl	%eax, -140(%rbp)
	cmpl	$-1, -140(%rbp)
	jne	.L83
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L61
.L83:
	cmpl	$0, -140(%rbp)
	jle	.L84
	movl	$0, %edi
	call	wait@PLT
	jmp	.L61
.L84:
	leaq	.LC45(%rip), %rax
	movq	%rax, -80(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	-80(%rbp), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	testl	%eax, %eax
	jne	.L85
	leaq	.LC41(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L85:
	movl	$0, %edi
	call	exit@PLT
.L82:
	movq	-112(%rbp), %rax
	leaq	.LC46(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L86
	call	fork@PLT
	movl	%eax, -144(%rbp)
	cmpl	$-1, -144(%rbp)
	jne	.L87
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L61
.L87:
	cmpl	$0, -144(%rbp)
	jle	.L88
	movl	$0, %edi
	call	wait@PLT
	jmp	.L61
.L88:
	leaq	.LC47(%rip), %rax
	movq	%rax, -80(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	-80(%rbp), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	testl	%eax, %eax
	jne	.L89
	leaq	.LC41(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L89:
	movl	$0, %edi
	call	exit@PLT
.L86:
	movq	-112(%rbp), %rax
	leaq	.LC48(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L90
	call	fork@PLT
	movl	%eax, -148(%rbp)
	cmpl	$-1, -148(%rbp)
	jne	.L91
	leaq	.LC39(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L61
.L91:
	cmpl	$0, -148(%rbp)
	jle	.L92
	movl	$0, %edi
	call	wait@PLT
	jmp	.L61
.L92:
	leaq	.LC49(%rip), %rax
	movq	%rax, -80(%rbp)
	movq	-168(%rbp), %rax
	movq	%rax, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	-80(%rbp), %rax
	leaq	-80(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	execvp@PLT
	testl	%eax, %eax
	jne	.L93
	leaq	.LC41(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L93:
	movl	$0, %edi
	call	exit@PLT
.L90:
	leaq	.LC13(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC14(%rip), %rdi
	call	puts@PLT
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L61:
	movq	%rbx, %rsp
	nop
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L94
	call	__stack_chk_fail@PLT
.L94:
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
.LFE15:
	.size	inputValue, .-inputValue
	.section	.rodata
.LC50:
	.string	"\033[1;34m"
.LC51:
	.string	">>> "
.LC52:
	.string	"%[^\n]%*c"
	.text
	.globl	main
	.type	main, @function
main:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$1824, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %eax
	call	displayMenu
	jmp	.L96
.L97:
	leaq	.LC50(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC34(%rip), %rdi
	call	printCurrentDirectory
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC51(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-10016(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC52(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	-10016(%rbp), %rax
	movq	%rax, %rdi
	call	storeHistory
	leaq	-10016(%rbp), %rax
	movq	%rax, %rdi
	call	inputValue
.L96:
	leaq	-10016(%rbp), %rax
	leaq	.LC36(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L97
	movl	$0, %eax
	call	exitMenu
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L99
	call	__stack_chk_fail@PLT
.L99:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
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
