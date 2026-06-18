	.file	"pem_lib.c"
	.text
.Ltext0:
	.file 0 "/mnt/HARDONE/NSI_Repos/tacvoice/service/target/debug/build/aws-lc-fips-sys-d437d42e962aa361/out/build/aws-lc/crypto" "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pem/pem_lib.c"
	.section	.text.ERR_GET_LIB,"ax",@progbits
	.type	ERR_GET_LIB, @function
ERR_GET_LIB:
.LFB0:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/err.h"
	.loc 1 170 55
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	.loc 1 171 30
	movl	-4(%rbp), %eax
	shrl	$24, %eax
	.loc 1 172 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	ERR_GET_LIB, .-ERR_GET_LIB
	.section	.text.ERR_GET_REASON,"ax",@progbits
	.type	ERR_GET_REASON, @function
ERR_GET_REASON:
.LFB1:
	.loc 1 177 58
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	.loc 1 178 29
	movl	-4(%rbp), %eax
	.loc 1 178 10
	andl	$4095, %eax
	.loc 1 179 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	ERR_GET_REASON, .-ERR_GET_REASON
	.section	.text.OPENSSL_memcpy,"ax",@progbits
	.type	OPENSSL_memcpy, @function
OPENSSL_memcpy:
.LFB850:
	.file 2 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pem/../internal.h"
	.loc 2 934 74
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 2 935 6
	cmpq	$0, -24(%rbp)
	jne	.L6
	.loc 2 936 12
	movq	-8(%rbp), %rax
	jmp	.L7
.L6:
	.loc 2 939 10
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
.L7:
	.loc 2 940 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE850:
	.size	OPENSSL_memcpy, .-OPENSSL_memcpy
	.section	.text.OPENSSL_memset,"ax",@progbits
	.type	OPENSSL_memset, @function
OPENSSL_memset:
.LFB852:
	.loc 2 950 64
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 2 951 6
	cmpq	$0, -24(%rbp)
	jne	.L9
	.loc 2 952 12
	movq	-8(%rbp), %rax
	jmp	.L10
.L9:
	.loc 2 955 10
	movq	-24(%rbp), %rdx
	movl	-12(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L10:
	.loc 2 956 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE852:
	.size	OPENSSL_memset, .-OPENSSL_memset
	.section	.rodata
.LC0:
	.string	"ENCRYPTED"
.LC1:
	.string	"MIC-CLEAR"
.LC2:
	.string	"MIC-ONLY"
.LC3:
	.string	"BAD-TYPE"
.LC4:
	.string	"Proc-Type: 4,"
.LC5:
	.string	"\n"
	.section	.text.PEM_proc_type,"ax",@progbits
	.type	PEM_proc_type, @function
PEM_proc_type:
.LFB878:
	.file 3 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pem/pem_lib.c"
	.loc 3 83 60
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	.loc 3 86 6
	cmpl	$10, -28(%rbp)
	jne	.L12
	.loc 3 87 9
	leaq	.LC0(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L13
.L12:
	.loc 3 88 13
	cmpl	$30, -28(%rbp)
	jne	.L14
	.loc 3 89 9
	leaq	.LC1(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L13
.L14:
	.loc 3 90 13
	cmpl	$20, -28(%rbp)
	jne	.L15
	.loc 3 91 9
	leaq	.LC2(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L13
.L15:
	.loc 3 93 9
	leaq	.LC3(%rip), %rax
	movq	%rax, -8(%rbp)
.L13:
	.loc 3 96 3
	leaq	.LC4(%rip), %rcx
	movq	-24(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strlcat@PLT
	.loc 3 97 3
	movq	-8(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strlcat@PLT
	.loc 3 98 3
	leaq	.LC5(%rip), %rcx
	movq	-24(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strlcat@PLT
	.loc 3 99 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE878:
	.size	PEM_proc_type, .-PEM_proc_type
	.section	.rodata
.LC6:
	.string	"DEK-Info: "
.LC7:
	.string	","
	.section	.text.PEM_dek_info,"ax",@progbits
	.type	PEM_dek_info, @function
PEM_dek_info:
.LFB879:
	.loc 3 104 37
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	.loc 3 107 3
	leaq	.LC6(%rip), %rcx
	movq	-24(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strlcat@PLT
	.loc 3 108 3
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strlcat@PLT
	.loc 3 109 3
	leaq	.LC7(%rip), %rcx
	movq	-24(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strlcat@PLT
	.loc 3 110 20
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, -8(%rbp)
	.loc 3 113 36
	movl	$1022, %eax
	subq	-8(%rbp), %rax
	.loc 3 113 41
	shrq	%rax
	.loc 3 113 6
	cmpq	-40(%rbp), %rax
	jb	.L21
.LBB2:
	.loc 3 116 15
	movq	$0, -16(%rbp)
	.loc 3 116 3
	jmp	.L19
.L20:
	.loc 3 117 36
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 3 117 46
	sarb	$4, %al
	movsbl	%al, %eax
	andl	$15, %eax
	.loc 3 117 31
	cltq
	leaq	map.2(%rip), %rdx
	movzbl	(%rax,%rdx), %ecx
	.loc 3 117 21
	movq	-16(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	.loc 3 117 17
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	.loc 3 117 8
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 3 117 31
	movl	%ecx, %edx
	.loc 3 117 26
	movb	%dl, (%rax)
	.loc 3 118 40
	movq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 3 118 45
	movsbl	%al, %eax
	andl	$15, %eax
	.loc 3 118 35
	cltq
	leaq	map.2(%rip), %rdx
	movzbl	(%rax,%rdx), %ecx
	.loc 3 118 21
	movq	-16(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	.loc 3 118 17
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 3 118 25
	leaq	1(%rax), %rdx
	.loc 3 118 8
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 3 118 35
	movl	%ecx, %edx
	.loc 3 118 30
	movb	%dl, (%rax)
	.loc 3 116 32 discriminator 3
	addq	$1, -16(%rbp)
.L19:
	.loc 3 116 24 discriminator 1
	movq	-16(%rbp), %rax
	cmpq	-40(%rbp), %rax
	jb	.L20
.LBE2:
	.loc 3 120 21
	movq	-40(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	.loc 3 120 15
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	.loc 3 120 6
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 3 120 26
	movb	$10, (%rax)
	.loc 3 121 21
	movq	-40(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	.loc 3 121 15
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 3 121 25
	leaq	1(%rax), %rdx
	.loc 3 121 6
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 3 121 30
	movb	$0, (%rax)
	jmp	.L16
.L21:
	.loc 3 114 5
	nop
.L16:
	.loc 3 122 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE879:
	.size	PEM_dek_info, .-PEM_dek_info
	.section	.rodata
	.align 8
.LC8:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pem/pem_lib.c"
	.section	.text.aws_lc_fips_0_13_14_PEM_ASN1_read,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PEM_ASN1_read
	.type	aws_lc_fips_0_13_14_PEM_ASN1_read, @function
aws_lc_fips_0_13_14_PEM_ASN1_read:
.LFB880:
	.loc 3 125 51
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	.loc 3 126 12
	movq	-40(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BIO_new_fp@PLT
	movq	%rax, -16(%rbp)
	.loc 3 127 6
	cmpq	$0, -16(%rbp)
	jne	.L23
	.loc 3 128 5
	leaq	.LC8(%rip), %rax
	movl	$128, %r8d
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 129 12
	movl	$0, %eax
	jmp	.L24
.L23:
	.loc 3 131 15
	movq	-64(%rbp), %r8
	movq	-56(%rbp), %rdi
	movq	-48(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PEM_ASN1_read_bio@PLT
	movq	%rax, -8(%rbp)
	.loc 3 132 3
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BIO_free@PLT
	.loc 3 133 10
	movq	-8(%rbp), %rax
.L24:
	.loc 3 134 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE880:
	.size	aws_lc_fips_0_13_14_PEM_ASN1_read, .-aws_lc_fips_0_13_14_PEM_ASN1_read
	.section	.rodata
.LC9:
	.string	"ANY PRIVATE KEY"
.LC10:
	.string	"ENCRYPTED PRIVATE KEY"
.LC11:
	.string	"PRIVATE KEY"
.LC12:
	.string	"RSA PRIVATE KEY"
.LC13:
	.string	"EC PRIVATE KEY"
.LC14:
	.string	"DSA PRIVATE KEY"
.LC15:
	.string	"PARAMETERS"
.LC16:
	.string	"EC PARAMETERS"
.LC17:
	.string	"DSA PARAMETERS"
.LC18:
	.string	"DH PARAMETERS"
.LC19:
	.string	"X509 CERTIFICATE"
.LC20:
	.string	"CERTIFICATE"
.LC21:
	.string	"NEW CERTIFICATE REQUEST"
.LC22:
	.string	"CERTIFICATE REQUEST"
.LC23:
	.string	"TRUSTED CERTIFICATE"
.LC24:
	.string	"PKCS7"
.LC25:
	.string	"PKCS #7 SIGNED DATA"
	.section	.text.check_pem,"ax",@progbits
	.type	check_pem, @function
check_pem:
.LFB881:
	.loc 3 136 56
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 3 138 8
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 138 6 discriminator 1
	testl	%eax, %eax
	jne	.L26
	.loc 3 139 12
	movl	$1, %eax
	jmp	.L27
.L26:
	.loc 3 144 8
	leaq	.LC9(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 144 6 discriminator 1
	testl	%eax, %eax
	jne	.L28
	.loc 3 145 13
	leaq	.LC10(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 146 70
	testl	%eax, %eax
	je	.L29
	.loc 3 145 46
	leaq	.LC11(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 145 42 discriminator 2
	testl	%eax, %eax
	je	.L29
	.loc 3 146 13
	leaq	.LC12(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 145 78 discriminator 3
	testl	%eax, %eax
	je	.L29
	.loc 3 146 44
	leaq	.LC13(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 146 40 discriminator 3
	testl	%eax, %eax
	je	.L29
	.loc 3 147 13
	leaq	.LC14(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 146 70 discriminator 5
	testl	%eax, %eax
	jne	.L30
.L29:
	.loc 3 146 70 is_stmt 0 discriminator 6
	movl	$1, %eax
	.loc 3 146 70
	jmp	.L27
.L30:
	.loc 3 146 70 discriminator 7
	movl	$0, %eax
	.loc 3 146 70
	jmp	.L27
.L28:
	.loc 3 151 8 is_stmt 1
	leaq	.LC15(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 151 6 discriminator 1
	testl	%eax, %eax
	jne	.L32
	.loc 3 152 13
	leaq	.LC16(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 153 46
	testl	%eax, %eax
	je	.L33
	.loc 3 153 13 discriminator 2
	leaq	.LC17(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 152 49
	testl	%eax, %eax
	je	.L33
	.loc 3 154 13
	leaq	.LC18(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 153 46 discriminator 4
	testl	%eax, %eax
	jne	.L34
.L33:
	.loc 3 153 46 is_stmt 0 discriminator 1
	movl	$1, %eax
	.loc 3 153 46
	jmp	.L27
.L34:
	.loc 3 153 46 discriminator 5
	movl	$0, %eax
	.loc 3 153 46
	jmp	.L27
.L32:
	.loc 3 159 8 is_stmt 1
	leaq	.LC19(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 159 6 discriminator 1
	testl	%eax, %eax
	jne	.L36
	.loc 3 159 44 discriminator 2
	leaq	.LC20(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 159 40 discriminator 3
	testl	%eax, %eax
	jne	.L36
	.loc 3 160 12
	movl	$1, %eax
	jmp	.L27
.L36:
	.loc 3 163 8
	leaq	.LC21(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 163 6 discriminator 1
	testl	%eax, %eax
	jne	.L37
	.loc 3 164 8
	leaq	.LC22(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 163 44 discriminator 2
	testl	%eax, %eax
	jne	.L37
	.loc 3 165 12
	movl	$1, %eax
	jmp	.L27
.L37:
	.loc 3 169 8
	leaq	.LC20(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 169 6 discriminator 1
	testl	%eax, %eax
	jne	.L38
	.loc 3 169 40 discriminator 2
	leaq	.LC23(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 169 36 discriminator 3
	testl	%eax, %eax
	jne	.L38
	.loc 3 170 12
	movl	$1, %eax
	jmp	.L27
.L38:
	.loc 3 173 8
	leaq	.LC19(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 173 6 discriminator 1
	testl	%eax, %eax
	jne	.L39
	.loc 3 174 8
	leaq	.LC23(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 173 40 discriminator 2
	testl	%eax, %eax
	jne	.L39
	.loc 3 175 12
	movl	$1, %eax
	jmp	.L27
.L39:
	.loc 3 179 8
	leaq	.LC20(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 179 6 discriminator 1
	testl	%eax, %eax
	jne	.L40
	.loc 3 179 40 discriminator 2
	leaq	.LC24(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 179 36 discriminator 3
	testl	%eax, %eax
	jne	.L40
	.loc 3 180 12
	movl	$1, %eax
	jmp	.L27
.L40:
	.loc 3 183 8
	leaq	.LC25(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 183 6 discriminator 1
	testl	%eax, %eax
	jne	.L41
	.loc 3 183 48 discriminator 2
	leaq	.LC24(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 183 44 discriminator 3
	testl	%eax, %eax
	jne	.L41
	.loc 3 184 12
	movl	$1, %eax
	jmp	.L27
.L41:
	.loc 3 197 10
	movl	$0, %eax
.L27:
	.loc 3 198 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE881:
	.size	check_pem, .-check_pem
	.section	.rodata
.LC26:
	.string	"DES-CBC"
.LC27:
	.string	"DES-EDE3-CBC"
.LC28:
	.string	"AES-128-CBC"
.LC29:
	.string	"AES-192-CBC"
.LC30:
	.string	"AES-256-CBC"
	.section	.text.cipher_by_name,"ax",@progbits
	.type	cipher_by_name, @function
cipher_by_name:
.LFB882:
	.loc 3 200 59
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 3 204 12
	leaq	.LC26(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 204 6 discriminator 1
	testl	%eax, %eax
	jne	.L43
	.loc 3 205 12
	call	aws_lc_fips_0_13_14_EVP_des_cbc@PLT
	jmp	.L44
.L43:
	.loc 3 206 19
	leaq	.LC27(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 206 13 discriminator 1
	testl	%eax, %eax
	jne	.L45
	.loc 3 207 12
	call	aws_lc_fips_0_13_14_EVP_des_ede3_cbc@PLT
	jmp	.L44
.L45:
	.loc 3 208 19
	leaq	.LC28(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 208 13 discriminator 1
	testl	%eax, %eax
	jne	.L46
	.loc 3 209 12
	call	aws_lc_fips_0_13_14_EVP_aes_128_cbc@PLT
	jmp	.L44
.L46:
	.loc 3 210 19
	leaq	.LC29(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 210 13 discriminator 1
	testl	%eax, %eax
	jne	.L47
	.loc 3 211 12
	call	aws_lc_fips_0_13_14_EVP_aes_192_cbc@PLT
	jmp	.L44
.L47:
	.loc 3 212 19
	leaq	.LC30(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 3 212 13 discriminator 1
	testl	%eax, %eax
	jne	.L48
	.loc 3 213 12
	call	aws_lc_fips_0_13_14_EVP_aes_256_cbc@PLT
	jmp	.L44
.L48:
	.loc 3 215 12
	movl	$0, %eax
.L44:
	.loc 3 217 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE882:
	.size	cipher_by_name, .-cipher_by_name
	.section	.rodata
.LC31:
	.string	"Expecting: "
	.section	.text.aws_lc_fips_0_13_14_PEM_bytes_read_bio,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PEM_bytes_read_bio
	.type	aws_lc_fips_0_13_14_PEM_bytes_read_bio, @function
aws_lc_fips_0_13_14_PEM_bytes_read_bio:
.LFB883:
	.loc 3 221 33
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%rdx, -104(%rbp)
	movq	%rcx, -112(%rbp)
	movq	%r8, -120(%rbp)
	movq	%r9, -128(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -136(%rbp)
	.loc 3 221 33
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 223 9
	movq	$0, -64(%rbp)
	.loc 3 223 21
	movq	$0, -56(%rbp)
	.loc 3 224 18
	movq	$0, -48(%rbp)
	.loc 3 226 7
	movl	$0, -72(%rbp)
.L55:
	.loc 3 229 10
	leaq	-40(%rbp), %rdi
	leaq	-48(%rbp), %rcx
	leaq	-56(%rbp), %rdx
	leaq	-64(%rbp), %rsi
	movq	-120(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PEM_read_bio@PLT
	.loc 3 229 8 discriminator 1
	testl	%eax, %eax
	jne	.L50
.LBB3:
	.loc 3 230 24
	call	aws_lc_fips_0_13_14_ERR_peek_error@PLT
	movl	%eax, -68(%rbp)
	.loc 3 231 11
	movl	-68(%rbp), %eax
	movl	%eax, %edi
	call	ERR_GET_LIB
	.loc 3 231 10 discriminator 1
	cmpl	$9, %eax
	jne	.L51
	.loc 3 232 11
	movl	-68(%rbp), %eax
	movl	%eax, %edi
	call	ERR_GET_REASON
	.loc 3 231 45 discriminator 2
	cmpl	$110, %eax
	jne	.L51
	.loc 3 233 9
	movq	-112(%rbp), %rax
	leaq	.LC31(%rip), %rcx
	movq	%rax, %rdx
	movq	%rcx, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	aws_lc_fips_0_13_14_ERR_add_error_data@PLT
.L51:
	.loc 3 235 14
	movl	$0, %eax
	jmp	.L63
.L50:
.LBE3:
	.loc 3 237 9
	movq	-64(%rbp), %rax
	movq	-112(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	check_pem
	.loc 3 237 8 discriminator 1
	testl	%eax, %eax
	jne	.L66
	.loc 3 240 5
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 3 241 5
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 3 242 5
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 3 229 8
	jmp	.L55
.L66:
	.loc 3 238 7
	nop
	.loc 3 244 8
	movq	-56(%rbp), %rax
	leaq	-32(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PEM_get_EVP_CIPHER_INFO@PLT
	.loc 3 244 6 discriminator 1
	testl	%eax, %eax
	je	.L67
	.loc 3 247 8
	movq	-48(%rbp), %rsi
	movq	-136(%rbp), %rdi
	movq	-128(%rbp), %rcx
	leaq	-40(%rbp), %rdx
	leaq	-32(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PEM_do_header@PLT
	.loc 3 247 6 discriminator 1
	testl	%eax, %eax
	je	.L68
	.loc 3 251 10
	movq	-48(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 3 252 9
	movq	-40(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 3 254 6
	cmpq	$0, -104(%rbp)
	je	.L59
	.loc 3 255 10
	movq	-64(%rbp), %rdx
	movq	-104(%rbp), %rax
	movq	%rdx, (%rax)
.L59:
	.loc 3 258 7
	movl	$1, -72(%rbp)
	jmp	.L57
.L67:
	.loc 3 245 5
	nop
	jmp	.L57
.L68:
	.loc 3 248 5
	nop
.L57:
	.loc 3 261 6
	cmpl	$0, -72(%rbp)
	je	.L60
	.loc 3 261 12 discriminator 1
	cmpq	$0, -104(%rbp)
	jne	.L61
.L60:
	.loc 3 262 5
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
.L61:
	.loc 3 264 3
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 3 265 6
	cmpl	$0, -72(%rbp)
	jne	.L62
	.loc 3 266 5
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
.L62:
	.loc 3 268 10
	movl	-72(%rbp), %eax
.L63:
	.loc 3 269 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L64
	call	__stack_chk_fail@PLT
.L64:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE883:
	.size	aws_lc_fips_0_13_14_PEM_bytes_read_bio, .-aws_lc_fips_0_13_14_PEM_bytes_read_bio
	.section	.text.aws_lc_fips_0_13_14_PEM_ASN1_write,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PEM_ASN1_write
	.type	aws_lc_fips_0_13_14_PEM_ASN1_write, @function
aws_lc_fips_0_13_14_PEM_ASN1_write:
.LFB884:
	.loc 3 273 56
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	.loc 3 274 12
	movq	-40(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BIO_new_fp@PLT
	movq	%rax, -8(%rbp)
	.loc 3 275 6
	cmpq	$0, -8(%rbp)
	jne	.L70
	.loc 3 276 5
	leaq	.LC8(%rip), %rax
	movl	$276, %r8d
	movq	%rax, %rcx
	movl	$7, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 277 12
	movl	$0, %eax
	jmp	.L71
.L70:
	.loc 3 279 13
	movq	-64(%rbp), %r9
	movq	-56(%rbp), %r8
	movq	-48(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	subq	$8, %rsp
	pushq	32(%rbp)
	pushq	24(%rbp)
	movl	16(%rbp), %edi
	pushq	%rdi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PEM_ASN1_write_bio@PLT
	addq	$32, %rsp
	movl	%eax, -12(%rbp)
	.loc 3 280 3
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BIO_free@PLT
	.loc 3 281 10
	movl	-12(%rbp), %eax
.L71:
	.loc 3 282 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE884:
	.size	aws_lc_fips_0_13_14_PEM_ASN1_write, .-aws_lc_fips_0_13_14_PEM_ASN1_write
	.section	.rodata
.LC32:
	.string	"iv_len <= sizeof(iv)"
	.align 8
.LC33:
	.string	"strlen(objstr) + 23 + 2 * iv_len + 13 <= sizeof(buf)"
	.section	.text.aws_lc_fips_0_13_14_PEM_ASN1_write_bio,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PEM_ASN1_write_bio
	.type	aws_lc_fips_0_13_14_PEM_ASN1_write_bio, @function
aws_lc_fips_0_13_14_PEM_ASN1_write_bio:
.LFB885:
	.loc 3 286 60
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1400, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1352(%rbp)
	movq	%rsi, -1360(%rbp)
	movq	%rdx, -1368(%rbp)
	movq	%rcx, -1376(%rbp)
	movq	%r8, -1384(%rbp)
	movq	%r9, -1392(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, -1400(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, -1408(%rbp)
	.loc 3 286 60
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 3 288 7
	movl	$0, -1328(%rbp)
	.loc 3 288 24
	movl	$0, -1332(%rbp)
	.loc 3 289 22
	movq	$0, -1312(%rbp)
	.loc 3 290 15
	movq	$0, -1304(%rbp)
	.loc 3 295 6
	cmpq	$0, -1384(%rbp)
	je	.L73
	.loc 3 296 14
	movq	-1384(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_nid@PLT
	.loc 3 296 14 is_stmt 0 discriminator 1
	movl	%eax, %edi
	call	aws_lc_fips_0_13_14_OBJ_nid2sn@PLT
	movq	%rax, -1304(%rbp)
	.loc 3 297 8 is_stmt 1
	cmpq	$0, -1304(%rbp)
	je	.L74
	.loc 3 297 27 discriminator 1
	movq	-1304(%rbp), %rax
	movq	%rax, %rdi
	call	cipher_by_name
	.loc 3 297 24 discriminator 2
	testq	%rax, %rax
	je	.L74
	.loc 3 298 9
	movq	-1384(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_iv_length@PLT
	.loc 3 297 58 discriminator 3
	cmpl	$7, %eax
	ja	.L73
.L74:
	.loc 3 299 7
	leaq	.LC8(%rip), %rax
	movl	$299, %r8d
	movq	%rax, %rcx
	movl	$113, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 300 7
	jmp	.L75
.L73:
	.loc 3 304 16
	movq	-1376(%rbp), %rax
	movq	-1352(%rbp), %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	*%rdx
.LVL0:
	movl	%eax, -1328(%rbp)
	.loc 3 304 6 discriminator 1
	cmpl	$0, -1328(%rbp)
	jns	.L76
	.loc 3 305 5
	leaq	.LC8(%rip), %rax
	movl	$305, %r8d
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 306 11
	movl	$0, -1328(%rbp)
	.loc 3 307 5
	jmp	.L75
.L76:
	.loc 3 311 42
	movl	-1328(%rbp), %eax
	.loc 3 311 62
	addl	$20, %eax
	.loc 3 311 27
	movl	%eax, %eax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_malloc@PLT
	movq	%rax, -1312(%rbp)
	.loc 3 312 6
	cmpq	$0, -1312(%rbp)
	je	.L93
	.loc 3 315 5
	movq	-1312(%rbp), %rax
	movq	%rax, -1320(%rbp)
	.loc 3 316 7
	leaq	-1320(%rbp), %rdx
	movq	-1376(%rbp), %rax
	movq	-1352(%rbp), %rcx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*%rcx
.LVL1:
	.loc 3 316 5 discriminator 1
	movl	%eax, -1340(%rbp)
	.loc 3 318 6
	cmpq	$0, -1384(%rbp)
	je	.L78
.LBB4:
	.loc 3 319 29
	movq	-1384(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_iv_length@PLT
	movl	%eax, -1324(%rbp)
	.loc 3 321 8
	cmpq	$0, -1392(%rbp)
	jne	.L79
	.loc 3 322 12
	movl	$0, 16(%rbp)
	.loc 3 323 10
	cmpq	$0, -1400(%rbp)
	jne	.L80
	.loc 3 324 18
	movq	aws_lc_fips_0_13_14_PEM_def_callback@GOTPCREL(%rip), %rax
	movq	%rax, -1400(%rbp)
.L80:
	.loc 3 326 15
	movq	-1408(%rbp), %rdx
	leaq	-1056(%rbp), %rax
	movq	-1400(%rbp), %r8
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$1024, %esi
	movq	%rax, %rdi
	call	*%r8
.LVL2:
	movl	%eax, 16(%rbp)
	.loc 3 327 10
	cmpl	$0, 16(%rbp)
	jg	.L81
	.loc 3 328 9
	leaq	.LC8(%rip), %rax
	movl	$328, %r8d
	movq	%rax, %rcx
	movl	$111, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 329 9
	jmp	.L75
.L81:
	.loc 3 331 12
	leaq	-1056(%rbp), %rax
	movq	%rax, -1392(%rbp)
.L79:
	.loc 3 333 5
	cmpl	$16, -1324(%rbp)
	jbe	.L82
	.loc 3 333 5 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.1(%rip), %rdx
	leaq	.LC8(%rip), %rsi
	leaq	.LC32(%rip), %rax
	movq	%rdx, %rcx
	movl	$333, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L82:
	.loc 3 334 10 is_stmt 1
	movl	-1324(%rbp), %edx
	leaq	-1136(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RAND_bytes@PLT
	.loc 3 334 8 discriminator 1
	testl	%eax, %eax
	je	.L94
	.loc 3 339 10
	movl	16(%rbp), %eax
	movslq	%eax, %rbx
	call	aws_lc_fips_0_13_14_EVP_md5@PLT
	movq	%rax, %rdi
	.loc 3 339 10 is_stmt 0 discriminator 1
	movq	-1392(%rbp), %rcx
	leaq	-1136(%rbp), %rdx
	movq	-1384(%rbp), %rax
	pushq	$0
	leaq	-1120(%rbp), %rsi
	pushq	%rsi
	movl	$1, %r9d
	movq	%rbx, %r8
	movq	%rdi, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_BytesToKey@PLT
	addq	$16, %rsp
	.loc 3 339 8 is_stmt 1 discriminator 2
	testl	%eax, %eax
	je	.L95
	.loc 3 343 8
	leaq	-1056(%rbp), %rax
	cmpq	%rax, -1392(%rbp)
	jne	.L85
	.loc 3 344 7
	leaq	-1056(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_cleanse@PLT
.L85:
	.loc 3 347 5
	movq	-1304(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	.loc 3 347 5 is_stmt 0 discriminator 1
	movl	-1324(%rbp), %edx
	addl	%edx, %edx
	movl	%edx, %edx
	addq	%rdx, %rax
	addq	$36, %rax
	cmpq	$1024, %rax
	jbe	.L86
	.loc 3 347 5 discriminator 2
	leaq	__PRETTY_FUNCTION__.1(%rip), %rdx
	leaq	.LC8(%rip), %rsi
	leaq	.LC33(%rip), %rax
	movq	%rdx, %rcx
	movl	$347, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L86:
	.loc 3 349 12 is_stmt 1
	movb	$0, -1056(%rbp)
	.loc 3 350 5
	leaq	-1056(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	PEM_proc_type
	.loc 3 351 5
	movl	-1324(%rbp), %edx
	leaq	-1136(%rbp), %rcx
	movq	-1304(%rbp), %rsi
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	PEM_dek_info
	.loc 3 354 5
	leaq	-1296(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_CTX_init@PLT
	.loc 3 355 9
	movl	$1, -1332(%rbp)
	.loc 3 356 10
	leaq	-1136(%rbp), %rcx
	leaq	-1120(%rbp), %rdx
	movq	-1384(%rbp), %rsi
	leaq	-1296(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_EncryptInit_ex@PLT
	.loc 3 356 8 discriminator 1
	testl	%eax, %eax
	je	.L87
	.loc 3 357 10
	movl	-1340(%rbp), %edi
	movq	-1312(%rbp), %rcx
	leaq	-1336(%rbp), %rdx
	movq	-1312(%rbp), %rsi
	leaq	-1296(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_EncryptUpdate@PLT
	.loc 3 356 55 discriminator 2
	testl	%eax, %eax
	je	.L87
	.loc 3 358 10
	movl	-1336(%rbp), %eax
	movslq	%eax, %rdx
	.loc 3 358 36
	movq	-1312(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	.loc 3 358 10
	leaq	-1340(%rbp), %rdx
	leaq	-1296(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_EncryptFinal_ex@PLT
	.loc 3 357 53
	testl	%eax, %eax
	jne	.L88
.L87:
	.loc 3 359 11
	movl	$0, -1332(%rbp)
	jmp	.L89
.L88:
	.loc 3 361 9
	movl	-1340(%rbp), %edx
	movl	-1336(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -1340(%rbp)
.L89:
	.loc 3 363 5
	leaq	-1296(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_CTX_cleanup@PLT
	.loc 3 364 8
	cmpl	$0, -1332(%rbp)
	jne	.L90
	.loc 3 365 7
	jmp	.L75
.L78:
.LBE4:
	.loc 3 368 9
	movl	$1, -1332(%rbp)
	.loc 3 369 12
	movb	$0, -1056(%rbp)
.L90:
	.loc 3 371 7
	movl	-1340(%rbp), %eax
	movslq	%eax, %rdi
	movq	-1312(%rbp), %rcx
	leaq	-1056(%rbp), %rdx
	movq	-1360(%rbp), %rsi
	movq	-1368(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PEM_write_bio@PLT
	.loc 3 371 5 discriminator 1
	movl	%eax, -1340(%rbp)
	.loc 3 372 9
	movl	-1340(%rbp), %eax
	.loc 3 372 6
	testl	%eax, %eax
	jg	.L96
	.loc 3 373 9
	movl	$0, -1332(%rbp)
	jmp	.L75
.L93:
	.loc 3 313 5
	nop
	jmp	.L75
.L94:
.LBB5:
	.loc 3 335 7
	nop
	jmp	.L75
.L95:
	.loc 3 340 7
	nop
	jmp	.L75
.L96:
.LBE5:
	.loc 3 375 1
	nop
.L75:
	.loc 3 376 3
	leaq	-1120(%rbp), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_cleanse@PLT
	.loc 3 377 3
	leaq	-1136(%rbp), %rax
	movl	$16, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_cleanse@PLT
	.loc 3 378 3
	leaq	-1296(%rbp), %rax
	movl	$152, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_cleanse@PLT
	.loc 3 379 3
	leaq	-1056(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_cleanse@PLT
	.loc 3 380 3
	movq	-1312(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 3 381 10
	movl	-1332(%rbp), %eax
	.loc 3 382 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L92
	call	__stack_chk_fail@PLT
.L92:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE885:
	.size	aws_lc_fips_0_13_14_PEM_ASN1_write_bio, .-aws_lc_fips_0_13_14_PEM_ASN1_write_bio
	.section	.text.aws_lc_fips_0_13_14_PEM_do_header,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PEM_do_header
	.type	aws_lc_fips_0_13_14_PEM_do_header, @function
aws_lc_fips_0_13_14_PEM_do_header:
.LFB886:
	.loc 3 385 55
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$1344, %rsp
	.cfi_offset 12, -24
	.cfi_offset 3, -32
	movq	%rdi, -1320(%rbp)
	movq	%rsi, -1328(%rbp)
	movq	%rdx, -1336(%rbp)
	movq	%rcx, -1344(%rbp)
	movq	%r8, -1352(%rbp)
	.loc 3 385 55
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 3 386 7
	movl	$0, -1304(%rbp)
	.loc 3 392 7
	movq	-1336(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -1288(%rbp)
	.loc 3 394 13
	movq	-1320(%rbp), %rax
	movq	(%rax), %rax
	.loc 3 394 6
	testq	%rax, %rax
	jne	.L98
	.loc 3 395 12
	movl	$1, %eax
	jmp	.L106
.L98:
	.loc 3 398 8
	movl	$0, -1292(%rbp)
	.loc 3 399 6
	cmpq	$0, -1344(%rbp)
	jne	.L100
	.loc 3 400 14
	movq	aws_lc_fips_0_13_14_PEM_def_callback@GOTPCREL(%rip), %rax
	movq	%rax, -1344(%rbp)
.L100:
	.loc 3 402 10
	movq	-1352(%rbp), %rdx
	leaq	-1056(%rbp), %rax
	movq	-1344(%rbp), %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$1024, %esi
	movq	%rax, %rdi
	call	*%r8
.LVL3:
	movl	%eax, -1292(%rbp)
	.loc 3 403 6
	cmpl	$0, -1292(%rbp)
	jg	.L101
	.loc 3 404 5
	leaq	.LC8(%rip), %rax
	movl	$404, %r8d
	movq	%rax, %rcx
	movl	$104, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 405 12
	movl	$0, %eax
	jmp	.L106
.L101:
	.loc 3 408 8
	movl	-1292(%rbp), %eax
	movslq	%eax, %r12
	.loc 3 408 50
	movq	-1320(%rbp), %rax
	leaq	8(%rax), %rbx
	.loc 3 408 8
	call	aws_lc_fips_0_13_14_EVP_md5@PLT
	movq	%rax, %rsi
	.loc 3 408 8 is_stmt 0 discriminator 1
	movq	-1320(%rbp), %rax
	movq	(%rax), %rax
	leaq	-1056(%rbp), %rdx
	pushq	$0
	leaq	-1120(%rbp), %rcx
	pushq	%rcx
	movl	$1, %r9d
	movq	%r12, %r8
	movq	%rdx, %rcx
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_BytesToKey@PLT
	addq	$16, %rsp
	.loc 3 408 6 is_stmt 1 discriminator 2
	testl	%eax, %eax
	jne	.L102
	.loc 3 410 12
	movl	$0, %eax
	jmp	.L106
.L102:
	.loc 3 413 7
	movq	-1288(%rbp), %rax
	.loc 3 413 5
	movl	%eax, -1300(%rbp)
	.loc 3 414 3
	leaq	-1280(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_CTX_init@PLT
	.loc 3 415 59
	movq	-1320(%rbp), %rax
	leaq	8(%rax), %rcx
	.loc 3 415 7
	movq	-1320(%rbp), %rax
	movq	(%rax), %rsi
	leaq	-1120(%rbp), %rdx
	leaq	-1280(%rbp), %rax
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_DecryptInit_ex@PLT
	movl	%eax, -1296(%rbp)
	.loc 3 416 6
	cmpl	$0, -1296(%rbp)
	je	.L103
	.loc 3 417 9
	movl	-1300(%rbp), %edi
	movq	-1328(%rbp), %rcx
	leaq	-1304(%rbp), %rdx
	movq	-1328(%rbp), %rsi
	leaq	-1280(%rbp), %rax
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_DecryptUpdate@PLT
	movl	%eax, -1296(%rbp)
.L103:
	.loc 3 419 6
	cmpl	$0, -1296(%rbp)
	je	.L104
	.loc 3 420 9
	movl	-1304(%rbp), %eax
	movslq	%eax, %rdx
	.loc 3 420 35
	movq	-1328(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	.loc 3 420 9
	leaq	-1300(%rbp), %rdx
	leaq	-1280(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_DecryptFinal_ex@PLT
	movl	%eax, -1296(%rbp)
.L104:
	.loc 3 422 3
	leaq	-1280(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_CTX_cleanup@PLT
	.loc 3 423 3
	leaq	-1056(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_cleanse@PLT
	.loc 3 424 3
	leaq	-1120(%rbp), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_cleanse@PLT
	.loc 3 425 6
	cmpl	$0, -1296(%rbp)
	jne	.L105
	.loc 3 426 5
	leaq	.LC8(%rip), %rax
	movl	$426, %r8d
	movq	%rax, %rcx
	movl	$101, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 427 12
	movl	$0, %eax
	jmp	.L106
.L105:
	.loc 3 429 5
	movl	-1300(%rbp), %edx
	movl	-1304(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -1300(%rbp)
	.loc 3 430 9
	movl	-1300(%rbp), %eax
	movslq	%eax, %rdx
	movq	-1336(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 3 431 10
	movl	$1, %eax
.L106:
	.loc 3 432 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L107
	call	__stack_chk_fail@PLT
.L107:
	leaq	-16(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE886:
	.size	aws_lc_fips_0_13_14_PEM_do_header, .-aws_lc_fips_0_13_14_PEM_do_header
	.section	.rodata
.LC34:
	.string	"Proc-Type: "
.LC35:
	.string	"0"
	.section	.text.aws_lc_fips_0_13_14_PEM_get_EVP_CIPHER_INFO,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PEM_get_EVP_CIPHER_INFO
	.type	aws_lc_fips_0_13_14_PEM_get_EVP_CIPHER_INFO, @function
aws_lc_fips_0_13_14_PEM_get_EVP_CIPHER_INFO:
.LFB887:
	.loc 3 434 68
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 3 435 21
	movq	$0, -24(%rbp)
	.loc 3 437 10
	leaq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 3 439 18
	movq	-48(%rbp), %rax
	movq	$0, (%rax)
	.loc 3 440 24
	movq	-48(%rbp), %rax
	addq	$8, %rax
	.loc 3 440 3
	movl	$16, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	OPENSSL_memset
	.loc 3 441 15
	movq	-40(%rbp), %rax
	.loc 3 441 6
	testq	%rax, %rax
	je	.L109
	.loc 3 441 28 discriminator 1
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 3 441 24 discriminator 1
	testb	%al, %al
	je	.L109
	.loc 3 441 49 discriminator 2
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 3 441 45 discriminator 2
	cmpb	$10, %al
	jne	.L110
.L109:
	.loc 3 442 12
	movl	$1, %eax
	jmp	.L111
.L110:
	.loc 3 444 7
	movq	-40(%rbp), %rax
	leaq	.LC34(%rip), %rcx
	movl	$11, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 3 444 6 discriminator 1
	testl	%eax, %eax
	je	.L112
	.loc 3 445 5
	leaq	.LC8(%rip), %rax
	movl	$445, %r8d
	movq	%rax, %rcx
	movl	$109, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 446 12
	movl	$0, %eax
	jmp	.L111
.L112:
	.loc 3 448 10
	movq	-40(%rbp), %rax
	addq	$11, %rax
	movq	%rax, -40(%rbp)
	.loc 3 449 7
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 3 449 6
	cmpb	$52, %al
	je	.L113
	.loc 3 450 12
	movl	$0, %eax
	jmp	.L111
.L113:
	.loc 3 452 9
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	.loc 3 453 7
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 3 453 6
	cmpb	$44, %al
	je	.L114
	.loc 3 454 12
	movl	$0, %eax
	jmp	.L111
.L114:
	.loc 3 456 9
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	.loc 3 457 7
	movq	-40(%rbp), %rax
	leaq	.LC0(%rip), %rcx
	movl	$9, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 3 457 6 discriminator 1
	testl	%eax, %eax
	je	.L116
	.loc 3 458 5
	leaq	.LC8(%rip), %rax
	movl	$458, %r8d
	movq	%rax, %rcx
	movl	$108, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 459 12
	movl	$0, %eax
	jmp	.L111
.L118:
	.loc 3 461 56 discriminator 3
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
.L116:
	.loc 3 461 11 discriminator 1
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 3 461 28 discriminator 1
	cmpb	$10, %al
	je	.L117
	.loc 3 461 32 discriminator 2
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 3 461 28 discriminator 2
	testb	%al, %al
	jne	.L118
.L117:
	.loc 3 464 7
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 3 464 6
	testb	%al, %al
	jne	.L119
	.loc 3 465 5
	leaq	.LC8(%rip), %rax
	movl	$465, %r8d
	movq	%rax, %rcx
	movl	$112, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 466 12
	movl	$0, %eax
	jmp	.L111
.L119:
	.loc 3 468 9
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	.loc 3 469 7
	movq	-40(%rbp), %rax
	leaq	.LC6(%rip), %rcx
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 3 469 6 discriminator 1
	testl	%eax, %eax
	je	.L120
	.loc 3 470 5
	leaq	.LC8(%rip), %rax
	movl	$470, %r8d
	movq	%rax, %rcx
	movl	$107, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 471 12
	movl	$0, %eax
	jmp	.L111
.L120:
	.loc 3 473 10
	movq	-40(%rbp), %rax
	addq	$10, %rax
	movq	%rax, -40(%rbp)
	.loc 3 475 5
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
.L124:
	.loc 3 477 9
	movq	-40(%rbp), %rax
	.loc 3 477 7
	movzbl	(%rax), %eax
	movb	%al, -25(%rbp)
	.loc 3 478 8
	cmpb	$64, -25(%rbp)
	jle	.L121
	.loc 3 478 21 discriminator 2
	cmpb	$90, -25(%rbp)
	jle	.L122
.L121:
	.loc 3 478 34 discriminator 3
	cmpb	$45, -25(%rbp)
	je	.L122
	.loc 3 479 11
	movsbl	-25(%rbp), %eax
	movl	%eax, %edi
	call	aws_lc_fips_0_13_14_OPENSSL_isdigit@PLT
	.loc 3 478 9 discriminator 4
	testl	%eax, %eax
	je	.L129
.L122:
	.loc 3 482 11
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	.loc 3 477 7
	jmp	.L124
.L129:
	.loc 3 480 7
	nop
	.loc 3 484 3
	movq	-40(%rbp), %rax
	.loc 3 484 11
	movb	$0, (%rax)
	.loc 3 485 26
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	cipher_by_name
	movq	%rax, -24(%rbp)
	.loc 3 485 18 discriminator 1
	movq	-48(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 3 486 3
	movq	-40(%rbp), %rax
	.loc 3 486 11
	movzbl	-25(%rbp), %edx
	movb	%dl, (%rax)
	.loc 3 487 9
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -40(%rbp)
	.loc 3 489 6
	cmpq	$0, -24(%rbp)
	jne	.L125
	.loc 3 490 5
	leaq	.LC8(%rip), %rax
	movl	$490, %r8d
	movq	%rax, %rcx
	movl	$114, %edx
	movl	$0, %esi
	movl	$9, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 491 12
	movl	$0, %eax
	jmp	.L111
.L125:
	.loc 3 495 7
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_iv_length@PLT
	.loc 3 495 6 discriminator 1
	cmpl	$7, %eax
	ja	.L126
	.loc 3 496 5 discriminator 1
	leaq	__PRETTY_FUNCTION__.0(%rip), %rdx
	leaq	.LC8(%rip), %rsi
	leaq	.LC35(%rip), %rax
	movq	%rdx, %rcx
	movl	$496, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L126:
	.loc 3 500 45
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_iv_length@PLT
	.loc 3 500 8 discriminator 1
	movl	%eax, %edx
	movq	-48(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	load_iv
	.loc 3 500 6 discriminator 2
	testl	%eax, %eax
	jne	.L127
	.loc 3 501 12
	movl	$0, %eax
	jmp	.L111
.L127:
	.loc 3 504 10
	movl	$1, %eax
.L111:
	.loc 3 505 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE887:
	.size	aws_lc_fips_0_13_14_PEM_get_EVP_CIPHER_INFO, .-aws_lc_fips_0_13_14_PEM_get_EVP_CIPHER_INFO
	.section	.text.load_iv,"ax",@progbits
	.type	load_iv, @function
load_iv:
.LFB888:
	.loc 3 507 65
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 3 507 65
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 511 8
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -32(%rbp)
.LBB6:
	.loc 3 512 15
	movq	$0, -24(%rbp)
	.loc 3 512 3
	jmp	.L131
.L132:
	.loc 3 513 7
	movq	-64(%rbp), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 3 513 11
	movb	$0, (%rax)
	.loc 3 512 32 discriminator 3
	addq	$1, -24(%rbp)
.L131:
	.loc 3 512 24 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-72(%rbp), %rax
	jb	.L132
.LBE6:
	.loc 3 515 7
	salq	-72(%rbp)
.LBB7:
	.loc 3 516 15
	movq	$0, -16(%rbp)
	.loc 3 516 3
	jmp	.L133
.L138:
	.loc 3 517 33
	movq	-32(%rbp), %rax
	movzbl	(%rax),