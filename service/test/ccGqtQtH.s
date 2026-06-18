	.file	"p5_pbev2.c"
	.text
.Ltext0:
	.file 0 "/mnt/HARDONE/NSI_Repos/tacvoice/gateway/target/debug/build/aws-lc-fips-sys-802b9ac702614b53/out/build/aws-lc/crypto" "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pkcs8/p5_pbev2.c"
	.section	.rodata.kPBKDF2,"a"
	.align 8
	.type	kPBKDF2, @object
	.size	kPBKDF2, 9
kPBKDF2:
	.base64	"KoZIhvcNAQUM"
	.section	.rodata.kPBES2,"a"
	.align 8
	.type	kPBES2, @object
	.size	kPBES2, 9
kPBES2:
	.base64	"KoZIhvcNAQUN"
	.section	.rodata.kHMACWithSHA1,"a"
	.align 8
	.type	kHMACWithSHA1, @object
	.size	kHMACWithSHA1, 8
kHMACWithSHA1:
	.base64	"KoZIhvcNAgc="
	.section	.rodata.kHMACWithSHA256,"a"
	.align 8
	.type	kHMACWithSHA256, @object
	.size	kHMACWithSHA256, 8
kHMACWithSHA256:
	.base64	"KoZIhvcNAgk="
	.section	.data.rel.ro.kCipherOIDs,"aw"
	.align 32
	.type	kCipherOIDs, @object
	.size	kCipherOIDs, 120
kCipherOIDs:
	.base64	"KoZIhvcNAwIA"
	.byte	8
	.zero	2
	.long	37
	.quad	aws_lc_fips_0_13_14_EVP_rc2_cbc
	.base64	"KoZIhvcNAwcA"
	.byte	8
	.zero	2
	.long	44
	.quad	aws_lc_fips_0_13_14_EVP_des_ede3_cbc
	.base64	"YIZIAWUDBAEC"
	.byte	9
	.zero	2
	.long	419
	.quad	aws_lc_fips_0_13_14_EVP_aes_128_cbc
	.base64	"YIZIAWUDBAEW"
	.byte	9
	.zero	2
	.long	423
	.quad	aws_lc_fips_0_13_14_EVP_aes_192_cbc
	.base64	"YIZIAWUDBAEq"
	.byte	9
	.zero	2
	.long	427
	.quad	aws_lc_fips_0_13_14_EVP_aes_256_cbc
	.section	.text.cbs_to_cipher,"ax",@progbits
	.type	cbs_to_cipher, @function
cbs_to_cipher:
.LFB878:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pkcs8/p5_pbev2.c"
	.loc 1 121 56
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
.LBB2:
	.loc 1 122 15
	movq	$0, -8(%rbp)
	.loc 1 122 3
	jmp	.L2
.L5:
	.loc 1 123 62
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	9+kCipherOIDs(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	.loc 1 123 9
	movzbl	%al, %ecx
	.loc 1 123 42
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	kCipherOIDs(%rip), %rdx
	leaq	(%rax,%rdx), %rsi
	.loc 1 123 9
	movq	-24(%rbp), %rax
	movq	%rcx, %rdx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_mem_equal@PLT
	.loc 1 123 8 discriminator 1
	testl	%eax, %eax
	je	.L3
	.loc 1 124 28
	movq	-8(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	16+kCipherOIDs(%rip), %rax
	movq	(%rdx,%rax), %rax
	.loc 1 124 14
	call	*%rax
.LVL0:
	jmp	.L4
.L3:
	.loc 1 122 60 discriminator 2
	addq	$1, -8(%rbp)
.L2:
	.loc 1 122 24 discriminator 1
	cmpq	$4, -8(%rbp)
	jbe	.L5
.LBE2:
	.loc 1 128 10
	movl	$0, %eax
.L4:
	.loc 1 129 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE878:
	.size	cbs_to_cipher, .-cbs_to_cipher
	.section	.rodata
	.align 8
.LC0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pkcs8/p5_pbev2.c"
	.section	.text.add_cipher_oid,"ax",@progbits
	.type	add_cipher_oid, @function
add_cipher_oid:
.LFB879:
	.loc 1 131 46
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movq	%rdi, -88(%rbp)
	movl	%esi, -92(%rbp)
	.loc 1 131 46
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.LBB3:
	.loc 1 132 15
	movq	$0, -72(%rbp)
	.loc 1 132 3
	jmp	.L7
.L12:
	.loc 1 133 23
	movq	-72(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	12+kCipherOIDs(%rip), %rax
	movl	(%rdx,%rax), %eax
	.loc 1 133 8
	cmpl	%eax, -92(%rbp)
	jne	.L8
.LBB4:
	.loc 1 135 14
	leaq	-64(%rbp), %rcx
	movq	-88(%rbp), %rax
	movl	$6, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 137 52
	testl	%eax, %eax
	je	.L9
	.loc 1 137 42 discriminator 1
	movq	-72(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	leaq	9+kCipherOIDs(%rip), %rax
	movzbl	(%rdx,%rax), %eax
	.loc 1 136 14
	movzbl	%al, %ecx
	.loc 1 136 50
	movq	-72(%rbp), %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	kCipherOIDs(%rip), %rdx
	leaq	(%rax,%rdx), %rsi
	.loc 1 136 14
	leaq	-64(%rbp), %rax
	movq	%rcx, %rdx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_bytes@PLT
	.loc 1 135 57
	testl	%eax, %eax
	je	.L9
	.loc 1 138 14
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_flush@PLT
	.loc 1 137 52 discriminator 4
	testl	%eax, %eax
	je	.L9
	.loc 1 137 52 is_stmt 0 discriminator 3
	movl	$1, %eax
	.loc 1 137 52
	jmp	.L11
.L9:
	.loc 1 137 52 discriminator 2
	movl	$0, %eax
	.loc 1 137 52
	jmp	.L11
.L8:
.LBE4:
	.loc 1 132 60 is_stmt 1 discriminator 2
	addq	$1, -72(%rbp)
.L7:
	.loc 1 132 24 discriminator 1
	cmpq	$4, -72(%rbp)
	jbe	.L12
.LBE3:
	.loc 1 142 3
	leaq	.LC0(%rip), %rax
	movl	$142, %r8d
	movq	%rax, %rcx
	movl	$127, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 143 10
	movl	$0, %eax
.L11:
	.loc 1 144 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE879:
	.size	add_cipher_oid, .-add_cipher_oid
	.section	.text.pkcs5_pbe2_cipher_init,"ax",@progbits
	.type	pkcs5_pbe2_cipher_init, @function
pkcs5_pbe2_cipher_init:
.LFB880:
	.loc 1 150 78
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -104(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%rdx, -120(%rbp)
	movl	%ecx, -124(%rbp)
	movq	%r8, -136(%rbp)
	movq	%r9, -144(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -152(%rbp)
	movq	32(%rbp), %rax
	movq	%rax, -160(%rbp)
	.loc 1 150 78
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 151 17
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_iv_length@PLT
	.loc 1 151 17 is_stmt 0 discriminator 1
	movl	%eax, %eax
	.loc 1 151 6 is_stmt 1 discriminator 1
	cmpq	%rax, 40(%rbp)
	je	.L15
	.loc 1 152 5
	leaq	.LC0(%rip), %rax
	movl	$152, %r8d
	movq	%rax, %rcx
	movl	$107, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 153 12
	movl	$0, %eax
	jmp	.L19
.L15:
	.loc 1 158 42
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_key_length@PLT
	.loc 1 157 13
	movl	%eax, %r10d
	movq	-120(%rbp), %r9
	movl	-124(%rbp), %r8d
	movq	24(%rbp), %rcx
	movq	-152(%rbp), %rdx
	movq	-144(%rbp), %rsi
	movq	-136(%rbp), %rax
	leaq	-80(%rbp), %rdi
	pushq	%rdi
	pushq	%r10
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_PKCS5_PBKDF2_HMAC@PLT
	addq	$16, %rsp
	.loc 1 158 78
	testl	%eax, %eax
	je	.L17
	.loc 1 159 13
	movl	48(%rbp), %edi
	movq	-160(%rbp), %rcx
	leaq	-80(%rbp), %rdx
	movq	-112(%rbp), %rsi
	movq	-104(%rbp), %rax
	movl	%edi, %r9d
	movq	%rcx, %r8
	movq	%rdx, %rcx
	movl	$0, %edx
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CipherInit_ex@PLT
	.loc 1 158 78 discriminator 2
	testl	%eax, %eax
	je	.L17
	.loc 1 158 78 is_stmt 0 discriminator 4
	movl	$1, %eax
	.loc 1 158 78
	jmp	.L18
.L17:
	.loc 1 158 78 discriminator 5
	movl	$0, %eax
.L18:
	.loc 1 157 7 is_stmt 1
	movl	%eax, -84(%rbp)
	.loc 1 160 3
	leaq	-80(%rbp), %rax
	movl	$64, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_cleanse@PLT
	.loc 1 161 10
	movl	-84(%rbp), %eax
.L19:
	.loc 1 162 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE880:
	.size	pkcs5_pbe2_cipher_init, .-pkcs5_pbe2_cipher_init
	.section	.text.aws_lc_fips_0_13_14_PKCS5_pbe2_encrypt_init,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PKCS5_pbe2_encrypt_init
	.hidden	aws_lc_fips_0_13_14_PKCS5_pbe2_encrypt_init
	.type	aws_lc_fips_0_13_14_PKCS5_pbe2_encrypt_init, @function
aws_lc_fips_0_13_14_PKCS5_pbe2_encrypt_init:
.LFB881:
	.loc 1 167 67
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$552, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -504(%rbp)
	movq	%rsi, -512(%rbp)
	movq	%rdx, -520(%rbp)
	movl	%ecx, -524(%rbp)
	movq	%r8, -536(%rbp)
	movq	%r9, -544(%rbp)
	movq	16(%rbp), %rax
	movq	%rax, -552(%rbp)
	.loc 1 167 67
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 168 20
	movq	-520(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_nid@PLT
	movl	%eax, -484(%rbp)
	.loc 1 169 6
	cmpl	$0, -484(%rbp)
	jne	.L22
	.loc 1 170 5
	leaq	.LC0(%rip), %rax
	movl	$170, %r8d
	movq	%rax, %rcx
	movl	$102, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 171 12
	movl	$0, %eax
	jmp	.L28
.L22:
	.loc 1 176 23
	movq	-520(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_iv_length@PLT
	.loc 1 176 8 discriminator 1
	movl	%eax, %edx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_RAND_bytes@PLT
	.loc 1 176 6 discriminator 2
	testl	%eax, %eax
	jne	.L24
	.loc 1 177 12
	movl	$0, %eax
	jmp	.L28
.L24:
	.loc 1 183 8
	leaq	-480(%rbp), %rcx
	movq	-504(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 183 6 discriminator 1
	testl	%eax, %eax
	je	.L25
	.loc 1 184 8
	leaq	-432(%rbp), %rcx
	leaq	-480(%rbp), %rax
	movl	$6, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 183 57 discriminator 2
	testl	%eax, %eax
	je	.L25
	.loc 1 185 8
	leaq	kPBES2(%rip), %rcx
	leaq	-432(%rbp), %rax
	movl	$9, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_bytes@PLT
	.loc 1 184 56
	testl	%eax, %eax
	je	.L25
	.loc 1 186 8
	leaq	-384(%rbp), %rcx
	leaq	-480(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 185 52
	testl	%eax, %eax
	je	.L25
	.loc 1 187 8
	leaq	-336(%rbp), %rcx
	leaq	-384(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 186 60
	testl	%eax, %eax
	je	.L25
	.loc 1 188 8
	leaq	-288(%rbp), %rcx
	leaq	-336(%rbp), %rax
	movl	$6, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 187 54
	testl	%eax, %eax
	je	.L25
	.loc 1 189 8
	leaq	kPBKDF2(%rip), %rcx
	leaq	-288(%rbp), %rax
	movl	$9, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_bytes@PLT
	.loc 1 188 54
	testl	%eax, %eax
	je	.L25
	.loc 1 190 8
	leaq	-240(%rbp), %rcx
	leaq	-336(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 189 58
	testl	%eax, %eax
	je	.L25
	.loc 1 191 8
	leaq	-192(%rbp), %rcx
	leaq	-240(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 190 58
	testl	%eax, %eax
	je	.L25
	.loc 1 192 8
	movq	24(%rbp), %rdx
	movq	-552(%rbp), %rcx
	leaq	-192(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_bytes@PLT
	.loc 1 191 66
	testl	%eax, %eax
	je	.L25
	.loc 1 193 8
	movl	-524(%rbp), %edx
	leaq	-240(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1_uint64@PLT
	.loc 1 192 49
	testl	%eax, %eax
	je	.L25
	.loc 1 193 52
	cmpl	$37, -484(%rbp)
	jne	.L26
	.loc 1 196 41
	movq	-520(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_key_length@PLT
	.loc 1 196 9 discriminator 1
	movl	%eax, %edx
	leaq	-240(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1_uint64@PLT
	.loc 1 195 34
	testl	%eax, %eax
	je	.L25
.L26:
	.loc 1 198 8
	leaq	-144(%rbp), %rcx
	leaq	-384(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 196 73
	testl	%eax, %eax
	je	.L25
	.loc 1 199 8
	movl	-484(%rbp), %edx
	leaq	-144(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	add_cipher_oid
	.loc 1 198 61
	testl	%eax, %eax
	je	.L25
	.loc 1 202 8
	leaq	-96(%rbp), %rcx
	leaq	-144(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_asn1@PLT
	.loc 1 199 48
	testl	%eax, %eax
	je	.L25
	.loc 1 203 35
	movq	-520(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_iv_length@PLT
	.loc 1 203 8 discriminator 1
	movl	%eax, %edx
	leaq	-48(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_add_bytes@PLT
	.loc 1 202 65
	testl	%eax, %eax
	je	.L25
	.loc 1 204 8
	movq	-504(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBB_flush@PLT
	.loc 1 203 65
	testl	%eax, %eax
	jne	.L27
.L25:
	.loc 1 205 12
	movl	$0, %eax
	jmp	.L28
.L27:
	.loc 1 210 33
	movq	-520(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_iv_length@PLT
	.loc 1 208 10
	movl	%eax, %ebx
	call	aws_lc_fips_0_13_14_EVP_sha1@PLT
	movq	%rax, %rdi
	.loc 1 208 10 is_stmt 0 discriminator 1
	movq	-544(%rbp), %r9
	movq	-536(%rbp), %r8
	movl	-524(%rbp), %edx
	movq	-520(%rbp), %rsi
	movq	-512(%rbp), %rax
	subq	$8, %rsp
	pushq	$1
	pushq	%rbx
	leaq	-48(%rbp), %rcx
	pushq	%rcx
	pushq	24(%rbp)
	pushq	-552(%rbp)
	movl	%edx, %ecx
	movq	%rdi, %rdx
	movq	%rax, %rdi
	call	pkcs5_pbe2_cipher_init
	addq	$48, %rsp
.L28:
	.loc 1 211 1 is_stmt 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE881:
	.size	aws_lc_fips_0_13_14_PKCS5_pbe2_encrypt_init, .-aws_lc_fips_0_13_14_PKCS5_pbe2_encrypt_init
	.section	.text.aws_lc_fips_0_13_14_PKCS5_pbe2_decrypt_init,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_PKCS5_pbe2_decrypt_init
	.hidden	aws_lc_fips_0_13_14_PKCS5_pbe2_decrypt_init
	.type	aws_lc_fips_0_13_14_PKCS5_pbe2_decrypt_init, @function
aws_lc_fips_0_13_14_PKCS5_pbe2_decrypt_init:
.LFB882:
	.loc 1 214 76
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$264, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%rdi, -248(%rbp)
	movq	%rsi, -256(%rbp)
	movq	%rdx, -264(%rbp)
	movq	%rcx, -272(%rbp)
	movq	%r8, -280(%rbp)
	.loc 1 214 76
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	.loc 1 216 8
	leaq	-208(%rbp), %rcx
	movq	-280(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 216 6 discriminator 1
	testl	%eax, %eax
	je	.L31
	.loc 1 217 7
	movq	-280(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	.loc 1 216 59 discriminator 2
	testq	%rax, %rax
	jne	.L31
	.loc 1 218 8
	leaq	-192(%rbp), %rcx
	leaq	-208(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 217 27
	testl	%eax, %eax
	je	.L31
	.loc 1 219 8
	leaq	-160(%rbp), %rcx
	leaq	-208(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 218 58
	testl	%eax, %eax
	je	.L31
	.loc 1 220 7
	leaq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	.loc 1 219 65
	testq	%rax, %rax
	jne	.L31
	.loc 1 221 8
	leaq	-176(%rbp), %rcx
	leaq	-192(%rbp), %rax
	movl	$6, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 220 32
	testl	%eax, %eax
	je	.L31
	.loc 1 222 8
	leaq	-144(%rbp), %rcx
	leaq	-160(%rbp), %rax
	movl	$6, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 221 54
	testl	%eax, %eax
	jne	.L32
.L31:
	.loc 1 223 5
	leaq	.LC0(%rip), %rax
	movl	$223, %r8d
	movq	%rax, %rcx
	movl	$104, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 224 12
	movl	$0, %eax
	jmp	.L54
.L32:
	.loc 1 228 8
	leaq	kPBKDF2(%rip), %rcx
	leaq	-176(%rbp), %rax
	movl	$9, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_mem_equal@PLT
	.loc 1 228 6 discriminator 1
	testl	%eax, %eax
	jne	.L34
	.loc 1 229 5
	leaq	.LC0(%rip), %rax
	movl	$229, %r8d
	movq	%rax, %rcx
	movl	$128, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 230 12
	movl	$0, %eax
	jmp	.L54
.L34:
	.loc 1 234 30
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	cbs_to_cipher
	movq	%rax, -216(%rbp)
	.loc 1 235 6
	cmpq	$0, -216(%rbp)
	jne	.L35
	.loc 1 236 5
	leaq	.LC0(%rip), %rax
	movl	$236, %r8d
	movq	%rax, %rcx
	movl	$127, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 237 12
	movl	$0, %eax
	jmp	.L54
.L35:
	.loc 1 243 8
	leaq	-128(%rbp), %rcx
	leaq	-192(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 243 6 discriminator 1
	testl	%eax, %eax
	je	.L36
	.loc 1 244 7
	leaq	-192(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	.loc 1 243 62 discriminator 2
	testq	%rax, %rax
	jne	.L36
	.loc 1 245 8
	leaq	-112(%rbp), %rcx
	leaq	-128(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 244 26
	testl	%eax, %eax
	je	.L36
	.loc 1 246 8
	leaq	-232(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1_uint64@PLT
	.loc 1 245 66
	testl	%eax, %eax
	jne	.L37
.L36:
	.loc 1 247 5
	leaq	.LC0(%rip), %rax
	movl	$247, %r8d
	movq	%rax, %rcx
	movl	$104, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 248 12
	movl	$0, %eax
	jmp	.L54
.L37:
	.loc 1 251 8
	movq	-232(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_pkcs12_iterations_acceptable@PLT
	.loc 1 251 6 discriminator 1
	testl	%eax, %eax
	jne	.L38
	.loc 1 252 5
	leaq	.LC0(%rip), %rax
	movl	$252, %r8d
	movq	%rax, %rcx
	movl	$129, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 253 12
	movl	$0, %eax
	jmp	.L54
.L38:
	.loc 1 258 7
	leaq	-128(%rbp), %rax
	movl	$2, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_peek_asn1_tag@PLT
	.loc 1 258 6 discriminator 1
	testl	%eax, %eax
	je	.L39
.LBB5:
	.loc 1 260 10
	leaq	-64(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1_uint64@PLT
	.loc 1 260 8 discriminator 1
	testl	%eax, %eax
	jne	.L40
	.loc 1 261 7
	leaq	.LC0(%rip), %rax
	movl	$261, %r8d
	movq	%rax, %rcx
	movl	$104, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 262 14
	movl	$0, %eax
	jmp	.L54
.L40:
	.loc 1 265 20
	movq	-216(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_EVP_CIPHER_key_length@PLT
	.loc 1 265 20 is_stmt 0 discriminator 1
	movl	%eax, %edx
	.loc 1 265 17 is_stmt 1 discriminator 1
	movq	-64(%rbp), %rax
	.loc 1 265 8 discriminator 1
	cmpq	%rax, %rdx
	je	.L39
	.loc 1 266 7
	leaq	.LC0(%rip), %rax
	movl	$266, %r8d
	movq	%rax, %rcx
	movl	$125, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 267 14
	movl	$0, %eax
	jmp	.L54
.L39:
.LBE5:
	.loc 1 271 22
	call	aws_lc_fips_0_13_14_EVP_sha1@PLT
	movq	%rax, -224(%rbp)
	.loc 1 272 7
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	.loc 1 272 6 discriminator 1
	testq	%rax, %rax
	je	.L43
.LBB6:
	.loc 1 274 10
	leaq	-96(%rbp), %rcx
	leaq	-128(%rbp), %rax
	movl	$536870928, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 274 8 discriminator 1
	testl	%eax, %eax
	je	.L44
	.loc 1 275 10
	leaq	-80(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movl	$6, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 274 67 discriminator 2
	testl	%eax, %eax
	je	.L44
	.loc 1 276 9
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	.loc 1 275 55
	testq	%rax, %rax
	je	.L45
.L44:
	.loc 1 277 7
	leaq	.LC0(%rip), %rax
	movl	$277, %r8d
	movq	%rax, %rcx
	movl	$104, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 278 14
	movl	$0, %eax
	jmp	.L54
.L45:
	.loc 1 281 9
	leaq	kHMACWithSHA1(%rip), %rcx
	leaq	-80(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_mem_equal@PLT
	.loc 1 281 8 discriminator 1
	testl	%eax, %eax
	je	.L47
	.loc 1 284 12
	call	aws_lc_fips_0_13_14_EVP_sha1@PLT
	movq	%rax, -224(%rbp)
	jmp	.L48
.L47:
	.loc 1 285 16
	leaq	kHMACWithSHA256(%rip), %rcx
	leaq	-80(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_mem_equal@PLT
	.loc 1 285 15 discriminator 1
	testl	%eax, %eax
	je	.L49
	.loc 1 286 12
	call	aws_lc_fips_0_13_14_EVP_sha256@PLT
	movq	%rax, -224(%rbp)
	jmp	.L48
.L49:
	.loc 1 288 7
	leaq	.LC0(%rip), %rax
	movl	$288, %r8d
	movq	%rax, %rcx
	movl	$130, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 289 14
	movl	$0, %eax
	jmp	.L54
.L48:
	.loc 1 294 10
	leaq	-64(%rbp), %rcx
	leaq	-96(%rbp), %rax
	movl	$5, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 294 8 discriminator 1
	testl	%eax, %eax
	je	.L50
	.loc 1 295 9
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	.loc 1 294 54 discriminator 2
	testq	%rax, %rax
	jne	.L50
	.loc 1 296 9
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	.loc 1 295 29
	testq	%rax, %rax
	je	.L43
.L50:
	.loc 1 297 7
	leaq	.LC0(%rip), %rax
	movl	$297, %r8d
	movq	%rax, %rcx
	movl	$104, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 298 14
	movl	$0, %eax
	jmp	.L54
.L43:
.LBE6:
	.loc 1 307 8
	leaq	-64(%rbp), %rcx
	leaq	-160(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_get_asn1@PLT
	.loc 1 307 6 discriminator 1
	testl	%eax, %eax
	je	.L52
	.loc 1 308 7
	leaq	-160(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	.loc 1 307 61 discriminator 2
	testq	%rax, %rax
	je	.L53
.L52:
	.loc 1 309 5
	leaq	.LC0(%rip), %rax
	movl	$309, %r8d
	movq	%rax, %rcx
	movl	$130, %edx
	movl	$0, %esi
	movl	$19, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 1 310 12
	movl	$0, %eax
	jmp	.L54
.L53:
	.loc 1 313 10
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	movq	%rax, %r13
	.loc 1 313 10 is_stmt 0 discriminator 1
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_data@PLT
	movq	%rax, %r12
	.loc 1 313 10 discriminator 2
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_len@PLT
	movq	%rax, %rbx
	.loc 1 313 10 discriminator 3
	leaq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CBS_data@PLT
	movq	%rax, %rcx
	.loc 1 313 10 discriminator 4
	movq	-232(%rbp), %rax
	movl	%eax, %r10d
	movq	-272(%rbp), %r8
	movq	-264(%rbp), %rdi
	movq	-224(%rbp), %rdx
	movq	-216(%rbp), %rsi
	movq	-256(%rbp), %rax
	subq	$8, %rsp
	pushq	$0
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	pushq	%rcx
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	%r10d, %ecx
	movq	%rax, %rdi
	call	pkcs5_pbe2_cipher_init
	addq	$48, %rsp
.L54:
	.loc 1 316 1 is_stmt 1
	movq	-40(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L55
	call	__stack_chk_fail@PLT
.L55:
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE882:
	.size	aws_lc_fips_0_13_14_PKCS5_pbe2_decrypt_init, .-aws_lc_fips_0_13_14_PKCS5_pbe2_decrypt_init
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/15/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 5 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/base.h"
	.file 6 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/bytestring.h"
	.file 7 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/cipher.h"
	.file 8 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pkcs8/internal.h"
	.file 9 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/digest.h"
	.file 10 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/rand.h"
	.file 11 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/evp.h"
	.file 12 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/mem.h"
	.file 13 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/err.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xc4d
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x20
	.long	.LASF120
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
	.uleb128 0xa
	.long	.LASF10
	.byte	0x2
	.byte	0xe5
	.byte	0x17
	.long	0x3d
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x21
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
	.uleb128 0xa
	.long	.LASF11
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x59
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF12
	.uleb128 0xa
	.long	.LASF13
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x67
	.uleb128 0xa
	.long	.LASF14
	.byte	0x3
	.byte	0x2d
	.byte	0x1b
	.long	0x3d
	.uleb128 0x22
	.byte	0x8
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF15
	.uleb128 0x7
	.long	0xa2
	.uleb128 0xa
	.long	.LASF16
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.long	0x75
	.uleb128 0x7
	.long	0xae
	.uleb128 0xa
	.long	.LASF17
	.byte	0x4
	.byte	0x1a
	.byte	0x14
	.long	0x88
	.uleb128 0xa
	.long	.LASF18
	.byte	0x4
	.byte	0x1b
	.byte	0x14
	.long	0x94
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF19
	.uleb128 0xa
	.long	.LASF20
	.byte	0x5
	.byte	0xff
	.byte	0x12
	.long	0xbf
	.uleb128 0x1a
	.string	"CBB"
	.value	0x13b
	.long	0xf5
	.uleb128 0x12
	.long	.LASF23
	.byte	0x30
	.byte	0x6
	.value	0x1be
	.long	0x12b
	.uleb128 0x6
	.long	.LASF21
	.byte	0x6
	.value	0x1c0
	.byte	0x8
	.long	0x388
	.byte	0
	.uleb128 0x6
	.long	.LASF22
	.byte	0x6
	.value	0x1c3
	.byte	0x8
	.long	0xa2
	.byte	0x8
	.uleb128 0xb
	.string	"u"
	.byte	0x6
	.value	0x1c7
	.byte	0x5
	.long	0x365
	.byte	0x10
	.byte	0
	.uleb128 0x1a
	.string	"CBS"
	.value	0x13c
	.long	0x13b
	.uleb128 0x7
	.long	0x12b
	.uleb128 0x1b
	.long	.LASF24
	.byte	0x10
	.byte	0x6
	.byte	0x28
	.long	0x162
	.uleb128 0xc
	.long	.LASF25
	.byte	0x6
	.byte	0x29
	.byte	0x12
	.long	0x2c2
	.byte	0
	.uleb128 0x13
	.string	"len"
	.byte	0x6
	.byte	0x2a
	.byte	0xa
	.long	0x31
	.byte	0x8
	.byte	0
	.uleb128 0x14
	.long	.LASF26
	.value	0x14a
	.byte	0x1a
	.long	0x16e
	.uleb128 0x16
	.long	.LASF28
	.uleb128 0x14
	.long	.LASF27
	.value	0x14c
	.byte	0x1a
	.long	0x184
	.uleb128 0x7
	.long	0x173
	.uleb128 0x16
	.long	.LASF29
	.uleb128 0x14
	.long	.LASF30
	.value	0x14f
	.byte	0x22
	.long	0x195
	.uleb128 0x12
	.long	.LASF31
	.byte	0x98
	.byte	0x7
	.value	0x26c
	.long	0x266
	.uleb128 0x6
	.long	.LASF32
	.byte	0x7
	.value	0x26e
	.byte	0x15
	.long	0x298
	.byte	0
	.uleb128 0x6
	.long	.LASF33
	.byte	0x7
	.value	0x271
	.byte	0x9
	.long	0xa0
	.byte	0x8
	.uleb128 0x6
	.long	.LASF34
	.byte	0x7
	.value	0x274
	.byte	0x9
	.long	0xa0
	.byte	0x10
	.uleb128 0x6
	.long	.LASF35
	.byte	0x7
	.value	0x278
	.byte	0xc
	.long	0x67
	.byte	0x18
	.uleb128 0x6
	.long	.LASF36
	.byte	0x7
	.value	0x27b
	.byte	0x7
	.long	0x44
	.byte	0x1c
	.uleb128 0x6
	.long	.LASF37
	.byte	0x7
	.value	0x27e
	.byte	0xc
	.long	0xbf
	.byte	0x20
	.uleb128 0xb
	.string	"oiv"
	.byte	0x7
	.value	0x281
	.byte	0xb
	.long	0x29d
	.byte	0x24
	.uleb128 0xb
	.string	"iv"
	.byte	0x7
	.value	0x284
	.byte	0xb
	.long	0x29d
	.byte	0x34
	.uleb128 0xb
	.string	"buf"
	.byte	0x7
	.value	0x288
	.byte	0xb
	.long	0x2ad
	.byte	0x44
	.uleb128 0x6
	.long	.LASF38
	.byte	0x7
	.value	0x28c
	.byte	0x7
	.long	0x44
	.byte	0x64
	.uleb128 0xb
	.string	"num"
	.byte	0x7
	.value	0x290
	.byte	0xc
	.long	0x67
	.byte	0x68
	.uleb128 0x6
	.long	.LASF39
	.byte	0x7
	.value	0x293
	.byte	0x7
	.long	0x44
	.byte	0x6c
	.uleb128 0x6
	.long	.LASF40
	.byte	0x7
	.value	0x295
	.byte	0xb
	.long	0x2ad
	.byte	0x70
	.uleb128 0x6
	.long	.LASF41
	.byte	0x7
	.value	0x298
	.byte	0x7
	.long	0x44
	.byte	0x90
	.byte	0
	.uleb128 0x14
	.long	.LASF42
	.value	0x150
	.byte	0x1e
	.long	0x277
	.uleb128 0x7
	.long	0x266
	.uleb128 0x16
	.long	.LASF43
	.uleb128 0x4
	.long	0xa9
	.uleb128 0xd
	.long	0xae
	.long	0x291
	.uleb128 0xe
	.long	0x3d
	.byte	0x3f
	.byte	0
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.long	.LASF44
	.uleb128 0x4
	.long	0x272
	.uleb128 0xd
	.long	0xae
	.long	0x2ad
	.uleb128 0xe
	.long	0x3d
	.byte	0xf
	.byte	0
	.uleb128 0xd
	.long	0xae
	.long	0x2bd
	.uleb128 0xe
	.long	0x3d
	.byte	0x1f
	.byte	0
	.uleb128 0x4
	.long	0x17f
	.uleb128 0x4
	.long	0xba
	.uleb128 0x12
	.long	.LASF45
	.byte	0x20
	.byte	0x6
	.value	0x1a4
	.long	0x317
	.uleb128 0xb
	.string	"buf"
	.byte	0x6
	.value	0x1a5
	.byte	0xc
	.long	0x317
	.byte	0
	.uleb128 0xb
	.string	"len"
	.byte	0x6
	.value	0x1a7
	.byte	0xa
	.long	0x31
	.byte	0x8
	.uleb128 0xb
	.string	"cap"
	.byte	0x6
	.value	0x1a9
	.byte	0xa
	.long	0x31
	.byte	0x10
	.uleb128 0x17
	.long	.LASF46
	.value	0x1ac
	.long	0x67
	.byte	0xc0
	.uleb128 0x17
	.long	.LASF47
	.value	0x1af
	.long	0x67
	.byte	0xc1
	.byte	0
	.uleb128 0x4
	.long	0xae
	.uleb128 0x12
	.long	.LASF48
	.byte	0x18
	.byte	0x6
	.value	0x1b2
	.long	0x360
	.uleb128 0x6
	.long	.LASF49
	.byte	0x6
	.value	0x1b4
	.byte	0x19
	.long	0x360
	.byte	0
	.uleb128 0x6
	.long	.LASF50
	.byte	0x6
	.value	0x1b7
	.byte	0xa
	.long	0x31
	.byte	0x8
	.uleb128 0x6
	.long	.LASF51
	.byte	0x6
	.value	0x1ba
	.byte	0xb
	.long	0xae
	.byte	0x10
	.uleb128 0x17
	.long	.LASF52
	.value	0x1bb
	.long	0x67
	.byte	0x88
	.byte	0
	.uleb128 0x4
	.long	0x2c7
	.uleb128 0x23
	.byte	0x20
	.byte	0x6
	.value	0x1c4
	.byte	0x3
	.long	0x388
	.uleb128 0x1c
	.long	.LASF49
	.value	0x1c5
	.byte	0x1a
	.long	0x2c7
	.uleb128 0x1c
	.long	.LASF21
	.value	0x1c6
	.byte	0x19
	.long	0x31c
	.byte	0
	.uleb128 0x4
	.long	0xea
	.uleb128 0x1b
	.long	.LASF53
	.byte	0x28
	.byte	0x8
	.byte	0x64
	.long	0x3e8
	.uleb128 0xc
	.long	.LASF54
	.byte	0x8
	.byte	0x65
	.byte	0x7
	.long	0x44
	.byte	0
	.uleb128 0x13
	.string	"oid"
	.byte	0x8
	.byte	0x66
	.byte	0xb
	.long	0x3ed
	.byte	0x4
	.uleb128 0xc
	.long	.LASF55
	.byte	0x8
	.byte	0x67
	.byte	0xb
	.long	0xae
	.byte	0xe
	.uleb128 0xc
	.long	.LASF56
	.byte	0x8
	.byte	0x68
	.byte	0x17
	.long	0x402
	.byte	0x10
	.uleb128 0xc
	.long	.LASF57
	.byte	0x8
	.byte	0x69
	.byte	0x13
	.long	0x40c
	.byte	0x18
	.uleb128 0xc
	.long	.LASF58
	.byte	0x8
	.byte	0x6f
	.byte	0x9
	.long	0x443
	.byte	0x20
	.byte	0
	.uleb128 0x7
	.long	0x38d
	.uleb128 0xd
	.long	0xae
	.long	0x3fd
	.uleb128 0xe
	.long	0x3d
	.byte	0x9
	.byte	0
	.uleb128 0x1d
	.long	0x298
	.uleb128 0x4
	.long	0x3fd
	.uleb128 0x1d
	.long	0x2bd
	.uleb128 0x4
	.long	0x407
	.uleb128 0x24
	.long	0x44
	.long	0x434
	.uleb128 0x1
	.long	0x434
	.uleb128 0x1
	.long	0x439
	.uleb128 0x1
	.long	0x27c
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x43e
	.byte	0
	.uleb128 0x4
	.long	0x3e8
	.uleb128 0x4
	.long	0x189
	.uleb128 0x4
	.long	0x12b
	.uleb128 0x4
	.long	0x411
	.uleb128 0x5
	.byte	0x10
	.byte	0x5
	.long	.LASF59
	.uleb128 0x5
	.byte	0x10
	.byte	0x7
	.long	.LASF60
	.uleb128 0x5
	.byte	0x1
	.byte	0x2
	.long	.LASF61
	.uleb128 0xd
	.long	0xba
	.long	0x46d
	.uleb128 0xe
	.long	0x3d
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.long	0x45d
	.uleb128 0x2
	.long	.LASF62
	.byte	0x49
	.byte	0x16
	.long	0x46d
	.uleb128 0x9
	.byte	0x3
	.quad	kPBKDF2
	.uleb128 0x2
	.long	.LASF63
	.byte	0x4d
	.byte	0x16
	.long	0x46d
	.uleb128 0x9
	.byte	0x3
	.quad	kPBES2
	.uleb128 0xd
	.long	0xba
	.long	0x4ac
	.uleb128 0xe
	.long	0x3d
	.byte	0x7
	.byte	0
	.uleb128 0x7
	.long	0x49c
	.uleb128 0x2
	.long	.LASF64
	.byte	0x51
	.byte	0x16
	.long	0x4ac
	.uleb128 0x9
	.byte	0x3
	.quad	kHMACWithSHA1
	.uleb128 0x2
	.long	.LASF65
	.byte	0x55
	.byte	0x16
	.long	0x4ac
	.uleb128 0x9
	.byte	0x3
	.quad	kHMACWithSHA256
	.uleb128 0x25
	.byte	0x18
	.byte	0x1
	.byte	0x58
	.byte	0xe
	.long	0x519
	.uleb128 0x13
	.string	"oid"
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.long	0x51e
	.byte	0
	.uleb128 0xc
	.long	.LASF55
	.byte	0x1
	.byte	0x5a
	.byte	0xb
	.long	0xae
	.byte	0x9
	.uleb128 0x13
	.string	"nid"
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.long	0x44
	.byte	0xc
	.uleb128 0xc
	.long	.LASF56
	.byte	0x1
	.byte	0x5c
	.byte	0x17
	.long	0x402
	.byte	0x10
	.byte	0
	.uleb128 0x7
	.long	0x4db
	.uleb128 0xd
	.long	0xae
	.long	0x52e
	.uleb128 0xe
	.long	0x3d
	.byte	0x8
	.byte	0
	.uleb128 0xd
	.long	0x519
	.long	0x53e
	.uleb128 0xe
	.long	0x3d
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.long	0x52e
	.uleb128 0x2
	.long	.LASF66
	.byte	0x5d
	.byte	0x3
	.long	0x53e
	.uleb128 0x9
	.byte	0x3
	.quad	kCipherOIDs
	.uleb128 0x10
	.long	.LASF67
	.byte	0x6
	.byte	0x44
	.byte	0x1f
	.long	0x2c2
	.long	0x56e
	.uleb128 0x1
	.long	0x56e
	.byte	0
	.uleb128 0x4
	.long	0x136
	.uleb128 0x11
	.long	.LASF73
	.byte	0x9
	.byte	0x55
	.byte	0x1e
	.long	0x2bd
	.uleb128 0x8
	.long	.LASF68
	.byte	0x6
	.value	0x100
	.byte	0x14
	.long	0x44
	.long	0x59b
	.uleb128 0x1
	.long	0x56e
	.uleb128 0x1
	.long	0xde
	.byte	0
	.uleb128 0x10
	.long	.LASF69
	.byte	0x8
	.byte	0x80
	.byte	0x5
	.long	0x44
	.long	0x5b1
	.uleb128 0x1
	.long	0xcb
	.byte	0
	.uleb128 0x8
	.long	.LASF70
	.byte	0x6
	.value	0x126
	.byte	0x14
	.long	0x44
	.long	0x5cd
	.uleb128 0x1
	.long	0x43e
	.uleb128 0x1
	.long	0x5cd
	.byte	0
	.uleb128 0x4
	.long	0xcb
	.uleb128 0x10
	.long	.LASF71
	.byte	0x6
	.byte	0x47
	.byte	0x17
	.long	0x31
	.long	0x5e8
	.uleb128 0x1
	.long	0x56e
	.byte	0
	.uleb128 0x10
	.long	.LASF72
	.byte	0x6
	.byte	0xf4
	.byte	0x14
	.long	0x44
	.long	0x608
	.uleb128 0x1
	.long	0x43e
	.uleb128 0x1
	.long	0x43e
	.uleb128 0x1
	.long	0xde
	.byte	0
	.uleb128 0x11
	.long	.LASF74
	.byte	0x9
	.byte	0x53
	.byte	0x1e
	.long	0x2bd
	.uleb128 0x8
	.long	.LASF75
	.byte	0x6
	.value	0x257
	.byte	0x14
	.long	0x44
	.long	0x630
	.uleb128 0x1
	.long	0x388
	.uleb128 0x1
	.long	0xcb
	.byte	0
	.uleb128 0x10
	.long	.LASF76
	.byte	0xa
	.byte	0x1e
	.byte	0x14
	.long	0x44
	.long	0x64b
	.uleb128 0x1
	.long	0x317
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0x8
	.long	.LASF77
	.byte	0x7
	.value	0x136
	.byte	0x14
	.long	0x44
	.long	0x662
	.uleb128 0x1
	.long	0x298
	.byte	0
	.uleb128 0x26
	.long	.LASF82
	.byte	0xc
	.byte	0x6d
	.byte	0x15
	.long	0x679
	.uleb128 0x1
	.long	0xa0
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0x10
	.long	.LASF78
	.byte	0x7
	.byte	0xa8
	.byte	0x14
	.long	0x44
	.long	0x6a8
	.uleb128 0x1
	.long	0x439
	.uleb128 0x1
	.long	0x298
	.uleb128 0x1
	.long	0x6a8
	.uleb128 0x1
	.long	0x2c2
	.uleb128 0x1
	.long	0x2c2
	.uleb128 0x1
	.long	0x44
	.byte	0
	.uleb128 0x4
	.long	0x162
	.uleb128 0x8
	.long	.LASF79
	.byte	0xb
	.value	0x1f9
	.byte	0x14
	.long	0x44
	.long	0x6e7
	.uleb128 0x1
	.long	0x27c
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x2c2
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0xbf
	.uleb128 0x1
	.long	0x2bd
	.uleb128 0x1
	.long	0x31
	.uleb128 0x1
	.long	0x317
	.byte	0
	.uleb128 0x8
	.long	.LASF80
	.byte	0x7
	.value	0x143
	.byte	0x19
	.long	0x67
	.long	0x6fe
	.uleb128 0x1
	.long	0x298
	.byte	0
	.uleb128 0x8
	.long	.LASF81
	.byte	0x7
	.value	0x147
	.byte	0x19
	.long	0x67
	.long	0x715
	.uleb128 0x1
	.long	0x298
	.byte	0
	.uleb128 0x27
	.long	.LASF83
	.byte	0xd
	.value	0x1cf
	.byte	0x15
	.long	0x73c
	.uleb128 0x1
	.long	0x44
	.uleb128 0x1
	.long	0x44
	.uleb128 0x1
	.long	0x44
	.uleb128 0x1
	.long	0x27c
	.uleb128 0x1
	.long	0x67
	.byte	0
	.uleb128 0x8
	.long	.LASF84
	.byte	0x6
	.value	0x1f3
	.byte	0x14
	.long	0x44
	.long	0x753
	.uleb128 0x1
	.long	0x388
	.byte	0
	.uleb128 0x8
	.long	.LASF85
	.byte	0x6
	.value	0x219
	.byte	0x14
	.long	0x44
	.long	0x774
	.uleb128 0x1
	.long	0x388
	.uleb128 0x1
	.long	0x2c2
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0x8
	.long	.LASF86
	.byte	0x6
	.value	0x215
	.byte	0x14
	.long	0x44
	.long	0x795
	.uleb128 0x1
	.long	0x388
	.uleb128 0x1
	.long	0x388
	.uleb128 0x1
	.long	0xde
	.byte	0
	.uleb128 0x10
	.long	.LASF87
	.byte	0x6
	.byte	0x60
	.byte	0x14
	.long	0x44
	.long	0x7b5
	.uleb128 0x1
	.long	0x56e
	.uleb128 0x1
	.long	0x2c2
	.uleb128 0x1
	.long	0x31
	.byte	0
	.uleb128 0x11
	.long	.LASF88
	.byte	0x7
	.byte	0x5a
	.byte	0x22
	.long	0x298
	.uleb128 0x28
	.long	.LASF89
	.byte	0x7
	.value	0x1f6
	.byte	0x22
	.long	0x298
	.uleb128 0x11
	.long	.LASF90
	.byte	0x7
	.byte	0x55
	.byte	0x22
	.long	0x298
	.uleb128 0x11
	.long	.LASF91
	.byte	0x7
	.byte	0x52
	.byte	0x22
	.long	0x298
	.uleb128 0x11
	.long	.LASF92
	.byte	0x7
	.byte	0x6a
	.byte	0x22
	.long	0x298
	.uleb128 0x1e
	.long	.LASF106
	.byte	0xd5
	.long	0x44
	.quad	.LFB882
	.quad	.LFE882-.LFB882
	.uleb128 0x1
	.byte	0x9c
	.long	0x96b
	.uleb128 0x3
	.long	.LASF93
	.byte	0xd5
	.byte	0x35
	.long	0x434
	.uleb128 0x3
	.byte	0x91
	.sleb128 -264
	.uleb128 0x9
	.string	"ctx"
	.byte	0xd5
	.byte	0x4c
	.long	0x439
	.uleb128 0x3
	.byte	0x91
	.sleb128 -272
	.uleb128 0x3
	.long	.LASF94
	.byte	0xd6
	.byte	0x29
	.long	0x27c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -280
	.uleb128 0x3
	.long	.LASF95
	.byte	0xd6
	.byte	0x36
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -288
	.uleb128 0x3
	.long	.LASF96
	.byte	0xd6
	.byte	0x45
	.long	0x43e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -296
	.uleb128 0x2
	.long	.LASF97
	.byte	0xd7
	.byte	0x7
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -224
	.uleb128 0xf
	.string	"kdf"
	.byte	0xd7
	.byte	0x12
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x2
	.long	.LASF98
	.byte	0xd7
	.byte	0x17
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -192
	.uleb128 0x2
	.long	.LASF99
	.byte	0xd7
	.byte	0x20
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x2
	.long	.LASF100
	.byte	0xd7
	.byte	0x2c
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2
	.long	.LASF32
	.byte	0xea
	.byte	0x15
	.long	0x298
	.uleb128 0x3
	.byte	0x91
	.sleb128 -232
	.uleb128 0x2
	.long	.LASF101
	.byte	0xf1
	.byte	0x7
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0x2
	.long	.LASF102
	.byte	0xf1
	.byte	0x16
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x2
	.long	.LASF103
	.byte	0xf2
	.byte	0xc
	.long	0xcb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -248
	.uleb128 0x18
	.string	"md"
	.value	0x10f
	.byte	0x11
	.long	0x2bd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -240
	.uleb128 0x18
	.string	"iv"
	.value	0x132
	.byte	0x7
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x29
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.long	0x928
	.uleb128 0x19
	.long	.LASF35
	.value	0x103
	.byte	0xe
	.long	0xcb
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x15
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x19
	.long	.LASF104
	.value	0x111
	.byte	0x9
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x18
	.string	"prf"
	.value	0x111
	.byte	0x11
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x19
	.long	.LASF105
	.value	0x125
	.byte	0x9
	.long	0x12b
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF107
	.byte	0xa4
	.long	0x44
	.quad	.LFB881
	.quad	.LFE881-.LFB881
	.uleb128 0x1
	.byte	0x9c
	.long	0xaa6
	.uleb128 0x9
	.string	"out"
	.byte	0xa4
	.byte	0x22
	.long	0x388
	.uleb128 0x3
	.byte	0x91
	.sleb128 -520
	.uleb128 0x9
	.string	"ctx"
	.byte	0xa4
	.byte	0x37
	.long	0x439
	.uleb128 0x3
	.byte	0x91
	.sleb128 -528
	.uleb128 0x3
	.long	.LASF32
	.byte	0xa5
	.byte	0x2f
	.long	0x298
	.uleb128 0x3
	.byte	0x91
	.sleb128 -536
	.uleb128 0x3
	.long	.LASF103
	.byte	0xa5
	.byte	0x40
	.long	0xbf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -540
	.uleb128 0x3
	.long	.LASF94
	.byte	0xa6
	.byte	0x29
	.long	0x27c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -552
	.uleb128 0x3
	.long	.LASF95
	.byte	0xa6
	.byte	0x36
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -560
	.uleb128 0x3
	.long	.LASF102
	.byte	0xa7
	.byte	0x2c
	.long	0x2c2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -568
	.uleb128 0x3
	.long	.LASF108
	.byte	0xa7
	.byte	0x39
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x2
	.long	.LASF109
	.byte	0xa8
	.byte	0x7
	.long	0x44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -500
	.uleb128 0xf
	.string	"iv"
	.byte	0xaf
	.byte	0xb
	.long	0x29d
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x2
	.long	.LASF110
	.byte	0xb5
	.byte	0x7
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -496
	.uleb128 0xf
	.string	"oid"
	.byte	0xb5
	.byte	0x12
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -448
	.uleb128 0x2
	.long	.LASF96
	.byte	0xb5
	.byte	0x17
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -400
	.uleb128 0xf
	.string	"kdf"
	.byte	0xb5
	.byte	0x1e
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -352
	.uleb128 0x2
	.long	.LASF111
	.byte	0xb5
	.byte	0x23
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x2
	.long	.LASF112
	.byte	0xb5
	.byte	0x2c
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -256
	.uleb128 0x2
	.long	.LASF113
	.byte	0xb5
	.byte	0x37
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -208
	.uleb128 0x2
	.long	.LASF114
	.byte	0xb5
	.byte	0x41
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x2
	.long	.LASF115
	.byte	0xb6
	.byte	0x7
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.byte	0
	.uleb128 0x1f
	.long	.LASF118
	.byte	0x92
	.long	0x44
	.quad	.LFB880
	.quad	.LFE880-.LFB880
	.uleb128 0x1
	.byte	0x9c
	.long	0xb86
	.uleb128 0x9
	.string	"ctx"
	.byte	0x92
	.byte	0x33
	.long	0x439
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0x3
	.long	.LASF32
	.byte	0x92
	.byte	0x4a
	.long	0x298
	.uleb128 0x3
	.byte	0x91
	.sleb128 -128
	.uleb128 0x3
	.long	.LASF116
	.byte	0x93
	.byte	0x31
	.long	0x2bd
	.uleb128 0x3
	.byte	0x91
	.sleb128 -136
	.uleb128 0x3
	.long	.LASF103
	.byte	0x93
	.byte	0x45
	.long	0xbf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -140
	.uleb128 0x3
	.long	.LASF94
	.byte	0x94
	.byte	0x2f
	.long	0x27c
	.uleb128 0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x3
	.long	.LASF95
	.byte	0x94
	.byte	0x3c
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x3
	.long	.LASF102
	.byte	0x95
	.byte	0x32
	.long	0x2c2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -168
	.uleb128 0x3
	.long	.LASF108
	.byte	0x95
	.byte	0x3f
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x9
	.string	"iv"
	.byte	0x96
	.byte	0x32
	.long	0x2c2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -176
	.uleb128 0x3
	.long	.LASF117
	.byte	0x96
	.byte	0x3d
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 24
	.uleb128 0x9
	.string	"enc"
	.byte	0x96
	.byte	0x49
	.long	0x44
	.uleb128 0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0xf
	.string	"key"
	.byte	0x9c
	.byte	0xb
	.long	0x281
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0xf
	.string	"ret"
	.byte	0x9d
	.byte	0x7
	.long	0x44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -100
	.byte	0
	.uleb128 0x1f
	.long	.LASF119
	.byte	0x83
	.long	0x44
	.quad	.LFB879
	.quad	.LFE879-.LFB879
	.uleb128 0x1
	.byte	0x9c
	.long	0xc05
	.uleb128 0x9
	.string	"out"
	.byte	0x83
	.byte	0x20
	.long	0x388
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x9
	.string	"nid"
	.byte	0x83
	.byte	0x29
	.long	0x44
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x15
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xf
	.string	"i"
	.byte	0x84
	.byte	0xf
	.long	0x31
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x15
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x2
	.long	.LASF21
	.byte	0x86
	.byte	0xb
	.long	0xea
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	.LASF121
	.byte	0x1
	.byte	0x79
	.byte	0x1a
	.long	0x298
	.quad	.LFB878
	.quad	.LFE878-.LFB878
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.string	"cbs"
	.byte	0x79
	.byte	0x33
	.long	0x56e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xf
	.string	"i"
	.byte	0x7a
	.byte	0xf
	.long	0x31
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
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
	.uleb128 0x3
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
	.uleb128 0x7
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x14
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xd
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x6b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x19
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
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
	.uleb128 0x1a
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 23
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.quad	.LFB878
	.quad	.LFE878-.LFB878
	.quad	.LFB879
	.quad	.LFE879-.LFB879
	.quad	.LFB880
	.quad	.LFE880-.LFB880
	.quad	.LFB881
	.quad	.LFE881-.LFB881
	.quad	.LFB882
	.quad	.LFE882-.LFB882
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
	.quad	.LFB878
	.uleb128 .LFE878-.LFB878
	.byte	0x7
	.quad	.LFB879
	.uleb128 .LFE879-.LFB879
	.byte	0x7
	.quad	.LFB880
	.uleb128 .LFE880-.LFB880
	.byte	0x7
	.quad	.LFB881
	.uleb128 .LFE881-.LFB881
	.byte	0x7
	.quad	.LFB882
	.uleb128 .LFE882-.LFB882
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF102:
	.string	"salt"
.LASF10:
	.string	"size_t"
.LASF113:
	.string	"salt_cbb"
.LASF48:
	.string	"cbb_child_st"
.LASF18:
	.string	"uint64_t"
.LASF11:
	.string	"__uint8_t"
.LASF79:
	.string	"aws_lc_fips_0_13_14_PKCS5_PBKDF2_HMAC"
.LASF51:
	.string	"pending_len_len"
.LASF20:
	.string	"CBS_ASN1_TAG"
.LASF69:
	.string	"aws_lc_fips_0_13_14_pkcs12_iterations_acceptable"
.LASF40:
	.string	"final"
.LASF22:
	.string	"is_child"
.LASF30:
	.string	"EVP_CIPHER_CTX"
.LASF85:
	.string	"aws_lc_fips_0_13_14_CBB_add_bytes"
.LASF29:
	.string	"env_md_st"
.LASF97:
	.string	"pbe_param"
.LASF91:
	.string	"aws_lc_fips_0_13_14_EVP_des_ede3_cbc"
.LASF4:
	.string	"long long int"
.LASF9:
	.string	"signed char"
.LASF56:
	.string	"cipher_func"
.LASF111:
	.string	"kdf_oid"
.LASF117:
	.string	"iv_len"
.LASF68:
	.string	"aws_lc_fips_0_13_14_CBS_peek_asn1_tag"
.LASF2:
	.string	"long int"
.LASF38:
	.string	"buf_len"
.LASF76:
	.string	"aws_lc_fips_0_13_14_RAND_bytes"
.LASF55:
	.string	"oid_len"
.LASF67:
	.string	"aws_lc_fips_0_13_14_CBS_data"
.LASF44:
	.string	"double"
.LASF98:
	.string	"kdf_obj"
.LASF35:
	.string	"key_len"
.LASF121:
	.string	"cbs_to_cipher"
.LASF71:
	.string	"aws_lc_fips_0_13_14_CBS_len"
.LASF13:
	.string	"__uint32_t"
.LASF89:
	.string	"aws_lc_fips_0_13_14_EVP_aes_192_cbc"
.LASF118:
	.string	"pkcs5_pbe2_cipher_init"
.LASF24:
	.string	"cbs_st"
.LASF19:
	.string	"long long unsigned int"
.LASF116:
	.string	"pbkdf2_md"
.LASF8:
	.string	"unsigned int"
.LASF83:
	.string	"aws_lc_fips_0_13_14_ERR_put_error"
.LASF59:
	.string	"__int128"
.LASF74:
	.string	"aws_lc_fips_0_13_14_EVP_sha1"
.LASF101:
	.string	"pbkdf2_params"
.LASF3:
	.string	"long unsigned int"
.LASF104:
	.string	"alg_id"
.LASF36:
	.string	"encrypt"
.LASF106:
	.string	"aws_lc_fips_0_13_14_PKCS5_pbe2_decrypt_init"
.LASF107:
	.string	"aws_lc_fips_0_13_14_PKCS5_pbe2_encrypt_init"
.LASF25:
	.string	"data"
.LASF7:
	.string	"short unsigned int"
.LASF23:
	.string	"cbb_st"
.LASF100:
	.string	"enc_obj"
.LASF81:
	.string	"aws_lc_fips_0_13_14_EVP_CIPHER_iv_length"
.LASF92:
	.string	"aws_lc_fips_0_13_14_EVP_rc2_cbc"
.LASF12:
	.string	"short int"
.LASF70:
	.string	"aws_lc_fips_0_13_14_CBS_get_asn1_uint64"
.LASF77:
	.string	"aws_lc_fips_0_13_14_EVP_CIPHER_nid"
.LASF14:
	.string	"__uint64_t"
.LASF49:
	.string	"base"
.LASF27:
	.string	"EVP_MD"
.LASF80:
	.string	"aws_lc_fips_0_13_14_EVP_CIPHER_key_length"
.LASF43:
	.string	"evp_cipher_st"
.LASF88:
	.string	"aws_lc_fips_0_13_14_EVP_aes_256_cbc"
.LASF96:
	.string	"param"
.LASF62:
	.string	"kPBKDF2"
.LASF26:
	.string	"ENGINE"
.LASF75:
	.string	"aws_lc_fips_0_13_14_CBB_add_asn1_uint64"
.LASF95:
	.string	"pass_len"
.LASF72:
	.string	"aws_lc_fips_0_13_14_CBS_get_asn1"
.LASF65:
	.string	"kHMACWithSHA256"
.LASF42:
	.string	"EVP_CIPHER"
.LASF52:
	.string	"pending_is_asn1"
.LASF57:
	.string	"md_func"
.LASF90:
	.string	"aws_lc_fips_0_13_14_EVP_aes_128_cbc"
.LASF47:
	.string	"error"
.LASF60:
	.string	"__int128 unsigned"
.LASF93:
	.string	"suite"
.LASF105:
	.string	"null"
.LASF61:
	.string	"_Bool"
.LASF6:
	.string	"unsigned char"
.LASF73:
	.string	"aws_lc_fips_0_13_14_EVP_sha256"
.LASF21:
	.string	"child"
.LASF86:
	.string	"aws_lc_fips_0_13_14_CBB_add_asn1"
.LASF33:
	.string	"app_data"
.LASF58:
	.string	"decrypt_init"
.LASF84:
	.string	"aws_lc_fips_0_13_14_CBB_flush"
.LASF103:
	.string	"iterations"
.LASF17:
	.string	"uint32_t"
.LASF28:
	.string	"engine_st"
.LASF5:
	.string	"long double"
.LASF15:
	.string	"char"
.LASF115:
	.string	"iv_cbb"
.LASF34:
	.string	"cipher_data"
.LASF54:
	.string	"pbe_nid"
.LASF82:
	.string	"aws_lc_fips_0_13_14_OPENSSL_cleanse"
.LASF120:
	.ascii	"GNU C11 15"
	.string	".2.0 -m64 -mtune=generic -march=x86-64 -ggdb -g -std=gnu11 -ffunction-sections -fdata-sections -fvisibility=hidden -fno-common -fPIC -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all"
.LASF41:
	.string	"poisoned"
.LASF50:
	.string	"offset"
.LASF109:
	.string	"cipher_nid"
.LASF108:
	.string	"salt_len"
.LASF119:
	.string	"add_cipher_oid"
.LASF64:
	.string	"kHMACWithSHA1"
.LASF78:
	.string	"aws_lc_fips_0_13_14_EVP_CipherInit_ex"
.LASF114:
	.string	"cipher_cbb"
.LASF46:
	.string	"can_resize"
.LASF16:
	.string	"uint8_t"
.LASF110:
	.string	"algorithm"
.LASF37:
	.string	"flags"
.LASF32:
	.string	"cipher"
.LASF66:
	.string	"kCipherOIDs"
.LASF99:
	.string	"enc_scheme"
.LASF112:
	.string	"kdf_param"
.LASF53:
	.string	"pbe_suite"
.LASF87:
	.string	"aws_lc_fips_0_13_14_CBS_mem_equal"
.LASF63:
	.string	"kPBES2"
.LASF45:
	.string	"cbb_buffer_st"
.LASF39:
	.string	"final_used"
.LASF94:
	.string	"pass"
.LASF31:
	.string	"evp_cipher_ctx_st"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/mnt/HARDONE/NSI_Repos/tacvoice/gateway/target/debug/build/aws-lc-fips-sys-802b9ac702614b53/out/build/aws-lc/crypto"
.LASF0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/pkcs8/p5_pbev2.c"
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
