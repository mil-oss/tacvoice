	.file	"rsa_crypt.c"
	.text
.Ltext0:
	.file 0 "/mnt/HARDONE/NSI_Repos/tacvoice/gateway/target/debug/build/aws-lc-fips-sys-802b9ac702614b53/out/build/aws-lc/crypto" "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rsa_extra/rsa_crypt.c"
	.section	.text.value_barrier_w,"ax",@progbits
	.type	value_barrier_w, @function
value_barrier_w:
.LFB173:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rsa_extra/../fipsmodule/bn/../../internal.h"
	.loc 1 317 62
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 319 3
	movq	-8(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 321 10
	movq	-8(%rbp), %rax
	.loc 1 322 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE173:
	.size	value_barrier_w, .-value_barrier_w
	.section	.text.value_barrier_u32,"ax",@progbits
	.type	value_barrier_u32, @function
value_barrier_u32:
.LFB174:
	.loc 1 325 54
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	.loc 1 327 3
	movl	-4(%rbp), %eax
	movl	%eax, -4(%rbp)
	.loc 1 329 10
	movl	-4(%rbp), %eax
	.loc 1 330 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE174:
	.size	value_barrier_u32, .-value_barrier_u32
	.section	.text.constant_time_msb_w,"ax",@progbits
	.type	constant_time_msb_w, @function
constant_time_msb_w:
.LFB176:
	.loc 1 342 66
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 1 343 13
	movq	-8(%rbp), %rax
	sarq	$63, %rax
	.loc 1 344 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE176:
	.size	constant_time_msb_w, .-constant_time_msb_w
	.section	.text.constant_time_lt_w,"ax",@progbits
	.type	constant_time_lt_w, @function
constant_time_lt_w:
.LFB177:
	.loc 1 348 65
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 379 35
	movq	-8(%rbp), %rax
	xorq	-16(%rbp), %rax
	movq	%rax, %rdx
	.loc 1 379 42
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	.loc 1 379 45
	xorq	-8(%rbp), %rax
	.loc 1 379 38
	orq	%rdx, %rax
	.loc 1 379 10
	xorq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	constant_time_msb_w
	.loc 1 380 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE177:
	.size	constant_time_lt_w, .-constant_time_lt_w
	.section	.text.constant_time_ge_w,"ax",@progbits
	.type	constant_time_ge_w, @function
constant_time_ge_w:
.LFB179:
	.loc 1 390 65
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 391 11
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	constant_time_lt_w
	.loc 1 391 10 discriminator 1
	notq	%rax
	.loc 1 392 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE179:
	.size	constant_time_ge_w, .-constant_time_ge_w
	.section	.text.constant_time_is_zero_w,"ax",@progbits
	.type	constant_time_is_zero_w, @function
constant_time_is_zero_w:
.LFB181:
	.loc 1 401 70
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 413 30
	movq	-8(%rbp), %rax
	notq	%rax
	movq	%rax, %rdx
	.loc 1 413 38
	movq	-8(%rbp), %rax
	subq	$1, %rax
	.loc 1 413 10
	andq	%rdx, %rax
	movq	%rax, %rdi
	call	constant_time_msb_w
	.loc 1 414 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE181:
	.size	constant_time_is_zero_w, .-constant_time_is_zero_w
	.section	.text.constant_time_eq_w,"ax",@progbits
	.type	constant_time_eq_w, @function
constant_time_eq_w:
.LFB183:
	.loc 1 424 65
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 425 10
	movq	-8(%rbp), %rax
	xorq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	constant_time_is_zero_w
	.loc 1 426 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE183:
	.size	constant_time_eq_w, .-constant_time_eq_w
	.section	.text.constant_time_select_w,"ax",@progbits
	.type	constant_time_select_w, @function
constant_time_select_w:
.LFB187:
	.loc 1 451 69
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movq	%rdx, -32(%rbp)
	.loc 1 458 11
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	value_barrier_w
	.loc 1 458 33 discriminator 1
	andq	-24(%rbp), %rax
	movq	%rax, %rbx
	.loc 1 458 41 discriminator 1
	movq	-16(%rbp), %rax
	notq	%rax
	movq	%rax, %rdi
	call	value_barrier_w
	.loc 1 458 64 discriminator 2
	andq	-32(%rbp), %rax
	.loc 1 458 38 discriminator 2
	orq	%rbx, %rax
	.loc 1 459 1
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE187:
	.size	constant_time_select_w, .-constant_time_select_w
	.section	.text.constant_time_declassify_w,"ax",@progbits
	.type	constant_time_declassify_w, @function
constant_time_declassify_w:
.LFB194:
	.loc 1 531 73
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 544 10
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	value_barrier_w
	.loc 1 545 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE194:
	.size	constant_time_declassify_w, .-constant_time_declassify_w
	.section	.text.constant_time_declassify_int,"ax",@progbits
	.type	constant_time_declassify_int, @function
constant_time_declassify_int:
.LFB195:
	.loc 1 547 55
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$8, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 552 10
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	value_barrier_u32
	.loc 1 553 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE195:
	.size	constant_time_declassify_int, .-constant_time_declassify_int
	.section	.text.OPENSSL_memcpy,"ax",@progbits
	.type	OPENSSL_memcpy, @function
OPENSSL_memcpy:
.LFB202:
	.loc 1 934 74
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
	.loc 1 935 6
	cmpq	$0, -24(%rbp)
	jne	.L22
	.loc 1 936 12
	movq	-8(%rbp), %rax
	jmp	.L23
.L22:
	.loc 1 939 10
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
.L23:
	.loc 1 940 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE202:
	.size	OPENSSL_memcpy, .-OPENSSL_memcpy
	.section	.text.OPENSSL_memset,"ax",@progbits
	.type	OPENSSL_memset, @function
OPENSSL_memset:
.LFB204:
	.loc 1 950 64
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
	.loc 1 951 6
	cmpq	$0, -24(%rbp)
	jne	.L25
	.loc 1 952 12
	movq	-8(%rbp), %rax
	jmp	.L26
.L25:
	.loc 1 955 10
	movq	-24(%rbp), %rdx
	movl	-12(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L26:
	.loc 1 956 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE204:
	.size	OPENSSL_memset, .-OPENSSL_memset
	.section	.text.rand_nonzero,"ax",@progbits
	.type	rand_nonzero, @function
rand_nonzero:
.LFB257:
	.file 2 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rsa_extra/rsa_crypt.c"
	.loc 2 74 52
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 2 75 3
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RAND_bytes@PLT
.LBB2:
	.loc 2 77 15
	movq	$0, -8(%rbp)
	.loc 2 77 3
	jmp	.L28
.L30:
	.loc 2 81 7
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RAND_bytes@PLT
.L29:
	.loc 2 80 44
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 2 80 12
	testb	%al, %al
	sete	%al
	movzbl	%al, %eax
	movl	%eax, %edi
	call	constant_time_declassify_int
	.loc 2 80 12 is_stmt 0 discriminator 1
	testl	%eax, %eax
	jne	.L30
	.loc 2 77 32 is_stmt 1 discriminator 2
	addq	$1, -8(%rbp)
.L28:
	.loc 2 77 24 discriminator 1
	movq	-8(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L29
.LBE2:
	.loc 2 84 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE257:
	.size	rand_nonzero, .-rand_nonzero
	.section	.rodata
	.align 8
.LC0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rsa_extra/rsa_crypt.c"
	.section	.text.aws_lc_fips_0_13_14_RSA_padding_add_PKCS1_OAEP_mgf1,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_RSA_padding_add_PKCS1_OAEP_mgf1
	.type	aws_lc_fips_0_13_14_RSA_padding_add_PKCS1_OAEP_mgf1, @function
aws_lc_fips_0_13_14_RSA_padding_add_PKCS1_OAEP_mgf1:
.LFB258:
	.loc 2 89 77
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$208, %rsp
	movq	%rdi, -152(%rbp)
	movq	%rsi, -160(%rbp)
	movq	%rdx, -168(%rbp)
	movq	%rcx, -176(%rbp)
	movq	%r8, -184(%rbp)
	movq	%r9, -192(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -200(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, -208(%rbp)
	.loc 2 89 77
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 90 6
	cmpq	$0, -200(%rbp)
	jne	.L33
	.loc 2 91 10
	call	aws_lc_fips_0_13_14_EVP_sha1@PLT
	movq	%rax, -200(%rbp)
.L33:
	.loc 2 93 6
	cmpq	$0, -208(%rbp)
	jne	.L34
	.loc 2 94 12
	movq	-200(%rbp), %rax
	movq	%rax, -208(%rbp)
.L34:
	.loc 2 97 18
	movq	-200(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_MD_size@PLT
	movq	%rax, -112(%rbp)
	.loc 2 99 26
	movq	-112(%rbp), %rax
	addq	$1, %rax
	addq	%rax, %rax
	.loc 2 99 6
	cmpq	%rax, -160(%rbp)
	jnb	.L35
	.loc 2 100 5
	leaq	.LC0(%rip), %rax
	movl	$100, %r8d
	movq	%rax, %rcx
	movl	$126, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 101 12
	movl	$0, %eax
	jmp	.L49
.L35:
	.loc 2 104 10
	movq	-160(%rbp), %rax
	subq	$1, %rax
	movq	%rax, -104(%rbp)
	.loc 2 105 28
	movq	-112(%rbp), %rax
	addq	%rax, %rax
	.loc 2 105 24
	movq	-104(%rbp), %rdx
	subq	%rax, %rdx
	.loc 2 105 36
	leaq	-1(%rdx), %rax
	.loc 2 105 6
	cmpq	-176(%rbp), %rax
	jnb	.L37
	.loc 2 106 5
	leaq	.LC0(%rip), %rax
	movl	$106, %r8d
	movq	%rax, %rcx
	movl	$114, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 107 12
	movl	$0, %eax
	jmp	.L49
.L37:
	.loc 2 110 17
	movq	-112(%rbp), %rax
	addq	%rax, %rax
	.loc 2 110 25
	addq	$1, %rax
	.loc 2 110 6
	cmpq	%rax, -104(%rbp)
	jnb	.L38
	.loc 2 111 5
	leaq	.LC0(%rip), %rax
	movl	$111, %r8d
	movq	%rax, %rcx
	movl	$126, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 112 12
	movl	$0, %eax
	jmp	.L49
.L38:
	.loc 2 115 9
	movq	-152(%rbp), %rax
	movb	$0, (%rax)
	.loc 2 116 12
	movq	-152(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -96(%rbp)
	.loc 2 117 28
	movq	-112(%rbp), %rax
	leaq	1(%rax), %rdx
	.loc 2 117 12
	movq	-152(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -88(%rbp)
	.loc 2 119 12
	movq	$0, -136(%rbp)
	.loc 2 120 7
	movl	$0, -140(%rbp)
	.loc 2 121 8
	movq	-200(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-192(%rbp), %rsi
	movq	-184(%rbp), %rax
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$0, %ecx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_Digest@PLT
	.loc 2 121 6 discriminator 1
	testl	%eax, %eax
	je	.L51
	.loc 2 124 39
	movq	-104(%rbp), %rax
	subq	-176(%rbp), %rax
	movq	%rax, %rdx
	.loc 2 124 54
	movq	-112(%rbp), %rax
	addq	%rax, %rax
	.loc 2 124 50
	subq	%rax, %rdx
	.loc 2 124 3
	subq	$1, %rdx
	.loc 2 124 21
	movq	-88(%rbp), %rcx
	movq	-112(%rbp), %rax
	addq	%rcx, %rax
	.loc 2 124 3
	movl	$0, %esi
	movq	%rax, %rdi
	call	OPENSSL_memset
	.loc 2 125 12
	movq	-104(%rbp), %rax
	subq	-176(%rbp), %rax
	.loc 2 125 23
	subq	-112(%rbp), %rax
	.loc 2 125 31
	leaq	-1(%rax), %rdx
	.loc 2 125 5
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 125 36
	movb	$1, (%rax)
	.loc 2 126 29
	movq	-104(%rbp), %rax
	subq	-176(%rbp), %rax
	.loc 2 126 40
	subq	-112(%rbp), %rax
	movq	%rax, %rdx
	movq	-88(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	.loc 2 126 3
	movq	-176(%rbp), %rdx
	movq	-168(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	OPENSSL_memcpy
	.loc 2 127 8
	movq	-112(%rbp), %rdx
	movq	-96(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RAND_bytes@PLT
	.loc 2 127 6 discriminator 1
	testl	%eax, %eax
	je	.L52
	.loc 2 131 12
	movq	-104(%rbp), %rax
	subq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_malloc@PLT
	movq	%rax, -136(%rbp)
	.loc 2 132 6
	cmpq	$0, -136(%rbp)
	je	.L53
	.loc 2 137 8
	movq	-104(%rbp), %rax
	subq	-112(%rbp), %rax
	movq	%rax, %rsi
	movq	-208(%rbp), %rdi
	movq	-112(%rbp), %rcx
	movq	-96(%rbp), %rdx
	movq	-136(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PKCS1_MGF1@PLT
	.loc 2 137 6 discriminator 1
	testl	%eax, %eax
	je	.L54
.LBB3:
	.loc 2 140 15
	movq	$0, -128(%rbp)
	.loc 2 140 3
	jmp	.L44
.L45:
	.loc 2 141 7
	movq	-88(%rbp), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %esi
	.loc 2 141 20
	movq	-136(%rbp), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %ecx
	.loc 2 141 7
	movq	-88(%rbp), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 141 11
	xorl	%ecx, %esi
	movl	%esi, %edx
	movb	%dl, (%rax)
	.loc 2 140 42 discriminator 3
	addq	$1, -128(%rbp)
.L44:
	.loc 2 140 32 discriminator 1
	movq	-104(%rbp), %rax
	subq	-112(%rbp), %rax
	.loc 2 140 24 discriminator 1
	cmpq	%rax, -128(%rbp)
	jb	.L45
.LBE3:
	.loc 2 145 8
	movq	-104(%rbp), %rax
	subq	-112(%rbp), %rax
	movq	%rax, %rcx
	movq	-208(%rbp), %rdi
	movq	-88(%rbp), %rdx
	movq	-112(%rbp), %rsi
	leaq	-80(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PKCS1_MGF1@PLT
	.loc 2 145 6 discriminator 1
	testl	%eax, %eax
	je	.L55
.LBB4:
	.loc 2 150 15
	movq	$0, -120(%rbp)
	.loc 2 150 3
	jmp	.L47
.L48:
	.loc 2 151 9
	movq	-96(%rbp), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %esi
	.loc 2 151 24
	leaq	-80(%rbp), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %ecx
	.loc 2 151 9
	movq	-96(%rbp), %rdx
	movq	-120(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 151 13
	xorl	%ecx, %esi
	movl	%esi, %edx
	movb	%dl, (%rax)
	.loc 2 150 34 discriminator 3
	addq	$1, -120(%rbp)
.L47:
	.loc 2 150 24 discriminator 1
	movq	-120(%rbp), %rax
	cmpq	-112(%rbp), %rax
	jb	.L48
.LBE4:
	.loc 2 153 7
	movl	$1, -140(%rbp)
	jmp	.L40
.L51:
	.loc 2 122 5
	nop
	jmp	.L40
.L52:
	.loc 2 128 5
	nop
	jmp	.L40
.L53:
	.loc 2 133 5
	nop
	jmp	.L40
.L54:
	.loc 2 138 5
	nop
	jmp	.L40
.L55:
	.loc 2 146 5
	nop
.L40:
	.loc 2 156 3
	movq	-136(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 2 157 10
	movl	-140(%rbp), %eax
.L49:
	.loc 2 158 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L50
	call	__stack_chk_fail@PLT
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE258:
	.size	aws_lc_fips_0_13_14_RSA_padding_add_PKCS1_OAEP_mgf1, .-aws_lc_fips_0_13_14_RSA_padding_add_PKCS1_OAEP_mgf1
	.section	.text.aws_lc_fips_0_13_14_RSA_padding_check_PKCS1_OAEP_mgf1,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_RSA_padding_check_PKCS1_OAEP_mgf1
	.hidden	aws_lc_fips_0_13_14_RSA_padding_check_PKCS1_OAEP_mgf1
	.type	aws_lc_fips_0_13_14_RSA_padding_check_PKCS1_OAEP_mgf1, @function
aws_lc_fips_0_13_14_RSA_padding_check_PKCS1_OAEP_mgf1:
.LFB259:
	.loc 2 164 61
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$320, %rsp
	movq	%rdi, -264(%rbp)
	movq	%rsi, -272(%rbp)
	movq	%rdx, -280(%rbp)
	movq	%rcx, -288(%rbp)
	movq	%r8, -296(%rbp)
	movq	%r9, -304(%rbp)
	movq	24(%rbp), %rax
	movq	%rax, -312(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, -320(%rbp)
	.loc 2 164 61
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 165 12
	movq	$0, -256(%rbp)
	.loc 2 167 6
	cmpq	$0, -312(%rbp)
	jne	.L57
	.loc 2 168 10
	call	aws_lc_fips_0_13_14_EVP_sha1@PLT
	movq	%rax, -312(%rbp)
.L57:
	.loc 2 170 6
	cmpq	$0, -320(%rbp)
	jne	.L58
	.loc 2 171 12
	movq	-312(%rbp), %rax
	movq	%rax, -320(%rbp)
.L58:
	.loc 2 174 18
	movq	-312(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_MD_size@PLT
	movq	%rax, -200(%rbp)
	.loc 2 179 32
	movq	-200(%rbp), %rax
	addq	$1, %rax
	addq	%rax, %rax
	.loc 2 179 6
	cmpq	%rax, -296(%rbp)
	jb	.L77
	.loc 2 185 27
	movq	-296(%rbp), %rax
	subq	-200(%rbp), %rax
	.loc 2 185 10
	subq	$1, %rax
	movq	%rax, -192(%rbp)
	.loc 2 186 8
	movq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_malloc@PLT
	movq	%rax, -256(%rbp)
	.loc 2 187 6
	cmpq	$0, -256(%rbp)
	je	.L78
	.loc 2 191 18
	movq	-288(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -184(%rbp)
	.loc 2 192 38
	movq	-200(%rbp), %rax
	leaq	1(%rax), %rdx
	.loc 2 192 18
	movq	-288(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -176(%rbp)
	.loc 2 197 8
	movq	-320(%rbp), %rdi
	movq	-192(%rbp), %rcx
	movq	-176(%rbp), %rdx
	movq	-200(%rbp), %rsi
	leaq	-144(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PKCS1_MGF1@PLT
	.loc 2 197 6 discriminator 1
	testl	%eax, %eax
	je	.L79
.LBB5:
	.loc 2 200 15
	movq	$0, -248(%rbp)
	.loc 2 200 3
	jmp	.L64
.L65:
	.loc 2 201 9
	leaq	-144(%rbp), %rdx
	movq	-248(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %ecx
	.loc 2 201 26
	movq	-184(%rbp), %rdx
	movq	-248(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 2 201 13
	xorl	%eax, %ecx
	movl	%ecx, %edx
	leaq	-144(%rbp), %rcx
	movq	-248(%rbp), %rax
	addq	%rcx, %rax
	movb	%dl, (%rax)
	.loc 2 200 34 discriminator 3
	addq	$1, -248(%rbp)
.L64:
	.loc 2 200 24 discriminator 1
	movq	-248(%rbp), %rax
	cmpq	-200(%rbp), %rax
	jb	.L65
.LBE5:
	.loc 2 204 8
	movq	-320(%rbp), %rdi
	movq	-200(%rbp), %rcx
	leaq	-144(%rbp), %rdx
	movq	-192(%rbp), %rsi
	movq	-256(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PKCS1_MGF1@PLT
	.loc 2 204 6 discriminator 1
	testl	%eax, %eax
	je	.L80
.LBB6:
	.loc 2 209 15
	movq	$0, -240(%rbp)
	.loc 2 209 3
	jmp	.L67
.L68:
	.loc 2 210 7
	movq	-256(%rbp), %rdx
	movq	-240(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %esi
	.loc 2 210 22
	movq	-176(%rbp), %rdx
	movq	-240(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %ecx
	.loc 2 210 7
	movq	-256(%rbp), %rdx
	movq	-240(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 210 11
	xorl	%ecx, %esi
	movl	%esi, %edx
	movb	%dl, (%rax)
	.loc 2 209 34 discriminator 3
	addq	$1, -240(%rbp)
.L67:
	.loc 2 209 24 discriminator 1
	movq	-240(%rbp), %rax
	cmpq	-192(%rbp), %rax
	jb	.L68
.LBE6:
	.loc 2 214 8
	movq	-312(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	movq	16(%rbp), %rsi
	movq	-304(%rbp), %rax
	movl	$0, %r9d
	movq	%rcx, %r8
	movl	$0, %ecx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_Digest@PLT
	.loc 2 214 6 discriminator 1
	testl	%eax, %eax
	je	.L81
	.loc 2 218 48
	movq	-200(%rbp), %rdx
	leaq	-80(%rbp), %rcx
	movq	-256(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CRYPTO_memcmp@PLT
	.loc 2 218 24 discriminator 1
	cltq
	movq	%rax, %rdi
	call	constant_time_is_zero_w
	.loc 2 218 17 discriminator 2
	notq	%rax
	movq	%rax, -232(%rbp)
	.loc 2 219 39
	movq	-288(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 2 219 11
	movzbl	%al, %eax
	movq	%rax, %rdi
	call	constant_time_is_zero_w
	.loc 2 219 10 discriminator 1
	notq	%rax
	.loc 2 219 7 discriminator 1
	orq	%rax, -232(%rbp)
	.loc 2 221 17
	movq	$-1, -224(%rbp)
	.loc 2 222 10
	movq	$0, -216(%rbp)
.LBB7:
	.loc 2 223 15
	movq	-200(%rbp), %rax
	movq	%rax, -208(%rbp)
	.loc 2 223 3
	jmp	.L70
.L71:
.LBB8:
	.loc 2 224 50
	movq	-256(%rbp), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 2 224 29
	movzbl	%al, %eax
	movl	$1, %esi
	movq	%rax, %rdi
	call	constant_time_eq_w
	movq	%rax, -160(%rbp)
	.loc 2 225 50
	movq	-256(%rbp), %rdx
	movq	-208(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 2 225 29
	movzbl	%al, %eax
	movl	$0, %esi
	movq	%rax, %rdi
	call	constant_time_eq_w
	movq	%rax, -152(%rbp)
	.loc 2 227 9
	movq	-224(%rbp), %rax
	andq	-160(%rbp), %rax
	movq	-216(%rbp), %rdx
	movq	-208(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	constant_time_select_w
	movq	%rax, -216(%rbp)
	.loc 2 229 9
	movq	-224(%rbp), %rdx
	movq	-160(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	constant_time_select_w
	movq	%rax, -224(%rbp)
	.loc 2 230 35
	movq	-152(%rbp), %rax
	notq	%rax
	.loc 2 230 33
	andq	-224(%rbp), %rax
	.loc 2 230 9
	orq	%rax, -232(%rbp)
.LBE8:
	.loc 2 223 38 discriminator 3
	addq	$1, -208(%rbp)
.L70:
	.loc 2 223 28 discriminator 1
	movq	-208(%rbp), %rax
	cmpq	-192(%rbp), %rax
	jb	.L71
.LBE7:
	.loc 2 233 7
	movq	-224(%rbp), %rax
	orq	%rax, -232(%rbp)
	.loc 2 236 7
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	constant_time_declassify_w
	.loc 2 236 6 discriminator 1
	testq	%rax, %rax
	jne	.L82
	.loc 2 243 15
	movq	-216(%rbp), %rax
	movq	%rax, %rdi
	call	constant_time_declassify_w
	movq	%rax, -216(%rbp)
	.loc 2 245 12
	addq	$1, -216(%rbp)
	.loc 2 246 10
	movq	-192(%rbp), %rax
	subq	-216(%rbp), %rax
	movq	%rax, -168(%rbp)
	.loc 2 247 6
	movq	-280(%rbp), %rax
	cmpq	-168(%rbp), %rax
	jnb	.L73
	.loc 2 248 5
	leaq	.LC0(%rip), %rax
	movl	$248, %r8d
	movq	%rax, %rcx
	movl	$113, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 249 5
	jmp	.L62
.L73:
	.loc 2 252 26
	movq	-256(%rbp), %rdx
	movq	-216(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	.loc 2 252 3
	movq	-168(%rbp), %rdx
	movq	-264(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	OPENSSL_memcpy
	.loc 2 253 12
	movq	-272(%rbp), %rax
	movq	-168(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 2 254 3
	movq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 2 255 10
	movl	$1, %eax
	jmp	.L75
.L77:
	.loc 2 182 5
	nop
	jmp	.L60
.L82:
	.loc 2 237 5
	nop
.L60:
	.loc 2 260 3
	leaq	.LC0(%rip), %rax
	movl	$260, %r8d
	movq	%rax, %rcx
	movl	$133, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	jmp	.L62
.L78:
	.loc 2 188 5
	nop
	jmp	.L62
.L79:
	.loc 2 198 5
	nop
	jmp	.L62
.L80:
	.loc 2 205 5
	nop
	jmp	.L62
.L81:
	.loc 2 215 5
	nop
.L62:
	.loc 2 262 3
	movq	-256(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 2 263 10
	movl	$0, %eax
.L75:
	.loc 2 264 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L76
	call	__stack_chk_fail@PLT
.L76:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE259:
	.size	aws_lc_fips_0_13_14_RSA_padding_check_PKCS1_OAEP_mgf1, .-aws_lc_fips_0_13_14_RSA_padding_check_PKCS1_OAEP_mgf1
	.section	.text.rsa_padding_add_PKCS1_type_2,"ax",@progbits
	.type	rsa_padding_add_PKCS1_type_2, @function
rsa_padding_add_PKCS1_type_2:
.LFB260:
	.loc 2 267 79
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
	.loc 2 269 6
	cmpq	$10, -32(%rbp)
	ja	.L84
	.loc 2 270 5
	leaq	.LC0(%rip), %rax
	movl	$270, %r8d
	movq	%rax, %rcx
	movl	$126, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 271 12
	movl	$0, %eax
	jmp	.L85
.L84:
	.loc 2 274 25
	movq	-32(%rbp), %rax
	subq	$11, %rax
	.loc 2 274 6
	cmpq	-48(%rbp), %rax
	jnb	.L86
	.loc 2 275 5
	leaq	.LC0(%rip), %rax
	movl	$275, %r8d
	movq	%rax, %rcx
	movl	$114, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 276 12
	movl	$0, %eax
	jmp	.L85
.L86:
	.loc 2 279 9
	movq	-24(%rbp), %rax
	movb	$0, (%rax)
	.loc 2 280 5
	movq	-24(%rbp), %rax
	addq	$1, %rax
	.loc 2 280 9
	movb	$2, (%rax)
	.loc 2 282 35
	movq	-32(%rbp), %rax
	subq	-48(%rbp), %rax
	.loc 2 282 10
	subq	$3, %rax
	movq	%rax, -8(%rbp)
	.loc 2 283 3
	movq	-24(%rbp), %rax
	leaq	2(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	rand_nonzero
	.loc 2 284 8
	movq	-8(%rbp), %rax
	leaq	2(%rax), %rdx
	.loc 2 284 5
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 2 284 23
	movb	$0, (%rax)
	.loc 2 285 30
	movq	-32(%rbp), %rax
	subq	-48(%rbp), %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	.loc 2 285 3
	movq	-48(%rbp), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	OPENSSL_memcpy
	.loc 2 286 10
	movl	$1, %eax
.L85:
	.loc 2 287 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE260:
	.size	rsa_padding_add_PKCS1_type_2, .-rsa_padding_add_PKCS1_type_2
	.section	.text.rsa_padding_check_PKCS1_type_2,"ax",@progbits
	.type	rsa_padding_check_PKCS1_type_2, @function
rsa_padding_check_PKCS1_type_2:
.LFB261:
	.loc 2 291 60
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%r8, -104(%rbp)
	.loc 2 292 6
	cmpq	$0, -104(%rbp)
	jne	.L88
	.loc 2 293 5
	leaq	.LC0(%rip), %rax
	movl	$293, %r8d
	movq	%rax, %rcx
	movl	$120, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 294 12
	movl	$0, %eax
	jmp	.L89
.L88:
	.loc 2 299 6
	cmpq	$10, -104(%rbp)
	ja	.L90
	.loc 2 302 5
	leaq	.LC0(%rip), %rax
	movl	$302, %r8d
	movq	%rax, %rcx
	movl	$126, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 303 12
	movl	$0, %eax
	jmp	.L89
.L90:
	.loc 2 306 61
	movq	-96(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 2 306 38
	movzbl	%al, %eax
	movl	$0, %esi
	movq	%rax, %rdi
	call	constant_time_eq_w
	movq	%rax, -40(%rbp)
	.loc 2 307 61
	movq	-96(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	.loc 2 307 38
	movzbl	%al, %eax
	movl	$2, %esi
	movq	%rax, %rdi
	call	constant_time_eq_w
	movq	%rax, -32(%rbp)
	.loc 2 309 17
	movq	$0, -64(%rbp)
	.loc 2 309 33
	movq	$-1, -56(%rbp)
.LBB9:
	.loc 2 310 15
	movq	$2, -48(%rbp)
	.loc 2 310 3
	jmp	.L91
.L92:
.LBB10:
	.loc 2 311 57
	movq	-96(%rbp), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 2 311 29
	movzbl	%al, %eax
	movq	%rax, %rdi
	call	constant_time_is_zero_w
	movq	%rax, -8(%rbp)
	.loc 2 313 9
	movq	-56(%rbp), %rax
	andq	-8(%rbp), %rax
	movq	-64(%rbp), %rdx
	movq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	constant_time_select_w
	movq	%rax, -64(%rbp)
	.loc 2 314 25
	movq	-56(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	constant_time_select_w
	movq	%rax, -56(%rbp)
.LBE10:
	.loc 2 310 37 discriminator 3
	addq	$1, -48(%rbp)
.L91:
	.loc 2 310 24 discriminator 1
	movq	-48(%rbp), %rax
	cmpq	-104(%rbp), %rax
	jb	.L92
.LBE9:
	.loc 2 318 17
	movq	-40(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 2 319 15
	movq	-32(%rbp), %rax
	andq	%rax, -24(%rbp)
	.loc 2 322 18
	movq	-56(%rbp), %rax
	notq	%rax
	.loc 2 322 15
	andq	%rax, -24(%rbp)
	.loc 2 325 18
	movq	-64(%rbp), %rax
	movl	$10, %esi
	movq	%rax, %rdi
	call	constant_time_ge_w
	.loc 2 325 15 discriminator 1
	andq	%rax, -24(%rbp)
	.loc 2 328 13
	addq	$1, -64(%rbp)
	.loc 2 338 6
	cmpq	$0, -24(%rbp)
	jne	.L93
	.loc 2 339 5
	leaq	.LC0(%rip), %rax
	movl	$339, %r8d
	movq	%rax, %rcx
	movl	$137, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 340 12
	movl	$0, %eax
	jmp	.L89
.L93:
	.loc 2 343 16
	movq	-104(%rbp), %rax
	subq	-64(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 2 344 6
	movq	-16(%rbp), %rax
	cmpq	%rax, -88(%rbp)
	jnb	.L94
	.loc 2 347 5
	leaq	.LC0(%rip), %rax
	movl	$347, %r8d
	movq	%rax, %rcx
	movl	$137, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 348 12
	movl	$0, %eax
	jmp	.L89
.L94:
	.loc 2 351 23
	movq	-96(%rbp), %rdx
	movq	-64(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	.loc 2 351 3
	movq	-16(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	OPENSSL_memcpy
	.loc 2 352 12
	movq	-80(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 2 353 10
	movl	$1, %eax
.L89:
	.loc 2 354 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE261:
	.size	rsa_padding_check_PKCS1_type_2, .-rsa_padding_check_PKCS1_type_2
	.section	.text.aws_lc_fips_0_13_14_RSA_public_encrypt,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_RSA_public_encrypt
	.type	aws_lc_fips_0_13_14_RSA_public_encrypt, @function
aws_lc_fips_0_13_14_RSA_public_encrypt:
.LFB262:
	.loc 2 357 37
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
	movl	%r8d, -52(%rbp)
	.loc 2 357 37
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 360 39
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_size@PLT
	.loc 2 360 8 discriminator 1
	movl	%eax, %r10d
	movq	-24(%rbp), %r8
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rdx
	leaq	-16(%rbp), %rsi
	movq	-48(%rbp), %rax
	subq	$8, %rsp
	movl	-52(%rbp), %ecx
	pushq	%rcx
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%r10, %rcx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_encrypt@PLT
	addq	$16, %rsp
	.loc 2 360 6 discriminator 2
	testl	%eax, %eax
	jne	.L96
	.loc 2 361 12
	movl	$-1, %eax
	jmp	.L99
.L96:
	.loc 2 364 15
	movq	-16(%rbp), %rax
	.loc 2 364 6
	cmpq	$2147483647, %rax
	jbe	.L98
	.loc 2 365 5
	leaq	.LC0(%rip), %rax
	movl	$365, %r8d
	movq	%rax, %rcx
	movl	$69, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 366 12
	movl	$-1, %eax
	jmp	.L99
.L98:
	.loc 2 368 10
	movq	-16(%rbp), %rax
.L99:
	.loc 2 369 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L100
	call	__stack_chk_fail@PLT
.L100:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE262:
	.size	aws_lc_fips_0_13_14_RSA_public_encrypt, .-aws_lc_fips_0_13_14_RSA_public_encrypt
	.section	.text.aws_lc_fips_0_13_14_RSA_private_encrypt,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_RSA_private_encrypt
	.type	aws_lc_fips_0_13_14_RSA_private_encrypt, @function
aws_lc_fips_0_13_14_RSA_private_encrypt:
.LFB263:
	.loc 2 372 38
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
	movl	%r8d, -52(%rbp)
	.loc 2 372 38
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 375 40
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_size@PLT
	.loc 2 375 8 discriminator 1
	movl	%eax, %r10d
	movq	-24(%rbp), %r8
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rdx
	leaq	-16(%rbp), %rsi
	movq	-48(%rbp), %rax
	subq	$8, %rsp
	movl	-52(%rbp), %ecx
	pushq	%rcx
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%r10, %rcx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_sign_raw@PLT
	addq	$16, %rsp
	.loc 2 375 6 discriminator 2
	testl	%eax, %eax
	jne	.L102
	.loc 2 376 12
	movl	$-1, %eax
	jmp	.L105
.L102:
	.loc 2 379 15
	movq	-16(%rbp), %rax
	.loc 2 379 6
	cmpq	$2147483647, %rax
	jbe	.L104
	.loc 2 380 5
	leaq	.LC0(%rip), %rax
	movl	$380, %r8d
	movq	%rax, %rcx
	movl	$69, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 381 12
	movl	$-1, %eax
	jmp	.L105
.L104:
	.loc 2 383 10
	movq	-16(%rbp), %rax
.L105:
	.loc 2 384 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L106
	call	__stack_chk_fail@PLT
.L106:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE263:
	.size	aws_lc_fips_0_13_14_RSA_private_encrypt, .-aws_lc_fips_0_13_14_RSA_private_encrypt
	.section	.text.aws_lc_fips_0_13_14_RSA_encrypt,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_RSA_encrypt
	.type	aws_lc_fips_0_13_14_RSA_encrypt, @function
aws_lc_fips_0_13_14_RSA_encrypt:
.LFB264:
	.loc 2 387 64
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -56(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	movq	%rcx, -80(%rbp)
	movq	%r8, -88(%rbp)
	movq	%r9, -96(%rbp)
	.loc 2 388 9
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 388 5
	testq	%rax, %rax
	je	.L108
	.loc 2 388 22 discriminator 1
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 388 28 discriminator 1
	movq	64(%rax), %rax
	.loc 2 388 16 discriminator 1
	testq	%rax, %rax
	je	.L108
.LBB11:
	.loc 2 396 18
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 396 24
	movq	64(%rax), %r9
	.loc 2 396 15
	movq	-80(%rbp), %rax
	movl	%eax, %edi
	movl	16(%rbp), %esi
	movq	-56(%rbp), %rcx
	movq	-72(%rbp), %rdx
	movq	-88(%rbp), %rax
	movl	%esi, %r8d
	movq	%rax, %rsi
	call	*%r9
.LVL0:
	movl	%eax, -40(%rbp)
	.loc 2 397 7
	cmpl	$0, -40(%rbp)
	jns	.L109
	.loc 2 398 16
	movq	-64(%rbp), %rax
	movq	$0, (%rax)
	.loc 2 399 14
	movl	$0, %eax
	jmp	.L110
.L109:
	.loc 2 401 14
	movl	-40(%rbp), %eax
	movslq	%eax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 2 402 12
	movl	$1, %eax
	jmp	.L110
.L108:
.LBE11:
	.loc 2 405 10
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 405 6
	testq	%rax, %rax
	je	.L111
	.loc 2 405 28 discriminator 1
	movq	-56(%rbp), %rax
	movq	16(%rax), %rax
	.loc 2 405 22 discriminator 1
	testq	%rax, %rax
	jne	.L112
.L111:
	.loc 2 406 5
	leaq	.LC0(%rip), %rax
	movl	$406, %r8d
	movq	%rax, %rcx
	movl	$144, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 407 12
	movl	$0, %eax
	jmp	.L110
.L112:
	.loc 2 410 8
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_is_public_component_of_rsa_key_good@PLT
	.loc 2 410 6 discriminator 1
	testl	%eax, %eax
	jne	.L113
	.loc 2 411 12
	movl	$0, %eax
	jmp	.L110
.L113:
	.loc 2 414 29
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_size@PLT
	movl	%eax, -36(%rbp)
	.loc 2 416 12
	movq	$0, -32(%rbp)
	.loc 2 417 11
	movq	$0, -24(%rbp)
	.loc 2 418 10
	movl	$0, -44(%rbp)
	.loc 2 420 15
	movl	-36(%rbp), %eax
	.loc 2 420 6
	cmpq	%rax, -80(%rbp)
	jnb	.L114
	.loc 2 421 5
	leaq	.LC0(%rip), %rax
	movl	$421, %r8d
	movq	%rax, %rcx
	movl	$135, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 422 12
	movl	$0, %eax
	jmp	.L110
.L114:
	.loc 2 425 9
	call	aws_lc_fips_0_13_14_BN_CTX_new@PLT
	movq	%rax, -24(%rbp)
	.loc 2 426 6
	cmpq	$0, -24(%rbp)
	je	.L131
	.loc 2 430 3
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BN_CTX_start@PLT
	.loc 2 431 7
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BN_CTX_get@PLT
	movq	%rax, -16(%rbp)
	.loc 2 432 12
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BN_CTX_get@PLT
	movq	%rax, -8(%rbp)
	.loc 2 433 9
	movl	-36(%rbp), %eax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_malloc@PLT
	movq	%rax, -32(%rbp)
	.loc 2 434 6
	cmpq	$0, -16(%rbp)
	je	.L132
	.loc 2 434 10 discriminator 1
	cmpq	$0, -8(%rbp)
	je	.L132
	.loc 2 434 21 discriminator 2
	cmpq	$0, -32(%rbp)
	je	.L132
	.loc 2 438 3
	cmpl	$4, 16(%rbp)
	je	.L119
	cmpl	$4, 16(%rbp)
	jg	.L120
	cmpl	$1, 16(%rbp)
	je	.L121
	cmpl	$3, 16(%rbp)
	je	.L122
	jmp	.L120
.L121:
	.loc 2 440 11
	movl	-36(%rbp), %esi
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	rsa_padding_add_PKCS1_type_2
	movl	%eax, -48(%rbp)
	.loc 2 441 7
	jmp	.L123
.L119:
	.loc 2 444 11
	movl	-36(%rbp), %esi
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rax
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_padding_add_PKCS1_OAEP_mgf1@PLT
	addq	$16, %rsp
	movl	%eax, -48(%rbp)
	.loc 2 446 7
	jmp	.L123
.L122:
	.loc 2 448 11
	movl	-36(%rbp), %esi
	movq	-96(%rbp), %rcx
	movq	-88(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_padding_add_none@PLT
	movl	%eax, -48(%rbp)
	.loc 2 449 7
	jmp	.L123
.L120:
	.loc 2 451 7
	leaq	.LC0(%rip), %rax
	movl	$451, %r8d
	movq	%rax, %rcx
	movl	$143, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 452 7
	jmp	.L116
.L123:
	.loc 2 455 6
	cmpl	$0, -48(%rbp)
	jle	.L133
	.loc 2 459 7
	movl	-36(%rbp), %ecx
	movq	-16(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BN_bin2bn@PLT
	.loc 2 459 6 discriminator 1
	testq	%rax, %rax
	je	.L134
	.loc 2 463 21
	movq	-56(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 2 463 7
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BN_ucmp@PLT
	.loc 2 463 6 discriminator 1
	testl	%eax, %eax
	js	.L126
	.loc 2 465 5
	leaq	.LC0(%rip), %rax
	movl	$465, %r8d
	movq	%rax, %rcx
	movl	$115, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 466 5
	jmp	.L116
.L126:
	.loc 2 469 60
	movq	-56(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 469 8
	movq	-56(%rbp), %rdx
	leaq	96(%rdx), %rsi
	movq	-56(%rbp), %rdx
	leaq	152(%rdx), %rdi
	movq	-24(%rbp), %rdx
	movq	%rdx, %rcx
	movq	%rax, %rdx
	call	aws_lc_fips_0_13_14_BN_MONT_CTX_set_locked@PLT
	.loc 2 469 6 discriminator 1
	testl	%eax, %eax
	je	.L135
	.loc 2 470 68
	movq	-56(%rbp), %rax
	movq	152(%rax), %r8
	.loc 2 470 47
	movq	-56(%rbp), %rax
	movq	152(%rax), %rax
	.loc 2 470 43
	leaq	24(%rax), %rcx
	.loc 2 470 38
	movq	-56(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 2 470 8
	movq	-24(%rbp), %rdi
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rax
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BN_mod_exp_mont@PLT
	.loc 2 469 70 discriminator 2
	testl	%eax, %eax
	je	.L135
	.loc 2 476 8
	movl	-36(%rbp), %ecx
	movq	-8(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BN_bn2bin_padded@PLT
	.loc 2 476 6 discriminator 1
	testl	%eax, %eax
	jne	.L129
	.loc 2 477 5
	leaq	.LC0(%rip), %rax
	movl	$477, %r8d
	movq	%rax, %rcx
	movl	$68, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 478 5
	jmp	.L116
.L129:
	.loc 2 481 12
	movl	-36(%rbp), %edx
	movq	-64(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 2 482 7
	movl	$1, -44(%rbp)
	jmp	.L116
.L131:
	.loc 2 427 5
	nop
	jmp	.L116
.L132:
	.loc 2 435 5
	nop
	jmp	.L116
.L133:
	.loc 2 456 5
	nop
	jmp	.L116
.L134:
	.loc 2 460 5
	nop
	jmp	.L116
.L135:
	.loc 2 471 5
	nop
.L116:
	.loc 2 485 6
	cmpq	$0, -24(%rbp)
	je	.L130
	.loc 2 486 5
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BN_CTX_end@PLT
	.loc 2 487 5
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_BN_CTX_free@PLT
.L130:
	.loc 2 489 3
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 2 491 10
	movl	-44(%rbp), %eax
.L110:
	.loc 2 492 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE264:
	.size	aws_lc_fips_0_13_14_RSA_encrypt, .-aws_lc_fips_0_13_14_RSA_encrypt
	.section	.text.rsa_default_decrypt,"ax",@progbits
	.type	rsa_default_decrypt, @function
rsa_default_decrypt:
.LFB265:
	.loc 2 496 45
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
	.loc 2 497 29
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_size@PLT
	movl	%eax, -12(%rbp)
	.loc 2 498 12
	movq	$0, -8(%rbp)
	.loc 2 499 7
	movl	$0, -16(%rbp)
	.loc 2 501 15
	movl	-12(%rbp), %eax
	.loc 2 501 6
	cmpq	%rax, -48(%rbp)
	jnb	.L137
	.loc 2 502 5
	leaq	.LC0(%rip), %rax
	movl	$502, %r8d
	movq	%rax, %rcx
	movl	$135, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 503 12
	movl	$0, %eax
	jmp	.L138
.L137:
	.loc 2 506 6
	cmpl	$3, 16(%rbp)
	jne	.L139
	.loc 2 507 9
	movq	-40(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L140
.L139:
	.loc 2 510 11
	movl	-12(%rbp), %eax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_malloc@PLT
	movq	%rax, -8(%rbp)
	.loc 2 511 8
	cmpq	$0, -8(%rbp)
	je	.L150
.L140:
	.loc 2 516 14
	movl	-12(%rbp), %eax
	.loc 2 516 6
	cmpq	%rax, -64(%rbp)
	je	.L142
	.loc 2 517 5
	leaq	.LC0(%rip), %rax
	movl	$517, %r8d
	movq	%rax, %rcx
	movl	$112, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 518 5
	jmp	.L141
.L142:
	.loc 2 521 8
	movl	-12(%rbp), %ecx
	movq	-56(%rbp), %rdx
	movq	-8(%rbp), %rsi
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_rsa_private_transform@PLT
	.loc 2 521 6 discriminator 1
	testl	%eax, %eax
	je	.L151
	.loc 2 525 3
	cmpl	$4, 16(%rbp)
	je	.L144
	cmpl	$4, 16(%rbp)
	jg	.L145
	cmpl	$1, 16(%rbp)
	je	.L146
	cmpl	$3, 16(%rbp)
	je	.L147
	jmp	.L145
.L146:
	.loc 2 528 11
	movl	-12(%rbp), %edi
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	rsa_padding_check_PKCS1_type_2
	movl	%eax, -16(%rbp)
	.loc 2 529 7
	jmp	.L148
.L144:
	.loc 2 532 13
	movl	-12(%rbp), %edi
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rsi
	movq	-40(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	$0
	pushq	$0
	movl	$0, %r9d
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_padding_check_PKCS1_OAEP_mgf1
	addq	$32, %rsp
	movl	%eax, -16(%rbp)
	.loc 2 534 7
	jmp	.L148
.L147:
	.loc 2 536 16
	movl	-12(%rbp), %edx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 2 537 11
	movl	$1, -16(%rbp)
	.loc 2 538 7
	jmp	.L148
.L145:
	.loc 2 540 7
	leaq	.LC0(%rip), %rax
	movl	$540, %r8d
	movq	%rax, %rcx
	movl	$143, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 541 7
	jmp	.L141
.L148:
	.loc 2 545 6
	cmpl	$0, -16(%rbp)
	jne	.L152
	.loc 2 546 5
	leaq	.LC0(%rip), %rax
	movl	$546, %r8d
	movq	%rax, %rcx
	movl	$136, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	jmp	.L141
.L150:
	.loc 2 512 7
	nop
	jmp	.L141
.L151:
	.loc 2 522 5
	nop
	jmp	.L141
.L152:
	.loc 2 551 1
	nop
.L141:
	.loc 2 552 6
	cmpl	$3, 16(%rbp)
	je	.L149
	.loc 2 553 5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
.L149:
	.loc 2 556 10
	movl	-16(%rbp), %eax
.L138:
	.loc 2 557 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE265:
	.size	rsa_default_decrypt, .-rsa_default_decrypt
	.section	.text.aws_lc_fips_0_13_14_RSA_decrypt,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_RSA_decrypt
	.type	aws_lc_fips_0_13_14_RSA_decrypt, @function
aws_lc_fips_0_13_14_RSA_decrypt:
.LFB266:
	.loc 2 560 64
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
	.loc 2 561 10
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 561 6
	testq	%rax, %rax
	je	.L154
	.loc 2 561 23 discriminator 1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 561 29 discriminator 1
	movq	56(%rax), %rax
	.loc 2 561 17 discriminator 1
	testq	%rax, %rax
	je	.L154
.LBB12:
	.loc 2 568 18
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 568 24
	movq	56(%rax), %r9
	.loc 2 568 15
	movq	-48(%rbp), %rax
	movl	%eax, %edi
	movl	16(%rbp), %esi
	movq	-24(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-56(%rbp), %rax
	movl	%esi, %r8d
	movq	%rax, %rsi
	call	*%r9
.LVL1:
	movl	%eax, -4(%rbp)
	.loc 2 569 7
	cmpl	$0, -4(%rbp)
	jns	.L155
	.loc 2 570 16
	movq	-32(%rbp), %rax
	movq	$0, (%rax)
	.loc 2 571 14
	movl	$0, %eax
	jmp	.L156
.L155:
	.loc 2 573 14
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 2 574 12
	movl	$1, %eax
	jmp	.L156
.L154:
.LBE12:
	.loc 2 577 10
	movq	-64(%rbp), %r9
	movq	-56(%rbp), %r8
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rax
	subq	$8, %rsp
	movl	16(%rbp), %edi
	pushq	%rdi
	movq	%rax, %rdi
	call	rsa_default_decrypt
	addq	$16, %rsp
.L156:
	.loc 2 578 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE266:
	.size	aws_lc_fips_0_13_14_RSA_decrypt, .-aws_lc_fips_0_13_14_RSA_decrypt
	.section	.text.aws_lc_fips_0_13_14_RSA_private_decrypt,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_RSA_private_decrypt
	.type	aws_lc_fips_0_13_14_RSA_private_decrypt, @function
aws_lc_fips_0_13_14_RSA_private_decrypt:
.LFB267:
	.loc 2 581 38
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
	movl	%r8d, -52(%rbp)
	.loc 2 581 38
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 583 39
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_size@PLT
	.loc 2 583 8 discriminator 1
	movl	%eax, %r10d
	movq	-24(%rbp), %r8
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rdx
	leaq	-16(%rbp), %rsi
	movq	-48(%rbp), %rax
	subq	$8, %rsp
	movl	-52(%rbp), %ecx
	pushq	%rcx
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%r10, %rcx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_decrypt@PLT
	addq	$16, %rsp
	.loc 2 583 6 discriminator 2
	testl	%eax, %eax
	jne	.L158
	.loc 2 584 12
	movl	$-1, %eax
	jmp	.L161
.L158:
	.loc 2 587 15
	movq	-16(%rbp), %rax
	.loc 2 587 6
	cmpq	$2147483647, %rax
	jbe	.L160
	.loc 2 588 5
	leaq	.LC0(%rip), %rax
	movl	$588, %r8d
	movq	%rax, %rcx
	movl	$69, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 589 12
	movl	$-1, %eax
	jmp	.L161
.L160:
	.loc 2 591 10
	movq	-16(%rbp), %rax
.L161:
	.loc 2 592 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L162
	call	__stack_chk_fail@PLT
.L162:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE267:
	.size	aws_lc_fips_0_13_14_RSA_private_decrypt, .-aws_lc_fips_0_13_14_RSA_private_decrypt
	.section	.text.aws_lc_fips_0_13_14_RSA_public_decrypt,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_RSA_public_decrypt
	.type	aws_lc_fips_0_13_14_RSA_public_decrypt, @function
aws_lc_fips_0_13_14_RSA_public_decrypt:
.LFB268:
	.loc 2 595 37
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
	movl	%r8d, -52(%rbp)
	.loc 2 595 37
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 2 597 42
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_size@PLT
	.loc 2 597 8 discriminator 1
	movl	%eax, %r10d
	movq	-24(%rbp), %r8
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rdx
	leaq	-16(%rbp), %rsi
	movq	-48(%rbp), %rax
	subq	$8, %rsp
	movl	-52(%rbp), %ecx
	pushq	%rcx
	movq	%r8, %r9
	movq	%rdi, %r8
	movq	%r10, %rcx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RSA_verify_raw@PLT
	addq	$16, %rsp
	.loc 2 597 6 discriminator 2
	testl	%eax, %eax
	jne	.L164
	.loc 2 598 12
	movl	$-1, %eax
	jmp	.L167
.L164:
	.loc 2 601 15
	movq	-16(%rbp), %rax
	.loc 2 601 6
	cmpq	$2147483647, %rax
	jbe	.L166
	.loc 2 602 5
	leaq	.LC0(%rip), %rax
	movl	$602, %r8d
	movq	%rax, %rcx
	movl	$69, %edx
	movl	$0, %esi
	movl	$4, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 603 12
	movl	$-1, %eax
	jmp	.L167
.L166:
	.loc 2 605 10
	movq	-16(%rbp), %rax
.L167:
	.loc 2 606 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L168
	call	__stack_chk_fail@PLT
.L168:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE268:
	.size	aws_lc_fips_0_13_14_RSA_public_decrypt, .-aws_lc_fips_0_13_14_RSA_public_decrypt
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/15/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 7 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/base.h"
	.file 8 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/bn.h"
	.file 9 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rsa_extra/../fipsmodule/rsa/internal.h"
	.file 10 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rsa_extra/internal.h"
	.file 11 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/thread.h"
	.file 12 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/ex_data.h"
	.file 13 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/rsa.h"
	.file 14 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rsa_extra/../fipsmodule/bn/internal.h"
	.file 15 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/mem.h"
	.file 16 "/usr/include/string.h"
	.file 17 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/digest.h"
	.file 18 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/err.h"
	.file 19 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/rand.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x16b5
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x24
	.long	.LASF182
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x8
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x6
	.long	.LASF10
	.byte	0x3
	.byte	0xe5
	.byte	0x17
	.long	0x42
	.uleb128 0x10
	.long	0x31
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x25
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x8
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x8
	.byte	0x10
	.byte	0x4
	.long	.LASF5
	.uleb128 0x8
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x8
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x8
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x10
	.long	0x6c
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x6
	.long	.LASF11
	.byte	0x4
	.byte	0x26
	.byte	0x17
	.long	0x5e
	.uleb128 0x8
	.byte	0x2
	.byte	0x5
	.long	.LASF12
	.uleb128 0x6
	.long	.LASF13
	.byte	0x4
	.byte	0x2a
	.byte	0x16
	.long	0x6c
	.uleb128 0x6
	.long	.LASF14
	.byte	0x4
	.byte	0x2c
	.byte	0x19
	.long	0x2a
	.uleb128 0x6
	.long	.LASF15
	.byte	0x4
	.byte	0x2d
	.byte	0x1b
	.long	0x42
	.uleb128 0x26
	.byte	0x8
	.uleb128 0x8
	.byte	0x1
	.byte	0x6
	.long	.LASF16
	.uleb128 0x10
	.long	0xb8
	.uleb128 0x6
	.long	.LASF17
	.byte	0x5
	.byte	0x1b
	.byte	0x13
	.long	0x9e
	.uleb128 0x6
	.long	.LASF18
	.byte	0x6
	.byte	0x18
	.byte	0x13
	.long	0x7f
	.uleb128 0x10
	.long	0xd0
	.uleb128 0x6
	.long	.LASF19
	.byte	0x6
	.byte	0x1a
	.byte	0x14
	.long	0x92
	.uleb128 0x6
	.long	.LASF20
	.byte	0x6
	.byte	0x1b
	.byte	0x14
	.long	0xaa
	.uleb128 0x8
	.byte	0x8
	.byte	0x7
	.long	.LASF21
	.uleb128 0x4
	.long	0x105
	.uleb128 0x27
	.uleb128 0x11
	.long	.LASF22
	.byte	0x7
	.value	0x132
	.byte	0x1b
	.long	0x113
	.uleb128 0x17
	.long	.LASF31
	.uleb128 0x11
	.long	.LASF23
	.byte	0x7
	.value	0x133
	.byte	0x1a
	.long	0x12a
	.uleb128 0x10
	.long	0x118
	.uleb128 0x20
	.long	.LASF28
	.byte	0x18
	.value	0x402
	.long	0x173
	.uleb128 0x18
	.string	"d"
	.value	0x405
	.byte	0xd
	.long	0x4ba
	.byte	0
	.uleb128 0x1b
	.long	.LASF24
	.value	0x414
	.long	0x49
	.byte	0x8
	.uleb128 0x1b
	.long	.LASF25
	.value	0x416
	.long	0x49
	.byte	0xc
	.uleb128 0x18
	.string	"neg"
	.value	0x418
	.byte	0x7
	.long	0x49
	.byte	0x10
	.uleb128 0x1b
	.long	.LASF26
	.value	0x41a
	.long	0x49
	.byte	0x14
	.byte	0
	.uleb128 0x11
	.long	.LASF27
	.byte	0x7
	.value	0x138
	.byte	0x1f
	.long	0x185
	.uleb128 0x10
	.long	0x173
	.uleb128 0x20
	.long	.LASF29
	.byte	0x40
	.value	0x41d
	.long	0x1b5
	.uleb128 0x18
	.string	"RR"
	.value	0x420
	.byte	0xa
	.long	0x118
	.byte	0
	.uleb128 0x18
	.string	"N"
	.value	0x423
	.byte	0xa
	.long	0x118
	.byte	0x18
	.uleb128 0x18
	.string	"n0"
	.value	0x424
	.byte	0xc
	.long	0x4bf
	.byte	0x30
	.byte	0
	.uleb128 0x11
	.long	.LASF30
	.byte	0x7
	.value	0x14a
	.byte	0x1a
	.long	0x1c2
	.uleb128 0x17
	.long	.LASF32
	.uleb128 0x11
	.long	.LASF33
	.byte	0x7
	.value	0x14c
	.byte	0x1a
	.long	0x1d9
	.uleb128 0x10
	.long	0x1c7
	.uleb128 0x17
	.long	.LASF34
	.uleb128 0x11
	.long	.LASF35
	.byte	0x7
	.value	0x16e
	.byte	0x1c
	.long	0x1f0
	.uleb128 0x10
	.long	0x1de
	.uleb128 0x14
	.long	.LASF36
	.byte	0x58
	.byte	0x9
	.byte	0x48
	.byte	0x8
	.long	0x28d
	.uleb128 0x3
	.long	.LASF37
	.byte	0x9
	.byte	0x49
	.byte	0xb
	.long	0xb6
	.byte	0
	.uleb128 0x3
	.long	.LASF38
	.byte	0x9
	.byte	0x4b
	.byte	0xb
	.long	0x564
	.byte	0x8
	.uleb128 0x3
	.long	.LASF39
	.byte	0x9
	.byte	0x4c
	.byte	0xb
	.long	0x564
	.byte	0x10
	.uleb128 0x3
	.long	.LASF40
	.byte	0x9
	.byte	0x4f
	.byte	0xe
	.long	0x57d
	.byte	0x18
	.uleb128 0x3
	.long	.LASF41
	.byte	0x9
	.byte	0x54
	.byte	0xb
	.long	0x5af
	.byte	0x20
	.uleb128 0x3
	.long	.LASF42
	.byte	0x9
	.byte	0x5c
	.byte	0xb
	.long	0x5d7
	.byte	0x28
	.uleb128 0x3
	.long	.LASF43
	.byte	0x9
	.byte	0x64
	.byte	0xb
	.long	0x5d7
	.byte	0x30
	.uleb128 0x3
	.long	.LASF44
	.byte	0x9
	.byte	0x6c
	.byte	0xb
	.long	0x5d7
	.byte	0x38
	.uleb128 0x3
	.long	.LASF45
	.byte	0x9
	.byte	0x74
	.byte	0xb
	.long	0x5d7
	.byte	0x40
	.uleb128 0x3
	.long	.LASF46
	.byte	0x9
	.byte	0x83
	.byte	0xb
	.long	0x5fa
	.byte	0x48
	.uleb128 0x3
	.long	.LASF26
	.byte	0x9
	.byte	0x86
	.byte	0x9
	.long	0x49
	.byte	0x50
	.byte	0
	.uleb128 0x11
	.long	.LASF47
	.byte	0x7
	.value	0x16f
	.byte	0x25
	.long	0x29a
	.uleb128 0x14
	.long	.LASF48
	.byte	0x20
	.byte	0xa
	.byte	0x26
	.byte	0x8
	.long	0x2dc
	.uleb128 0x3
	.long	.LASF49
	.byte	0xa
	.byte	0x27
	.byte	0x19
	.long	0x667
	.byte	0
	.uleb128 0x3
	.long	.LASF50
	.byte	0xa
	.byte	0x28
	.byte	0x17
	.long	0x69f
	.byte	0x8
	.uleb128 0x3
	.long	.LASF51
	.byte	0xa
	.byte	0x29
	.byte	0x10
	.long	0x6a4
	.byte	0x10
	.uleb128 0x3
	.long	.LASF52
	.byte	0xa
	.byte	0x2a
	.byte	0x10
	.long	0x6a4
	.byte	0x18
	.byte	0
	.uleb128 0x28
	.string	"RSA"
	.byte	0x7
	.value	0x171
	.byte	0x17
	.long	0x2ee
	.uleb128 0x10
	.long	0x2dc
	.uleb128 0x14
	.long	.LASF53
	.byte	0xf8
	.byte	0x9
	.byte	0x89
	.byte	0x8
	.long	0x446
	.uleb128 0x3
	.long	.LASF54
	.byte	0x9
	.byte	0x8a
	.byte	0x15
	.long	0x5ff
	.byte	0
	.uleb128 0x12
	.string	"n"
	.byte	0x9
	.byte	0x8c
	.byte	0xb
	.long	0x53a
	.byte	0x8
	.uleb128 0x12
	.string	"e"
	.byte	0x9
	.byte	0x8d
	.byte	0xb
	.long	0x53a
	.byte	0x10
	.uleb128 0x12
	.string	"d"
	.byte	0x9
	.byte	0x8e
	.byte	0xb
	.long	0x53a
	.byte	0x18
	.uleb128 0x12
	.string	"p"
	.byte	0x9
	.byte	0x8f
	.byte	0xb
	.long	0x53a
	.byte	0x20
	.uleb128 0x12
	.string	"q"
	.byte	0x9
	.byte	0x90
	.byte	0xb
	.long	0x53a
	.byte	0x28
	.uleb128 0x3
	.long	.LASF55
	.byte	0x9
	.byte	0x91
	.byte	0xb
	.long	0x53a
	.byte	0x30
	.uleb128 0x3
	.long	.LASF56
	.byte	0x9
	.byte	0x92
	.byte	0xb
	.long	0x53a
	.byte	0x38
	.uleb128 0x3
	.long	.LASF57
	.byte	0x9
	.byte	0x93
	.byte	0xb
	.long	0x53a
	.byte	0x40
	.uleb128 0x12
	.string	"pss"
	.byte	0x9
	.byte	0x96
	.byte	0x16
	.long	0x604
	.byte	0x48
	.uleb128 0x3
	.long	.LASF58
	.byte	0x9
	.byte	0x99
	.byte	0x12
	.long	0x4cf
	.byte	0x50
	.uleb128 0x3
	.long	.LASF59
	.byte	0x9
	.byte	0x9a
	.byte	0x15
	.long	0x49d
	.byte	0x58
	.uleb128 0x3
	.long	.LASF26
	.byte	0x9
	.byte	0x9b
	.byte	0x7
	.long	0x49
	.byte	0x5c
	.uleb128 0x3
	.long	.LASF60
	.byte	0x9
	.byte	0x9d
	.byte	0x10
	.long	0x491
	.byte	0x60
	.uleb128 0x3
	.long	.LASF61
	.byte	0x9
	.byte	0xa1
	.byte	0x10
	.long	0x609
	.byte	0x98
	.uleb128 0x3
	.long	.LASF62
	.byte	0x9
	.byte	0xa2
	.byte	0x10
	.long	0x609
	.byte	0xa0
	.uleb128 0x3
	.long	.LASF63
	.byte	0x9
	.byte	0xa3
	.byte	0x10
	.long	0x609
	.byte	0xa8
	.uleb128 0x3
	.long	.LASF64
	.byte	0x9
	.byte	0xaa
	.byte	0xb
	.long	0x53a
	.byte	0xb0
	.uleb128 0x3
	.long	.LASF65
	.byte	0x9
	.byte	0xaa
	.byte	0x15
	.long	0x53a
	.byte	0xb8
	.uleb128 0x3
	.long	.LASF66
	.byte	0x9
	.byte	0xaa
	.byte	0x22
	.long	0x53a
	.byte	0xc0
	.uleb128 0x3
	.long	.LASF67
	.byte	0x9
	.byte	0xad
	.byte	0xb
	.long	0x53a
	.byte	0xc8
	.uleb128 0x3
	.long	.LASF68
	.byte	0x9
	.byte	0xb2
	.byte	0xa
	.long	0x31
	.byte	0xd0
	.uleb128 0x3
	.long	.LASF69
	.byte	0x9
	.byte	0xb6
	.byte	0x11
	.long	0x60e
	.byte	0xd8
	.uleb128 0x3
	.long	.LASF70
	.byte	0x9
	.byte	0xb7
	.byte	0x12
	.long	0x513
	.byte	0xe0
	.uleb128 0x3
	.long	.LASF71
	.byte	0x9
	.byte	0xb8
	.byte	0xc
	.long	0xed
	.byte	0xe8
	.uleb128 0x29
	.long	.LASF183
	.byte	0x9
	.byte	0xbc
	.byte	0xc
	.long	0x6c
	.byte	0x1
	.value	0x780
	.byte	0
	.uleb128 0x1c
	.long	0xd0
	.long	0x456
	.uleb128 0x1d
	.long	0x42
	.byte	0x3f
	.byte	0
	.uleb128 0x2a
	.long	.LASF184
	.byte	0x38
	.byte	0xb
	.byte	0x5a
	.byte	0xf
	.long	0x47a
	.uleb128 0x21
	.long	.LASF72
	.byte	0x5b
	.byte	0xa
	.long	0x47a
	.uleb128 0x21
	.long	.LASF73
	.byte	0x5c
	.byte	0xb
	.long	0x481
	.byte	0
	.uleb128 0x8
	.byte	0x8
	.byte	0x4
	.long	.LASF74
	.uleb128 0x1c
	.long	0xd0
	.long	0x491
	.uleb128 0x1d
	.long	0x42
	.byte	0x37
	.byte	0
	.uleb128 0x6
	.long	.LASF75
	.byte	0xb
	.byte	0x5d
	.byte	0x3
	.long	0x456
	.uleb128 0x6
	.long	.LASF76
	.byte	0xb
	.byte	0x67
	.byte	0x12
	.long	0xe1
	.uleb128 0x4
	.long	0xbf
	.uleb128 0x6
	.long	.LASF77
	.byte	0x8
	.byte	0xa4
	.byte	0x12
	.long	0xed
	.uleb128 0x4
	.long	0x4ae
	.uleb128 0x1c
	.long	0x4ae
	.long	0x4cf
	.uleb128 0x1d
	.long	0x42
	.byte	0x1
	.byte	0
	.uleb128 0x6
	.long	.LASF78
	.byte	0xc
	.byte	0x80
	.byte	0x22
	.long	0x4db
	.uleb128 0x14
	.long	.LASF79
	.byte	0x8
	.byte	0xc
	.byte	0xc3
	.byte	0x8
	.long	0x4f5
	.uleb128 0x12
	.string	"sk"
	.byte	0xc
	.byte	0xc4
	.byte	0x13
	.long	0x4fa
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF80
	.uleb128 0x4
	.long	0x4f5
	.uleb128 0x4
	.long	0xd0
	.uleb128 0x4
	.long	0x1d4
	.uleb128 0x4
	.long	0xdc
	.uleb128 0x4
	.long	0x31
	.uleb128 0x4
	.long	0x5e
	.uleb128 0x8
	.byte	0x10
	.byte	0x5
	.long	.LASF81
	.uleb128 0x8
	.byte	0x10
	.byte	0x7
	.long	.LASF82
	.uleb128 0x11
	.long	.LASF83
	.byte	0x1
	.value	0x12a
	.byte	0x12
	.long	0xed
	.uleb128 0x8
	.byte	0x1
	.byte	0x2
	.long	.LASF84
	.uleb128 0x4
	.long	0x118
	.uleb128 0x6
	.long	.LASF85
	.byte	0x9
	.byte	0x46
	.byte	0x1f
	.long	0x54b
	.uleb128 0x17
	.long	.LASF86
	.uleb128 0x19
	.long	0x49
	.long	0x55f
	.uleb128 0x1
	.long	0x55f
	.byte	0
	.uleb128 0x4
	.long	0x2dc
	.uleb128 0x4
	.long	0x550
	.uleb128 0x19
	.long	0x31
	.long	0x578
	.uleb128 0x1
	.long	0x578
	.byte	0
	.uleb128 0x4
	.long	0x2e9
	.uleb128 0x4
	.long	0x569
	.uleb128 0x19
	.long	0x49
	.long	0x5aa
	.uleb128 0x1
	.long	0x49
	.uleb128 0x1
	.long	0x509
	.uleb128 0x1
	.long	0x6c
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x5aa
	.uleb128 0x1
	.long	0x578
	.byte	0
	.uleb128 0x4
	.long	0x6c
	.uleb128 0x4
	.long	0x582
	.uleb128 0x19
	.long	0x49
	.long	0x5d7
	.uleb128 0x1
	.long	0x49
	.uleb128 0x1
	.long	0x509
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x55f
	.uleb128 0x1
	.long	0x49
	.byte	0
	.uleb128 0x4
	.long	0x5b4
	.uleb128 0x19
	.long	0x49
	.long	0x5fa
	.uleb128 0x1
	.long	0x55f
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x509
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0x4
	.long	0x5dc
	.uleb128 0x4
	.long	0x1eb
	.uleb128 0x4
	.long	0x28d
	.uleb128 0x4
	.long	0x173
	.uleb128 0x4
	.long	0x613
	.uleb128 0x4
	.long	0x53f
	.uleb128 0x14
	.long	.LASF87
	.byte	0x4
	.byte	0xa
	.byte	0x15
	.byte	0x10
	.long	0x633
	.uleb128 0x12
	.string	"nid"
	.byte	0xa
	.byte	0x16
	.byte	0x7
	.long	0x49
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	.LASF88
	.byte	0xa
	.byte	0x17
	.byte	0x3
	.long	0x618
	.uleb128 0x14
	.long	.LASF89
	.byte	0x10
	.byte	0xa
	.byte	0x19
	.byte	0x10
	.long	0x667
	.uleb128 0x3
	.long	.LASF90
	.byte	0xa
	.byte	0x1b
	.byte	0x19
	.long	0x667
	.byte	0
	.uleb128 0x3
	.long	.LASF91
	.byte	0xa
	.byte	0x1d
	.byte	0x19
	.long	0x667
	.byte	0x8
	.byte	0
	.uleb128 0x4
	.long	0x633
	.uleb128 0x6
	.long	.LASF92
	.byte	0xa
	.byte	0x1e
	.byte	0x3
	.long	0x63f
	.uleb128 0x14
	.long	.LASF93
	.byte	0x8
	.byte	0xa
	.byte	0x20
	.byte	0x10
	.long	0x693
	.uleb128 0x3
	.long	.LASF94
	.byte	0xa
	.byte	0x21
	.byte	0xb
	.long	0xc4
	.byte	0
	.byte	0
	.uleb128 0x6
	.long	.LASF95
	.byte	0xa
	.byte	0x22
	.byte	0x3
	.long	0x678
	.uleb128 0x4
	.long	0x66c
	.uleb128 0x4
	.long	0x693
	.uleb128 0xc
	.long	.LASF96
	.byte	0xd
	.value	0x228
	.byte	0x14
	.long	0x49
	.long	0x6de
	.uleb128 0x1
	.long	0x55f
	.uleb128 0x1
	.long	0x50e
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x509
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x49
	.byte	0
	.uleb128 0xd
	.long	.LASF97
	.byte	0x9
	.byte	0xe5
	.byte	0x5
	.long	0x49
	.long	0x703
	.uleb128 0x1
	.long	0x55f
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x509
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0x1a
	.long	.LASF98
	.byte	0x8
	.value	0x179
	.long	0x715
	.uleb128 0x1
	.long	0x715
	.byte	0
	.uleb128 0x4
	.long	0x106
	.uleb128 0x1a
	.long	.LASF99
	.byte	0x8
	.value	0x186
	.long	0x72c
	.uleb128 0x1
	.long	0x715
	.byte	0
	.uleb128 0xc
	.long	.LASF100
	.byte	0x8
	.value	0x115
	.byte	0x14
	.long	0x49
	.long	0x74d
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x74d
	.byte	0
	.uleb128 0x4
	.long	0x125
	.uleb128 0xc
	.long	.LASF101
	.byte	0x8
	.value	0x3a4
	.byte	0x14
	.long	0x49
	.long	0x782
	.uleb128 0x1
	.long	0x53a
	.uleb128 0x1
	.long	0x74d
	.uleb128 0x1
	.long	0x74d
	.uleb128 0x1
	.long	0x74d
	.uleb128 0x1
	.long	0x715
	.uleb128 0x1
	.long	0x782
	.byte	0
	.uleb128 0x4
	.long	0x180
	.uleb128 0xc
	.long	.LASF102
	.byte	0xe
	.value	0x2d7
	.byte	0x5
	.long	0x49
	.long	0x7ad
	.uleb128 0x1
	.long	0x7ad
	.uleb128 0x1
	.long	0x7b2
	.uleb128 0x1
	.long	0x74d
	.uleb128 0x1
	.long	0x715
	.byte	0
	.uleb128 0x4
	.long	0x609
	.uleb128 0x4
	.long	0x491
	.uleb128 0xc
	.long	.LASF103
	.byte	0x8
	.value	0x1d3
	.byte	0x14
	.long	0x49
	.long	0x7d3
	.uleb128 0x1
	.long	0x74d
	.uleb128 0x1
	.long	0x74d
	.byte	0
	.uleb128 0xd
	.long	.LASF104
	.byte	0x8
	.byte	0xfd
	.byte	0x18
	.long	0x53a
	.long	0x7f3
	.uleb128 0x1
	.long	0x509
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x53a
	.byte	0
	.uleb128 0xd
	.long	.LASF105
	.byte	0x9
	.byte	0xd9
	.byte	0x5
	.long	0x49
	.long	0x818
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x509
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0xc
	.long	.LASF106
	.byte	0x8
	.value	0x182
	.byte	0x18
	.long	0x53a
	.long	0x82f
	.uleb128 0x1
	.long	0x715
	.byte	0
	.uleb128 0x1a
	.long	.LASF107
	.byte	0x8
	.value	0x17d
	.long	0x841
	.uleb128 0x1
	.long	0x715
	.byte	0
	.uleb128 0x2b
	.long	.LASF120
	.byte	0x8
	.value	0x175
	.byte	0x18
	.long	0x715
	.uleb128 0xc
	.long	.LASF108
	.byte	0x9
	.value	0x118
	.byte	0x5
	.long	0x49
	.long	0x865
	.uleb128 0x1
	.long	0x578
	.byte	0
	.uleb128 0xc
	.long	.LASF109
	.byte	0xd
	.value	0x1e4
	.byte	0x14
	.long	0x49
	.long	0x89a
	.uleb128 0x1
	.long	0x55f
	.uleb128 0x1
	.long	0x50e
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x509
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x49
	.byte	0
	.uleb128 0xc
	.long	.LASF110
	.byte	0xd
	.value	0x24f
	.byte	0x19
	.long	0x6c
	.long	0x8b1
	.uleb128 0x1
	.long	0x578
	.byte	0
	.uleb128 0xd
	.long	.LASF111
	.byte	0xf
	.byte	0x74
	.byte	0x14
	.long	0x49
	.long	0x8d1
	.uleb128 0x1
	.long	0x100
	.uleb128 0x1
	.long	0x100
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0xd
	.long	.LASF112
	.byte	0x10
	.byte	0x2f
	.byte	0xe
	.long	0xb6
	.long	0x8f1
	.uleb128 0x1
	.long	0xb6
	.uleb128 0x1
	.long	0x100
	.uleb128 0x1
	.long	0x42
	.byte	0
	.uleb128 0xd
	.long	.LASF113
	.byte	0x10
	.byte	0x41
	.byte	0xe
	.long	0xb6
	.long	0x911
	.uleb128 0x1
	.long	0xb6
	.uleb128 0x1
	.long	0x49
	.uleb128 0x1
	.long	0x42
	.byte	0
	.uleb128 0x2c
	.long	.LASF114
	.byte	0xf
	.byte	0x69
	.byte	0x15
	.long	0x923
	.uleb128 0x1
	.long	0xb6
	.byte	0
	.uleb128 0xc
	.long	.LASF115
	.byte	0xd
	.value	0x2a0
	.byte	0x27
	.long	0x49
	.long	0x94e
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x509
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x504
	.byte	0
	.uleb128 0xd
	.long	.LASF116
	.byte	0xf
	.byte	0x53
	.byte	0x16
	.long	0xb6
	.long	0x964
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0xd
	.long	.LASF117
	.byte	0x11
	.byte	0xce
	.byte	0x14
	.long	0x49
	.long	0x993
	.uleb128 0x1
	.long	0x100
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x5aa
	.uleb128 0x1
	.long	0x504
	.uleb128 0x1
	.long	0x993
	.byte	0
	.uleb128 0x4
	.long	0x1b5
	.uleb128 0x1a
	.long	.LASF118
	.byte	0x12
	.value	0x1cf
	.long	0x9be
	.uleb128 0x1
	.long	0x49
	.uleb128 0x1
	.long	0x49
	.uleb128 0x1
	.long	0x49
	.uleb128 0x1
	.long	0x4a9
	.uleb128 0x1
	.long	0x6c
	.byte	0
	.uleb128 0xd
	.long	.LASF119
	.byte	0x11
	.byte	0xe0
	.byte	0x17
	.long	0x31
	.long	0x9d4
	.uleb128 0x1
	.long	0x504
	.byte	0
	.uleb128 0x2d
	.long	.LASF121
	.byte	0x11
	.byte	0x53
	.byte	0x1e
	.long	0x504
	.uleb128 0xd
	.long	.LASF122
	.byte	0x13
	.byte	0x1e
	.byte	0x14
	.long	0x49
	.long	0x9fb
	.uleb128 0x1
	.long	0x4ff
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0x15
	.long	.LASF125
	.value	0x252
	.long	0x49
	.quad	.LFB268
	.quad	.LFE268-.LFB268
	.uleb128 0x1
	.byte	0x9c
	.long	0xa7c
	.uleb128 0x5
	.long	.LASF123
	.byte	0x2
	.value	0x252
	.byte	0x1f
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.long	.LASF124
	.byte	0x2
	.value	0x252
	.byte	0x34
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"to"
	.byte	0x2
	.value	0x252
	.byte	0x43
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.string	"rsa"
	.byte	0x2
	.value	0x252
	.byte	0x4c
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x5
	.long	.LASF73
	.byte	0x2
	.value	0x253
	.byte	0x1c
	.long	0x49
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x9
	.long	.LASF127
	.value	0x254
	.byte	0xa
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x15
	.long	.LASF126
	.value	0x244
	.long	0x49
	.quad	.LFB267
	.quad	.LFE267-.LFB267
	.uleb128 0x1
	.byte	0x9c
	.long	0xafd
	.uleb128 0x5
	.long	.LASF123
	.byte	0x2
	.value	0x244
	.byte	0x20
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.long	.LASF124
	.byte	0x2
	.value	0x244
	.byte	0x35
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"to"
	.byte	0x2
	.value	0x244
	.byte	0x44
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.string	"rsa"
	.byte	0x2
	.value	0x244
	.byte	0x4d
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x5
	.long	.LASF73
	.byte	0x2
	.value	0x245
	.byte	0x1d
	.long	0x49
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x9
	.long	.LASF127
	.value	0x246
	.byte	0xa
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x15
	.long	.LASF128
	.value	0x22f
	.long	0x49
	.quad	.LFB266
	.quad	.LFE266-.LFB266
	.uleb128 0x1
	.byte	0x9c
	.long	0xbb1
	.uleb128 0x2
	.string	"rsa"
	.byte	0x2
	.value	0x22f
	.byte	0x16
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.long	.LASF127
	.byte	0x2
	.value	0x22f
	.byte	0x23
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"out"
	.byte	0x2
	.value	0x22f
	.byte	0x35
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x5
	.long	.LASF129
	.byte	0x2
	.value	0x22f
	.byte	0x41
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.string	"in"
	.byte	0x2
	.value	0x230
	.byte	0x20
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x5
	.long	.LASF130
	.byte	0x2
	.value	0x230
	.byte	0x2b
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x5
	.long	.LASF73
	.byte	0x2
	.value	0x230
	.byte	0x37
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.quad	.LBB12
	.quad	.LBE12-.LBB12
	.uleb128 0xe
	.string	"ret"
	.value	0x238
	.byte	0x9
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF136
	.byte	0x2
	.value	0x1ee
	.byte	0xc
	.long	0x49
	.quad	.LFB265
	.quad	.LFE265-.LFB265
	.uleb128 0x1
	.byte	0x9c
	.long	0xc82
	.uleb128 0x2
	.string	"rsa"
	.byte	0x2
	.value	0x1ee
	.byte	0x25
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.long	.LASF127
	.byte	0x2
	.value	0x1ee
	.byte	0x32
	.long	0x50e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"out"
	.byte	0x2
	.value	0x1ee
	.byte	0x44
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x5
	.long	.LASF129
	.byte	0x2
	.value	0x1ef
	.byte	0x27
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.string	"in"
	.byte	0x2
	.value	0x1ef
	.byte	0x3f
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x5
	.long	.LASF130
	.byte	0x2
	.value	0x1ef
	.byte	0x4a
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x5
	.long	.LASF73
	.byte	0x2
	.value	0x1f0
	.byte	0x24
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x9
	.long	.LASF131
	.value	0x1f1
	.byte	0x12
	.long	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xe
	.string	"buf"
	.value	0x1f2
	.byte	0xc
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.string	"ret"
	.value	0x1f3
	.byte	0x7
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.string	"err"
	.value	0x227
	.quad	.L141
	.byte	0
	.uleb128 0x15
	.long	.LASF132
	.value	0x182
	.long	0x49
	.quad	.LFB264
	.quad	.LFE264-.LFB264
	.uleb128 0x1
	.byte	0x9c
	.long	0xdae
	.uleb128 0x2
	.string	"rsa"
	.byte	0x2
	.value	0x182
	.byte	0x16
	.long	0x55f
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x5
	.long	.LASF127
	.byte	0x2
	.value	0x182
	.byte	0x23
	.long	0x50e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x2
	.string	"out"
	.byte	0x2
	.value	0x182
	.byte	0x35
	.long	0x4ff
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x5
	.long	.LASF129
	.byte	0x2
	.value	0x182
	.byte	0x41
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x2
	.string	"in"
	.byte	0x2
	.value	0x183
	.byte	0x20
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x5
	.long	.LASF130
	.byte	0x2
	.value	0x183
	.byte	0x2b
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x5
	.long	.LASF73
	.byte	0x2
	.value	0x183
	.byte	0x37
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x9
	.long	.LASF131
	.value	0x19e
	.byte	0x12
	.long	0x73
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0xe
	.string	"f"
	.value	0x19f
	.byte	0xb
	.long	0x53a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF133
	.value	0x19f
	.byte	0xf
	.long	0x53a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xe
	.string	"buf"
	.value	0x1a0
	.byte	0xc
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xe
	.string	"ctx"
	.value	0x1a1
	.byte	0xb
	.long	0x715
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.string	"i"
	.value	0x1a2
	.byte	0x7
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xe
	.string	"ret"
	.value	0x1a2
	.byte	0xa
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1e
	.string	"err"
	.value	0x1e4
	.quad	.L116
	.uleb128 0x13
	.quad	.LBB11
	.quad	.LBE11-.LBB11
	.uleb128 0xe
	.string	"ret"
	.value	0x18c
	.byte	0x9
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	.LASF134
	.value	0x173
	.long	0x49
	.quad	.LFB263
	.quad	.LFE263-.LFB263
	.uleb128 0x1
	.byte	0x9c
	.long	0xe2f
	.uleb128 0x5
	.long	.LASF123
	.byte	0x2
	.value	0x173
	.byte	0x20
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.long	.LASF124
	.byte	0x2
	.value	0x173
	.byte	0x35
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"to"
	.byte	0x2
	.value	0x173
	.byte	0x44
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.string	"rsa"
	.byte	0x2
	.value	0x173
	.byte	0x4d
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x5
	.long	.LASF73
	.byte	0x2
	.value	0x174
	.byte	0x1d
	.long	0x49
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x9
	.long	.LASF127
	.value	0x175
	.byte	0xa
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x15
	.long	.LASF135
	.value	0x164
	.long	0x49
	.quad	.LFB262
	.quad	.LFE262-.LFB262
	.uleb128 0x1
	.byte	0x9c
	.long	0xeb0
	.uleb128 0x5
	.long	.LASF123
	.byte	0x2
	.value	0x164
	.byte	0x1f
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.long	.LASF124
	.byte	0x2
	.value	0x164
	.byte	0x34
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"to"
	.byte	0x2
	.value	0x164
	.byte	0x43
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.string	"rsa"
	.byte	0x2
	.value	0x164
	.byte	0x4c
	.long	0x55f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x5
	.long	.LASF73
	.byte	0x2
	.value	0x165
	.byte	0x1c
	.long	0x49
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x9
	.long	.LASF127
	.value	0x166
	.byte	0xa
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xb
	.long	.LASF137
	.byte	0x2
	.value	0x121
	.byte	0xc
	.long	0x49
	.quad	.LFB261
	.quad	.LFE261-.LFB261
	.uleb128 0x1
	.byte	0x9c
	.long	0xfc5
	.uleb128 0x2
	.string	"out"
	.byte	0x2
	.value	0x121
	.byte	0x34
	.long	0x4ff
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x5
	.long	.LASF127
	.byte	0x2
	.value	0x121
	.byte	0x41
	.long	0x50e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x5
	.long	.LASF129
	.byte	0x2
	.value	0x122
	.byte	0x32
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x5
	.long	.LASF124
	.byte	0x2
	.value	0x122
	.byte	0x4a
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x5
	.long	.LASF138
	.byte	0x2
	.value	0x123
	.byte	0x32
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x9
	.long	.LASF139
	.value	0x132
	.byte	0x11
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x9
	.long	.LASF140
	.value	0x133
	.byte	0x11
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x9
	.long	.LASF141
	.value	0x135
	.byte	0x11
	.long	0x526
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x9
	.long	.LASF142
	.value	0x135
	.byte	0x21
	.long	0x526
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x9
	.long	.LASF143
	.value	0x13e
	.byte	0x11
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x9
	.long	.LASF144
	.value	0x157
	.byte	0x10
	.long	0x3d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x13
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.uleb128 0xe
	.string	"i"
	.value	0x136
	.byte	0xf
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x13
	.quad	.LBB10
	.quad	.LBE10-.LBB10
	.uleb128 0x9
	.long	.LASF145
	.value	0x137
	.byte	0x13
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF146
	.byte	0x2
	.value	0x10a
	.byte	0xc
	.long	0x49
	.quad	.LFB260
	.quad	.LFE260-.LFB260
	.uleb128 0x1
	.byte	0x9c
	.long	0x1037
	.uleb128 0x2
	.string	"to"
	.byte	0x2
	.value	0x10a
	.byte	0x32
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x5
	.long	.LASF147
	.byte	0x2
	.value	0x10a
	.byte	0x3d
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x5
	.long	.LASF124
	.byte	0x2
	.value	0x10b
	.byte	0x38
	.long	0x509
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x5
	.long	.LASF138
	.byte	0x2
	.value	0x10b
	.byte	0x45
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x9
	.long	.LASF148
	.value	0x11a
	.byte	0xa
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x22
	.long	.LASF149
	.byte	0xa0
	.long	0x49
	.quad	.LFB259
	.quad	.LFE259-.LFB259
	.uleb128 0x1
	.byte	0x9c
	.long	0x1236
	.uleb128 0x16
	.string	"out"
	.byte	0xa0
	.byte	0x30
	.long	0x4ff
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0xa
	.long	.LASF127
	.byte	0xa0
	.byte	0x3d
	.long	0x50e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0xa
	.long	.LASF129
	.byte	0xa1
	.byte	0x2e
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0xa
	.long	.LASF124
	.byte	0xa1
	.byte	0x46
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0xa
	.long	.LASF138
	.byte	0xa2
	.byte	0x2e
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0xa
	.long	.LASF150
	.byte	0xa2
	.byte	0x47
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -320
	.uleb128 0xa
	.long	.LASF151
	.byte	0xa3
	.byte	0x2e
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.string	"md"
	.byte	0xa3
	.byte	0x47
	.long	0x504
	.uleb128 0x3
	.byte	0x91
	.sleb128 -328
	.uleb128 0xa
	.long	.LASF152
	.byte	0xa4
	.byte	0x35
	.long	0x504
	.uleb128 0x3
	.byte	0x91
	.sleb128 -336
	.uleb128 0xf
	.string	"db"
	.byte	0xa5
	.byte	0xc
	.long	0x4ff
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x7
	.long	.LASF153
	.byte	0xae
	.byte	0xa
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0x2e
	.long	.LASF154
	.byte	0x2
	.value	0x101
	.byte	0x1
	.quad	.L60
	.uleb128 0x7
	.long	.LASF155
	.byte	0xb9
	.byte	0xa
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x1e
	.string	"err"
	.value	0x105
	.quad	.L62
	.uleb128 0x7
	.long	.LASF156
	.byte	0xbf
	.byte	0x12
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x7
	.long	.LASF157
	.byte	0xc0
	.byte	0x12
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x7
	.long	.LASF158
	.byte	0xc2
	.byte	0xb
	.long	0x446
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x7
	.long	.LASF159
	.byte	0xd5
	.byte	0xb
	.long	0x446
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0xf
	.string	"bad"
	.byte	0xda
	.byte	0x11
	.long	0x526
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x7
	.long	.LASF160
	.byte	0xdd
	.byte	0x11
	.long	0x526
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x7
	.long	.LASF161
	.byte	0xde
	.byte	0xa
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x7
	.long	.LASF162
	.byte	0xf6
	.byte	0xa
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0x1f
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x11c3
	.uleb128 0xf
	.string	"i"
	.byte	0xc8
	.byte	0xf
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.byte	0
	.uleb128 0x1f
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.long	0x11e6
	.uleb128 0xf
	.string	"i"
	.byte	0xd1
	.byte	0xf
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.byte	0
	.uleb128 0x13
	.quad	.LBB7
	.quad	.LBE7-.LBB7
	.uleb128 0xf
	.string	"i"
	.byte	0xdf
	.byte	0xf
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x13
	.quad	.LBB8
	.quad	.LBE8-.LBB8
	.uleb128 0x7
	.long	.LASF163
	.byte	0xe0
	.byte	0x13
	.long	0x526
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x7
	.long	.LASF145
	.byte	0xe1
	.byte	0x13
	.long	0x526
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF164
	.byte	0x56
	.long	0x49
	.quad	.LFB258
	.quad	.LFE258-.LFB258
	.uleb128 0x1
	.byte	0x9c
	.long	0x1387
	.uleb128 0x16
	.string	"to"
	.byte	0x56
	.byte	0x2e
	.long	0x4ff
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0xa
	.long	.LASF147
	.byte	0x56
	.byte	0x39
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0xa
	.long	.LASF124
	.byte	0x57
	.byte	0x34
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -184
	.uleb128 0xa
	.long	.LASF138
	.byte	0x57
	.byte	0x41
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0xa
	.long	.LASF150
	.byte	0x58
	.byte	0x34
	.long	0x509
	.uleb128 0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0xa
	.long	.LASF151
	.byte	0x58
	.byte	0x42
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x16
	.string	"md"
	.byte	0x59
	.byte	0x33
	.long	0x504
	.uleb128 0x3
	.byte	0x91
	.sleb128 -216
	.uleb128 0xa
	.long	.LASF152
	.byte	0x59
	.byte	0x45
	.long	0x504
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0x7
	.long	.LASF153
	.byte	0x61
	.byte	0xa
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x7
	.long	.LASF165
	.byte	0x68
	.byte	0xa
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x7
	.long	.LASF158
	.byte	0x74
	.byte	0xc
	.long	0x4ff
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0xf
	.string	"db"
	.byte	0x75
	.byte	0xc
	.long	0x4ff
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x7
	.long	.LASF166
	.byte	0x77
	.byte	0xc
	.long	0x4ff
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0xf
	.string	"ret"
	.byte	0x78
	.byte	0x7
	.long	0x49
	.uleb128 0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x2f
	.string	"out"
	.byte	0x2
	.byte	0x9b
	.byte	0x1
	.quad	.L40
	.uleb128 0x7
	.long	.LASF167
	.byte	0x90
	.byte	0xb
	.long	0x446
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x1f
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.long	0x1367
	.uleb128 0xf
	.string	"i"
	.byte	0x8c
	.byte	0xf
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.byte	0
	.uleb128 0x13
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0xf
	.string	"i"
	.byte	0x96
	.byte	0xf
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.byte	0
	.byte	0
	.uleb128 0x30
	.long	.LASF180
	.byte	0x2
	.byte	0x4a
	.byte	0xd
	.quad	.LFB257
	.quad	.LFE257-.LFB257
	.uleb128 0x1
	.byte	0x9c
	.long	0x13e0
	.uleb128 0x16
	.string	"out"
	.byte	0x4a
	.byte	0x23
	.long	0x4ff
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.string	"len"
	.byte	0x4a
	.byte	0x2f
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xf
	.string	"i"
	.byte	0x4d
	.byte	0xf
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0xb
	.long	.LASF168
	.byte	0x1
	.value	0x3b6
	.byte	0x15
	.long	0xb6
	.quad	.LFB204
	.quad	.LFE204-.LFB204
	.uleb128 0x1
	.byte	0x9c
	.long	0x1430
	.uleb128 0x2
	.string	"dst"
	.byte	0x1
	.value	0x3b6
	.byte	0x2a
	.long	0xb6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"c"
	.byte	0x1
	.value	0x3b6
	.byte	0x33
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2
	.string	"n"
	.byte	0x1
	.value	0x3b6
	.byte	0x3d
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0xb
	.long	.LASF169
	.byte	0x1
	.value	0x3a6
	.byte	0x15
	.long	0xb6
	.quad	.LFB202
	.quad	.LFE202-.LFB202
	.uleb128 0x1
	.byte	0x9c
	.long	0x1482
	.uleb128 0x2
	.string	"dst"
	.byte	0x1
	.value	0x3a6
	.byte	0x2a
	.long	0xb6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"src"
	.byte	0x1
	.value	0x3a6
	.byte	0x3b
	.long	0x100
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"n"
	.byte	0x1
	.value	0x3a6
	.byte	0x47
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0xb
	.long	.LASF170
	.byte	0x1
	.value	0x223
	.byte	0x13
	.long	0x49
	.quad	.LFB195
	.quad	.LFE195-.LFB195
	.uleb128 0x1
	.byte	0x9c
	.long	0x14b4
	.uleb128 0x2
	.string	"v"
	.byte	0x1
	.value	0x223
	.byte	0x34
	.long	0x49
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0xb
	.long	.LASF171
	.byte	0x1
	.value	0x213
	.byte	0x1d
	.long	0x526
	.quad	.LFB194
	.quad	.LFE194-.LFB194
	.uleb128 0x1
	.byte	0x9c
	.long	0x14e6
	.uleb128 0x2
	.string	"v"
	.byte	0x1
	.value	0x213
	.byte	0x46
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	.LASF172
	.byte	0x1
	.value	0x1c1
	.byte	0x1d
	.long	0x526
	.quad	.LFB187
	.quad	.LFE187-.LFB187
	.uleb128 0x1
	.byte	0x9c
	.long	0x1536
	.uleb128 0x5
	.long	.LASF173
	.byte	0x1
	.value	0x1c1
	.byte	0x42
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"a"
	.byte	0x1
	.value	0x1c2
	.byte	0x42
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"b"
	.byte	0x1
	.value	0x1c3
	.byte	0x42
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.byte	0
	.uleb128 0xb
	.long	.LASF174
	.byte	0x1
	.value	0x1a7
	.byte	0x1d
	.long	0x526
	.quad	.LFB183
	.quad	.LFE183-.LFB183
	.uleb128 0x1
	.byte	0x9c
	.long	0x1576
	.uleb128 0x2
	.string	"a"
	.byte	0x1
	.value	0x1a7
	.byte	0x3e
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"b"
	.byte	0x1
	.value	0x1a8
	.byte	0x3e
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xb
	.long	.LASF175
	.byte	0x1
	.value	0x191
	.byte	0x1d
	.long	0x526
	.quad	.LFB181
	.quad	.LFE181-.LFB181
	.uleb128 0x1
	.byte	0x9c
	.long	0x15a8
	.uleb128 0x2
	.string	"a"
	.byte	0x1
	.value	0x191
	.byte	0x43
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xb
	.long	.LASF176
	.byte	0x1
	.value	0x185
	.byte	0x1d
	.long	0x526
	.quad	.LFB179
	.quad	.LFE179-.LFB179
	.uleb128 0x1
	.byte	0x9c
	.long	0x15e8
	.uleb128 0x2
	.string	"a"
	.byte	0x1
	.value	0x185
	.byte	0x3e
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"b"
	.byte	0x1
	.value	0x186
	.byte	0x3e
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0xb
	.long	.LASF177
	.byte	0x1
	.value	0x15b
	.byte	0x1d
	.long	0x526
	.quad	.LFB177
	.quad	.LFE177-.LFB177
	.uleb128 0x1
	.byte	0x9c
	.long	0x1628
	.uleb128 0x2
	.string	"a"
	.byte	0x1
	.value	0x15b
	.byte	0x3e
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"b"
	.byte	0x1
	.value	0x15c
	.byte	0x3e
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x23
	.long	.LASF178
	.value	0x156
	.byte	0x1d
	.long	0x526
	.quad	.LFB176
	.quad	.LFE176-.LFB176
	.uleb128 0x1
	.byte	0x9c
	.long	0x1659
	.uleb128 0x2
	.string	"a"
	.byte	0x1
	.value	0x156
	.byte	0x3f
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x23
	.long	.LASF179
	.value	0x145
	.byte	0x18
	.long	0xe1
	.quad	.LFB174
	.quad	.LFE174-.LFB174
	.uleb128 0x1
	.byte	0x9c
	.long	0x168a
	.uleb128 0x2
	.string	"a"
	.byte	0x1
	.value	0x145
	.byte	0x33
	.long	0xe1
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x31
	.long	.LASF181
	.byte	0x1
	.value	0x13d
	.byte	0x1d
	.long	0x526
	.quad	.LFB173
	.quad	.LFE173-.LFB173
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x2
	.string	"a"
	.byte	0x1
	.value	0x13d
	.byte	0x3b
	.long	0x526
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 21
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 11
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 2
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0x6b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x19c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB173
	.quad	.LFE173-.LFB173
	.quad	.LFB174
	.quad	.LFE174-.LFB174
	.quad	.LFB176
	.quad	.LFE176-.LFB176
	.quad	.LFB177
	.quad	.LFE177-.LFB177
	.quad	.LFB179
	.quad	.LFE179-.LFB179
	.quad	.LFB181
	.quad	.LFE181-.LFB181
	.quad	.LFB183
	.quad	.LFE183-.LFB183
	.quad	.LFB187
	.quad	.LFE187-.LFB187
	.quad	.LFB194
	.quad	.LFE194-.LFB194
	.quad	.LFB195
	.quad	.LFE195-.LFB195
	.quad	.LFB202
	.quad	.LFE202-.LFB202
	.quad	.LFB204
	.quad	.LFE204-.LFB204
	.quad	.LFB257
	.quad	.LFE257-.LFB257
	.quad	.LFB258
	.quad	.LFE258-.LFB258
	.quad	.LFB259
	.quad	.LFE259-.LFB259
	.quad	.LFB260
	.quad	.LFE260-.LFB260
	.quad	.LFB261
	.quad	.LFE261-.LFB261
	.quad	.LFB262
	.quad	.LFE262-.LFB262
	.quad	.LFB263
	.quad	.LFE263-.LFB263
	.quad	.LFB264
	.quad	.LFE264-.LFB264
	.quad	.LFB265
	.quad	.LFE265-.LFB265
	.quad	.LFB266
	.quad	.LFE266-.LFB266
	.quad	.LFB267
	.quad	.LFE267-.LFB267
	.quad	.LFB268
	.quad	.LFE268-.LFB268
	.quad	0
	.quad	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.long	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.value	0x5
	.byte	0x8
	.byte	0
	.long	0
.LLRL0:
	.byte	0x7
	.quad	.LFB173
	.uleb128 .LFE173-.LFB173
	.byte	0x7
	.quad	.LFB174
	.uleb128 .LFE174-.LFB174
	.byte	0x7
	.quad	.LFB176
	.uleb128 .LFE176-.LFB176
	.byte	0x7
	.quad	.LFB177
	.uleb128 .LFE177-.LFB177
	.byte	0x7
	.quad	.LFB179
	.uleb128 .LFE179-.LFB179
	.byte	0x7
	.quad	.LFB181
	.uleb128 .LFE181-.LFB181
	.byte	0x7
	.quad	.LFB183
	.uleb128 .LFE183-.LFB183
	.byte	0x7
	.quad	.LFB187
	.uleb128 .LFE187-.LFB187
	.byte	0x7
	.quad	.LFB194
	.uleb128 .LFE194-.LFB194
	.byte	0x7
	.quad	.LFB195
	.uleb128 .LFE195-.LFB195
	.byte	0x7
	.quad	.LFB202
	.uleb128 .LFE202-.LFB202
	.byte	0x7
	.quad	.LFB204
	.uleb128 .LFE204-.LFB204
	.byte	0x7
	.quad	.LFB257
	.uleb128 .LFE257-.LFB257
	.byte	0x7
	.quad	.LFB258
	.uleb128 .LFE258-.LFB258
	.byte	0x7
	.quad	.LFB259
	.uleb128 .LFE259-.LFB259
	.byte	0x7
	.quad	.LFB260
	.uleb128 .LFE260-.LFB260
	.byte	0x7
	.quad	.LFB261
	.uleb128 .LFE261-.LFB261
	.byte	0x7
	.quad	.LFB262
	.uleb128 .LFE262-.LFB262
	.byte	0x7
	.quad	.LFB263
	.uleb128 .LFE263-.LFB263
	.byte	0x7
	.quad	.LFB264
	.uleb128 .LFE264-.LFB264
	.byte	0x7
	.quad	.LFB265
	.uleb128 .LFE265-.LFB265
	.byte	0x7
	.quad	.LFB266
	.uleb128 .LFE266-.LFB266
	.byte	0x7
	.quad	.LFB267
	.uleb128 .LFE267-.LFB267
	.byte	0x7
	.quad	.LFB268
	.uleb128 .LFE268-.LFB268
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF65:
	.string	"dmp1_fixed"
.LASF93:
	.string	"rsa_integer_st"
.LASF109:
	.string	"aws_lc_fips_0_13_14_RSA_sign_raw"
.LASF106:
	.string	"aws_lc_fips_0_13_14_BN_CTX_get"
.LASF112:
	.string	"memcpy"
.LASF10:
	.string	"size_t"
.LASF87:
	.string	"rsa_algor_identifier_st"
.LASF110:
	.string	"aws_lc_fips_0_13_14_RSA_size"
.LASF68:
	.string	"num_blindings"
.LASF20:
	.string	"uint64_t"
.LASF171:
	.string	"constant_time_declassify_w"
.LASF57:
	.string	"iqmp"
.LASF11:
	.string	"__uint8_t"
.LASF166:
	.string	"dbmask"
.LASF154:
	.string	"decoding_err"
.LASF61:
	.string	"mont_n"
.LASF62:
	.string	"mont_p"
.LASF63:
	.string	"mont_q"
.LASF157:
	.string	"maskeddb"
.LASF21:
	.string	"long long unsigned int"
.LASF64:
	.string	"d_fixed"
.LASF181:
	.string	"value_barrier_w"
.LASF139:
	.string	"first_byte_is_zero"
.LASF169:
	.string	"OPENSSL_memcpy"
.LASF86:
	.string	"bn_blinding_st"
.LASF34:
	.string	"env_md_st"
.LASF79:
	.string	"crypto_ex_data_st"
.LASF35:
	.string	"RSA_METHOD"
.LASF50:
	.string	"mask_gen_algor"
.LASF135:
	.string	"aws_lc_fips_0_13_14_RSA_public_encrypt"
.LASF14:
	.string	"__int64_t"
.LASF119:
	.string	"aws_lc_fips_0_13_14_EVP_MD_size"
.LASF4:
	.string	"long long int"
.LASF9:
	.string	"signed char"
.LASF71:
	.string	"blinding_fork_generation"
.LASF142:
	.string	"looking_for_index"
.LASF108:
	.string	"aws_lc_fips_0_13_14_is_public_component_of_rsa_key_good"
.LASF22:
	.string	"BN_CTX"
.LASF70:
	.string	"blindings_inuse"
.LASF114:
	.string	"aws_lc_fips_0_13_14_OPENSSL_free"
.LASF126:
	.string	"aws_lc_fips_0_13_14_RSA_private_decrypt"
.LASF47:
	.string	"RSASSA_PSS_PARAMS"
.LASF75:
	.string	"CRYPTO_MUTEX"
.LASF29:
	.string	"bn_mont_ctx_st"
.LASF48:
	.string	"rsassa_pss_params_st"
.LASF2:
	.string	"long int"
.LASF144:
	.string	"msg_len"
.LASF161:
	.string	"one_index"
.LASF80:
	.string	"stack_st_void"
.LASF123:
	.string	"flen"
.LASF107:
	.string	"aws_lc_fips_0_13_14_BN_CTX_start"
.LASF74:
	.string	"double"
.LASF28:
	.string	"bignum_st"
.LASF176:
	.string	"constant_time_ge_w"
.LASF134:
	.string	"aws_lc_fips_0_13_14_RSA_private_encrypt"
.LASF13:
	.string	"__uint32_t"
.LASF173:
	.string	"mask"
.LASF178:
	.string	"constant_time_msb_w"
.LASF92:
	.string	"RSA_MGA_IDENTIFIER"
.LASF94:
	.string	"value"
.LASF174:
	.string	"constant_time_eq_w"
.LASF8:
	.string	"unsigned int"
.LASF118:
	.string	"aws_lc_fips_0_13_14_ERR_put_error"
.LASF104:
	.string	"aws_lc_fips_0_13_14_BN_bin2bn"
.LASF78:
	.string	"CRYPTO_EX_DATA"
.LASF121:
	.string	"aws_lc_fips_0_13_14_EVP_sha1"
.LASF158:
	.string	"seed"
.LASF90:
	.string	"mask_gen"
.LASF58:
	.string	"ex_data"
.LASF3:
	.string	"long unsigned int"
.LASF136:
	.string	"rsa_default_decrypt"
.LASF49:
	.string	"hash_algor"
.LASF45:
	.string	"encrypt"
.LASF132:
	.string	"aws_lc_fips_0_13_14_RSA_encrypt"
.LASF111:
	.string	"aws_lc_fips_0_13_14_CRYPTO_memcmp"
.LASF24:
	.string	"width"
.LASF180:
	.string	"rand_nonzero"
.LASF105:
	.string	"aws_lc_fips_0_13_14_RSA_padding_add_none"
.LASF184:
	.string	"crypto_mutex_st"
.LASF179:
	.string	"value_barrier_u32"
.LASF146:
	.string	"rsa_padding_add_PKCS1_type_2"
.LASF170:
	.string	"constant_time_declassify_int"
.LASF156:
	.string	"maskedseed"
.LASF148:
	.string	"padding_len"
.LASF147:
	.string	"to_len"
.LASF131:
	.string	"rsa_size"
.LASF117:
	.string	"aws_lc_fips_0_13_14_EVP_Digest"
.LASF67:
	.string	"iqmp_mont"
.LASF137:
	.string	"rsa_padding_check_PKCS1_type_2"
.LASF31:
	.string	"bignum_ctx"
.LASF89:
	.string	"rsa_mga_identifier_st"
.LASF140:
	.string	"second_byte_is_two"
.LASF39:
	.string	"finish"
.LASF12:
	.string	"short int"
.LASF129:
	.string	"max_out"
.LASF162:
	.string	"mlen"
.LASF98:
	.string	"aws_lc_fips_0_13_14_BN_CTX_free"
.LASF96:
	.string	"aws_lc_fips_0_13_14_RSA_verify_raw"
.LASF115:
	.string	"aws_lc_fips_0_13_14_PKCS1_MGF1"
.LASF149:
	.string	"aws_lc_fips_0_13_14_RSA_padding_check_PKCS1_OAEP_mgf1"
.LASF33:
	.string	"EVP_MD"
.LASF122:
	.string	"aws_lc_fips_0_13_14_RAND_bytes"
.LASF155:
	.string	"dblen"
.LASF124:
	.string	"from"
.LASF5:
	.string	"long double"
.LASF99:
	.string	"aws_lc_fips_0_13_14_BN_CTX_end"
.LASF91:
	.string	"one_way_hash"
.LASF66:
	.string	"dmq1_fixed"
.LASF150:
	.string	"param"
.LASF143:
	.string	"valid_index"
.LASF27:
	.string	"BN_MONT_CTX"
.LASF183:
	.string	"private_key_frozen"
.LASF30:
	.string	"ENGINE"
.LASF36:
	.string	"rsa_meth_st"
.LASF38:
	.string	"init"
.LASF15:
	.string	"__uint64_t"
.LASF55:
	.string	"dmp1"
.LASF76:
	.string	"CRYPTO_refcount_t"
.LASF177:
	.string	"constant_time_lt_w"
.LASF100:
	.string	"aws_lc_fips_0_13_14_BN_bn2bin_padded"
.LASF72:
	.string	"alignment"
.LASF73:
	.string	"padding"
.LASF125:
	.string	"aws_lc_fips_0_13_14_RSA_public_decrypt"
.LASF59:
	.string	"references"
.LASF82:
	.string	"__int128 unsigned"
.LASF84:
	.string	"_Bool"
.LASF6:
	.string	"unsigned char"
.LASF167:
	.string	"seedmask"
.LASF53:
	.string	"rsa_st"
.LASF37:
	.string	"app_data"
.LASF42:
	.string	"sign_raw"
.LASF54:
	.string	"meth"
.LASF141:
	.string	"zero_index"
.LASF43:
	.string	"verify_raw"
.LASF77:
	.string	"BN_ULONG"
.LASF83:
	.string	"crypto_word_t"
.LASF56:
	.string	"dmq1"
.LASF19:
	.string	"uint32_t"
.LASF130:
	.string	"in_len"
.LASF32:
	.string	"engine_st"
.LASF164:
	.string	"aws_lc_fips_0_13_14_RSA_padding_add_PKCS1_OAEP_mgf1"
.LASF120:
	.string	"aws_lc_fips_0_13_14_BN_CTX_new"
.LASF60:
	.string	"lock"
.LASF16:
	.string	"char"
.LASF25:
	.string	"dmax"
.LASF52:
	.string	"trailer_field"
.LASF168:
	.string	"OPENSSL_memset"
.LASF138:
	.string	"from_len"
.LASF23:
	.string	"BIGNUM"
.LASF46:
	.string	"private_transform"
.LASF95:
	.string	"RSA_INTEGER"
.LASF172:
	.string	"constant_time_select_w"
.LASF81:
	.string	"__int128"
.LASF7:
	.string	"short unsigned int"
.LASF51:
	.string	"salt_len"
.LASF101:
	.string	"aws_lc_fips_0_13_14_BN_mod_exp_mont"
.LASF145:
	.string	"equals0"
.LASF163:
	.string	"equals1"
.LASF152:
	.string	"mgf1md"
.LASF97:
	.string	"aws_lc_fips_0_13_14_rsa_private_transform"
.LASF128:
	.string	"aws_lc_fips_0_13_14_RSA_decrypt"
.LASF113:
	.string	"memset"
.LASF159:
	.string	"phash"
.LASF69:
	.string	"blindings"
.LASF182:
	.ascii	"GNU C11 15"
	.string	".2.0 -m64 -mtune=generic -march=x86-64 -ggdb -g -std=gnu11 -ffunction-sections -fdata-sections -fvisibility=hidden -fno-common -fPIC -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all"
.LASF26:
	.string	"flags"
.LASF18:
	.string	"uint8_t"
.LASF41:
	.string	"sign"
.LASF88:
	.string	"RSA_ALGOR_IDENTIFIER"
.LASF165:
	.string	"emlen"
.LASF44:
	.string	"decrypt"
.LASF151:
	.string	"param_len"
.LASF85:
	.string	"BN_BLINDING"
.LASF153:
	.string	"mdlen"
.LASF40:
	.string	"size"
.LASF103:
	.string	"aws_lc_fips_0_13_14_BN_ucmp"
.LASF127:
	.string	"out_len"
.LASF17:
	.string	"int64_t"
.LASF116:
	.string	"aws_lc_fips_0_13_14_OPENSSL_malloc"
.LASF102:
	.string	"aws_lc_fips_0_13_14_BN_MONT_CTX_set_locked"
.LASF133:
	.string	"result"
.LASF175:
	.string	"constant_time_is_zero_w"
.LASF160:
	.string	"looking_for_one_byte"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/mnt/HARDONE/NSI_Repos/tacvoice/gateway/target/debug/build/aws-lc-fips-sys-802b9ac702614b53/out/build/aws-lc/crypto"
.LASF0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rsa_extra/rsa_crypt.c"
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
