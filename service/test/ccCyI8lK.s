	.file	"ocsp_lib.c"
	.text
.Ltext0:
	.file 0 "/mnt/HARDONE/NSI_Repos/tacvoice/service/target/debug/build/aws-lc-fips-sys-d437d42e962aa361/out/build/aws-lc/crypto" "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/ocsp_lib.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/ocsp_lib.c"
	.section	.text.aws_lc_fips_0_13_14_OCSP_cert_to_id,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_cert_to_id
	.type	aws_lc_fips_0_13_14_OCSP_cert_to_id, @function
aws_lc_fips_0_13_14_OCSP_cert_to_id:
.LFB954:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/ocsp_lib.c"
	.loc 1 10 50
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 1 11 6
	cmpq	$0, -56(%rbp)
	jne	.L2
	.loc 1 12 5
	leaq	.LC0(%rip), %rax
	movl	$12, %r8d
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 13 12
	movl	$0, %eax
	jmp	.L3
.L2:
	.loc 1 20 6
	cmpq	$0, -40(%rbp)
	jne	.L4
	.loc 1 21 12
	call	aws_lc_fips_0_13_14_EVP_sha1@PLT
	movq	%rax, -40(%rbp)
.L4:
	.loc 1 23 6
	cmpq	$0, -48(%rbp)
	je	.L5
	.loc 1 24 13
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_X509_get_issuer_name@PLT
	movq	%rax, -24(%rbp)
	.loc 1 25 14
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_X509_get0_serialNumber@PLT
	movq	%rax, -16(%rbp)
	jmp	.L6
.L5:
	.loc 1 27 13
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_X509_get_subject_name@PLT
	movq	%rax, -24(%rbp)
	.loc 1 28 12
	movq	$0, -16(%rbp)
.L6:
	.loc 1 30 10
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_X509_get0_pubkey_bitstr@PLT
	movq	%rax, -8(%rbp)
	.loc 1 31 10
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rsi
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OCSP_cert_id_new@PLT
.L3:
	.loc 1 32 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE954:
	.size	aws_lc_fips_0_13_14_OCSP_cert_to_id, .-aws_lc_fips_0_13_14_OCSP_cert_to_id
	.section	.text.aws_lc_fips_0_13_14_OCSP_cert_id_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_cert_id_new
	.type	aws_lc_fips_0_13_14_OCSP_cert_id_new, @function
aws_lc_fips_0_13_14_OCSP_cert_id_new:
.LFB955:
	.loc 1 36 65
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$144, %rsp
	movq	%rdi, -120(%rbp)
	movq	%rsi, -128(%rbp)
	movq	%rdx, -136(%rbp)
	movq	%rcx, -144(%rbp)
	.loc 1 36 65
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 37 6
	cmpq	$0, -120(%rbp)
	je	.L8
	.loc 1 37 20 discriminator 1
	cmpq	$0, -128(%rbp)
	je	.L8
	.loc 1 37 42 discriminator 2
	cmpq	$0, -136(%rbp)
	jne	.L9
.L8:
	.loc 1 38 5
	leaq	.LC0(%rip), %rax
	movl	$38, %r8d
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 39 12
	movl	$0, %eax
	jmp	.L21
.L9:
	.loc 1 46 22
	call	aws_lc_fips_0_13_14_OCSP_CERTID_new@PLT
	movq	%rax, -96(%rbp)
	.loc 1 47 6
	cmpq	$0, -96(%rbp)
	jne	.L11
	.loc 1 48 12
	movl	$0, %eax
	jmp	.L21
.L11:
	.loc 1 51 7
	movq	-96(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -88(%rbp)
	.loc 1 52 3
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_OBJECT_free@PLT
	.loc 1 53 9
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_MD_type@PLT
	movl	%eax, -100(%rbp)
	.loc 1 54 6
	cmpl	$0, -100(%rbp)
	jne	.L12
	.loc 1 55 5
	leaq	.LC0(%rip), %rax
	movl	$55, %r8d
	movq	%rax, %rcx
	movl	$120, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 56 5
	jmp	.L13
.L12:
	.loc 1 58 20
	movl	-100(%rbp), %eax
	movl	%eax, %edi
	call	aws_lc_fips_0_13_14_OBJ_nid2obj@PLT
	.loc 1 58 18 discriminator 1
	movq	-88(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 59 10
	movq	-88(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 59 6
	testq	%rax, %rax
	je	.L23
	.loc 1 62 20
	call	aws_lc_fips_0_13_14_ASN1_TYPE_new@PLT
	.loc 1 62 18 discriminator 1
	movq	-88(%rbp), %rdx
	movq	%rax, 8(%rdx)
	.loc 1 63 10
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 63 6
	testq	%rax, %rax
	je	.L24
	.loc 1 66 6
	movq	-88(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 66 24
	movl	$5, (%rax)
	.loc 1 68 8
	leaq	-104(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	movq	-120(%rbp), %rsi
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_X509_NAME_digest@PLT
	.loc 1 68 6 discriminator 1
	testl	%eax, %eax
	jne	.L16
	.loc 1 69 5
	leaq	.LC0(%rip), %rax
	movl	$69, %r8d
	movq	%rax, %rcx
	movl	$102, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 70 5
	jmp	.L13
.L16:
	.loc 1 72 9
	movl	-104(%rbp), %eax
	movl	%eax, %edx
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_OCTET_STRING_set@PLT
	.loc 1 72 6 discriminator 1
	testl	%eax, %eax
	je	.L25
	.loc 1 76 45
	movq	-136(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 76 8
	movslq	%eax, %rsi
	.loc 1 76 28
	movq	-136(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 76 8
	movq	-120(%rbp), %rdi
	leaq	-104(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	movl	$0, %r9d
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_Digest@PLT
	.loc 1 76 6 discriminator 1
	testl	%eax, %eax
	je	.L26
	.loc 1 79 9
	movl	-104(%rbp), %eax
	movl	%eax, %edx
	movq	-96(%rbp), %rax
	movq	16(%rax), %rax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_OCTET_STRING_set@PLT
	.loc 1 79 6 discriminator 1
	testl	%eax, %eax
	je	.L27
	.loc 1 83 6
	cmpq	$0, -144(%rbp)
	je	.L20
	.loc 1 84 29
	movq	-96(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 84 9
	movq	-144(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_STRING_copy@PLT
	.loc 1 84 8 discriminator 1
	testl	%eax, %eax
	je	.L28
.L20:
	.loc 1 88 10
	movq	-96(%rbp), %rax
	jmp	.L21
.L23:
	.loc 1 60 5
	nop
	jmp	.L13
.L24:
	.loc 1 64 5
	nop
	jmp	.L13
.L25:
	.loc 1 73 5
	nop
	jmp	.L13
.L26:
	.loc 1 77 5
	nop
	jmp	.L13
.L27:
	.loc 1 80 5
	nop
	jmp	.L13
.L28:
	.loc 1 85 7
	nop
.L13:
	.loc 1 91 3
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OCSP_CERTID_free@PLT
	.loc 1 92 10
	movl	$0, %eax
.L21:
	.loc 1 93 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L22
	call	__stack_chk_fail@PLT
.L22:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE955:
	.size	aws_lc_fips_0_13_14_OCSP_cert_id_new, .-aws_lc_fips_0_13_14_OCSP_cert_id_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_id_issuer_cmp,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_id_issuer_cmp
	.type	aws_lc_fips_0_13_14_OCSP_id_issuer_cmp, @function
aws_lc_fips_0_13_14_OCSP_id_issuer_cmp:
.LFB956:
	.loc 1 95 68
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
	.loc 1 96 6
	cmpq	$0, -24(%rbp)
	je	.L30
	.loc 1 96 17 discriminator 1
	cmpq	$0, -32(%rbp)
	jne	.L31
.L30:
	.loc 1 97 5
	leaq	.LC0(%rip), %rax
	movl	$97, %r8d
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 98 12
	movl	$-1, %eax
	jmp	.L32
.L31:
	.loc 1 101 8
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 101 6
	testq	%rax, %rax
	je	.L33
	.loc 1 101 36 discriminator 1
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 101 32 discriminator 1
	testq	%rax, %rax
	jne	.L34
.L33:
	.loc 1 102 5
	leaq	.LC0(%rip), %rax
	movl	$102, %r8d
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 103 12
	movl	$-1, %eax
	jmp	.L32
.L34:
	.loc 1 106 51
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 106 66
	movq	(%rax), %rdx
	.loc 1 106 22
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 106 37
	movq	(%rax), %rax
	.loc 1 106 13
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OBJ_cmp@PLT
	movl	%eax, -4(%rbp)
	.loc 1 107 6
	cmpl	$0, -4(%rbp)
	je	.L35
	.loc 1 108 12
	movl	-4(%rbp), %eax
	jmp	.L32
.L35:
	.loc 1 110 51
	movq	-32(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 110 32
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 110 9
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_OCTET_STRING_cmp@PLT
	movl	%eax, -4(%rbp)
	.loc 1 111 6
	cmpl	$0, -4(%rbp)
	je	.L36
	.loc 1 112 12
	movl	-4(%rbp), %eax
	jmp	.L32
.L36:
	.loc 1 114 50
	movq	-32(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 114 32
	movq	-24(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 114 9
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_OCTET_STRING_cmp@PLT
	movl	%eax, -4(%rbp)
	.loc 1 115 10
	movl	-4(%rbp), %eax
.L32:
	.loc 1 116 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE956:
	.size	aws_lc_fips_0_13_14_OCSP_id_issuer_cmp, .-aws_lc_fips_0_13_14_OCSP_id_issuer_cmp
	.section	.text.aws_lc_fips_0_13_14_OCSP_id_cmp,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_id_cmp
	.type	aws_lc_fips_0_13_14_OCSP_id_cmp, @function
aws_lc_fips_0_13_14_OCSP_id_cmp:
.LFB957:
	.loc 1 118 61
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
	.loc 1 119 6
	cmpq	$0, -24(%rbp)
	je	.L38
	.loc 1 119 17 discriminator 1
	cmpq	$0, -32(%rbp)
	jne	.L39
.L38:
	.loc 1 120 5
	leaq	.LC0(%rip), %rax
	movl	$120, %r8d
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 121 12
	movl	$-1, %eax
	jmp	.L40
.L39:
	.loc 1 125 13
	movq	-32(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OCSP_id_issuer_cmp@PLT
	movl	%eax, -4(%rbp)
	.loc 1 126 6
	cmpl	$0, -4(%rbp)
	je	.L41
	.loc 1 127 12
	movl	-4(%rbp), %eax
	jmp	.L40
.L41:
	.loc 1 130 44
	movq	-32(%rbp), %rax
	movq	24(%rax), %rdx
	.loc 1 130 27
	movq	-24(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 130 9
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_INTEGER_cmp@PLT
	movl	%eax, -4(%rbp)
	.loc 1 131 10
	movl	-4(%rbp), %eax
.L40:
	.loc 1 132 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE957:
	.size	aws_lc_fips_0_13_14_OCSP_id_cmp, .-aws_lc_fips_0_13_14_OCSP_id_cmp
	.section	.rodata
.LC1:
	.string	"https"
.LC2:
	.string	"443"
.LC3:
	.string	"http"
.LC4:
	.string	"80"
.LC5:
	.string	"/"
	.section	.text.aws_lc_fips_0_13_14_OCSP_parse_url,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_parse_url
	.type	aws_lc_fips_0_13_14_OCSP_parse_url, @function
aws_lc_fips_0_13_14_OCSP_parse_url:
.LFB958:
	.loc 1 135 31
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%r8, -72(%rbp)
	.loc 1 136 6
	cmpq	$0, -40(%rbp)
	je	.L43
	.loc 1 136 19 discriminator 1
	cmpq	$0, -48(%rbp)
	je	.L43
	.loc 1 136 36 discriminator 2
	cmpq	$0, -56(%rbp)
	je	.L43
	.loc 1 136 53 discriminator 3
	cmpq	$0, -64(%rbp)
	je	.L43
	.loc 1 136 70 discriminator 4
	cmpq	$0, -72(%rbp)
	jne	.L44
.L43:
	.loc 1 138 5
	leaq	.LC0(%rip), %rax
	movl	$138, %r8d
	movq	%rax, %rcx
	movl	$67, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 139 12
	movl	$0, %eax
	jmp	.L45
.L44:
	.loc 1 143 9
	movq	$0, -24(%rbp)
	.loc 1 144 9
	movq	$0, -16(%rbp)
	.loc 1 146 10
	movq	-48(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 147 10
	movq	-56(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 148 10
	movq	-64(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 151 12
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strdup@PLT
	movq	%rax, -8(%rbp)
	.loc 1 152 6
	cmpq	$0, -8(%rbp)
	je	.L64
	.loc 1 157 12
	movq	-8(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -32(%rbp)
	.loc 1 158 6
	cmpq	$0, -32(%rbp)
	je	.L65
	.loc 1 161 11
	movq	-32(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	%rdx, -32(%rbp)
	.loc 1 161 15
	movb	$0, (%rax)
	.loc 1 165 7
	leaq	.LC1(%rip), %rcx
	movq	-8(%rbp), %rax
	movl	$5, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 165 6 discriminator 1
	testl	%eax, %eax
	jne	.L50
	.loc 1 166 11
	movq	-72(%rbp), %rax
	movl	$1, (%rax)
	.loc 1 167 10
	leaq	.LC2(%rip), %rax
	movq	%rax, -16(%rbp)
	jmp	.L51
.L50:
	.loc 1 168 14
	leaq	.LC3(%rip), %rcx
	movq	-8(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncmp@PLT
	.loc 1 168 13 discriminator 1
	testl	%eax, %eax
	jne	.L66
	.loc 1 169 11
	movq	-72(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 170 10
	leaq	.LC4(%rip), %rax
	movq	%rax, -16(%rbp)
.L51:
	.loc 1 176 14
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 176 6
	cmpb	$47, %al
	jne	.L67
	.loc 1 176 36 discriminator 1
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	.loc 1 176 26 discriminator 1
	cmpb	$47, %al
	jne	.L67
	.loc 1 179 10
	addq	$2, -32(%rbp)
	.loc 1 180 8
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 183 12
	movq	-32(%rbp), %rax
	movl	$47, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -32(%rbp)
	.loc 1 184 6
	cmpq	$0, -32(%rbp)
	jne	.L55
	.loc 1 186 14
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strdup@PLT
	.loc 1 186 12 discriminator 1
	movq	-64(%rbp), %rdx
	movq	%rax, (%rdx)
	jmp	.L56
.L55:
	.loc 1 188 14
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strdup@PLT
	.loc 1 188 12 discriminator 1
	movq	-64(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 190 13
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
.L56:
	.loc 1 192 7
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 192 6
	testq	%rax, %rax
	je	.L68
	.loc 1 196 10
	movq	-24(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 198 11
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	.loc 1 198 6
	cmpb	$91, %al
	jne	.L58
	.loc 1 199 9
	addq	$1, -24(%rbp)
	.loc 1 200 14
	movq	-24(%rbp), %rax
	movl	$93, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -32(%rbp)
	.loc 1 201 8
	cmpq	$0, -32(%rbp)
	je	.L69
	.loc 1 204 13
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 205 11
	addq	$1, -32(%rbp)
.L58:
	.loc 1 209 17
	movq	-32(%rbp), %rax
	movl	$58, %esi
	movq	%rax, %rdi
	call	strchr@PLT
	movq	%rax, -32(%rbp)
	.loc 1 209 6 discriminator 1
	cmpq	$0, -32(%rbp)
	je	.L60
	.loc 1 210 13
	movq	-32(%rbp), %rax
	movb	$0, (%rax)
	.loc 1 211 10
	movq	-32(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -16(%rbp)
.L60:
	.loc 1 214 12
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strdup@PLT
	.loc 1 214 10 discriminator 1
	movq	-56(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 215 7
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 215 6
	testq	%rax, %rax
	je	.L70
	.loc 1 219 12
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_strdup@PLT
	.loc 1 219 10 discriminator 1
	movq	-48(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 220 7
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 220 6
	testq	%rax, %rax
	je	.L71
	.loc 1 223 3
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 1 224 10
	movl	$1, %eax
	jmp	.L45
.L64:
	.loc 1 153 5
	nop
	jmp	.L47
.L68:
	.loc 1 193 5
	nop
	jmp	.L47
.L70:
	.loc 1 216 5
	nop
	jmp	.L47
.L71:
	.loc 1 221 5
	nop
.L47:
	.loc 1 227 3
	leaq	.LC0(%rip), %rax
	movl	$227, %r8d
	movq	%rax, %rcx
	movl	$65, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 228 3
	jmp	.L63
.L65:
	.loc 1 159 5
	nop
	jmp	.L49
.L66:
	.loc 1 172 5
	nop
	jmp	.L49
.L67:
	.loc 1 177 5
	nop
	jmp	.L49
.L69:
	.loc 1 202 7
	nop
.L49:
	.loc 1 230 3
	leaq	.LC0(%rip), %rax
	movl	$230, %r8d
	movq	%rax, %rcx
	movl	$121, %edx
	movl	$0, %esi
	movl	$23, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
.L63:
	.loc 1 232 3
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 1 233 3
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 1 234 10
	movq	-64(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 235 3
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 1 236 10
	movq	-56(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 237 3
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 1 238 10
	movq	-48(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 239 10
	movl	$0, %eax
.L45:
	.loc 1 240 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE958:
	.size	aws_lc_fips_0_13_14_OCSP_parse_url, .-aws_lc_fips_0_13_14_OCSP_parse_url
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/15/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 5 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/base.h"
	.file 6 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/asn1.h"
	.file 7 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/x509.h"
	.file 8 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/ocsp.h"
	.file 9 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/internal.h"
	.file 10 "/usr/include/string.h"
	.file 11 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/mem.h"
	.file 12 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/obj.h"
	.file 13 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/digest.h"
	.file 14 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/err.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9ba
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x19
	.long	.LASF127
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0xf
	.long	.LASF10
	.byte	0x2
	.byte	0xe5
	.byte	0x17
	.long	0x3d
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1a
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x5
	.byte	0x10
	.byte	0x4
	.long	.LASF5
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x6
	.long	0x59
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0xf
	.long	.LASF11
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x59
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF12
	.uleb128 0x1b
	.byte	0x8
	.uleb128 0x2
	.long	0x94
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x6
	.long	0x94
	.uleb128 0xf
	.long	.LASF14
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.long	0x7a
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF15
	.uleb128 0x2
	.long	0xb8
	.uleb128 0x1c
	.uleb128 0x3
	.long	.LASF16
	.byte	0x5
	.value	0x108
	.byte	0xd
	.long	0x44
	.uleb128 0x3
	.long	.LASF17
	.byte	0x5
	.value	0x10a
	.byte	0x1f
	.long	0xd8
	.uleb128 0x6
	.long	0xc6
	.uleb128 0xc
	.long	.LASF46
	.uleb128 0x3
	.long	.LASF18
	.byte	0x5
	.value	0x10c
	.byte	0x1f
	.long	0xef
	.uleb128 0x6
	.long	0xdd
	.uleb128 0x12
	.long	.LASF38
	.byte	0x18
	.byte	0x6
	.value	0x252
	.long	0x135
	.uleb128 0x9
	.long	.LASF19
	.byte	0x6
	.value	0x253
	.byte	0x7
	.long	0x44
	.byte	0
	.uleb128 0x9
	.long	.LASF20
	.byte	0x6
	.value	0x254
	.byte	0x7
	.long	0x44
	.byte	0x4
	.uleb128 0x9
	.long	.LASF21
	.byte	0x6
	.value	0x255
	.byte	0x12
	.long	0x2d0
	.byte	0x8
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.value	0x256
	.byte	0x8
	.long	0x2a
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.long	.LASF23
	.byte	0x5
	.value	0x10d
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF24
	.byte	0x5
	.value	0x10e
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF25
	.byte	0x5
	.value	0x10f
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF26
	.byte	0x5
	.value	0x110
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF27
	.byte	0x5
	.value	0x111
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF28
	.byte	0x5
	.value	0x112
	.byte	0x1f
	.long	0xef
	.uleb128 0x6
	.long	0x176
	.uleb128 0x3
	.long	.LASF29
	.byte	0x5
	.value	0x113
	.byte	0x1f
	.long	0xef
	.uleb128 0x6
	.long	0x188
	.uleb128 0x3
	.long	.LASF30
	.byte	0x5
	.value	0x114
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF31
	.byte	0x5
	.value	0x115
	.byte	0x1f
	.long	0xef
	.uleb128 0x6
	.long	0x1a7
	.uleb128 0x3
	.long	.LASF32
	.byte	0x5
	.value	0x116
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF33
	.byte	0x5
	.value	0x118
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF34
	.byte	0x5
	.value	0x119
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF35
	.byte	0x5
	.value	0x11a
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF36
	.byte	0x5
	.value	0x11b
	.byte	0x1f
	.long	0xef
	.uleb128 0x3
	.long	.LASF37
	.byte	0x5
	.value	0x11c
	.byte	0x1d
	.long	0x207
	.uleb128 0x12
	.long	.LASF39
	.byte	0x10
	.byte	0x6
	.value	0x642
	.long	0x231
	.uleb128 0x9
	.long	.LASF20
	.byte	0x6
	.value	0x643
	.byte	0x7
	.long	0x44
	.byte	0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x6
	.value	0x65b
	.byte	0x5
	.long	0x2fb
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF41
	.byte	0x5
	.value	0x128
	.byte	0x1e
	.long	0x23e
	.uleb128 0x12
	.long	.LASF42
	.byte	0x10
	.byte	0x7
	.value	0x1147
	.long	0x268
	.uleb128 0x9
	.long	.LASF43
	.byte	0x7
	.value	0x1148
	.byte	0x10
	.long	0x2f1
	.byte	0
	.uleb128 0x9
	.long	.LASF44
	.byte	0x7
	.value	0x1149
	.byte	0xe
	.long	0x44d
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF45
	.byte	0x5
	.value	0x12d
	.byte	0x1d
	.long	0x27a
	.uleb128 0x6
	.long	0x268
	.uleb128 0xc
	.long	.LASF47
	.uleb128 0x3
	.long	.LASF48
	.byte	0x5
	.value	0x14a
	.byte	0x1a
	.long	0x28c
	.uleb128 0xc
	.long	.LASF49
	.uleb128 0x3
	.long	.LASF50
	.byte	0x5
	.value	0x14c
	.byte	0x1a
	.long	0x2a3
	.uleb128 0x6
	.long	0x291
	.uleb128 0xc
	.long	.LASF51
	.uleb128 0x3
	.long	.LASF52
	.byte	0x5
	.value	0x18d
	.byte	0x18
	.long	0x2ba
	.uleb128 0x6
	.long	0x2a8
	.uleb128 0xc
	.long	.LASF53
	.uleb128 0x2
	.long	0x9b
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.long	.LASF54
	.uleb128 0x2
	.long	0x60
	.uleb128 0x2
	.long	0x59
	.uleb128 0x3
	.long	.LASF55
	.byte	0x6
	.value	0x14a
	.byte	0x1e
	.long	0x2e2
	.uleb128 0xc
	.long	.LASF56
	.uleb128 0x2
	.long	0x176
	.uleb128 0x2
	.long	0x183
	.uleb128 0x2
	.long	0xc6
	.uleb128 0x2
	.long	0xd3
	.uleb128 0x1d
	.byte	0x8
	.byte	0x6
	.value	0x644
	.byte	0x3
	.long	0x402
	.uleb128 0x13
	.string	"ptr"
	.value	0x645
	.byte	0xb
	.long	0x8f
	.uleb128 0x4
	.long	.LASF57
	.value	0x646
	.byte	0x12
	.long	0xb9
	.uleb128 0x4
	.long	.LASF58
	.value	0x647
	.byte	0x12
	.long	0x402
	.uleb128 0x4
	.long	.LASF59
	.value	0x648
	.byte	0x12
	.long	0x2f1
	.uleb128 0x4
	.long	.LASF60
	.value	0x649
	.byte	0x13
	.long	0x2e7
	.uleb128 0x4
	.long	.LASF61
	.value	0x64a
	.byte	0x16
	.long	0x407
	.uleb128 0x4
	.long	.LASF62
	.value	0x64b
	.byte	0x16
	.long	0x40c
	.uleb128 0x4
	.long	.LASF63
	.value	0x64c
	.byte	0x18
	.long	0x411
	.uleb128 0x4
	.long	.LASF64
	.value	0x64d
	.byte	0x1b
	.long	0x416
	.uleb128 0x4
	.long	.LASF65
	.value	0x64e
	.byte	0x15
	.long	0x41b
	.uleb128 0x4
	.long	.LASF66
	.value	0x64f
	.byte	0x15
	.long	0x420
	.uleb128 0x4
	.long	.LASF67
	.value	0x650
	.byte	0x19
	.long	0x425
	.uleb128 0x4
	.long	.LASF68
	.value	0x651
	.byte	0x15
	.long	0x42a
	.uleb128 0x4
	.long	.LASF69
	.value	0x652
	.byte	0x1b
	.long	0x42f
	.uleb128 0x4
	.long	.LASF70
	.value	0x653
	.byte	0x13
	.long	0x434
	.uleb128 0x4
	.long	.LASF71
	.value	0x654
	.byte	0x1b
	.long	0x439
	.uleb128 0x4
	.long	.LASF72
	.value	0x655
	.byte	0x19
	.long	0x43e
	.uleb128 0x4
	.long	.LASF73
	.value	0x656
	.byte	0x16
	.long	0x443
	.uleb128 0x13
	.string	"set"
	.value	0x658
	.byte	0x12
	.long	0x402
	.uleb128 0x4
	.long	.LASF74
	.value	0x659
	.byte	0x12
	.long	0x402
	.uleb128 0x4
	.long	.LASF75
	.value	0x65a
	.byte	0x11
	.long	0x448
	.byte	0
	.uleb128 0x2
	.long	0x1a7
	.uleb128 0x2
	.long	0x142
	.uleb128 0x2
	.long	0xdd
	.uleb128 0x2
	.long	0x188
	.uleb128 0x2
	.long	0x19a
	.uleb128 0x2
	.long	0x1b9
	.uleb128 0x2
	.long	0x169
	.uleb128 0x2
	.long	0x15c
	.uleb128 0x2
	.long	0x135
	.uleb128 0x2
	.long	0x1c6
	.uleb128 0x2
	.long	0x1d3
	.uleb128 0x2
	.long	0x14f
	.uleb128 0x2
	.long	0x1ed
	.uleb128 0x2
	.long	0x1e0
	.uleb128 0x2
	.long	0x2d5
	.uleb128 0x2
	.long	0x1fa
	.uleb128 0x2
	.long	0x29e
	.uleb128 0x2
	.long	0xa0
	.uleb128 0x2
	.long	0x2b5
	.uleb128 0x2
	.long	0x268
	.uleb128 0x2
	.long	0x275
	.uleb128 0x2
	.long	0x231
	.uleb128 0xf
	.long	.LASF76
	.byte	0x8
	.byte	0x5b
	.byte	0x20
	.long	0x481
	.uleb128 0x6
	.long	0x470
	.uleb128 0x1e
	.long	.LASF77
	.byte	0x20
	.byte	0x9
	.byte	0x28
	.byte	0x8
	.long	0x4bf
	.uleb128 0x10
	.long	.LASF78
	.byte	0x29
	.byte	0xf
	.long	0x46b
	.byte	0
	.uleb128 0x10
	.long	.LASF79
	.byte	0x2a
	.byte	0x16
	.long	0x411
	.byte	0x8
	.uleb128 0x10
	.long	.LASF80
	.byte	0x2b
	.byte	0x16
	.long	0x411
	.byte	0x10
	.uleb128 0x10
	.long	.LASF81
	.byte	0x2c
	.byte	0x11
	.long	0x2e7
	.byte	0x18
	.byte	0
	.uleb128 0x2
	.long	0x470
	.uleb128 0x2
	.long	0x47c
	.uleb128 0x14
	.long	.LASF88
	.byte	0xb
	.byte	0x69
	.byte	0x15
	.long	0x4db
	.uleb128 0x1
	.long	0x8d
	.byte	0
	.uleb128 0x8
	.long	.LASF82
	.byte	0xa
	.byte	0xae
	.byte	0xc
	.long	0x44
	.long	0x4fb
	.uleb128 0x1
	.long	0x2bf
	.uleb128 0x1
	.long	0x2bf
	.uleb128 0x1
	.long	0x3d
	.byte	0
	.uleb128 0xd
	.long	.LASF83
	.byte	0xa
	.value	0x105
	.byte	0xe
	.long	0x8f
	.long	0x517
	.uleb128 0x1
	.long	0x2bf
	.uleb128 0x1
	.long	0x44
	.byte	0
	.uleb128 0x8
	.long	.LASF84
	.byte	0xb
	.byte	0x7d
	.byte	0x16
	.long	0x8f
	.long	0x52d
	.uleb128 0x1
	.long	0x2bf
	.byte	0
	.uleb128 0xd
	.long	.LASF85
	.byte	0x6
	.value	0x493
	.byte	0x14
	.long	0x44
	.long	0x549
	.uleb128 0x1
	.long	0x2ec
	.uleb128 0x1
	.long	0x2ec
	.byte	0
	.uleb128 0xd
	.long	.LASF86
	.byte	0x6
	.value	0x2fa
	.byte	0x14
	.long	0x44
	.long	0x565
	.uleb128 0x1
	.long	0x565
	.uleb128 0x1
	.long	0x565
	.byte	0
	.uleb128 0x2
	.long	0x195
	.uleb128 0x8
	.long	.LASF87
	.byte	0xc
	.byte	0x5d
	.byte	0x14
	.long	0x44
	.long	0x585
	.uleb128 0x1
	.long	0x2f6
	.uleb128 0x1
	.long	0x2f6
	.byte	0
	.uleb128 0x14
	.long	.LASF89
	.byte	0x8
	.byte	0x70
	.byte	0x1
	.long	0x597
	.uleb128 0x1
	.long	0x4bf
	.byte	0
	.uleb128 0xd
	.long	.LASF90
	.byte	0x6
	.value	0x270
	.byte	0x14
	.long	0x44
	.long	0x5b3
	.uleb128 0x1
	.long	0x402
	.uleb128 0x1
	.long	0x5b3
	.byte	0
	.uleb128 0x2
	.long	0x1b4
	.uleb128 0x8
	.long	.LASF91
	.byte	0xd
	.byte	0xce
	.byte	0x14
	.long	0x44
	.long	0x5e7
	.uleb128 0x1
	.long	0xb3
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x457
	.uleb128 0x1
	.long	0x5e7
	.uleb128 0x1
	.long	0x452
	.uleb128 0x1
	.long	0x5ec
	.byte	0
	.uleb128 0x2
	.long	0x6c
	.uleb128 0x2
	.long	0x27f
	.uleb128 0xd
	.long	.LASF92
	.byte	0x6
	.value	0x2fe
	.byte	0x14
	.long	0x44
	.long	0x612
	.uleb128 0x1
	.long	0x411
	.uleb128 0x1
	.long	0x2cb
	.uleb128 0x1
	.long	0x44
	.byte	0
	.uleb128 0xd
	.long	.LASF93
	.byte	0x7
	.value	0xde0
	.byte	0x14
	.long	0x44
	.long	0x638
	.uleb128 0x1
	.long	0x466
	.uleb128 0x1
	.long	0x452
	.uleb128 0x1
	.long	0x457
	.uleb128 0x1
	.long	0x5e7
	.byte	0
	.uleb128 0x1f
	.long	.LASF97
	.byte	0x6
	.value	0x663
	.byte	0x1b
	.long	0x44d
	.uleb128 0x8
	.long	.LASF94
	.byte	0xc
	.byte	0x95
	.byte	0x1d
	.long	0x2f1
	.long	0x65b
	.uleb128 0x1
	.long	0x44
	.byte	0
	.uleb128 0x8
	.long	.LASF95
	.byte	0xd
	.byte	0xd9
	.byte	0x14
	.long	0x44
	.long	0x671
	.uleb128 0x1
	.long	0x452
	.byte	0
	.uleb128 0x15
	.long	.LASF96
	.byte	0x6
	.value	0x601
	.long	0x683
	.uleb128 0x1
	.long	0x2f1
	.byte	0
	.uleb128 0x16
	.long	.LASF98
	.byte	0x8
	.byte	0x70
	.byte	0x1
	.long	0x4bf
	.uleb128 0x8
	.long	.LASF99
	.byte	0x7
	.byte	0xda
	.byte	0x21
	.long	0x40c
	.long	0x6a5
	.uleb128 0x1
	.long	0x45c
	.byte	0
	.uleb128 0x8
	.long	.LASF100
	.byte	0x7
	.byte	0xc2
	.byte	0x1b
	.long	0x461
	.long	0x6bb
	.uleb128 0x1
	.long	0x45c
	.byte	0
	.uleb128 0x8
	.long	.LASF101
	.byte	0x7
	.byte	0xb6
	.byte	0x24
	.long	0x2ec
	.long	0x6d1
	.uleb128 0x1
	.long	0x45c
	.byte	0
	.uleb128 0x8
	.long	.LASF102
	.byte	0x7
	.byte	0xbf
	.byte	0x1b
	.long	0x461
	.long	0x6e7
	.uleb128 0x1
	.long	0x45c
	.byte	0
	.uleb128 0x16
	.long	.LASF103
	.byte	0xd
	.byte	0x53
	.byte	0x1e
	.long	0x452
	.uleb128 0x15
	.long	.LASF104
	.byte	0xe
	.value	0x1cf
	.long	0x719
	.uleb128 0x1
	.long	0x44
	.uleb128 0x1
	.long	0x44
	.uleb128 0x1
	.long	0x44
	.uleb128 0x1
	.long	0x2bf
	.uleb128 0x1
	.long	0x6c
	.byte	0
	.uleb128 0x11
	.long	.LASF115
	.byte	0x86
	.byte	0x5
	.long	0x44
	.quad	.LFB958
	.quad	.LFE958-.LFB958
	.uleb128 0x1
	.byte	0x9c
	.long	0x7e6
	.uleb128 0xe
	.string	"url"
	.byte	0x86
	.byte	0x20
	.long	0x2bf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.long	.LASF105
	.byte	0x86
	.byte	0x2c
	.long	0x7e6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x7
	.long	.LASF106
	.byte	0x86
	.byte	0x3a
	.long	0x7e6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x7
	.long	.LASF107
	.byte	0x86
	.byte	0x48
	.long	0x7e6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x7
	.long	.LASF108
	.byte	0x87
	.byte	0x19
	.long	0x7eb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0xa
	.long	.LASF109
	.byte	0x8e
	.byte	0x9
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xa
	.long	.LASF110
	.byte	0x8e
	.byte	0x12
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xa
	.long	.LASF111
	.byte	0x8f
	.byte	0x9
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.long	.LASF112
	.byte	0x90
	.byte	0x9
	.long	0x8f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.long	.LASF113
	.byte	0xe2
	.quad	.L47
	.uleb128 0x17
	.long	.LASF114
	.byte	0xe5
	.quad	.L49
	.uleb128 0x18
	.string	"err"
	.byte	0xe7
	.quad	.L63
	.byte	0
	.uleb128 0x2
	.long	0x8f
	.uleb128 0x2
	.long	0x44
	.uleb128 0x11
	.long	.LASF116
	.byte	0x76
	.byte	0x5
	.long	0x44
	.quad	.LFB957
	.quad	.LFE957-.LFB957
	.uleb128 0x1
	.byte	0x9c
	.long	0x838
	.uleb128 0xe
	.string	"a"
	.byte	0x76
	.byte	0x24
	.long	0x4c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.string	"b"
	.byte	0x76
	.byte	0x3a
	.long	0x4c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xb
	.string	"ret"
	.byte	0x7d
	.byte	0x7
	.long	0x44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x11
	.long	.LASF117
	.byte	0x5f
	.byte	0x5
	.long	0x44
	.quad	.LFB956
	.quad	.LFE956-.LFB956
	.uleb128 0x1
	.byte	0x9c
	.long	0x880
	.uleb128 0xe
	.string	"a"
	.byte	0x5f
	.byte	0x2b
	.long	0x4c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xe
	.string	"b"
	.byte	0x5f
	.byte	0x41
	.long	0x4c4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xb
	.string	"ret"
	.byte	0x6a
	.byte	0x7
	.long	0x44
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x11
	.long	.LASF118
	.byte	0x22
	.byte	0xe
	.long	0x4bf
	.quad	.LFB955
	.quad	.LFE955-.LFB955
	.uleb128 0x1
	.byte	0x9c
	.long	0x934
	.uleb128 0x7
	.long	.LASF119
	.byte	0x22
	.byte	0x2d
	.long	0x452
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x7
	.long	.LASF120
	.byte	0x22
	.byte	0x44
	.long	0x466
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x7
	.long	.LASF121
	.byte	0x23
	.byte	0x36
	.long	0x934
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x7
	.long	.LASF81
	.byte	0x24
	.byte	0x33
	.long	0x2ec
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0xb
	.string	"nid"
	.byte	0x2a
	.byte	0x7
	.long	0x44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0xb
	.string	"i"
	.byte	0x2b
	.byte	0x10
	.long	0x6c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0xb
	.string	"alg"
	.byte	0x2c
	.byte	0xf
	.long	0x46b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0xb
	.string	"md"
	.byte	0x2d
	.byte	0x11
	.long	0x939
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0xb
	.string	"cid"
	.byte	0x2e
	.byte	0x10
	.long	0x4bf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x18
	.string	"err"
	.byte	0x5a
	.quad	.L13
	.byte	0
	.uleb128 0x2
	.long	0xea
	.uleb128 0x20
	.long	0x59
	.long	0x949
	.uleb128 0x21
	.long	0x3d
	.byte	0x3f
	.byte	0
	.uleb128 0x22
	.long	.LASF128
	.byte	0x1
	.byte	0x9
	.byte	0xe
	.long	0x4bf
	.quad	.LFB954
	.quad	.LFE954-.LFB954
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.long	.LASF119
	.byte	0x9
	.byte	0x2c
	.long	0x452
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x7
	.long	.LASF122
	.byte	0x9
	.byte	0x3e
	.long	0x45c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x7
	.long	.LASF123
	.byte	0xa
	.byte	0x2a
	.long	0x45c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0xa
	.long	.LASF124
	.byte	0x10
	.byte	0x14
	.long	0x466
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xa
	.long	.LASF125
	.byte	0x11
	.byte	0x17
	.long	0x2ec
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xa
	.long	.LASF126
	.byte	0x12
	.byte	0x14
	.long	0x40c
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x9
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0xc
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 9
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
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x6c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB954
	.quad	.LFE954-.LFB954
	.quad	.LFB955
	.quad	.LFE955-.LFB955
	.quad	.LFB956
	.quad	.LFE956-.LFB956
	.quad	.LFB957
	.quad	.LFE957-.LFB957
	.quad	.LFB958
	.quad	.LFE958-.LFB958
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
	.quad	.LFB954
	.uleb128 .LFE954-.LFB954
	.byte	0x7
	.quad	.LFB955
	.uleb128 .LFE955-.LFB955
	.byte	0x7
	.quad	.LFB956
	.uleb128 .LFE956-.LFB956
	.byte	0x7
	.quad	.LFB957
	.uleb128 .LFE957-.LFB957
	.byte	0x7
	.quad	.LFB958
	.uleb128 .LFE958-.LFB958
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF41:
	.string	"X509_ALGOR"
.LASF17:
	.string	"ASN1_OBJECT"
.LASF10:
	.string	"size_t"
.LASF100:
	.string	"aws_lc_fips_0_13_14_X509_get_subject_name"
.LASF52:
	.string	"X509"
.LASF11:
	.string	"__uint8_t"
.LASF59:
	.string	"object"
.LASF32:
	.string	"ASN1_T61STRING"
.LASF20:
	.string	"type"
.LASF65:
	.string	"t61string"
.LASF103:
	.string	"aws_lc_fips_0_13_14_EVP_sha1"
.LASF15:
	.string	"long long unsigned int"
.LASF64:
	.string	"printablestring"
.LASF126:
	.string	"ikey"
.LASF61:
	.string	"enumerated"
.LASF115:
	.string	"aws_lc_fips_0_13_14_OCSP_parse_url"
.LASF51:
	.string	"env_md_st"
.LASF29:
	.string	"ASN1_OCTET_STRING"
.LASF4:
	.string	"long long int"
.LASF9:
	.string	"signed char"
.LASF26:
	.string	"ASN1_GENERALSTRING"
.LASF88:
	.string	"aws_lc_fips_0_13_14_OPENSSL_free"
.LASF34:
	.string	"ASN1_UTCTIME"
.LASF86:
	.string	"aws_lc_fips_0_13_14_ASN1_OCTET_STRING_cmp"
.LASF2:
	.string	"long int"
.LASF119:
	.string	"dgst"
.LASF78:
	.string	"hashAlgorithm"
.LASF104:
	.string	"aws_lc_fips_0_13_14_ERR_put_error"
.LASF77:
	.string	"ocsp_cert_id_st"
.LASF54:
	.string	"double"
.LASF98:
	.string	"aws_lc_fips_0_13_14_OCSP_CERTID_new"
.LASF120:
	.string	"issuerName"
.LASF92:
	.string	"aws_lc_fips_0_13_14_ASN1_OCTET_STRING_set"
.LASF7:
	.string	"short unsigned int"
.LASF18:
	.string	"ASN1_BIT_STRING"
.LASF102:
	.string	"aws_lc_fips_0_13_14_X509_get_issuer_name"
.LASF66:
	.string	"ia5string"
.LASF58:
	.string	"asn1_string"
.LASF67:
	.string	"generalstring"
.LASF40:
	.string	"value"
.LASF111:
	.string	"host"
.LASF8:
	.string	"unsigned int"
.LASF35:
	.string	"ASN1_UTF8STRING"
.LASF101:
	.string	"aws_lc_fips_0_13_14_X509_get0_serialNumber"
.LASF28:
	.string	"ASN1_INTEGER"
.LASF124:
	.string	"iname"
.LASF60:
	.string	"integer"
.LASF3:
	.string	"long unsigned int"
.LASF53:
	.string	"x509_st"
.LASF83:
	.string	"strchr"
.LASF24:
	.string	"ASN1_ENUMERATED"
.LASF37:
	.string	"ASN1_TYPE"
.LASF38:
	.string	"asn1_string_st"
.LASF21:
	.string	"data"
.LASF89:
	.string	"aws_lc_fips_0_13_14_OCSP_CERTID_free"
.LASF112:
	.string	"port"
.LASF79:
	.string	"issuerNameHash"
.LASF91:
	.string	"aws_lc_fips_0_13_14_EVP_Digest"
.LASF69:
	.string	"universalstring"
.LASF97:
	.string	"aws_lc_fips_0_13_14_ASN1_TYPE_new"
.LASF74:
	.string	"sequence"
.LASF12:
	.string	"short int"
.LASF107:
	.string	"ppath"
.LASF27:
	.string	"ASN1_IA5STRING"
.LASF114:
	.string	"parse_err"
.LASF71:
	.string	"generalizedtime"
.LASF109:
	.string	"parser"
.LASF87:
	.string	"aws_lc_fips_0_13_14_OBJ_cmp"
.LASF93:
	.string	"aws_lc_fips_0_13_14_X509_NAME_digest"
.LASF50:
	.string	"EVP_MD"
.LASF70:
	.string	"utctime"
.LASF96:
	.string	"aws_lc_fips_0_13_14_ASN1_OBJECT_free"
.LASF80:
	.string	"issuerKeyHash"
.LASF68:
	.string	"bmpstring"
.LASF72:
	.string	"visiblestring"
.LASF85:
	.string	"aws_lc_fips_0_13_14_ASN1_INTEGER_cmp"
.LASF48:
	.string	"ENGINE"
.LASF128:
	.string	"aws_lc_fips_0_13_14_OCSP_cert_to_id"
.LASF90:
	.string	"aws_lc_fips_0_13_14_ASN1_STRING_copy"
.LASF81:
	.string	"serialNumber"
.LASF63:
	.string	"octet_string"
.LASF75:
	.string	"asn1_value"
.LASF42:
	.string	"X509_algor_st"
.LASF46:
	.string	"asn1_object_st"
.LASF6:
	.string	"unsigned char"
.LASF82:
	.string	"strncmp"
.LASF56:
	.string	"ASN1_VALUE_st"
.LASF121:
	.string	"issuerKey"
.LASF106:
	.string	"pport"
.LASF122:
	.string	"subject"
.LASF105:
	.string	"phost"
.LASF76:
	.string	"OCSP_CERTID"
.LASF108:
	.string	"pssl"
.LASF118:
	.string	"aws_lc_fips_0_13_14_OCSP_cert_id_new"
.LASF30:
	.string	"ASN1_PRINTABLESTRING"
.LASF113:
	.string	"mem_err"
.LASF49:
	.string	"engine_st"
.LASF45:
	.string	"X509_NAME"
.LASF5:
	.string	"long double"
.LASF33:
	.string	"ASN1_UNIVERSALSTRING"
.LASF13:
	.string	"char"
.LASF16:
	.string	"ASN1_BOOLEAN"
.LASF57:
	.string	"boolean"
.LASF25:
	.string	"ASN1_GENERALIZEDTIME"
.LASF110:
	.string	"buffer"
.LASF36:
	.string	"ASN1_VISIBLESTRING"
.LASF47:
	.string	"X509_name_st"
.LASF95:
	.string	"aws_lc_fips_0_13_14_EVP_MD_type"
.LASF44:
	.string	"parameter"
.LASF19:
	.string	"length"
.LASF84:
	.string	"aws_lc_fips_0_13_14_OPENSSL_strdup"
.LASF123:
	.string	"issuer"
.LASF39:
	.string	"asn1_type_st"
.LASF117:
	.string	"aws_lc_fips_0_13_14_OCSP_id_issuer_cmp"
.LASF116:
	.string	"aws_lc_fips_0_13_14_OCSP_id_cmp"
.LASF23:
	.string	"ASN1_BMPSTRING"
.LASF127:
	.ascii	"GNU C11 15"
	.string	".2.0 -m64 -mtune=generic -march=x86-64 -ggdb -g -std=gnu11 -ffunction-sections -fdata-sections -fvisibility=hidden -fno-common -fPIC -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all"
.LASF14:
	.string	"uint8_t"
.LASF43:
	.string	"algorithm"
.LASF22:
	.string	"flags"
.LASF125:
	.string	"serial"
.LASF62:
	.string	"bit_string"
.LASF99:
	.string	"aws_lc_fips_0_13_14_X509_get0_pubkey_bitstr"
.LASF31:
	.string	"ASN1_STRING"
.LASF94:
	.string	"aws_lc_fips_0_13_14_OBJ_nid2obj"
.LASF55:
	.string	"ASN1_VALUE"
.LASF73:
	.string	"utf8string"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/ocsp_lib.c"
.LASF1:
	.string	"/mnt/HARDONE/NSI_Repos/tacvoice/service/target/debug/build/aws-lc-fips-sys-d437d42e962aa361/out/build/aws-lc/crypto"
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
