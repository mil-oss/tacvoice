	.file	"stack.c"
	.text
.Ltext0:
	.file 0 "/mnt/HARDONE/NSI_Repos/tacvoice/gateway/target/debug/build/aws-lc-fips-sys-802b9ac702614b53/out/build/aws-lc/crypto" "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/stack/stack.c"
	.section	.text.OPENSSL_memmove,"ax",@progbits
	.type	OPENSSL_memmove, @function
OPENSSL_memmove:
.LFB95:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/stack/../internal.h"
	.loc 1 942 75
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
	.loc 1 943 6
	cmpq	$0, -24(%rbp)
	jne	.L2
	.loc 1 944 12
	movq	-8(%rbp), %rax
	jmp	.L3
.L2:
	.loc 1 947 10
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove@PLT
.L3:
	.loc 1 948 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE95:
	.size	OPENSSL_memmove, .-OPENSSL_memmove
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
	.section	.rodata.kMinSize,"a"
	.align 8
	.type	kMinSize, @object
	.size	kMinSize, 8
kMinSize:
	.quad	4
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_new
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_new, @function
aws_lc_fips_0_13_14_OPENSSL_sk_new:
.LFB122:
	.file 2 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/stack/stack.c"
	.loc 2 86 57
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 2 87 24
	movl	$40, %edi
	call	aws_lc_fips_0_13_14_OPENSSL_zalloc@PLT
	movq	%rax, -8(%rbp)
	.loc 2 88 6
	cmpq	$0, -8(%rbp)
	jne	.L8
	.loc 2 89 12
	movl	$0, %eax
	jmp	.L9
.L8:
	.loc 2 92 15
	movl	$4, %eax
	movl	$8, %esi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_calloc@PLT
	.loc 2 92 13 discriminator 1
	movq	-8(%rbp), %rdx
	movq	%rax, 8(%rdx)
	.loc 2 93 10
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 93 6
	testq	%rax, %rax
	je	.L13
	.loc 2 97 13
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 32(%rax)
	.loc 2 98 18
	movl	$4, %edx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	.loc 2 100 10
	movq	-8(%rbp), %rax
	jmp	.L9
.L13:
	.loc 2 94 5
	nop
.L11:
	.loc 2 103 3
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 2 104 10
	movl	$0, %eax
.L9:
	.loc 2 105 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE122:
	.size	aws_lc_fips_0_13_14_OPENSSL_sk_new, .-aws_lc_fips_0_13_14_OPENSSL_sk_new
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_new_null,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_new_null
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_new_null, @function
aws_lc_fips_0_13_14_OPENSSL_sk_new_null:
.LFB123:
	.loc 2 107 42
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 2 107 51
	movl	$0, %edi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_new@PLT
	.loc 2 107 73
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE123:
	.size	aws_lc_fips_0_13_14_OPENSSL_sk_new_null, .-aws_lc_fips_0_13_14_OPENSSL_sk_new_null
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_num,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_num
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_num, @function
aws_lc_fips_0_13_14_OPENSSL_sk_num:
.LFB124:
	.loc 2 109 48
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	.loc 2 110 6
	cmpq	$0, -8(%rbp)
	jne	.L17
	.loc 2 111 12
	movl	$0, %eax
	jmp	.L18
.L17:
	.loc 2 113 12
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
.L18:
	.loc 2 114 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE124:
	.size	aws_lc_fips_0_13_14_OPENSSL_sk_num, .-aws_lc_fips_0_13_14_OPENSSL_sk_num
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_zero,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_zero
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_zero, @function
aws_lc_fips_0_13_14_OPENSSL_sk_zero:
.LFB125:
	.loc 2 116 41
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 2 117 6
	cmpq	$0, -8(%rbp)
	je	.L23
	.loc 2 117 23 discriminator 1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 117 18 discriminator 1
	testq	%rax, %rax
	je	.L23
	.loc 2 120 49
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 120 45
	leaq	0(,%rax,8), %rdx
	.loc 2 120 20
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 120 3
	movl	$0, %esi
	movq	%rax, %rdi
	call	OPENSSL_memset
	.loc 2 121 11
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	.loc 2 122 14
	movq	-8(%rbp), %rax
	movl	$0, 16(%rax)
	jmp	.L19
.L23:
	.loc 2 118 5
	nop
.L19:
	.loc 2 123 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE125:
	.size	aws_lc_fips_0_13_14_OPENSSL_sk_zero, .-aws_lc_fips_0_13_14_OPENSSL_sk_zero
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_value,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_value
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_value, @function
aws_lc_fips_0_13_14_OPENSSL_sk_value:
.LFB126:
	.loc 2 125 59
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	.loc 2 126 6
	cmpq	$0, -8(%rbp)
	je	.L25
	.loc 2 126 21 discriminator 1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 126 11 discriminator 1
	cmpq	%rax, -16(%rbp)
	jb	.L26
.L25:
	.loc 2 127 12
	movl	$0, %eax
	jmp	.L27
.L26:
	.loc 2 129 12
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 129 18
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
.L27:
	.loc 2 130 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE126:
	.size	aws_lc_fips_0_13_14_OPENSSL_sk_value, .-aws_lc_fips_0_13_14_OPENSSL_sk_value
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_set,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_set
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_set, @function
aws_lc_fips_0_13_14_OPENSSL_sk_set:
.LFB127:
	.loc 2 132 64
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	.loc 2 133 6
	cmpq	$0, -8(%rbp)
	je	.L29
	.loc 2 133 21 discriminator 1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 133 11 discriminator 1
	cmpq	%rax, -16(%rbp)
	jb	.L30
.L29:
	.loc 2 134 12
	movl	$0, %eax
	jmp	.L31
.L30:
	.loc 2 136 12
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 136 18
	movq	-16(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 2 136 22
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	(%rax), %rax
.L31:
	.loc 2 137 1
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE127:
	.size	aws_lc_fips_0_13_14_OPENSSL_sk_set, .-aws_lc_fips_0_13_14_OPENSSL_sk_set
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_free
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_free, @function
aws_lc_fips_0_13_14_OPENSSL_sk_free:
.LFB128:
	.loc 2 139 41
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 2 140 6
	cmpq	$0, -8(%rbp)
	je	.L35
	.loc 2 143 18
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 143 3
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	.loc 2 144 3
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_free@PLT
	jmp	.L32
.L35:
	.loc 2 141 5
	nop
.L32:
	.loc 2 145 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE128:
	.size	aws_lc_fips_0_13_14_OPENSSL_sk_free, .-aws_lc_fips_0_13_14_OPENSSL_sk_free
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_pop_free_ex,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_pop_free_ex
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_pop_free_ex, @function
aws_lc_fips_0_13_14_OPENSSL_sk_pop_free_ex:
.LFB129:
	.loc 2 149 61
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
	.loc 2 150 6
	cmpq	$0, -24(%rbp)
	je	.L42
.LBB2:
	.loc 2 154 15
	movq	$0, -8(%rbp)
	.loc 2 154 3
	jmp	.L39
.L41:
	.loc 2 155 11
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 155 17
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 2 155 8
	testq	%rax, %rax
	je	.L40
	.loc 2 156 35
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 156 41
	movq	-8(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 2 156 7
	movq	(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rcx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	*%rcx
.LVL0:
.L40:
	.loc 2 154 36 discriminator 2
	addq	$1, -8(%rbp)
.L39:
	.loc 2 154 28 discriminator 1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 154 24 discriminator 1
	cmpq	%rax, -8(%rbp)
	jb	.L41
.LBE2:
	.loc 2 159 3
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_free@PLT
	jmp	.L36
.L42:
	.loc 2 151 5
	nop
.L36:
	.loc 2 160 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE129:
	.size	aws_lc_fips_0_13_14_OPENSSL_sk_pop_free_ex, .-aws_lc_fips_0_13_14_OPENSSL_sk_pop_free_ex
	.section	.text.call_free_func_legacy,"ax",@progbits
	.type	call_free_func_legacy, @function
call_free_func_legacy:
.LFB130:
	.loc 2 165 73
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
	.loc 2 166 3
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rax, %rdi
	call	*%rdx
.LVL1:
	.loc 2 167 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE130:
	.size	call_free_func_legacy, .-call_free_func_legacy
	.section	.text.aws_lc_fips_0_13_14_sk_pop_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_sk_pop_free
	.type	aws_lc_fips_0_13_14_sk_pop_free, @function
aws_lc_fips_0_13_14_sk_pop_free:
.LFB131:
	.loc 2 169 69
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
	.loc 2 170 3
	movq	-16(%rbp), %rdx
	leaq	call_free_func_legacy(%rip), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_sk_pop_free_ex@PLT
	.loc 2 171 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE131:
	.size	aws_lc_fips_0_13_14_sk_pop_free, .-aws_lc_fips_0_13_14_sk_pop_free
	.section	.rodata
	.align 8
.LC0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/stack/stack.c"
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_insert,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_insert
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_insert, @function
aws_lc_fips_0_13_14_OPENSSL_sk_insert:
.LFB132:
	.loc 2 173 68
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
	.loc 2 174 6
	cmpq	$0, -40(%rbp)
	jne	.L46
	.loc 2 175 12
	movl	$0, %eax
	jmp	.L47
.L46:
	.loc 2 178 9
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 178 6
	cmpq	$2147483646, %rax
	jbe	.L48
	.loc 2 179 5
	leaq	.LC0(%rip), %rax
	movl	$179, %r8d
	movq	%rax, %rcx
	movl	$69, %edx
	movl	$0, %esi
	movl	$14, %edi
	call	aws_lc_fips_0_13_14_ERR_put_error@PLT
	.loc 2 180 12
	movl	$0, %eax
	jmp	.L47
.L48:
	.loc 2 183 9
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	.loc 2 183 26
	movq	-40(%rbp), %rdx
	movq	(%rdx), %rdx
	.loc 2 183 32
	addq	$1, %rdx
	.loc 2 183 6
	cmpq	%rax, %rdx
	jb	.L49
.LBB3:
	.loc 2 185 26
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	.loc 2 185 12
	addq	%rax, %rax
	movq	%rax, -24(%rbp)
	.loc 2 186 12
	movq	-24(%rbp), %rax
	salq	$3, %rax
	movq	%rax, -16(%rbp)
	.loc 2 190 23
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	.loc 2 190 8
	cmpq	%rax, -24(%rbp)
	jb	.L50
	.loc 2 190 49 discriminator 1
	movq	-16(%rbp), %rax
	shrq	$3, %rax
	.loc 2 190 35 discriminator 1
	cmpq	%rax, -24(%rbp)
	je	.L51
.L50:
	.loc 2 191 21
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	.loc 2 191 17
	addq	$1, %rax
	movq	%rax, -24(%rbp)
	.loc 2 192 18
	movq	-24(%rbp), %rax
	salq	$3, %rax
	movq	%rax, -16(%rbp)
.L51:
	.loc 2 196 23
	movq	-40(%rbp), %rax
	movq	24(%rax), %rax
	.loc 2 196 8
	cmpq	%rax, -24(%rbp)
	jb	.L52
	.loc 2 196 49 discriminator 1
	movq	-16(%rbp), %rax
	shrq	$3, %rax
	.loc 2 196 35 discriminator 1
	cmpq	%rax, -24(%rbp)
	je	.L53
.L52:
	.loc 2 197 14
	movl	$0, %eax
	jmp	.L47
.L53:
	.loc 2 200 30
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 200 12
	movq	-16(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_OPENSSL_realloc@PLT
	movq	%rax, -8(%rbp)
	.loc 2 201 8
	cmpq	$0, -8(%rbp)
	jne	.L54
	.loc 2 202 14
	movl	$0, %eax
	jmp	.L47
.L54:
	.loc 2 205 14
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 2 206 19
	movq	-40(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 24(%rax)
.L49:
.LBE3:
	.loc 2 209 18
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 209 6
	cmpq	%rax, -56(%rbp)
	jb	.L55
	.loc 2 210 7
	movq	-40(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 2 210 16
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 210 13
	salq	$3, %rax
	addq	%rax, %rdx
	.loc 2 210 23
	movq	-48(%rbp), %rax
	movq	%rax, (%rdx)
	jmp	.L56
.L55:
	.loc 2 213 41
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 213 47
	subq	-56(%rbp), %rax
	.loc 2 213 36
	leaq	0(,%rax,8), %rdx
	.loc 2 212 46
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 212 52
	movq	-56(%rbp), %rcx
	salq	$3, %rcx
	.loc 2 212 43
	addq	%rax, %rcx
	.loc 2 212 24
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 212 37
	movq	-56(%rbp), %rsi
	addq	$1, %rsi
	salq	$3, %rsi
	.loc 2 212 21
	addq	%rsi, %rax
	.loc 2 212 5
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	OPENSSL_memmove
	.loc 2 214 7
	movq	-40(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 214 13
	movq	-56(%rbp), %rdx
	salq	$3, %rdx
	addq	%rax, %rdx
	.loc 2 214 21
	movq	-48(%rbp), %rax
	movq	%rax, (%rdx)
.L56:
	.loc 2 217 5
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 217 10
	leaq	1(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 2 218 14
	movq	-40(%rbp), %rax
	movl	$0, 16(%rax)
	.loc 2 220 12
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
.L47:
	.loc 2 221 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE132:
	.size	aws_lc_fips_0_13_14_OPENSSL_sk_insert, .-aws_lc_fips_0_13_14_OPENSSL_sk_insert
	.section	.text.aws_lc_fips_0_13_14_OPENSSL_sk_delete,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OPENSSL_sk_delete
	.type	aws_lc_fips_0_13_14_OPENSSL_sk_delete, @function
aws_lc_fips_0_13_14_OPENSSL_sk_delete:
.LFB133:
	.loc 2 223 58
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
	.loc 2 226 6
	cmpq	$0, -24(%rbp)
	je	.L58
	.loc 2 226 25 discriminator 1
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 226 11 discriminator 1
	cmpq	%rax, -32(%rbp)
	jb	.L59
.L58:
	.loc 2 227 12
	movl	$0, %eax
	jmp	.L60
.L59:
	.loc 2 230 11
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 230 17
	movq	-32(%rbp), %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	.loc 2 230 7
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 2 232 18
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 232 24
	subq	$1, %rax
	.loc 2 232 6
	cmpq	%rax, -32(%rbp)
	je	.L61
	.loc 2 234 41
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 2 234 47
	subq	-32(%rbp), %rax
	.loc 2 234 55
	subq	$1, %rax
	.loc 2 234 36
	leaq	0(,%rax,8), %rdx
	.loc 2 233 42
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 2 233 55
	movq	-32(%rbp), %rcx
	addq	$1, %rcx
	salq	$3, %rcx
	.l