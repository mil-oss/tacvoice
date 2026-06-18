	.file	"poly1305_vec.c"
	.text
.Ltext0:
	.file 0 "/mnt/HARDONE/NSI_Repos/tacvoice/gateway/target/debug/build/aws-lc-fips-sys-802b9ac702614b53/out/build/aws-lc/crypto" "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/poly1305/poly1305_vec.c"
	.section	.text.OPENSSL_memcpy,"ax",@progbits
	.type	OPENSSL_memcpy, @function
OPENSSL_memcpy:
.LFB94:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/poly1305/../internal.h"
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
	jne	.L2
	.loc 1 936 12
	movq	-8(%rbp), %rax
	jmp	.L3
.L2:
	.loc 1 939 10
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
.L3:
	.loc 1 940 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE94:
	.size	OPENSSL_memcpy, .-OPENSSL_memcpy
	.section	.text.OPENSSL_memset,"ax",@progbits
	.type	OPENSSL_memset, @function
OPENSSL_memset:
.LFB96:
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
	jne	.L5
	.loc 1 952 12
	movq	-8(%rbp), %rax
	jmp	.L6
.L5:
	.loc 1 955 10
	movq	-24(%rbp), %rdx
	movl	-12(%rbp), %ecx
	movq	-8(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	memset@PLT
.L6:
	.loc 1 956 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE96:
	.size	OPENSSL_memset, .-OPENSSL_memset
	.section	.text.CRYPTO_load_u32_le,"ax",@progbits
	.type	CRYPTO_load_u32_le, @function
CRYPTO_load_u32_le:
.LFB101:
	.loc 1 999 59
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 999 59
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1001 3
	movq	-24(%rbp), %rcx
	leaq	-12(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	OPENSSL_memcpy
	.loc 1 1005 10
	movl	-12(%rbp), %eax
	.loc 1 1007 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE101:
	.size	CRYPTO_load_u32_le, .-CRYPTO_load_u32_le
	.section	.text.CRYPTO_load_u64_le,"ax",@progbits
	.type	CRYPTO_load_u64_le, @function
CRYPTO_load_u64_le:
.LFB105:
	.loc 1 1036 59
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 1036 59
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 1038 3
	movq	-24(%rbp), %rcx
	leaq	-16(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	OPENSSL_memcpy
	.loc 1 1042 10
	movq	-16(%rbp), %rax
	.loc 1 1044 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L12
	call	__stack_chk_fail@PLT
.L12:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE105:
	.size	CRYPTO_load_u64_le, .-CRYPTO_load_u64_le
	.section	.text.CRYPTO_store_u64_le,"ax",@progbits
	.type	CRYPTO_store_u64_le, @function
CRYPTO_store_u64_le:
.LFB106:
	.loc 1 1046 63
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 1 1050 3
	leaq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	OPENSSL_memcpy
	.loc 1 1052 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE106:
	.size	CRYPTO_store_u64_le, .-CRYPTO_store_u64_le
	.section	.rodata.poly1305_x64_sse2_message_mask,"a"
	.align 16
	.type	poly1305_x64_sse2_message_mask, @object
	.size	poly1305_x64_sse2_message_mask, 16
poly1305_x64_sse2_message_mask:
	.long	67108863
	.long	0
	.long	67108863
	.long	0
	.section	.rodata.poly1305_x64_sse2_5,"a"
	.align 16
	.type	poly1305_x64_sse2_5, @object
	.size	poly1305_x64_sse2_5, 16
poly1305_x64_sse2_5:
	.long	5
	.long	0
	.long	5
	.long	0
	.section	.rodata.poly1305_x64_sse2_1shl128,"a"
	.align 16
	.type	poly1305_x64_sse2_1shl128, @object
	.size	poly1305_x64_sse2_1shl128, 16
poly1305_x64_sse2_1shl128:
	.long	16777216
	.long	0
	.long	16777216
	.long	0
	.section	.text.add128,"ax",@progbits
	.type	add128, @function
add128:
.LFB625:
	.file 2 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/poly1305/poly1305_vec.c"
	.loc 2 38 58
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, %rax
	movq	%rsi, %r8
	movq	%rax, %rsi
	movl	$0, %edi
	movq	%r8, %rdi
	movq	%rsi, -32(%rbp)
	movq	%rdi, -24(%rbp)
	movq	%rdx, -48(%rbp)
	movq	%rcx, -40(%rbp)
	.loc 2 38 69
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rbx
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	addq	%rcx, %rax
	adcq	%rbx, %rdx
	.loc 2 38 74
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE625:
	.size	add128, .-add128
	.section	.text.add128_64,"ax",@progbits
	.type	add128_64, @function
add128_64:
.LFB626:
	.loc 2 40 60
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, %rax
	movq	%rax, %rcx
	movl	$0, %ebx
	movq	%rsi, %rbx
	movq	%rcx, -32(%rbp)
	movq	%rbx, -24(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 2 40 71
	movq	-40(%rbp), %rax
	movl	$0, %edx
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rbx
	addq	%rcx, %rax
	adcq	%rbx, %rdx
	.loc 2 40 76
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE626:
	.size	add128_64, .-add128_64
	.section	.text.mul64x64_128,"ax",@progbits
	.type	mul64x64_128, @function
mul64x64_128:
.LFB627:
	.loc 2 42 62
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 2 43 10
	movq	-24(%rbp), %rax
	movl	$0, %edx
	.loc 2 43 23
	movq	-32(%rbp), %rcx
	movl	$0, %ebx
	movq	%rdx, %rdi
	imulq	%rcx, %rdi
	movq	%rbx, %rsi
	imulq	%rax, %rsi
	addq	%rdi, %rsi
	mulq	%rcx
	leaq	(%rsi,%rdx), %rcx
	movq	%rcx, %rdx
	.loc 2 44 1
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE627:
	.size	mul64x64_128, .-mul64x64_128
	.section	.text.lo128,"ax",@progbits
	.type	lo128, @function
lo128:
.LFB628:
	.loc 2 46 43
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, %rax
	movq	%rsi, %rcx
	movq	%rax, %rax
	movl	$0, %edx
	movq	%rcx, %rdx
	movq	%rax, -16(%rbp)
	movq	%rdx, -8(%rbp)
	.loc 2 46 52
	movq	-16(%rbp), %rax
	.loc 2 46 65
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE628:
	.size	lo128, .-lo128
	.section	.text.shr128,"ax",@progbits
	.type	shr128, @function
shr128:
.LFB629:
	.loc 2 48 61
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, %rax
	movq	%rax, %rcx
	movl	$0, %ebx
	movq	%rsi, %rbx
	movq	%rcx, -32(%rbp)
	movq	%rbx, -24(%rbp)
	movl	%edx, -36(%rbp)
	.loc 2 49 23
	movl	-36(%rbp), %ecx
	movq	-32(%rbp), %rax
	movq	-24(%rbp), %rdx
	shrdq	%cl, %rdx, %rax
	shrq	%cl, %rdx
	testb	$64, %cl
	je	.L24
	movq	%rdx, %rax
	xorl	%edx, %edx
.L24:
	.loc 2 50 1
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE629:
	.size	shr128, .-shr128
	.section	.text.shr128_pair,"ax",@progbits
	.type	shr128_pair, @function
shr128_pair:
.LFB630:
	.loc 2 52 79
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	.loc 2 53 23
	movq	-24(%rbp), %rax
	movl	$0, %edx
	.loc 2 53 37
	movq	%rax, %rdx
	xorl	%eax, %eax
	.loc 2 53 44
	movq	-32(%rbp), %rcx
	movl	$0, %ebx
	orq	%rcx, %rax
	orq	%rbx, %rdx
	.loc 2 53 50
	movl	-36(%rbp), %ecx
	shrdq	%cl, %rdx, %rax
	shrq	%cl, %rdx
	testb	$64, %cl
	je	.L27
	movq	%rdx, %rax
	xorl	%edx, %edx
.L27:
	.loc 2 54 1
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE630:
	.size	shr128_pair, .-shr128_pair
	.section	.text.poly1305_aligned_state,"ax",@progbits
	.type	poly1305_aligned_state, @function
poly1305_aligned_state:
.LFB631:
	.loc 2 84 28
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 2 85 39
	movq	-8(%rbp), %rax
	.loc 2 85 55
	addq	$63, %rax
	.loc 2 85 61
	andq	$-64, %rax
	.loc 2 86 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE631:
	.size	poly1305_aligned_state, .-poly1305_aligned_state
	.section	.text.poly1305_min,"ax",@progbits
	.type	poly1305_min, @function
poly1305_min:
.LFB632:
	.loc 2 88 55
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 2 89 22
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	cmpq	%rax, %rdx
	cmovbe	%rdx, %rax
	.loc 2 90 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE632:
	.size	poly1305_min, .-poly1305_min
	.section	.text.aws_lc_fips_0_13_14_CRYPTO_poly1305_init,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_CRYPTO_poly1305_init
	.type	aws_lc_fips_0_13_14_CRYPTO_poly1305_init, @function
aws_lc_fips_0_13_14_CRYPTO_poly1305_init:
.LFB633:
	.loc 2 92 73
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	.loc 2 93 33
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	poly1305_aligned_state
	movq	%rax, -56(%rbp)
	.loc 2 99 8
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	CRYPTO_load_u64_le
	movq	%rax, -48(%rbp)
	.loc 2 100 31
	movq	-80(%rbp), %rax
	addq	$8, %rax
	.loc 2 100 8
	movq	%rax, %rdi
	call	CRYPTO_load_u64_le
	movq	%rax, -40(%rbp)
	.loc 2 101 6
	movabsq	$17575274610687, %rax
	andq	-48(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 2 102 6
	shrq	$44, -48(%rbp)
	.loc 2 103 12
	movq	-40(%rbp), %rax
	salq	$20, %rax
	.loc 2 103 6
	orq	%rax, -48(%rbp)
	.loc 2 104 6
	movabsq	$17592181915647, %rax
	andq	-48(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 2 105 6
	shrq	$24, -40(%rbp)
	.loc 2 106 6
	movabsq	$68719475727, %rax
	andq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 2 109 5
	movq	-56(%rbp), %rax
	addq	$144, %rax
	movq	%rax, -8(%rbp)
	.loc 2 110 17
	movq	-32(%rbp), %rax
	movl	%eax, %edx
	.loc 2 110 15
	movq	-8(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 2 111 31
	movq	-32(%rbp), %rax
	shrq	$32, %rax
	.loc 2 111 17
	movl	%eax, %edx
	.loc 2 111 15
	movq	-8(%rbp), %rax
	movl	%edx, 12(%rax)
	.loc 2 112 17
	movq	-24(%rbp), %rax
	movl	%eax, %edx
	.loc 2 112 15
	movq	-8(%rbp), %rax
	movl	%edx, 20(%rax)
	.loc 2 113 31
	movq	-24(%rbp), %rax
	shrq	$32, %rax
	.loc 2 113 17
	movl	%eax, %edx
	.loc 2 113 15
	movq	-8(%rbp), %rax
	movl	%edx, 28(%rax)
	.loc 2 114 17
	movq	-16(%rbp), %rax
	movl	%eax, %edx
	.loc 2 114 15
	movq	-8(%rbp), %rax
	movl	%edx, 36(%rax)
	.loc 2 115 31
	movq	-16(%rbp), %rax
	shrq	$32, %rax
	.loc 2 115 17
	movl	%eax, %edx
	.loc 2 115 15
	movq	-8(%rbp), %rax
	movl	%edx, 44(%rax)
	.loc 2 118 40
	movq	-80(%rbp), %rax
	addq	$16, %rax
	.loc 2 118 17
	movq	%rax, %rdi
	call	CRYPTO_load_u32_le
	.loc 2 118 15 discriminator 1
	movq	-8(%rbp), %rdx
	movl	%eax, 52(%rdx)
	.loc 2 119 40
	movq	-80(%rbp), %rax
	addq	$20, %rax
	.loc 2 119 17
	movq	%rax, %rdi
	call	CRYPTO_load_u32_le
	.loc 2 119 15 discriminator 1
	movq	-8(%rbp), %rdx
	movl	%eax, 60(%rdx)
	.loc 2 120 40
	movq	-80(%rbp), %rax
	addq	$24, %rax
	.loc 2 120 17
	movq	%rax, %rdi
	call	CRYPTO_load_u32_le
	.loc 2 120 15 discriminator 1
	movq	-8(%rbp), %rdx
	movl	%eax, 68(%rdx)
	.loc 2 121 40
	movq	-80(%rbp), %rax
	addq	$28, %rax
	.loc 2 121 17
	movq	%rax, %rdi
	call	CRYPTO_load_u32_le
	.loc 2 121 15 discriminator 1
	movq	-8(%rbp), %rdx
	movl	%eax, 76(%rdx)
.LBB808:
.LBB809:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/15/include/emmintrin.h"
	.loc 3 803 24
	pxor	%xmm0, %xmm0
.LBE809:
.LBE808:
	.loc 2 124 14 discriminator 1
	movq	-56(%rbp), %rax
	movaps	%xmm0, 288(%rax)
.LBB810:
.LBB811:
	.loc 3 803 24
	pxor	%xmm0, %xmm0
.LBE811:
.LBE810:
	.loc 2 125 14 discriminator 1
	movq	-56(%rbp), %rax
	movaps	%xmm0, 304(%rax)
.LBB812:
.LBB813:
	.loc 3 803 24
	pxor	%xmm0, %xmm0
.LBE813:
.LBE812:
	.loc 2 126 14 discriminator 1
	movq	-56(%rbp), %rax
	movaps	%xmm0, 320(%rax)
.LBB814:
.LBB815:
	.loc 3 803 24
	pxor	%xmm0, %xmm0
.LBE815:
.LBE814:
	.loc 2 127 14 discriminator 1
	movq	-56(%rbp), %rax
	movaps	%xmm0, 336(%rax)
.LBB816:
.LBB817:
	.loc 3 803 24
	pxor	%xmm0, %xmm0
.LBE817:
.LBE816:
	.loc 2 128 14 discriminator 1
	movq	-56(%rbp), %rax
	movaps	%xmm0, 352(%rax)
	.loc 2 130 15
	movq	-56(%rbp), %rax
	movq	$0, 368(%rax)
	.loc 2 131 16
	movq	-56(%rbp), %rax
	movq	$0, 376(%rax)
	.loc 2 132 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE633:
	.size	aws_lc_fips_0_13_14_CRYPTO_poly1305_init, .-aws_lc_fips_0_13_14_CRYPTO_poly1305_init
	.section	.text.poly1305_first_block,"ax",@progbits
	.type	poly1305_first_block, @function
poly1305_first_block:
.LFB634:
	.loc 2 135 52
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	subq	$1024, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	movq	%rdi, -1032(%rbp)
	movq	%rsi, -1040(%rbp)
	.loc 2 135 52
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	leaq	poly1305_x64_sse2_message_mask(%rip), %rax
	movq	%rax, -808(%rbp)
.LBB818:
.LBB819:
	.loc 3 701 10
	movq	-808(%rbp), %rax
	movdqa	(%rax), %xmm0
.LBE819:
.LBE818:
	.loc 2 136 22
	movaps	%xmm0, -624(%rbp)
	leaq	poly1305_x64_sse2_5(%rip), %rax
	movq	%rax, -800(%rbp)
.LBB820:
.LBB821:
	.loc 3 701 10
	movq	-800(%rbp), %rax
	movdqa	(%rax), %xmm0
.LBE821:
.LBE820:
	.loc 2 137 21
	movaps	%xmm0, -608(%rbp)
	leaq	poly1305_x64_sse2_1shl128(%rip), %rax
	movq	%rax, -792(%rbp)
.LBB822:
.LBB823:
	.loc 3 701 10
	movq	-792(%rbp), %rax
	movdqa	(%rax), %xmm0
.LBE823:
.LBE822:
	.loc 2 138 22
	movaps	%xmm0, -592(%rbp)
	.loc 2 149 5
	movq	-1032(%rbp), %rax
	addq	$144, %rax
	movq	%rax, -904(%rbp)
	.loc 2 151 27
	movq	-904(%rbp), %rax
	movl	12(%rax), %eax
	.loc 2 151 9
	movl	%eax, %eax
	.loc 2 151 31
	salq	$32, %rax
	movq	%rax, %rdx
	.loc 2 151 58
	movq	-904(%rbp), %rax
	movl	4(%rax), %eax
	.loc 2 151 40
	movl	%eax, %eax
	.loc 2 151 6
	orq	%rdx, %rax
	movq	%rax, -864(%rbp)
	.loc 2 152 27
	movq	-904(%rbp), %rax
	movl	28(%rax), %eax
	.loc 2 152 9
	movl	%eax, %eax
	.loc 2 152 31
	salq	$32, %rax
	movq	%rax, %rdx
	.loc 2 152 58
	movq	-904(%rbp), %rax
	movl	20(%rax), %eax
	.loc 2 152 40
	movl	%eax, %eax
	.loc 2 152 6
	orq	%rdx, %rax
	movq	%rax, -856(%rbp)
	.loc 2 153 27
	movq	-904(%rbp), %rax
	movl	44(%rax), %eax
	.loc 2 153 9
	movl	%eax, %eax
	.loc 2 153 31
	salq	$32, %rax
	movq	%rax, %rdx
	.loc 2 153 58
	movq	-904(%rbp), %rax
	movl	36(%rax), %eax
	.loc 2 153 40
	movl	%eax, %eax
	.loc 2 153 6
	orq	%rdx, %rax
	movq	%rax, -848(%rbp)
	.loc 2 154 29
	movq	-904(%rbp), %rax
	movl	60(%rax), %eax
	.loc 2 154 11
	movl	%eax, %eax
	.loc 2 154 33
	salq	$32, %rax
	movq	%rax, %rdx
	.loc 2 154 60
	movq	-904(%rbp), %rax
	movl	52(%rax), %eax
	.loc 2 154 42
	movl	%eax, %eax
	.loc 2 154 8
	orq	%rdx, %rax
	movq	%rax, -840(%rbp)
	.loc 2 155 29
	movq	-904(%rbp), %rax
	movl	76(%rax), %eax
	.loc 2 155 11
	movl	%eax, %eax
	.loc 2 155 33
	salq	$32, %rax
	movq	%rax, %rdx
	.loc 2 155 60
	movq	-904(%rbp), %rax
	movl	68(%rax), %eax
	.loc 2 155 42
	movl	%eax, %eax
	.loc 2 155 8
	orq	%rdx, %rax
	movq	%rax, -832(%rbp)
	.loc 2 158 7
	movq	-864(%rbp), %rax
	movq	%rax, -896(%rbp)
	.loc 2 159 7
	movq	-856(%rbp), %rax
	movq	%rax, -888(%rbp)
	.loc 2 160 7
	movq	-848(%rbp), %rax
	movq	%rax, -880(%rbp)
	.loc 2 161 10
	movq	$0, -872(%rbp)
	.loc 2 161 3
	jmp	.L42
.L57:
	.loc 2 162 9
	movq	-880(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, -824(%rbp)
	.loc 2 164 12
	movq	-888(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	movq	-824(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	mul64x64_128
	movq	%rax, %r12
	movq	%rdx, %r13
	.loc 2 164 12 is_stmt 0 discriminator 1
	movq	-896(%rbp), %rdx
	movq	-896(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	mul64x64_128
	.loc 2 164 12 discriminator 2
	movq	%rax, %rsi
	movq	%rdx, %rax
	movq	%r12, %rdx
	movq	%r13, %rcx
	movq	%rsi, %rdi
	movq	%rax, %rsi
	call	add128
	.loc 2 164 10 is_stmt 1 discriminator 3
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 2 165 12
	movq	-896(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	movq	-888(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	mul64x64_128
	movq	%rax, %r12
	movq	%rdx, %r13
	.loc 2 165 12 is_stmt 0 discriminator 1
	movq	-824(%rbp), %rdx
	movq	-880(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	mul64x64_128
	.loc 2 165 12 discriminator 2
	movq	%rax, %rsi
	movq	%rdx, %rax
	movq	%r12, %rdx
	movq	%r13, %rcx
	movq	%rsi, %rdi
	movq	%rax, %rsi
	call	add128
	.loc 2 165 10 is_stmt 1 discriminator 3
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 2 166 12
	movq	-880(%rbp), %rax
	leaq	(%rax,%rax), %rdx
	movq	-896(%rbp), %rax
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	mul64x64_128
	movq	%rax, %r12
	movq	%rdx, %r13
	.loc 2 166 12 is_stmt 0 discriminator 1
	movq	-888(%rbp), %rdx
	movq	-888(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	mul64x64_128
	.loc 2 166 12 discriminator 2
	movq	%rax, %rsi
	movq	%rdx, %rax
	movq	%r12, %rdx
	movq	%r13, %rcx
	movq	%rsi, %rdi
	movq	%rax, %rsi
	call	add128
	.loc 2 166 10 is_stmt 1 discriminator 3
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 2 168 11
	movq	-80(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	movq	%rdx, %rax
	movq	%rcx, %rdi
	movq	%rax, %rsi
	call	lo128
	.loc 2 168 9 discriminator 1
	movabsq	$17592186044415, %rdx
	andq	%rdx, %rax
	movq	%rax, -896(%rbp)
	.loc 2 169 9
	movq	-80(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	%rax, %rcx
	movq	%rdx, %rax
	movl	$44, %edx
	movq	%rcx, %rdi
	movq	%rax, %rsi
	call	shr128
	movq	%rax, -816(%rbp)
	.loc 2 170 12
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	-816(%rbp), %rcx
	movq	%rax, %rsi
	movq	%rdx, %rax
	movq	%rcx, %rdx
	movq	%rsi, %rdi
	movq	%rax, %rsi
	call	add128_64
	.loc 2 170 10 discriminator 1
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 2 171 11
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rcx
	movq	%rdx, %rax
	movq	%rcx, %rdi
	movq	%rax, %rsi
	call	lo128
	.loc 2 171 9 discriminator 1
	movabsq	$17592186044415, %rdx
	andq	%rdx, %rax
	movq	%rax, -888(%rbp)
	.loc 2 172 9
	movq	-64(%rbp), %rax
	movq	-56(%rbp), %rdx
	movq	%rax, %rcx
	movq	%rdx, %rax
	movl	$44, %edx
	movq	%rcx, %rdi
	movq	%rax, %rsi
	call	shr128
	movq	%rax, -816(%rbp)
	.loc 2 173 12
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	-816(%rbp), %rcx
	movq	%rax, %rsi
	movq	%rdx, %rax
	movq	%rcx, %rdx
	movq	%rsi, %rdi
	movq	%rax, %rsi
	call	add128_64
	.loc 2 173 10 discriminator 1
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 2 174 11
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, %rcx
	movq	%rdx, %rax
	movq	%rcx, %rdi
	movq	%rax, %rsi
	call	lo128
	.loc 2 174 9 discriminator 1
	movabsq	$4398046511103, %rdx
	andq	%rdx, %rax
	movq	%rax, -880(%rbp)
	.loc 2 175 9
	movq	-48(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rax, %rcx
	movq	%rdx, %rax
	movl	$42, %edx
	movq	%rcx, %rdi
	movq	%rax, %rsi
	call	shr128
	movq	%rax, -816(%rbp)
	.loc 2 176 14
	movq	-816(%rbp), %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	.loc 2 176 9
	addq	%rax, -896(%rbp)
	.loc 2 177 7
	movq	-896(%rbp), %rax
	shrq	$44, %rax
	movq	%rax, -816(%rbp)
	.loc 2 178 9
	movabsq	$17592186044415, %rax
	andq	%rax, -896(%rbp)
	.loc 2 179 9
	movq	-816(%rbp), %rax
	addq	%rax, -888(%rbp)
	.loc 2 181 16
	movq	-896(%rbp), %rax
	andl	$67108863, %eax
	movl	%eax, -944(%rbp)
	movl	$0, -940(%rbp)
	movl	$0, -936(%rbp)
	movl	$0, -932(%rbp)
	movl	-944(%rbp), %eax
	movl	%eax, -928(%rbp)
.LBB824:
.LBB825:
.LBB826:
.LBB827:
	.loc 3 608 41
	movd	-940(%rbp), %xmm0
	movd	-936(%rbp), %xmm1
	movdqa	%xmm1, %xmm2
	punpckldq	%xmm0, %xmm2
	movd	-932(%rbp), %xmm1
	movd	-928(%rbp), %xmm0
	punpckldq	%xmm1, %xmm0
	punpcklqdq	%xmm2, %xmm0
.LBE827:
.LBE826:
	.loc 3 1569 10
	nop
.LBE825:
.LBE824:
	.loc 2 181 16 discriminator 1
	pshufd	$68, %xmm0, %xmm0
	.loc 2 181 14 discriminator 2
	movq	-904(%rbp), %rax
	movaps	%xmm0, (%rax)
	.loc 2 183 16
	movq	-896(%rbp), %rax
	shrq	$26, %rax
	movl	%eax, %edx
	movq	-888(%rbp), %rax
	sall	$18, %eax
	orl	%edx, %eax
	andl	$67108863, %eax
	movl	%eax, -964(%rbp)
	movl	$0, -960(%rbp)
	movl	$0, -956(%rbp)
	movl	$0, -952(%rbp)
	movl	-964(%rbp), %eax
	movl	%eax, -948(%rbp)
.LBB828:
.LBB829:
.LBB830:
.LBB831:
	.loc 3 608 41
	movd	-960(%rbp), %xmm0
	movd	-956(%rbp), %xmm1
	movdqa	%xmm1, %xmm2
	punpckldq	%xmm0, %xmm2
	movd	-952(%rbp), %xmm1
	movd	-948(%rbp), %xmm0
	punpckldq	%xmm1, %xmm0
	punpcklqdq	%xmm2, %xmm0
.LBE831:
.LBE830:
	.loc 3 1569 10
	nop
.LBE829:
.LBE828:
	.loc 2 183 16 discriminator 1
	pshufd	$68, %xmm0, %xmm0
	.loc 2 183 14 discriminator 2
	movq	-904(%rbp), %rax
	movaps	%xmm0, 16(%rax)
	.loc 2 187 9
	movq	-888(%rbp), %rax
	shrq	$8, %rax
	andl	$67108863, %eax
	movl	%eax, -984(%rbp)
	movl	$0, -980(%rbp)
	movl	$0, -976(%rbp)
	movl	$0, -972(%rbp)
	movl	-984(%rbp), %eax
	movl	%eax, -968(%rbp)
.LBB832:
.LBB833:
.LBB834:
.LBB835:
	.loc 3 608 41
	movd	-980(%rbp), %xmm0
	movd	-976(%rbp), %xmm1
	movdqa	%xmm1, %xmm2
	punpckldq	%xmm0, %xmm2
	movd	-972(%rbp), %xmm1
	movd	-968(%rbp), %xmm0
	punpckldq	%xmm1, %xmm0
	punpcklqdq	%xmm2, %xmm0
.LBE835:
.LBE834:
	.loc 3 1569 10
	nop
.LBE833:
.LBE832:
	.loc 2 187 9 discriminator 1
	pshufd	$68, %xmm0, %xmm0
	.loc 2 186 14
	movq	-904(%rbp), %rax
	movaps	%xmm0, 32(%rax)
	.loc 2 189 16
	movq	-888(%rbp), %rax
	shrq	$34, %rax
	movl	%eax, %edx
	movq	-880(%rbp), %rax
	sall	$10, %eax
	orl	%edx, %eax
	andl	$67108863, %eax
	movl	%eax, -1004(%rbp)
	movl	$0, -1000(%rbp)
	movl	$0, -996(%rbp)
	movl	$0, -992(%rbp)
	movl	-1004(%rbp), %eax
	movl	%eax, -988(%rbp)
.LBB836:
.LBB837:
.LBB838:
.LBB839:
	.loc 3 608 41
	movd	-1000(%rbp), %xmm0
	movd	-996(%rbp), %xmm1
	movdqa	%xmm1, %xmm2
	punpckldq	%xmm0, %xmm2
	movd	-992(%rbp), %xmm1
	movd	-988(%rbp), %xmm0
	punpckldq	%xmm1, %xmm0
	punpcklqdq	%xmm2, %xmm0
.LBE839:
.LBE838:
	.loc 3 1569 10
	nop
.LBE837:
.LBE836:
	.loc 2 189 16 discriminator 1
	pshufd	$68, %xmm0, %xmm0
	.loc 2 189 14 discriminator 2
	movq	-904(%rbp), %rax
	movaps	%xmm0, 48(%rax)
	.loc 2 192 16
	movq	-880(%rbp), %rax
	shrq	$16, %rax
	movl	%eax, -1024(%rbp)
	movl	$0, -1020(%rbp)
	movl	$0, -1016(%rbp)
	movl	$0, -1012(%rbp)
	movl	-1024(%rbp), %eax
	movl	%eax, -1008(%rbp)
.LBB840:
.LBB841:
.LBB842:
.LBB843:
	.loc 3 608 41
	movd	-1020(%rbp), %xmm0
	movd	-1016(%rbp), %xmm1
	movdqa	%xmm1, %xmm2
	punpckldq	%xmm0, %xmm2
	movd	-1012(%rbp), %xmm1
	movd	-1008(%rbp), %xmm0
	punpckldq	%xmm1, %xmm0
	punpcklqdq	%xmm2, %xmm0
.LBE843:
.LBE842:
	.loc 3 1569 10
	nop
.LBE841:
.LBE840:
	.loc 2 192 16 discriminator 1
	pshufd	$68, %xmm0, %xmm0
	.loc 2 192 14 discriminator 2
	movq	-904(%rbp), %rax
	movaps	%xmm0, 64(%rax)
	.loc 2 194 36
	movq	-904(%rbp), %rax
	movdqa	16(%rax), %xmm0
	movaps	%xmm0, -448(%rbp)
	movdqa	-608(%rbp), %xmm0
	movaps	%xmm0, -432(%rbp)
.LBB844:
.LBB845:
	.loc 3 1181 19
	movdqa	-432(%rbp), %xmm0
	movdqa	-448(%rbp), %xmm1
	pmuludq	%xmm1, %xmm0
	.loc 3 1181 10
	nop
.LBE845:
.LBE844:
	.loc 2 194 14 discriminator 1
	movq	-904(%rbp), %rax
	movaps	%xmm0, 80(%rax)
	.loc 2 195 36
	movq	-904(%rbp), %rax
	movdqa	32(%rax), %xmm0
	movaps	%xmm0, -480(%rbp)
	movdqa	-608(%rbp), %xmm0
	movaps	%xmm0, -464(%rbp)
.LBB846:
.LBB847:
	.loc 3 1181 19
	movdqa	-464(%rbp), %xmm0
	movdqa	-480(%rbp), %xmm1
	pmuludq	%xmm1, %xmm0
	.loc 3 1181 10
	nop
.LBE847:
.LBE846:
	.loc 2 195 14 discriminator 1
	movq	-904(%rbp), %rax
	movaps	%xmm0, 96(%rax)
	.loc 2 196 36
	movq	-904(%rbp), %rax
	movdqa	48(%rax), %xmm0
	movaps	%xmm0, -512(%rbp)
	movdqa	-608(%rbp), %xmm0
	movaps	%xmm0, -496(%rbp)
.LBB848:
.LBB849:
	.loc 3 1181 19
	movdqa	-496(%rbp), %xmm0
	movdqa	-512(%rbp), %xmm1
	pmuludq	%xmm1, %xmm0
	.loc 3 1181 10
	nop
.LBE849:
.LBE848:
	.loc 2 196 14 discriminator 1
	movq	-904(%rbp), %rax
	movaps	%xmm0, 112(%rax)
	.loc 2 197 36
	movq	-904(%rbp), %rax
	movdqa	64(%rax), %xmm0
	movaps	%xmm0, -544(%rbp)
	movdqa	-608(%rbp), %xmm0
	movaps	%xmm0, -528(%rbp)
.LBB850:
.LBB851:
	.loc 3 1181 19
	movdqa	-528(%rbp), %xmm0
	movdqa	-544(%rbp), %xmm1
	pmuludq	%xmm1, %xmm0
	.loc 3 1181 10
	nop
.LBE851:
.LBE850:
	.loc 2 197 14 discriminator 1
	movq	-904(%rbp), %rax
	movaps	%xmm0, 128(%rax)
	.loc 2 198 6
	subq	$144, -904(%rbp)
	.loc 2 161 23 discriminator 3
	addq	$1, -872(%rbp)
.L42:
	.loc 2 161 17 discriminator 1
	cmpq	$1, -872(%rbp)
	jbe	.L57
	.loc 2 202 5
	movq	-1032(%rbp), %rax
	addq	$144, %rax
	movq	%rax, -904(%rbp)
	.loc 2 203 17
	movq	-864(%rbp), %rax
	movl	%eax, %edx
	.loc 2 203 15
	movq	-904(%rbp), %rax
	movl	%edx, 4(%rax)
	.loc 2 204 31
	movq	-864(%rbp), %rax
	shrq	$32, %rax
	.loc 2 204 17
	movl	%eax, %edx
	.loc 2 204 15
	movq	-904(%rbp), %rax
	movl	%edx, 12(%rax)
	.loc 2 205 17
	movq	-856(%rbp), %rax
	movl	%eax, %edx
	.loc 2 205 15
	movq	-904(%rbp), %rax
	movl	%edx, 20(%rax)
	.loc 2 206 31
	movq	-856(%rbp), %rax
	shrq	$32, %rax
	.loc 2 206 17
	movl	%eax, %edx
	.loc 2 206 15
	movq	-904(%rbp), %rax
	movl	%edx, 28(%rax)
	.loc 2 207 17
	movq	-848(%rbp), %rax
	movl	%eax, %edx
	.loc 2 207 15
	movq	-904(%rbp), %rax
	movl	%edx, 36(%rax)
	.loc 2 208 31
	movq	-848(%rbp), %rax
	shrq	$32, %rax
	.loc 2 208 17
	movl	%eax, %edx
	.loc 2 208 15
	movq	-904(%rbp), %rax
	movl	%edx, 44(%rax)
	.loc 2 209 17
	movq	-840(%rbp), %rax
	movl	%eax, %edx
	.loc 2 209 15
	movq	-904(%rbp), %rax
	movl	%edx, 52(%rax)
	.loc 2 210 33
	movq	-840(%rbp), %rax
	shrq	$32, %rax
	.loc 2 210 17
	movl	%eax, %edx
	.loc 2 210 15
	movq	-904(%rbp), %rax
	movl	%edx, 60(%rax)
	.loc 2 211 17
	movq	-832(%rbp), %rax
	movl	%eax, %edx
	.loc 2 211 15
	movq	-904(%rbp), %rax
	movl	%edx, 68(%rax)
	.loc 2 212 33
	movq	-832(%rbp), %rax
	shrq	$32, %rax
	.loc 2 212 17
	movl	%eax, %edx
	.loc 2 212 15
	movq	-904(%rbp), %rax
	movl	%edx, 76(%rax)
	.loc 2 216 60
	movq	-1040(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -664(%rbp)
.LBB852:
.LBB853:
	.loc 3 713 10
	movq	-664(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movq	%rdx, -656(%rbp)
	movq	%rax, -648(%rbp)
.LBB854:
.LBB855:
	.loc 3 602 10
	movq	-648(%rbp), %rax
	movq	-656(%rbp), %rdx
	movq	%rdx, -640(%rbp)
	movq	%rax, -632(%rbp)
.LBB856:
.LBB857:
	.loc 3 596 24
	movq	-640(%rbp), %xmm1
	movq	-632(%rbp), %xmm0
	punpcklqdq	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
.LBE857:
.LBE856:
	.loc 3 602 10
	nop
.LBE855:
.LBE854:
	.loc 3 713 10
	nop
	movq	-1040(%rbp), %rax
	movq	%rax, -704(%rbp)
.LBE853:
.LBE852:
.LBB858:
.LBB859:
	movq	-704(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movq	%rdx, -696(%rbp)
	movq	%rax, -688(%rbp)
.LBB860:
.LBB861:
	.loc 3 602 10
	movq	-688(%rbp), %rax
	movq	-696(%rbp), %rdx
	movq	%rdx, -680(%rbp)
	movq	%rax, -672(%rbp)
.LBB862:
.LBB863:
	.loc 3 596 24
	movq	-680(%rbp), %xmm2
	movq	-672(%rbp), %xmm0
	punpcklqdq	%xmm2, %xmm0
.LBE863:
.LBE862:
	.loc 3 602 10
	nop
.LBE861:
.LBE860:
	.loc 3 713 10
	nop
	movaps	%xmm0, -112(%rbp)
	movaps	%xmm1, -96(%rbp)
.LBE859:
.LBE858:
.LBB864:
.LBB865:
	.loc 3 1055 19
	movdqa	-112(%rbp), %xmm0
	punpcklqdq	-96(%rbp), %xmm0
	.loc 3 1055 10
	nop
.LBE865:
.LBE864:
	.loc 2 215 8 discriminator 2
	movaps	%xmm0, -576(%rbp)
	.loc 2 218 60
	movq	-1040(%rbp), %rax
	addq	$24, %rax
	movq	%rax, -744(%rbp)
.LBB866:
.LBB867:
	.loc 3 713 10
	movq	-744(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movq	%rdx, -736(%rbp)
	movq	%rax, -728(%rbp)
.LBB868:
.LBB869:
	.loc 3 602 10
	movq	-728(%rbp), %rax
	movq	-736(%rbp), %rdx
	movq	%rdx, -720(%rbp)
	movq	%rax, -712(%rbp)
.LBB870:
.LBB871:
	.loc 3 596 24
	movq	-720(%rbp), %xmm1
	movq	-712(%rbp), %xmm0
	punpcklqdq	%xmm1, %xmm0
	movdqa	%xmm0, %xmm1
.LBE871:
.LBE870:
	.loc 3 602 10
	nop
.LBE869:
.LBE868:
	.loc 3 713 10
	nop
.LBE867:
.LBE866:
	.loc 2 217 60 discriminator 1
	movq	-1040(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -784(%rbp)
.LBB872:
.LBB873:
	.loc 3 713 10
	movq	-784(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %edx
	movq	%rdx, -776(%rbp)
	movq	%rax, -768(%rbp)
.LBB874:
.LBB875:
	.loc 3 602 10
	movq	-768(%rbp), %rax
	movq	-776(%rbp), %rdx
	movq	%rdx, -760(%rbp)
	movq	%rax, -752(%rbp)
.LBB876:
.LBB877:
	.loc 3 596 24
	movq	-760(%rbp), %xmm2
	movq	-752(%rbp), %xmm0
	punpcklqdq	%xmm2, %xmm0
.LBE877:
.LBE876:
	.loc 3 602 10
	nop
.LBE875:
.LBE874:
	.loc 3 713 10
	nop
	movaps	%xmm0, -144(%rbp)
	movaps	%xmm1, -128(%rbp)
.LBE873:
.LBE872:
.LBB878:
.LBB879:
	.loc 3 1055 19
	movdqa	-144(%rbp), %xmm0
	punpcklqdq	-128(%rbp), %xmm0
	.loc 3 1055 10
	nop
.LBE879:
.LB