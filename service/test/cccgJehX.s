	.file	"pkcs8_x509.c"
	.text
.Ltext0:
	.file 0 "/mnt/HARDONE/NSI_Repos/tacvoice/gateway/target/debug/build/aws-lc-fips-sys-802b9ac702614b53/out/build/aws-lc/crypto" "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pkcs8/pkcs8_x509.c"
	.section	.text.sk_X509_call_free_func,"ax",@progbits
	.type	sk_X509_call_free_func, @function
sk_X509_call_free_func:
.LFB279:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/x509.h"
	.loc 1 124 1
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
	.loc 1 124 1
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rdi
	call	*%rdx
.LVL0:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE279:
	.size	sk_X509_call_free_func, .-sk_X509_call_free_func
	.section	.text.sk_X509_new_null,"ax",@progbits
	.type	sk_X509_new_null, @function
sk_X509_new_null:
.LFB284:
	.loc 1 124 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 124 1
	call	aws_lc_fips_0_13_14_OPENSSL_sk_new_null@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE284:
	.size	sk_X509_new_null, .-sk_X509_new_null
	.section	.text.sk_X509_num,"ax",@progbits
	.type	sk_X509_num, @function
sk_X509_num:
.LFB285:
	.loc 1 124 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 124 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_num@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE285:
	.size	sk_X509_num, .-sk_X509_num
	.section	.text.sk_X509_value,"ax",@progbits
	.type	sk_X509_value, @function
sk_X509_value:
.LFB287:
	.loc 1 124 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 124 1
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_value@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE287:
	.size	sk_X509_value, .-sk_X509_value
	.section	.text.sk_X509_free,"ax",@progbits
	.type	sk_X509_free, @function
sk_X509_free:
.LFB289:
	.loc 1 124 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 124 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE289:
	.size	sk_X509_free, .-sk_X509_free
	.section	.text.sk_X509_pop_free,"ax",@progbits
	.type	sk_X509_pop_free, @function
sk_X509_pop_free:
.LFB290:
	.loc 1 124 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 124 1
	movq	-16(%rbp), %rdx
	leaq	sk_X509_call_free_func(%rip), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_pop_free_ex@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE290:
	.size	sk_X509_pop_free, .-sk_X509_pop_free
	.section	.text.sk_X509_delete,"ax",@progbits
	.type	sk_X509_delete, @function
sk_X509_delete:
.LFB292:
	.loc 1 124 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 124 1
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_delete@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE292:
	.size	sk_X509_delete, .-sk_X509_delete
	.section	.text.sk_X509_push,"ax",@progbits
	.type	sk_X509_push, @function
sk_X509_push:
.LFB299:
	.loc 1 124 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 124 1
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_push@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE299:
	.size	sk_X509_push, .-sk_X509_push
	.section	.text.sk_X509_pop,"ax",@progbits
	.type	sk_X509_pop, @function
sk_X509_pop:
.LFB300:
	.loc 1 124 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 124 1
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_pop@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE300:
	.size	sk_X509_pop, .-sk_X509_pop
	.section	.text.OPENSSL_memchr,"ax",@progbits
	.type	OPENSSL_memchr, @function
OPENSSL_memchr:
.LFB875:
	.file 2 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pkcs8/../internal.h"
	.loc 2 916 68
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
	.loc 2 917 6
	cmpq	$0, -24(%rbp)
	jne	.L17
	.loc 2 918 12
	movl	$0, %eax
	jmp	.L18
.L17:
	.loc 2 921 10
	movq	-24(%rbp), %rdx
	movl	-12(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	memchr@PLT
.L18:
	.loc 2 922 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE875:
	.size	OPENSSL_memchr, .-OPENSSL_memchr
	.section	.text.OPENSSL_memcpy,"ax",@progbits
	.type	OPENSSL_memcpy, @function
OPENSSL_memcpy:
.LFB877:
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
	jne	.L20
	.loc 2 936 12
	movq	-8(%rbp), %rax
	jmp	.L21
.L20:
	.loc 2 939 10
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
.L21:
	.loc 2 940 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE877:
	.size	OPENSSL_memcpy, .-OPENSSL_memcpy
	.section	.text.OPENSSL_memset,"ax",@progbits
	.type	OPENSSL_memset, @function
OPENSSL_memset:
.LFB879:
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
	jne	.L23
	.loc 2 952 12
	movq	-8(%rbp), %rax
	jmp	.L24
.L23:
	.loc 2 955 10
	movq	-24(%rbp), %rdx
	movl	-12(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L24:
	.loc 2 956 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE879:
	.size	OPENSSL_memset, .-OPENSSL_memset
	.section	.rodata
	.align 8
.LC0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pkcs8/pkcs8_x509.c"
	.align 8
.LC1:
	.string	"kIterationsLimit <= UINT32_MAX"
	.section	.text.aws_lc_fips_0_13_14_pkcs12_iterations_acceptable,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_pkcs12_iterations_acceptable
	.hidden	aws_lc_fips_0_13_14_pkcs12_iterations_acceptable
	.type	aws_lc_fips_0_13_14_pkcs12_iterations_acceptable, @function
aws_lc_fips_0_13_14_pkcs12_iterations_acceptable:
.LFB905:
	.file 3 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pkcs8/pkcs8_x509.c"
	.loc 3 78 55
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 3 90 3
	movq	kIterationsLimit.2(%rip), %rax
	movl	$4294967295, %edx
	cmpq	%rax, %rdx
	jnb	.L26
	.loc 3 90 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.1(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rax
	movq	%rdx, %rcx
	movl	$90, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L26:
	.loc 3 91 25 is_stmt 1
	cmpq	$0, -8(%rbp)
	je	.L27
	.loc 3 91 39 discriminator 1
	movq	kIterationsLimit.2(%rip), %rax
	.loc 3 91 25 discriminator 1
	cmpq	-8(%rbp), %rax
	jb	.L27
	.loc 3 91 25 is_stmt 0 discriminator 3
	movl	$1, %eax
	.loc 3 91 25
	jmp	.L29
.L27:
	.loc 3 91 25 discriminator 4
	movl	$0, %eax
.L29:
	.loc 3 92 1 is_stmt 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE905:
	.size	aws_lc_fips_0_13_14_pkcs12_iterations_acceptable, .-aws_lc_fips_0_13_14_pkcs12_iterations_acceptable
	.section	.rodata
.LC2:
	.string	"version"
.LC3:
	.string	"pkeyalg"
.LC4:
	.string	"pkey"
.LC5:
	.string	"attributes"
	.section	.data.rel.ro.PKCS8_PRIV_KEY_INFO_seq_tt,"aw"
	.align 32
	.type	PKCS8_PRIV_KEY_INFO_seq_tt, @object
	.size	PKCS8_PRIV_KEY_INFO_seq_tt, 128
PKCS8_PRIV_KEY_INFO_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC2
	.quad	aws_lc_fips_0_13_14_ASN1_INTEGER_it
	.long	0
	.long	0
	.quad	8
	.quad	.LC3
	.quad	aws_lc_fips_0_13_14_X509_ALGOR_it
	.long	0
	.long	0
	.quad	16
	.quad	.LC4
	.quad	aws_lc_fips_0_13_14_ASN1_OCTET_STRING_it
	.long	139
	.long	0
	.quad	24
	.quad	.LC5
	.quad	aws_lc_fips_0_13_14_X509_ATTRIBUTE_it
	.globl	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_it
	.section	.rodata
.LC6:
	.string	"PKCS8_PRIV_KEY_INFO"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_it, @object
	.size	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_it, 48
aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_it:
	.byte	1
	.zero	3
	.long	16
	.quad	PKCS8_PRIV_KEY_INFO_seq_tt
	.quad	4
	.quad	0
	.quad	32
	.quad	.LC6
	.section	.text.aws_lc_fips_0_13_14_d2i_PKCS8_PRIV_KEY_INFO,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_PKCS8_PRIV_KEY_INFO
	.type	aws_lc_fips_0_13_14_d2i_PKCS8_PRIV_KEY_INFO, @function
aws_lc_fips_0_13_14_d2i_PKCS8_PRIV_KEY_INFO:
.LFB906:
	.loc 3 101 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 3 101 1
	movq	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_it@GOTPCREL(%rip), %rax
	movq	%rax, %rcx
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_d2i@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE906:
	.size	aws_lc_fips_0_13_14_d2i_PKCS8_PRIV_KEY_INFO, .-aws_lc_fips_0_13_14_d2i_PKCS8_PRIV_KEY_INFO
	.section	.text.aws_lc_fips_0_13_14_i2d_PKCS8_PRIV_KEY_INFO,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_PKCS8_PRIV_KEY_INFO
	.type	aws_lc_fips_0_13_14_i2d_PKCS8_PRIV_KEY_INFO, @function
aws_lc_fips_0_13_14_i2d_PKCS8_PRIV_KEY_INFO:
.LFB907:
	.loc 3 101 1
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
	.loc 3 101 1
	movq	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_i2d@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE907:
	.size	aws_lc_fips_0_13_14_i2d_PKCS8_PRIV_KEY_INFO, .-aws_lc_fips_0_13_14_i2d_PKCS8_PRIV_KEY_INFO
	.section	.text.aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_new
	.type	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_new, @function
aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_new:
.LFB908:
	.loc 3 101 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 3 101 1
	movq	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE908:
	.size	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_new, .-aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_new
	.section	.text.aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_free
	.type	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_free, @function
aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_free:
.LFB909:
	.loc 3 101 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 3 101 1
	movq	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE909:
	.size	aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_free, .-aws_lc_fips_0_13_14_PKCS8_PRIV_KEY_INFO_free
	.section	.text.aws_lc_fips_0_13_14_EVP_PKCS82PKEY,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_EVP_PKCS82PKEY
	.type	aws_lc_fips_0_13_14_EVP_PKCS82PKEY, @function
aws_lc_fips_0_13_14_EVP_PKCS82PKEY:
.LFB910:
	.loc 3 103 57
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	.loc 3 103 57
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 104 12
	movq	$0, -48(%rbp)
	.loc 3 105 17
	leaq	-48(%rbp), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_i2d_PKCS8_PRIV_KEY_INFO@PLT
	movl	%eax, -52(%rbp)
	.loc 3 106 6
	cmpl	$0, -52(%rbp)
	jns	.L38
	.loc 3 107 12
	movl	$0, %eax
	jmp	.L42
.L38:
	.loc 3 111 3
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rcx
	leaq	-32(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_init@PLT
	.loc 3 112 19
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_parse_private_key@PLT
	movq	%rax, -40(%rbp)
	.loc 3 113 6
	cmpq	$0, -40(%rbp)
	je	.L40
	.loc 3 113 22 discriminator 1
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	.loc 3 113 19 discriminator 2
	testq	%rax, %rax
	je	.L41
.L40:
	.loc 3 114 5
	leaq	.LC0(%rip), %rax
	movl	$114, %r8d
	movq	%rax, %rcx
	movl	$104, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 115 5
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_PKEY_free@PLT
	.loc 3 116 5
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 3 117 12
	movl	$0, %eax
	jmp	.L42
.L41:
	.loc 3 120 3
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 3 121 10
	movq	-40(%rbp), %rax
.L42:
	.loc 3 122 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L43
	call	__stack_chk_fail@PLT
.L43:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE910:
	.size	aws_lc_fips_0_13_14_EVP_PKCS82PKEY, .-aws_lc_fips_0_13_14_EVP_PKCS82PKEY
	.section	.text.aws_lc_fips_0_13_14_EVP_PKEY2PKCS8,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_EVP_PKEY2PKCS8
	.type	aws_lc_fips_0_13_14_EVP_PKEY2PKCS8, @function
aws_lc_fips_0_13_14_EVP_PKEY2PKCS8:
.LFB911:
	.loc 3 124 59
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	.loc 3 124 59
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 3 126 12
	movq	$0, -96(%rbp)
	.loc 3 128 8
	leaq	-64(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_init@PLT
	.loc 3 128 6 discriminator 1
	testl	%eax, %eax
	je	.L45
	.loc 3 129 8
	movq	-104(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_marshal_private_key@PLT
	.loc 3 128 26 discriminator 2
	testl	%eax, %eax
	je	.L45
	.loc 3 130 8
	leaq	-88(%rbp), %rdx
	leaq	-96(%rbp), %rcx
	leaq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_finish@PLT
	.loc 3 129 44
	testl	%eax, %eax
	je	.L45
	.loc 3 131 15
	movq	-88(%rbp), %rax
	.loc 3 130 41
	testq	%rax, %rax
	jns	.L46
.L45:
	.loc 3 132 5
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_cleanup@PLT
	.loc 3 133 5
	leaq	.LC0(%rip), %rax
	movl	$133, %r8d
	movq	%rax, %rcx
	movl	$105, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 3 134 5
	jmp	.L47
.L46:
	.loc 3 137 18
	movq	-96(%rbp), %rax
	movq	%rax, -80(%rbp)
	.loc 3 138 29
	movq	-88(%rbp), %rax
	movq	%rax, %rdx
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	mov