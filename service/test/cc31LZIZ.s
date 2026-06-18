	.file	"pair.c"
	.text
.Ltext0:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/crypto/bio/pair.c"
	.section	.text.OPENSSL_memcpy,"ax",@progbits
	.type	OPENSSL_memcpy, @function
OPENSSL_memcpy:
.LFB121:
	.file 2 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/crypto/bio/../internal.h"
	.loc 2 852 74
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
	.loc 2 853 6
	cmpq	$0, -24(%rbp)
	jne	.L2
	.loc 2 854 12
	movq	-8(%rbp), %rax
	jmp	.L3
.L2:
	.loc 2 857 10
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
.L3:
	.loc 2 858 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE121:
	.size	OPENSSL_memcpy, .-OPENSSL_memcpy
	.section	.text.bio_new,"ax",@progbits
	.type	bio_new, @function
bio_new:
.LFB155:
	.loc 1 34 30
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 35 26
	movl	$56, %edi
	call	aws_lc_0_40_0_OPENSSL_zalloc@PLT
	movq	%rax, -8(%rbp)
	.loc 1 36 6
	cmpq	$0, -8(%rbp)
	jne	.L5
	.loc 1 37 12
	movl	$0, %eax
	jmp	.L6
.L5:
	.loc 1 40 11
	movq	-8(%rbp), %rax
	movq	$17408, 32(%rax)
	.loc 1 41 12
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 64(%rax)
	.loc 1 42 10
	movl	$1, %eax
.L6:
	.loc 1 43 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE155:
	.size	bio_new, .-bio_new
	.section	.rodata
	.align 8
.LC0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.40.0/aws-lc/crypto/bio/pair.c"
.LC1:
	.string	"peer_b != NULL"
.LC2:
	.string	"peer_b->peer == bio"
.LC3:
	.string	"peer_b->buf != NULL"
.LC4:
	.string	"b->buf != NULL"
	.section	.text.bio_destroy_pair,"ax",@progbits
	.type	bio_destroy_pair, @function
bio_destroy_pair:
.LFB156:
	.loc 1 45 40
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 46 22
	movq	-40(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 1 50 6
	cmpq	$0, -24(%rbp)
	je	.L15
	.loc 1 54 12
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 55 6
	cmpq	$0, -16(%rbp)
	je	.L16
	.loc 1 59 10
	movq	-16(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 61 3
	cmpq	$0, -8(%rbp)
	jne	.L11
	.loc 1 61 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.5(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rax
	movq	%rdx, %rcx
	movl	$61, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L11:
	.loc 1 62 3 is_stmt 1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	cmpq	%rax, -40(%rbp)
	je	.L12
	.loc 1 62 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.5(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC2(%rip), %rax
	movq	%rdx, %rcx
	movl	$62, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L12:
	.loc 1 64 16 is_stmt 1
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 65 18
	movq	-16(%rbp), %rax
	movl	$0, 40(%rax)
	.loc 1 66 3
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L13
	.loc 1 66 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.5(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rax
	movq	%rdx, %rcx
	movl	$66, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L13:
	.loc 1 67 15 is_stmt 1
	movq	-8(%rbp), %rax
	movq	$0, 16(%rax)
	.loc 1 68 18
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
	.loc 1 70 11
	movq	-24(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 71 13
	movq	-40(%rbp), %rax
	movl	$0, 40(%rax)
	.loc 1 72 3
	movq	-24(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L14
	.loc 1 72 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.5(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC4(%rip), %rax
	movq	%rdx, %rcx
	movl	$72, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L14:
	.loc 1 73 10 is_stmt 1
	movq	-24(%rbp), %rax
	movq	$0, 16(%rax)
	.loc 1 74 13
	movq	-24(%rbp), %rax
	movq	$0, 24(%rax)
	jmp	.L7
.L15:
	.loc 1 51 5
	nop
	jmp	.L7
.L16:
	.loc 1 56 5
	nop
.L7:
	.loc 1 75 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE156:
	.size	bio_destroy_pair, .-bio_destroy_pair
	.section	.rodata
.LC5:
	.string	"b != NULL"
	.section	.text.bio_free,"ax",@progbits
	.type	bio_free, @function
bio_free:
.LFB157:
	.loc 1 77 31
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 78 22
	movq	-24(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 80 3
	cmpq	$0, -8(%rbp)
	jne	.L18
	.loc 1 80 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.4(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC5(%rip), %rax
	movq	%rdx, %rcx
	movl	$80, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L18:
	.loc 1 82 8 is_stmt 1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 82 6
	testq	%rax, %rax
	je	.L19
	.loc 1 83 5
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	bio_destroy_pair
.L19:
	.loc 1 86 17
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 86 3
	movq	%rax, %rdi
	call	aws_lc_0_40_0_OPENSSL_free@PLT
	.loc 1 87 3
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_OPENSSL_free@PLT
	.loc 1 89 10
	movl	$1, %eax
	.loc 1 90 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE157:
	.size	bio_free, .-bio_free
	.section	.rodata
.LC6:
	.string	"b->peer != NULL"
.LC7:
	.string	"rest > 0"
.LC8:
	.string	"rest <= peer_b->len"
	.align 8
.LC9:
	.string	"peer_b->offset + chunk <= peer_b->size"
	.align 8
.LC10:
	.string	"peer_b->offset <= peer_b->size"
.LC11:
	.string	"chunk == rest"
	.section	.text.bio_read,"ax",@progbits
	.type	bio_read, @function
bio_read:
.LFB158:
	.loc 1 92 53
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
	movl	%edx, -68(%rbp)
	.loc 1 93 10
	movl	-68(%rbp), %eax
	cltq
	movq	%rax, -40(%rbp)
	.loc 1 97 3
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_BIO_clear_retry_flags@PLT
	.loc 1 99 11
	movq	-56(%rbp), %rax
	movl	40(%rax), %eax
	.loc 1 99 6
	testl	%eax, %eax
	jne	.L22
	.loc 1 100 12
	movl	$0, %eax
	jmp	.L23
.L22:
	.loc 1 103 5
	movq	-56(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 104 3
	cmpq	$0, -16(%rbp)
	jne	.L24
	.loc 1 104 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.3(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC5(%rip), %rax
	movq	%rdx, %rcx
	movl	$104, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L24:
	.loc 1 105 3 is_stmt 1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L25
	.loc 1 105 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.3(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC6(%rip), %rax
	movq	%rdx, %rcx
	movl	$105, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L25:
	.loc 1 106 13 is_stmt 1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 106 10
	movq	64(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 107 3
	cmpq	$0, -8(%rbp)
	jne	.L26
	.loc 1 107 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.3(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rax
	movq	%rdx, %rcx
	movl	$107, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L26:
	.loc 1 108 3 is_stmt 1
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L27
	.loc 1 108 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.3(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC3(%rip), %rax
	movq	%rdx, %rcx
	movl	$108, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L27:
	.loc 1 110 19 is_stmt 1
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	.loc 1 112 6
	cmpq	$0, -64(%rbp)
	je	.L28
	.loc 1 112 19 discriminator 1
	cmpq	$0, -40(%rbp)
	jne	.L29
.L28:
	.loc 1 113 12
	movl	$0, %eax
	jmp	.L23
.L29:
	.loc 1 116 13
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 116 6
	testq	%rax, %rax
	jne	.L30
	.loc 1 117 15
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 117 8
	testl	%eax, %eax
	je	.L31
	.loc 1 118 14
	movl	$0, %eax
	jmp	.L23
.L31:
	.loc 1 120 7
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_BIO_set_retry_read@PLT
	.loc 1 121 25
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 121 10
	cmpq	-40(%rbp), %rax
	jb	.L32
	.loc 1 122 25
	movq	-8(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 48(%rax)
	jmp	.L33
.L32:
	.loc 1 126 33
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdx
	.loc 1 126 25
	movq	-8(%rbp), %rax
	movq	%rdx, 48(%rax)
.L33:
	.loc 1 128 14
	movl	$-1, %eax
	jmp	.L23
.L30:
	.loc 1 133 13
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 133 6
	cmpq	-40(%rbp), %rax
	jnb	.L34
	.loc 1 134 10
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -40(%rbp)
.L34:
	.loc 1 138 8
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 140 3
	cmpq	$0, -32(%rbp)
	jne	.L35
	.loc 1 140 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.3(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC7(%rip), %rax
	movq	%rdx, %rcx
	movl	$140, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L35:
.LBB2:
	.loc 1 145 5 is_stmt 1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	cmpq	-32(%rbp), %rax
	jnb	.L36
	.loc 1 145 5 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.3(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC8(%rip), %rax
	movq	%rdx, %rcx
	movl	$145, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L36:
	.loc 1 146 15 is_stmt 1
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	.loc 1 146 24
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 146 40
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 146 8
	cmpq	%rdx, %rax
	jb	.L37
	.loc 1 147 13
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	jmp	.L38
.L37:
	.loc 1 150 21
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdx
	.loc 1 150 36
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 150 13
	subq	%rax, %rdx
	movq	%rdx, -24(%rbp)
.L38:
	.loc 1 152 5
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	cmpq	%rdx, %rax
	jnb	.L39
	.loc 1 152 5 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.3(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC9(%rip), %rax
	movq	%rdx, %rcx
	movl	$152, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L39:
	.loc 1 154 31 is_stmt 1
	movq	-8(%rbp), %rax
	movq	40(%rax), %rdx
	.loc 1 154 45
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	.loc 1 154 37
	leaq	(%rdx,%rax), %rcx
	.loc 1 154 5
	movq	-24(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	OPENSSL_memcpy
	.loc 1 156 11
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 156 17
	subq	-24(%rbp), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	.loc 1 157 15
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 157 8
	testq	%rax, %rax
	je	.L40
	.loc 1 158 13
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	.loc 1 158 22
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	.loc 1 159 7
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	32(%rdx), %rdx
	cmpq	%rax, %rdx
	jnb	.L41
	.loc 1 159 7 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.3(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC10(%rip), %rax
	movq	%rdx, %rcx
	movl	$159, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L41:
	.loc 1 160 17 is_stmt 1
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	.loc 1 160 35
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 160 10
	cmpq	%rax, %rdx
	jne	.L42
	.loc 1 161 24
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
.L42:
	.loc 1 163 11
	movq	-24(%rbp), %rax
	addq	%rax, -64(%rbp)
	jmp	.L43
.L40:
	.loc 1 166 7
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	je	.L44
	.loc 1 166 7 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.3(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC11(%rip), %rax
	movq	%rdx, %rcx
	movl	$166, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L44:
	.loc 1 167 22 is_stmt 1
	movq	-8(%rbp), %rax
	movq	$0, 24(%rax)
.L43:
	.loc 1 169 10
	movq	-24(%rbp), %rax
	subq	%rax, -32(%rbp)
.LBE2:
	.loc 1 170 12
	cmpq	$0, -32(%rbp)
	jne	.L35
	.loc 1 173 10
	movq	-40(%rbp), %rax
.L23:
	.loc 1 174 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE158:
	.size	bio_read, .-bio_read
	.section	.rodata
.LC12:
	.string	"b->len <= b->size"
.LC13:
	.string	"b->len + rest <= b->size"
	.section	.text.bio_write,"ax",@progbits
	.type	bio_write, @function
bio_write:
.LFB159:
	.loc 1 176 59
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
	movl	%edx, -68(%rbp)
	.loc 1 177 10
	movl	-68(%rbp), %eax
	cltq
	movq	%rax, -40(%rbp)
	.loc 1 181 3
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_BIO_clear_retry_flags@PLT
	.loc 1 183 11
	movq	-56(%rbp), %rax
	movl	40(%rax), %eax
	.loc 1 183 6
	testl	%eax, %eax
	je	.L46
	.loc 1 183 18 discriminator 1
	cmpq	$0, -64(%rbp)
	je	.L46
	.loc 1 183 33 discriminator 2
	cmpq	$0, -40(%rbp)
	jne	.L47
.L46:
	.loc 1 184 12
	movl	$0, %eax
	jmp	.L48
.L47:
	.loc 1 187 5
	movq	-56(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 188 3
	cmpq	$0, -8(%rbp)
	jne	.L49
	.loc 1 188 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.2(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC5(%rip), %rax
	movq	%rdx, %rcx
	movl	$188, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L49:
	.loc 1 189 3 is_stmt 1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L50
	.loc 1 189 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.2(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC6(%rip), %rax
	movq	%rdx, %rcx
	movl	$189, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L50:
	.loc 1 190 3 is_stmt 1
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	testq	%rax, %rax
	jne	.L51
	.loc 1 190 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.2(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC4(%rip), %rax
	movq	%rdx, %rcx
	movl	$190, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L51:
	.loc 1 192 14 is_stmt 1
	movq	-8(%rbp), %rax
	movq	$0, 48(%rax)
	.loc 1 193 8
	movq	-8(%rbp), %rax
	movl	8(%rax), %eax
	.loc 1 193 6
	testl	%eax, %eax
	je	.L52
	.loc 1 195 5
	leaq	.LC0(%rip), %rax
	movl	$195, %r8d
	movq	%rax, %rcx
	movl	$101, %edx
	movl	$0, %esi
	movl	$17, %edi
	call	aws_lc_0_40_0_ERR_put_error@PLT
	.loc 1 196 12
	movl	$-1, %eax
	jmp	.L48
.L52:
	.loc 1 199 3
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	32(%rdx), %rdx
	cmpq	%rax, %rdx
	jnb	.L53
	.loc 1 199 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.2(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC12(%rip), %rax
	movq	%rdx, %rcx
	movl	$199, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L53:
	.loc 1 201 8 is_stmt 1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 201 18
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 201 6
	cmpq	%rax, %rdx
	jne	.L54
	.loc 1 202 5
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_BIO_set_retry_write@PLT
	.loc 1 203 12
	movl	$-1, %eax
	jmp	.L48
.L54:
	.loc 1 207 14
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdx
	.loc 1 207 24
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 207 21
	subq	%rax, %rdx
	.loc 1 207 6
	cmpq	-40(%rbp), %rdx
	jnb	.L55
	.loc 1 208 12
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdx
	.loc 1 208 22
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 208 9
	subq	%rax, %rdx
	movq	%rdx, -40(%rbp)
.L55:
	.loc 1 212 8
	movq	-40(%rbp), %rax
	movq	%rax, -32(%rbp)
	.loc 1 214 3
	cmpq	$0, -32(%rbp)
	jne	.L56
	.loc 1 214 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.2(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC7(%rip), %rax
	movq	%rdx, %rcx
	movl	$214, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L56:
.LBB3:
	.loc 1 220 5 is_stmt 1
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	cmpq	%rdx, %rax
	jnb	.L57
	.loc 1 220 5 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.2(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC13(%rip), %rax
	movq	%rdx, %rcx
	movl	$220, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L57:
	.loc 1 222 21 is_stmt 1
	movq	-8(%rbp), %rax
	movq	24(%rax), %rdx
	.loc 1 222 33
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	.loc 1 222 18
	addq	%rdx, %rax
	movq	%rax, -24(%rbp)
	.loc 1 223 26
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 223 8
	cmpq	%rax, -24(%rbp)
	jb	.L58
	.loc 1 224 24
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 224 20
	subq	%rax, -24(%rbp)
.L58:
	.loc 1 228 22
	movq	-24(%rbp), %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 228 33
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 228 8
	cmpq	%rdx, %rax
	jb	.L59
	.loc 1 229 13
	movq	-32(%rbp), %rax
	movq	%rax, -16(%rbp)
	jmp	.L60
.L59:
	.loc 1 232 16
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	.loc 1 232 13
	subq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
.L60:
	.loc 1 235 21
	movq	-8(%rbp), %rax
	movq	40(%rax), %rdx
	.loc 1 235 27
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	.loc 1 235 5
	movq	-16(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	OPENSSL_memcpy
	.loc 1 237 6
	movq	-8(%rbp), %rax
	movq	16(%rax), %rdx
	.loc 1 237 12
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 16(%rax)
	.loc 1 239 5
	movq	-8(%rbp), %rax
	movq	16(%rax), %rax
	movq	-8(%rbp), %rdx
	movq	32(%rdx), %rdx
	cmpq	%rax, %rdx
	jnb	.L61
	.loc 1 239 5 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.2(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC12(%rip), %rax
	movq	%rdx, %rcx
	movl	$239, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L61:
	.loc 1 241 10 is_stmt 1
	movq	-16(%rbp), %rax
	subq	%rax, -32(%rbp)
	.loc 1 242 9
	movq	-16(%rbp), %rax
	addq	%rax, -64(%rbp)
.LBE3:
	.loc 1 243 12
	cmpq	$0, -32(%rbp)
	jne	.L56
	.loc 1 246 10
	movq	-40(%rbp), %rax
.L48:
	.loc 1 247 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE159:
	.size	bio_write, .-bio_write
	.section	.rodata
.LC14:
	.string	"bio1 != NULL"
.LC15:
	.string	"bio2 != NULL"
	.section	.text.bio_make_pair,"ax",@progbits
	.type	bio_make_pair, @function
bio_make_pair:
.LFB160:
	.loc 1 250 48
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
	.loc 1 253 3
	cmpq	$0, -24(%rbp)
	jne	.L63
	.loc 1 253 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.1(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC14(%rip), %rax
	movq	%rdx, %rcx
	movl	$253, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L63:
	.loc 1 254 3 is_stmt 1
	cmpq	$0, -32(%rbp)
	jne	.L64
	.loc 1 254 3 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.1(%rip), %rdx
	leaq	.LC0(%rip), %rsi
	leaq	.LC15(%rip), %rax
	movq	%rdx, %rcx
	movl	$254, %edx
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L64:
	.loc 1 256 6 is_stmt 1
	movq	-24(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 257 6
	movq	-32(%rbp), %rax
	movq	64(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 259 9
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 259 6
	testq	%rax, %rax
	jne	.L65
	.loc 1 259 29 discriminator 1
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 259 24 discriminator 1
	testq	%rax, %rax
	je	.L66
.L65:
	.loc 1 260 5
	leaq	.LC0(%rip), %rax
	movl	$260, %r8d
	movq	%rax, %rcx
	movl	$105, %edx
	movl	$0, %esi
	movl	$17, %edi
	call	aws_lc_0_40_0_ERR_put_error@PLT
	.loc 1 261 12
	movl	$0, %eax
	jmp	.L67
.L66:
	.loc 1 264 9
	movq	-16(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 264 6
	testq	%rax, %rax
	jne	.L68
	.loc 1 265 8
	cmpq	$0, -40(%rbp)
	je	.L69
	.loc 1 266 16
	movq	-16(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, 32(%rax)
.L69:
	.loc 1 268 15
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_OPENSSL_malloc@PLT
	.loc 1 268 13 discriminator 1
	movq	-16(%rbp), %rdx
	movq	%rax, 40(%rdx)
	.loc 1 269 11
	movq	-16(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 269 8
	testq	%rax, %rax
	jne	.L70
	.loc 1 270 14
	movl	$0, %eax
	jmp	.L67
.L70:
	.loc 1 272 13
	movq	-16(%rbp), %rax
	movq	$0, 16(%rax)
	.loc 1 273 16
	movq	-16(%rbp), %rax
	movq	$0, 24(%rax)
.L68:
	.loc 1 276 9
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 276 6
	testq	%rax, %rax
	jne	.L71
	.loc 1 277 8
	cmpq	$0, -48(%rbp)
	je	.L72
	.loc 1 278 16
	movq	-8(%rbp), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, 32(%rax)
.L72:
	.loc 1 280 15
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, %rdi
	call	aws_lc_0_40_0_OPENSSL_malloc@PLT
	.loc 1 280 13 discriminator 1
	movq	-8(%rbp), %rdx
	movq	%rax, 40(%rdx)
	.loc 1 281 11
	movq	-8(%rbp), %rax
	movq	40(%rax), %rax
	.loc 1 281 8
	testq	%rax, %rax
	jne	.L73
	.loc 1 282 14
	movl	$0, %ea