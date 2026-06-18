	.file	"bn_asn1.c"
	.text
.Ltext0:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/crypto/bn_extra/bn_asn1.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/crypto/bn_extra/bn_asn1.c"
	.section	.text.aws_lc_0_40_0_BN_parse_asn1_unsigned,"ax",@progbits
	.globl	aws_lc_0_40_0_BN_parse_asn1_unsigned
	.type	aws_lc_0_40_0_BN_parse_asn1_unsigned, @function
aws_lc_0_40_0_BN_parse_asn1_unsigned:
.LFB3:
	.loc 1 10 51
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	.loc 1 10 51
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 13 8
	leaq	-48(%rbp), %rcx
	movq	-72(%rbp), %rax
	movl	$2, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_0_40_0_CBS_get_asn1@PLT
	.loc 1 13 6 discriminator 1
	testl	%eax, %eax
	je	.L2
	.loc 1 14 8
	leaq	-52(%rbp), %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_0_40_0_CBS_is_valid_asn1_integer@PLT
	.loc 1 13 52 discriminator 2
	testl	%eax, %eax
	jne	.L3
.L2:
	.loc 1 15 5
	leaq	.LC0(%rip), %rax
	movl	$15, %r8d
	movq	%rax, %rcx
	movl	$117, %edx
	movl	$0, %esi
	movl	$3, %edi
	call	aws_lc_0_40_0_ERR_put_error@PLT
	.loc 1 16 12
	movl	$0, %eax
	jmp	.L6
.L3:
	.loc 1 19 7
	movl	-52(%rbp), %eax
	.loc 1 19 6
	testl	%eax, %eax
	je	.L5
	.loc 1 20 5
	leaq	.LC0(%rip), %rax
	movl	$20, %r8d
	movq	%rax, %rcx
	movl	$109, %edx
	movl	$0, %esi
	movl	$3, %edi
	call	aws_lc_0_40_0_ERR_put_error@PLT
	.loc 1 21 12
	movl	$0, %eax
	jmp	.L6
.L5:
	.loc 1 24 10
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_CBS_len@PLT
	movq	%rax, %rbx
	.loc 1 24 10 is_stmt 0 discriminator 1
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_CBS_data@PLT
	movq	%rax, %rcx
	.loc 1 24 10 discriminator 2
	movq	-80(%rbp), %rax
	movq	%rax, %rdx
	movq	%rbx, %rsi
	movq	%rcx, %rdi
	call	aws_lc_0_40_0_BN_bin2bn@PLT
	.loc 1 24 60 is_stmt 1 discriminator 3
	testq	%rax, %rax
	setne	%al
	movzbl	%al, %eax
.L6:
	.loc 1 25 1
	movq	-24(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	aws_lc_0_40_0_BN_parse_asn1_unsigned, .-aws_lc_0_40_0_BN_parse_asn1_unsigned
	.section	.text.aws_lc_0_40_0_BN_marshal_asn1,"ax",@progbits
	.globl	aws_lc_0_40_0_BN_marshal_asn1
	.type	aws_lc_0_40_0_BN_marshal_asn1, @function
aws_lc_0_40_0_BN_marshal_asn1:
.LFB4:
	.loc 1 27 49
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
	.loc 1 27 49
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	.loc 1 29 7
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_BN_is_negative@PLT
	.loc 1 29 6 discriminator 1
	testl	%eax, %eax
	je	.L9
	.loc 1 30 5
	leaq	.LC0(%rip), %rax
	movl	$30, %r8d
	movq	%rax, %rcx
	movl	$109, %edx
	movl	$0, %esi
	movl	$3, %edi
	call	aws_lc_0_40_0_ERR_put_error@PLT
	.loc 1 31 12
	movl	$0, %eax
	jmp	.L14
.L9:
	.loc 1 35 8
	leaq	-64(%rbp), %rcx
	movq	-72(%rbp), %rax
	movl	$2, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_0_40_0_CBB_add_asn1@PLT
	.loc 1 35 6 discriminator 1
	testl	%eax, %eax
	je	.L11
	.loc 1 38 8
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_BN_num_bits@PLT
	.loc 1 38 24 discriminator 1
	andl	$7, %eax
	.loc 1 35 52 discriminator 2
	testl	%eax, %eax
	jne	.L12
	.loc 1 38 37
	leaq	-64(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	aws_lc_0_40_0_CBB_add_u8@PLT
	.loc 1 38 33 discriminator 2
	testl	%eax, %eax
	je	.L11
.L12:
	.loc 1 39 33
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_BN_num_bytes@PLT
	.loc 1 39 8 discriminator 1
	movl	%eax, %ecx
	movq	-80(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_0_40_0_BN_bn2cbb_padded@PLT
	.loc 1 38 63 discriminator 3
	testl	%eax, %eax
	je	.L11
	.loc 1 40 8
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_CBB_flush@PLT
	.loc 1 39 55
	testl	%eax, %eax
	jne	.L13
.L11:
	.loc 1 41 5
	leaq	.LC0(%rip), %rax
	movl	$41, %r8d
	movq	%rax, %rcx
	movl	$118, %edx
	movl	$0, %esi
	movl	$3, %edi
	call	aws_lc_0_40_0_ERR_put_error@PLT
	.loc 1 42 12
	movl	$0, %eax
	jmp	.L14
.L13:
	.loc 1 45 10
	movl	$1, %eax
.L14:
	.loc 1 46 1
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	aws_lc_0_40_0_BN_marshal_asn1, .-aws_lc_0_40_0_BN_marshal_asn1
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/15/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 5 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/include/openssl/base.h"
	.file 6 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/include/openssl/bn.h"
	.file 7 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/include/openssl/bytestring.h"
	.file 8 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/include/openssl/err.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4fc
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF52
	.byte	0xc
	.long	.LASF53
	.long	.LASF54
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF8
	.byte	0x2
	.byte	0xe5
	.byte	0x17
	.long	0x3c
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF9
	.byte	0x3
	.byte	0x26
	.byte	0x17
	.long	0x58
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x3
	.long	.LASF11
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x66
	.uleb128 0x3
	.long	.LASF12
	.byte	0x3
	.byte	0x2d
	.byte	0x1b
	.long	0x3c
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF13
	.uleb128 0x5
	.long	0x9f
	.uleb128 0x3
	.long	.LASF14
	.byte	0x4
	.byte	0x18
	.byte	0x13
	.long	0x74
	.uleb128 0x5
	.long	0xab
	.uleb128 0x3
	.long	.LASF15
	.byte	0x4
	.byte	0x1a
	.byte	0x14
	.long	0x87
	.uleb128 0x3
	.long	.LASF16
	.byte	0x4
	.byte	0x1b
	.byte	0x14
	.long	0x93
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF17
	.uleb128 0x6
	.long	.LASF18
	.byte	0x5
	.value	0x11c
	.byte	0x12
	.long	0xbc
	.uleb128 0x6
	.long	.LASF19
	.byte	0x5
	.value	0x150
	.byte	0x1a
	.long	0xfa
	.uleb128 0x5
	.long	0xe8
	.uleb128 0x7
	.long	.LASF23
	.byte	0x18
	.byte	0x6
	.value	0x3a7
	.byte	0x8
	.long	0x14d
	.uleb128 0x8
	.string	"d"
	.byte	0x6
	.value	0x3aa
	.byte	0xd
	.long	0x1de
	.byte	0
	.uleb128 0x9
	.long	.LASF20
	.byte	0x6
	.value	0x3b9
	.byte	0x7
	.long	0x43
	.byte	0x8
	.uleb128 0x9
	.long	.LASF21
	.byte	0x6
	.value	0x3bb
	.byte	0x7
	.long	0x43
	.byte	0xc
	.uleb128 0x8
	.string	"neg"
	.byte	0x6
	.value	0x3bd
	.byte	0x7
	.long	0x43
	.byte	0x10
	.uleb128 0x9
	.long	.LASF22
	.byte	0x6
	.value	0x3bf
	.byte	0x7
	.long	0x43
	.byte	0x14
	.byte	0
	.uleb128 0xa
	.string	"CBB"
	.byte	0x5
	.value	0x158
	.byte	0x17
	.long	0x15a
	.uleb128 0x7
	.long	.LASF24
	.byte	0x30
	.byte	0x7
	.value	0x1b3
	.byte	0x8
	.long	0x191
	.uleb128 0x9
	.long	.LASF25
	.byte	0x7
	.value	0x1b5
	.byte	0x8
	.long	0x2c6
	.byte	0
	.uleb128 0x9
	.long	.LASF26
	.byte	0x7
	.value	0x1b8
	.byte	0x8
	.long	0x9f
	.byte	0x8
	.uleb128 0x8
	.string	"u"
	.byte	0x7
	.value	0x1bc
	.byte	0x5
	.long	0x2a1
	.byte	0x10
	.byte	0
	.uleb128 0xa
	.string	"CBS"
	.byte	0x5
	.value	0x159
	.byte	0x17
	.long	0x1a3
	.uleb128 0x5
	.long	0x191
	.uleb128 0xb
	.long	.LASF27
	.byte	0x10
	.byte	0x7
	.byte	0x1d
	.byte	0x8
	.long	0x1cb
	.uleb128 0xc
	.long	.LASF28
	.byte	0x7
	.byte	0x1e
	.byte	0x12
	.long	0x1ea
	.byte	0
	.uleb128 0xd
	.string	"len"
	.byte	0x7
	.byte	0x1f
	.byte	0xa
	.long	0x30
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF29
	.uleb128 0x3
	.long	.LASF30
	.byte	0x6
	.byte	0x34
	.byte	0x12
	.long	0xc8
	.uleb128 0xe
	.byte	0x8
	.long	0x1d2
	.uleb128 0xe
	.byte	0x8
	.long	0xa6
	.uleb128 0xe
	.byte	0x8
	.long	0xb7
	.uleb128 0x7
	.long	.LASF31
	.byte	0x20
	.byte	0x7
	.value	0x199
	.byte	0x8
	.long	0x24b
	.uleb128 0x8
	.string	"buf"
	.byte	0x7
	.value	0x19a
	.byte	0xc
	.long	0x24b
	.byte	0
	.uleb128 0x8
	.string	"len"
	.byte	0x7
	.value	0x19c
	.byte	0xa
	.long	0x30
	.byte	0x8
	.uleb128 0x8
	.string	"cap"
	.byte	0x7
	.value	0x19e
	.byte	0xa
	.long	0x30
	.byte	0x10
	.uleb128 0xf
	.long	.LASF32
	.byte	0x7
	.value	0x1a1
	.byte	0xc
	.long	0x66
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x18
	.uleb128 0xf
	.long	.LASF33
	.byte	0x7
	.value	0x1a4
	.byte	0xc
	.long	0x66
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x18
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0xab
	.uleb128 0x7
	.long	.LASF34
	.byte	0x18
	.byte	0x7
	.value	0x1a7
	.byte	0x8
	.long	0x29b
	.uleb128 0x9
	.long	.LASF35
	.byte	0x7
	.value	0x1a9
	.byte	0x19
	.long	0x29b
	.byte	0
	.uleb128 0x9
	.long	.LASF36
	.byte	0x7
	.value	0x1ac
	.byte	0xa
	.long	0x30
	.byte	0x8
	.uleb128 0x9
	.long	.LASF37
	.byte	0x7
	.value	0x1af
	.byte	0xb
	.long	0xab
	.byte	0x10
	.uleb128 0xf
	.long	.LASF38
	.byte	0x7
	.value	0x1b0
	.byte	0xc
	.long	0x66
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x10
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x1f0
	.uleb128 0x10
	.byte	0x20
	.byte	0x7
	.value	0x1b9
	.byte	0x3
	.long	0x2c6
	.uleb128 0x11
	.long	.LASF35
	.byte	0x7
	.value	0x1ba
	.byte	0x1a
	.long	0x1f0
	.uleb128 0x11
	.long	.LASF25
	.byte	0x7
	.value	0x1bb
	.byte	0x19
	.long	0x251
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x14d
	.uleb128 0x12
	.long	.LASF39
	.byte	0x7
	.value	0x1e8
	.byte	0x14
	.long	0x43
	.long	0x2e3
	.uleb128 0x13
	.long	0x2c6
	.byte	0
	.uleb128 0x14
	.long	.LASF40
	.byte	0x6
	.byte	0xac
	.byte	0x14
	.long	0x43
	.long	0x303
	.uleb128 0x13
	.long	0x2c6
	.uleb128 0x13
	.long	0x30
	.uleb128 0x13
	.long	0x303
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0xf5
	.uleb128 0x14
	.long	.LASF41
	.byte	0x6
	.byte	0x6f
	.byte	0x19
	.long	0x66
	.long	0x31f
	.uleb128 0x13
	.long	0x303
	.byte	0
	.uleb128 0x12
	.long	.LASF42
	.byte	0x7
	.value	0x227
	.byte	0x14
	.long	0x43
	.long	0x33b
	.uleb128 0x13
	.long	0x2c6
	.uleb128 0x13
	.long	0xab
	.byte	0
	.uleb128 0x14
	.long	.LASF43
	.byte	0x6
	.byte	0x67
	.byte	0x19
	.long	0x66
	.long	0x351
	.uleb128 0x13
	.long	0x303
	.byte	0
	.uleb128 0x12
	.long	.LASF44
	.byte	0x7
	.value	0x20a
	.byte	0x14
	.long	0x43
	.long	0x372
	.uleb128 0x13
	.long	0x2c6
	.uleb128 0x13
	.long	0x2c6
	.uleb128 0x13
	.long	0xdb
	.byte	0
	.uleb128 0x14
	.long	.LASF45
	.byte	0x6
	.byte	0x88
	.byte	0x14
	.long	0x43
	.long	0x388
	.uleb128 0x13
	.long	0x303
	.byte	0
	.uleb128 0x14
	.long	.LASF46
	.byte	0x6
	.byte	0x91
	.byte	0x18
	.long	0x3a8
	.long	0x3a8
	.uleb128 0x13
	.long	0x1ea
	.uleb128 0x13
	.long	0x30
	.uleb128 0x13
	.long	0x3a8
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0xe8
	.uleb128 0x14
	.long	.LASF47
	.byte	0x7
	.byte	0x39
	.byte	0x1f
	.long	0x1ea
	.long	0x3c4
	.uleb128 0x13
	.long	0x3c4
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x19e
	.uleb128 0x14
	.long	.LASF48
	.byte	0x7
	.byte	0x3c
	.byte	0x17
	.long	0x30
	.long	0x3e0
	.uleb128 0x13
	.long	0x3c4
	.byte	0
	.uleb128 0x15
	.long	.LASF55
	.byte	0x8
	.value	0x168
	.byte	0x15
	.long	0x407
	.uleb128 0x13
	.long	0x43
	.uleb128 0x13
	.long	0x43
	.uleb128 0x13
	.long	0x43
	.uleb128 0x13
	.long	0x1e4
	.uleb128 0x13
	.long	0x66
	.byte	0
	.uleb128 0x12
	.long	.LASF49
	.byte	0x7
	.value	0x157
	.byte	0x14
	.long	0x43
	.long	0x423
	.uleb128 0x13
	.long	0x3c4
	.uleb128 0x13
	.long	0x423
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x43
	.uleb128 0x14
	.long	.LASF50
	.byte	0x7
	.byte	0xe9
	.byte	0x14
	.long	0x43
	.long	0x449
	.uleb128 0x13
	.long	0x449
	.uleb128 0x13
	.long	0x449
	.uleb128 0x13
	.long	0xdb
	.byte	0
	.uleb128 0xe
	.byte	0x8
	.long	0x191
	.uleb128 0x16
	.long	.LASF56
	.byte	0x1
	.byte	0x1b
	.byte	0x5
	.long	0x43
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x4a1
	.uleb128 0x17
	.string	"cbb"
	.byte	0x1
	.byte	0x1b
	.byte	0x1a
	.long	0x2c6
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x17
	.string	"bn"
	.byte	0x1
	.byte	0x1b
	.byte	0x2d
	.long	0x303
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x18
	.long	.LASF25
	.byte	0x1
	.byte	0x22
	.byte	0x7
	.long	0x14d
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.byte	0
	.uleb128 0x19
	.long	.LASF57
	.byte	0x1
	.byte	0xa
	.byte	0x5
	.long	0x43
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x17
	.string	"cbs"
	.byte	0x1
	.byte	0xa
	.byte	0x21
	.long	0x449
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x17
	.string	"ret"
	.byte	0x1
	.byte	0xa
	.byte	0x2e
	.long	0x3a8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x18
	.long	.LASF25
	.byte	0x1
	.byte	0xb
	.byte	0x7
	.long	0x191
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x18
	.long	.LASF51
	.byte	0x1
	.byte	0xc
	.byte	0x7
	.long	0x43
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0xb
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
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
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
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
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB3
	.quad	.LFE3
	.quad	.LFB4
	.quad	.LFE4
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF55:
	.string	"aws_lc_0_40_0_ERR_put_error"
.LASF42:
	.string	"aws_lc_0_40_0_CBB_add_u8"
.LASF37:
	.string	"pending_len_len"
.LASF44:
	.string	"aws_lc_0_40_0_CBB_add_asn1"
.LASF24:
	.string	"cbb_st"
.LASF16:
	.string	"uint64_t"
.LASF32:
	.string	"can_resize"
.LASF10:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF11:
	.string	"__uint32_t"
.LASF34:
	.string	"cbb_child_st"
.LASF52:
	.ascii	"GNU C11 "
	.string	"15.2.0 -m64 -mtune=generic -march=x86-64 -g -gdwarf-4 -O0 -std=c11 -ffunction-sections -fdata-sections -fPIC -fno-omit-frame-pointer -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all"
.LASF14:
	.string	"uint8_t"
.LASF26:
	.string	"is_child"
.LASF47:
	.string	"aws_lc_0_40_0_CBS_data"
.LASF23:
	.string	"bignum_st"
.LASF20:
	.string	"width"
.LASF2:
	.string	"long long int"
.LASF51:
	.string	"is_negative"
.LASF21:
	.string	"dmax"
.LASF0:
	.string	"long int"
.LASF36:
	.string	"offset"
.LASF50:
	.string	"aws_lc_0_40_0_CBS_get_asn1"
.LASF9:
	.string	"__uint8_t"
.LASF49:
	.string	"aws_lc_0_40_0_CBS_is_valid_asn1_integer"
.LASF27:
	.string	"cbs_st"
.LASF3:
	.string	"long double"
.LASF4:
	.string	"unsigned char"
.LASF18:
	.string	"CBS_ASN1_TAG"
.LASF7:
	.string	"signed char"
.LASF22:
	.string	"flags"
.LASF17:
	.string	"long long unsigned int"
.LASF15:
	.string	"uint32_t"
.LASF6:
	.string	"unsigned int"
.LASF43:
	.string	"aws_lc_0_40_0_BN_num_bits"
.LASF31:
	.string	"cbb_buffer_st"
.LASF5:
	.string	"short unsigned int"
.LASF13:
	.string	"char"
.LASF38:
	.string	"pending_is_asn1"
.LASF12:
	.string	"__uint64_t"
.LASF28:
	.string	"data"
.LASF45:
	.string	"aws_lc_0_40_0_BN_is_negative"
.LASF40:
	.string	"aws_lc_0_40_0_BN_bn2cbb_padded"
.LASF1:
	.string	"long unsigned int"
.LASF29:
	.string	"double"
.LASF39:
	.string	"aws_lc_0_40_0_CBB_flush"
.LASF53:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/crypto/bn_extra/bn_asn1.c"
.LASF25:
	.string	"child"
.LASF19:
	.string	"BIGNUM"
.LASF57:
	.string	"aws_lc_0_40_0_BN_parse_asn1_unsigned"
.LASF41:
	.string	"aws_lc_0_40_0_BN_num_bytes"
.LASF46:
	.string	"aws_lc_0_40_0_BN_bin2bn"
.LASF54:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0"
.LASF33:
	.string	"error"
.LASF35:
	.string	"base"
.LASF48:
	.string	"aws_lc_0_40_0_CBS_len"
.LASF56:
	.string	"aws_lc_0_40_0_BN_marshal_asn1"
.LASF30:
	.string	"BN_ULONG"
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
