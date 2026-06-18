	.file	"forkunsafe.c"
	.text
.Ltext0:
	.file 0 "/mnt/HARDONE/NSI_Repos/tacvoice/gateway/target/debug/build/aws-lc-fips-sys-802b9ac702614b53/out/build/aws-lc/crypto" "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rand_extra/forkunsafe.c"
	.section	.bss.g_buffering_enabled,"aw",@nobits
	.align 4
	.type	g_buffering_enabled, @object
	.size	g_buffering_enabled, 4
g_buffering_enabled:
	.zero	4
	.section	.bss.g_lock,"aw",@nobits
	.align 32
	.type	g_lock, @object
	.size	g_lock, 56
g_lock:
	.zero	56
	.section	.text.aws_lc_fips_0_13_14_RAND_enable_fork_unsafe_buffering,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_RAND_enable_fork_unsafe_buffering
	.type	aws_lc_fips_0_13_14_RAND_enable_fork_unsafe_buffering, @function
aws_lc_fips_0_13_14_RAND_enable_fork_unsafe_buffering:
.LFB146:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rand_extra/forkunsafe.c"
	.loc 1 29 48
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 31 6
	cmpl	$-1, -4(%rbp)
	je	.L2
	.loc 1 32 5
	call	abort@PLT
.L2:
	.loc 1 35 3
	leaq	g_lock(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CRYPTO_STATIC_MUTEX_lock_write@PLT
	.loc 1 36 23
	movl	$1, g_buffering_enabled(%rip)
	.loc 1 37 3
	leaq	g_lock(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CRYPTO_STATIC_MUTEX_unlock_write@PLT
	.loc 1 38 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE146:
	.size	aws_lc_fips_0_13_14_RAND_enable_fork_unsafe_buffering, .-aws_lc_fips_0_13_14_RAND_enable_fork_unsafe_buffering
	.section	.text.aws_lc_fips_0_13_14_rand_fork_unsafe_buffering_enabled,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_rand_fork_unsafe_buffering_enabled
	.hidden	aws_lc_fips_0_13_14_rand_fork_unsafe_buffering_enabled
	.type	aws_lc_fips_0_13_14_rand_fork_unsafe_buffering_enabled, @function
aws_lc_fips_0_13_14_rand_fork_unsafe_buffering_enabled:
.LFB147:
	.loc 1 40 46
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 41 3
	leaq	g_lock(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CRYPTO_STATIC_MUTEX_lock_read@PLT
	.loc 1 42 13
	movl	g_buffering_enabled(%rip), %eax
	movl	%eax, -4(%rbp)
	.loc 1 43 3
	leaq	g_lock(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_CRYPTO_STATIC_MUTEX_unlock_read@PLT
	.loc 1 44 10
	movl	-4(%rbp), %eax
	.loc 1 45 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE147:
	.size	aws_lc_fips_0_13_14_rand_fork_unsafe_buffering_enabled, .-aws_lc_fips_0_13_14_rand_fork_unsafe_buffering_enabled
	.text
.Letext0:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/struct_rwlock.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 4 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rand_extra/../fipsmodule/rand/../../internal.h"
	.file 5 "/usr/include/pthread.h"
	.file 6 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x291
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x8
	.long	.LASF44
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xa
	.long	0x38
	.uleb128 0x1
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0x1
	.byte	0x10
	.byte	0x4
	.long	.LASF5
	.uleb128 0x1
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x1
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x1
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x1
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x1
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x1
	.byte	0x8
	.byte	0x7
	.long	.LASF12
	.uleb128 0xb
	.long	.LASF35
	.byte	0x38
	.byte	0x2
	.byte	0x17
	.byte	0x8
	.long	0x115
	.uleb128 0x2
	.long	.LASF13
	.byte	0x19
	.byte	0x10
	.long	0x60
	.byte	0
	.uleb128 0x2
	.long	.LASF14
	.byte	0x1a
	.byte	0x10
	.long	0x60
	.byte	0x4
	.uleb128 0x2
	.long	.LASF15
	.byte	0x1b
	.byte	0x10
	.long	0x60
	.byte	0x8
	.uleb128 0x2
	.long	.LASF16
	.byte	0x1c
	.byte	0x10
	.long	0x60
	.byte	0xc
	.uleb128 0x2
	.long	.LASF17
	.byte	0x1d
	.byte	0x10
	.long	0x60
	.byte	0x10
	.uleb128 0x2
	.long	.LASF18
	.byte	0x1e
	.byte	0x10
	.long	0x60
	.byte	0x14
	.uleb128 0x2
	.long	.LASF19
	.byte	0x20
	.byte	0x7
	.long	0x38
	.byte	0x18
	.uleb128 0x2
	.long	.LASF20
	.byte	0x21
	.byte	0x7
	.long	0x38
	.byte	0x1c
	.uleb128 0x2
	.long	.LASF21
	.byte	0x22
	.byte	0x15
	.long	0x31
	.byte	0x20
	.uleb128 0x2
	.long	.LASF22
	.byte	0x23
	.byte	0x15
	.long	0x31
	.byte	0x28
	.uleb128 0x2
	.long	.LASF23
	.byte	0x26
	.byte	0x10
	.long	0x60
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.long	0x75
	.long	0x125
	.uleb128 0xd
	.long	0x31
	.byte	0x37
	.byte	0
	.uleb128 0xe
	.byte	0x38
	.byte	0x3
	.byte	0x56
	.byte	0x9
	.long	0x150
	.uleb128 0x6
	.long	.LASF24
	.byte	0x58
	.byte	0x22
	.long	0x83
	.uleb128 0x6
	.long	.LASF25
	.byte	0x59
	.byte	0x8
	.long	0x115
	.uleb128 0x6
	.long	.LASF26
	.byte	0x5a
	.byte	0xc
	.long	0x2a
	.byte	0
	.uleb128 0xf
	.long	.LASF45
	.byte	0x3
	.byte	0x5b
	.byte	0x3
	.long	0x125
	.uleb128 0x1
	.byte	0x8
	.byte	0x4
	.long	.LASF27
	.uleb128 0x10
	.byte	0x7
	.byte	0x4
	.long	0x60
	.byte	0x5
	.byte	0x69
	.byte	0x1
	.long	0x18a
	.uleb128 0x3
	.long	.LASF28
	.byte	0
	.uleb128 0x3
	.long	.LASF29
	.byte	0x1
	.uleb128 0x3
	.long	.LASF30
	.byte	0x2
	.uleb128 0x3
	.long	.LASF31
	.byte	0
	.byte	0
	.uleb128 0x1
	.byte	0x10
	.byte	0x5
	.long	.LASF32
	.uleb128 0x1
	.byte	0x10
	.byte	0x7
	.long	.LASF33
	.uleb128 0x1
	.byte	0x1
	.byte	0x2
	.long	.LASF34
	.uleb128 0x11
	.long	.LASF36
	.byte	0x38
	.byte	0x4
	.value	0x288
	.byte	0x8
	.long	0x1bc
	.uleb128 0x12
	.long	.LASF37
	.byte	0x4
	.value	0x289
	.byte	0x14
	.long	0x150
	.byte	0
	.byte	0
	.uleb128 0x7
	.long	.LASF38
	.byte	0x18
	.byte	0xc
	.long	0x38
	.uleb128 0x9
	.byte	0x3
	.quad	g_buffering_enabled
	.uleb128 0x7
	.long	.LASF39
	.byte	0x1b
	.byte	0x23
	.long	0x19f
	.uleb128 0x9
	.byte	0x3
	.quad	g_lock
	.uleb128 0x4
	.long	.LASF40
	.value	0x2b4
	.long	0x1f7
	.uleb128 0x5
	.long	0x1f7
	.byte	0
	.uleb128 0x13
	.byte	0x8
	.long	0x19f
	.uleb128 0x4
	.long	.LASF41
	.value	0x2a9
	.long	0x20e
	.uleb128 0x5
	.long	0x1f7
	.byte	0
	.uleb128 0x4
	.long	.LASF42
	.value	0x2b8
	.long	0x21f
	.uleb128 0x5
	.long	0x1f7
	.byte	0
	.uleb128 0x4
	.long	.LASF43
	.value	0x2b0
	.long	0x230
	.uleb128 0x5
	.long	0x1f7
	.byte	0
	.uleb128 0x14
	.long	.LASF46
	.byte	0x6
	.value	0x2f0
	.byte	0xd
	.uleb128 0x15
	.long	.LASF47
	.byte	0x1
	.byte	0x28
	.byte	0x5
	.long	0x38
	.quad	.LFB147
	.quad	.LFE147-.LFB147
	.uleb128 0x1
	.byte	0x9c
	.long	0x26b
	.uleb128 0x16
	.string	"ret"
	.byte	0x1
	.byte	0x2a
	.byte	0xd
	.long	0x3f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.long	.LASF48
	.byte	0x1
	.byte	0x1d
	.byte	0x6
	.quad	.LFB146
	.quad	.LFE146-.LFB146
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x18
	.string	"fd"
	.byte	0x1
	.byte	0x1d
	.byte	0x2c
	.long	0x38
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
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
	.uleb128 0x2
	.uleb128 0xd
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
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
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 3
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x26
	.byte	0
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x17
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x16
	.uleb128 0x34
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB146
	.quad	.LFE146-.LFB146
	.quad	.LFB147
	.quad	.LFE147-.LFB147
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
	.quad	.LFB146
	.uleb128 .LFE146-.LFB146
	.byte	0x7
	.quad	.LFB147
	.uleb128 .LFE147-.LFB147
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF33:
	.string	"__int128 unsigned"
.LASF15:
	.string	"__wrphase_futex"
.LASF22:
	.string	"__pad2"
.LASF18:
	.string	"__pad4"
.LASF24:
	.string	"__data"
.LASF48:
	.string	"aws_lc_fips_0_13_14_RAND_enable_fork_unsafe_buffering"
.LASF38:
	.string	"g_buffering_enabled"
.LASF27:
	.string	"double"
.LASF41:
	.string	"aws_lc_fips_0_13_14_CRYPTO_STATIC_MUTEX_lock_read"
.LASF23:
	.string	"__flags"
.LASF12:
	.string	"long long unsigned int"
.LASF25:
	.string	"__size"
.LASF6:
	.string	"unsigned char"
.LASF45:
	.string	"pthread_rwlock_t"
.LASF3:
	.string	"long unsigned int"
.LASF7:
	.string	"short unsigned int"
.LASF39:
	.string	"g_lock"
.LASF32:
	.string	"__int128"
.LASF44:
	.ascii	"GNU C11 15"
	.string	".2.0 -m64 -mtune=generic -march=x86-64 -ggdb -g -std=gnu11 -ffunction-sections -fdata-sections -fvisibility=hidden -fno-common -fPIC -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all"
.LASF31:
	.string	"PTHREAD_RWLOCK_DEFAULT_NP"
.LASF14:
	.string	"__writers"
.LASF40:
	.string	"aws_lc_fips_0_13_14_CRYPTO_STATIC_MUTEX_unlock_read"
.LASF16:
	.string	"__writers_futex"
.LASF19:
	.string	"__cur_writer"
.LASF36:
	.string	"CRYPTO_STATIC_MUTEX"
.LASF13:
	.string	"__readers"
.LASF35:
	.string	"__pthread_rwlock_arch_t"
.LASF28:
	.string	"PTHREAD_RWLOCK_PREFER_READER_NP"
.LASF8:
	.string	"unsigned int"
.LASF11:
	.string	"char"
.LASF43:
	.string	"aws_lc_fips_0_13_14_CRYPTO_STATIC_MUTEX_lock_write"
.LASF47:
	.string	"aws_lc_fips_0_13_14_rand_fork_unsafe_buffering_enabled"
.LASF4:
	.string	"long long int"
.LASF29:
	.string	"PTHREAD_RWLOCK_PREFER_WRITER_NP"
.LASF26:
	.string	"__align"
.LASF42:
	.string	"aws_lc_fips_0_13_14_CRYPTO_STATIC_MUTEX_unlock_write"
.LASF10:
	.string	"short int"
.LASF20:
	.string	"__shared"
.LASF30:
	.string	"PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP"
.LASF21:
	.string	"__pad1"
.LASF2:
	.string	"long int"
.LASF17:
	.string	"__pad3"
.LASF46:
	.string	"abort"
.LASF5:
	.string	"long double"
.LASF9:
	.string	"signed char"
.LASF37:
	.string	"lock"
.LASF34:
	.string	"_Bool"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/rand_extra/forkunsafe.c"
.LASF1:
	.string	"/mnt/HARDONE/NSI_Repos/tacvoice/gateway/target/debug/build/aws-lc-fips-sys-802b9ac702614b53/out/build/aws-lc/crypto"
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
