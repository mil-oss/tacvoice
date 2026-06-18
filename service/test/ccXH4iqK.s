# 0 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
# 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1




# 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/generated-include/openssl/boringssl_prefix_symbols.h" 1
# 6 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/generated-include/openssl/boringssl_prefix_symbols_asm.h" 2
# 0 "<command-line>" 2
# 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
# 25 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
# 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/include/_internal_s2n_bignum_x86_att.h" 1

# 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/generated-include/openssl/boringssl_prefix_symbols_asm.h" 1
# 3 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/include/_internal_s2n_bignum_x86_att.h" 2
# 50 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/include/_internal_s2n_bignum_x86_att.h"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/15/include/cet.h" 1 3 4
# 69 "/usr/lib/gcc/x86_64-linux-gnu/15/include/cet.h" 3 4
 .pushsection ".note.gnu.property", "a"
 .p2align 3
 .long 1f - 0f
 .long 4f - 1f

 .long 5
0:
 .asciz "GNU"
1:
 .p2align 3

 .long 0xc0000002
 .long 3f - 2f
2:

 .long (0x1 | 0x2)
3:
 .p2align 3
4:
 .popsection
# 51 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/include/_internal_s2n_bignum_x86_att.h" 2
# 26 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S" 2


        .globl aws_lc_0_41_0_edwards25519_scalarmuldouble
        .type aws_lc_0_41_0_edwards25519_scalarmuldouble, %function
        .hidden aws_lc_0_41_0_edwards25519_scalarmuldouble


        .text
# 439 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
aws_lc_0_41_0_edwards25519_scalarmuldouble:
        .cfi_startproc
        endbr64
# 468 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
        pushq %rbx ; .cfi_adjust_cfa_offset 8 ; .cfi_rel_offset %rbx, 0
        pushq %rbp ; .cfi_adjust_cfa_offset 8 ; .cfi_rel_offset %rbp, 0
        pushq %r12 ; .cfi_adjust_cfa_offset 8 ; .cfi_rel_offset %r12, 0
        pushq %r13 ; .cfi_adjust_cfa_offset 8 ; .cfi_rel_offset %r13, 0
        pushq %r14 ; .cfi_adjust_cfa_offset 8 ; .cfi_rel_offset %r14, 0
        pushq %r15 ; .cfi_adjust_cfa_offset 8 ; .cfi_rel_offset %r15, 0
        subq $46*32, %rsp ; .cfi_adjust_cfa_offset 46*32



        movq %rdi, 45*32 +24(%rsp)
# 496 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
        movq (%rcx), %r8
        movq 8(%rcx), %r9
        movq 16(%rcx), %r10
        movq 24(%rcx), %r11
        movq $0xc7f56fb5a0d9e920, %r12
        movq $0xe190b99370cba1d5, %r13
        movq $0x8888888888888887, %r14
        movq $0x8888888888888888, %r15
        movq $0x8000000000000000, %rax
        movq $0x0888888888888888, %rbx
        cmpq %r11, %rax
        cmovncq %r15, %r12
        cmovncq %r15, %r13
        cmovncq %r15, %r14
        cmovncq %rbx, %r15
        addq %r12, %r8
        adcq %r13, %r9
        adcq %r14, %r10
        adcq %r15, %r11
        movq %r8, (1*32)(%rsp)
        movq %r9, (1*32)+8(%rsp)
        movq %r10, (1*32)+16(%rsp)
        movq %r11, (1*32)+24(%rsp)

        movq (%rsi), %r8
        movq 8(%rsi), %r9
        movq 16(%rsi), %r10
        movq 24(%rsi), %r11
        movq $0xc7f56fb5a0d9e920, %r12
        movq $0xe190b99370cba1d5, %r13
        movq $0x8888888888888887, %r14
        movq $0x8888888888888888, %r15
        movq $0x8000000000000000, %rax
        movq $0x0888888888888888, %rbx
        cmpq %r11, %rax
        cmovncq %r15, %r12
        cmovncq %r15, %r13
        cmovncq %r15, %r14
        cmovncq %rbx, %r15
        addq %r12, %r8
        adcq %r13, %r9
        adcq %r14, %r10
        adcq %r15, %r11
        movq %r8, (0*32)(%rsp)
        movq %r9, (0*32)+8(%rsp)
        movq %r10, (0*32)+16(%rsp)
        movq %r11, (0*32)+24(%rsp)







        movl $38, %eax
        movq (%rdx), %r8
        xorl %ebx, %ebx
        movq 8(%rdx), %r9
        xorl %ecx, %ecx
        movq 16(%rdx), %r10
        xorl %esi, %esi
        movq 24(%rdx), %r11
        addq %r8, %rax
        adcq %r9, %rbx
        adcq %r10, %rcx
        adcq %r11, %rsi
        cmovncq %r8, %rax
        movq %rax, (13*32)(%rsp)
        cmovncq %r9, %rbx
        movq %rbx, (13*32)+8(%rsp)
        cmovncq %r10, %rcx
        movq %rcx, (13*32)+16(%rsp)
        cmovncq %r11, %rsi
        movq %rsi, (13*32)+24(%rsp)

        movl $38, %eax
        movq 32(%rdx), %r8
        xorl %ebx, %ebx
        movq 40(%rdx), %r9
        xorl %ecx, %ecx
        movq 48(%rdx), %r10
        xorl %esi, %esi
        movq 56(%rdx), %r11
        addq %r8, %rax
        adcq %r9, %rbx
        adcq %r10, %rcx
        adcq %r11, %rsi
        cmovncq %r8, %rax
        movq %rax, (13*32)+32(%rsp)
        cmovncq %r9, %rbx
        movq %rbx, (13*32)+40(%rsp)
        cmovncq %r10, %rcx
        movq %rcx, (13*32)+48(%rsp)
        cmovncq %r11, %rsi
        movq %rsi, (13*32)+56(%rsp)

        movl $1, %eax
        movq %rax, (13*32)+64(%rsp)
        xorl %eax, %eax
        movq %rax, (13*32)+72(%rsp)
        movq %rax, (13*32)+80(%rsp)
        movq %rax, (13*32)+88(%rsp)

        leaq (13*32)+96(%rsp), %rdi
        leaq (13*32)(%rsp), %rsi
        leaq (13*32)+32(%rsp), %rbp
        xorl %ecx, %ecx ; movq 0(%rbp), %rdx ; mulxq 0(%rsi), %r8, %r9 ; mulxq 0x8+0(%rsi), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+0(%rsi), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+0(%rsi), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+0(%rbp), %rdx ; mulxq 0(%rsi), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+0(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+0(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+0(%rsi), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+0(%rbp), %rdx ; mulxq 0(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+0(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+0(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+0(%rsi), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+0(%rbp), %rdx ; mulxq 0(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+0(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+0(%rsi), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+0(%rsi), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, 0(%rdi) ; movq %r9, 0x8+0(%rdi) ; movq %r10, 0x10+0(%rdi) ; movq %r11, 0x18+0(%rdi)



        leaq (13*32)+1*128(%rsp), %rdi
        leaq (13*32)(%rsp), %rsi
        callq Ledwards25519_scalarmuldouble_epdouble



        leaq (13*32)+2*128(%rsp), %rdi
        leaq (13*32)(%rsp), %rsi
        leaq (13*32)+1*128(%rsp), %rbp
        callq Ledwards25519_scalarmuldouble_epadd



        leaq (13*32)+3*128(%rsp), %rdi
        leaq (13*32)+1*128(%rsp), %rsi
        callq Ledwards25519_scalarmuldouble_epdouble



        leaq (13*32)+4*128(%rsp), %rdi
        leaq (13*32)(%rsp), %rsi
        leaq (13*32)+3*128(%rsp), %rbp
        callq Ledwards25519_scalarmuldouble_epadd



        leaq (13*32)+5*128(%rsp), %rdi
        leaq (13*32)+2*128(%rsp), %rsi
        callq Ledwards25519_scalarmuldouble_epdouble



        leaq (13*32)+6*128(%rsp), %rdi
        leaq (13*32)(%rsp), %rsi
        leaq (13*32)+5*128(%rsp), %rbp
        callq Ledwards25519_scalarmuldouble_epadd



        leaq (13*32)+7*128(%rsp), %rdi
        leaq (13*32)+3*128(%rsp), %rsi
        callq Ledwards25519_scalarmuldouble_epdouble





        movq $252, %rax
        movq %rax, 45*32 +16(%rsp)



        movq (1*32)+24(%rsp), %rax
        shrq $60, %rax
        movq %rax, 45*32(%rsp)



        movl $1, %eax
        xorl %ebx, %ebx
        xorl %ecx, %ecx
        xorl %edx, %edx
        movl $1, %r8d
        xorl %r9d, %r9d
        xorl %r10d, %r10d
        xorl %r11d, %r11d
        xorl %r12d, %r12d
        xorl %r13d, %r13d
        xorl %r14d, %r14d
        xorl %r15d, %r15d

        leaq Ledwards25519_scalarmuldouble_table(%rip), %rbp

        cmpq $1, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $2, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $3, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $4, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $5, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $6, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $7, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $8, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15

        movq %rax, (6*32)(%rsp)
        movq %rbx, (6*32)+8(%rsp)
        movq %rcx, (6*32)+16(%rsp)
        movq %rdx, (6*32)+24(%rsp)
        movq %r8, (6*32)+32(%rsp)
        movq %r9, (6*32)+40(%rsp)
        movq %r10, (6*32)+48(%rsp)
        movq %r11, (6*32)+56(%rsp)
        movq %r12, (6*32)+64(%rsp)
        movq %r13, (6*32)+72(%rsp)
        movq %r14, (6*32)+80(%rsp)
        movq %r15, (6*32)+88(%rsp)



        movq (0*32)+24(%rsp), %rax
        shrq $60, %rax
        movq %rax, 45*32(%rsp)




        movl $1, %eax
        xorl %ebx, %ebx
        xorl %ecx, %ecx
        xorl %edx, %edx
        movl $1, %r8d
        xorl %r9d, %r9d
        xorl %r10d, %r10d
        xorl %r11d, %r11d

        leaq (13*32)+32(%rsp), %rbp

        cmpq $1, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $2, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $3, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $4, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $5, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $6, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $7, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $8, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11

        movq %rax, (2*32)+32(%rsp)
        movq %rbx, (2*32)+40(%rsp)
        movq %rcx, (2*32)+48(%rsp)
        movq %rdx, (2*32)+56(%rsp)
        movq %r8, (2*32)+64(%rsp)
        movq %r9, (2*32)+72(%rsp)
        movq %r10, (2*32)+80(%rsp)
        movq %r11, (2*32)+88(%rsp)



        leaq (13*32)(%rsp), %rbp

        xorl %eax, %eax
        xorl %ebx, %ebx
        xorl %ecx, %ecx
        xorl %edx, %edx
        xorl %r8d, %r8d
        xorl %r9d, %r9d
        xorl %r10d, %r10d
        xorl %r11d, %r11d

        cmpq $1, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $2, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $3, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $4, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $5, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $6, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $7, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $8, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11

        movq %rax, (2*32)(%rsp)
        movq %rbx, (2*32)+8(%rsp)
        movq %rcx, (2*32)+16(%rsp)
        movq %rdx, (2*32)+24(%rsp)
        movq %r8, (2*32)+96(%rsp)
        movq %r9, (2*32)+104(%rsp)
        movq %r10, (2*32)+112(%rsp)
        movq %r11, (2*32)+120(%rsp)



        leaq (9*32)(%rsp), %rdi
        leaq (2*32)(%rsp), %rsi
        leaq (6*32)(%rsp), %rbp
        callq Ledwards25519_scalarmuldouble_pepadd




Ledwards25519_scalarmuldouble_loop:

        movq 45*32 +16(%rsp), %rax
        subq $4, %rax
        movq %rax, 45*32 +16(%rsp)



        leaq (9*32)(%rsp), %rdi
        leaq (9*32)(%rsp), %rsi
        callq Ledwards25519_scalarmuldouble_pdouble



        movq 45*32 +16(%rsp), %rax
        movq %rax, %rcx
        shrq $6, %rax
        movq 32(%rsp,%rax,8), %rax
        shrq %cl, %rax
        andq $15, %rax

        subq $8, %rax
        sbbq %rcx, %rcx
        xorq %rcx, %rax
        subq %rcx, %rax
        movq %rcx, 45*32 +8(%rsp)
        movq %rax, 45*32(%rsp)



        movl $1, %eax
        xorl %ebx, %ebx
        xorl %ecx, %ecx
        xorl %edx, %edx
        movl $1, %r8d
        xorl %r9d, %r9d
        xorl %r10d, %r10d
        xorl %r11d, %r11d
        xorl %r12d, %r12d
        xorl %r13d, %r13d
        xorl %r14d, %r14d
        xorl %r15d, %r15d

        leaq Ledwards25519_scalarmuldouble_table(%rip), %rbp

        cmpq $1, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $2, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $3, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $4, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $5, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $6, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $7, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
        addq $96, %rbp

        cmpq $8, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        movq 64(%rbp), %rsi
        cmovzq %rsi, %r12
        movq 72(%rbp), %rsi
        cmovzq %rsi, %r13
        movq 80(%rbp), %rsi
        cmovzq %rsi, %r14
        movq 88(%rbp), %rsi
        cmovzq %rsi, %r15
# 1544 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
        movq 45*32 +8(%rsp), %rdi
        testq %rdi, %rdi

        movq %rax, %rsi
        cmovnzq %r8, %rsi
        cmovnzq %rax, %r8
        movq %rsi, (6*32)(%rsp)
        movq %r8, (6*32)+32(%rsp)

        movq %rbx, %rsi
        cmovnzq %r9, %rsi
        cmovnzq %rbx, %r9
        movq %rsi, (6*32)+8(%rsp)
        movq %r9, (6*32)+40(%rsp)

        movq %rcx, %rsi
        cmovnzq %r10, %rsi
        cmovnzq %rcx, %r10
        movq %rsi, (6*32)+16(%rsp)
        movq %r10, (6*32)+48(%rsp)

        movq %rdx, %rsi
        cmovnzq %r11, %rsi
        cmovnzq %rdx, %r11
        movq %rsi, (6*32)+24(%rsp)
        movq %r11, (6*32)+56(%rsp)

        xorq %rdi, %r12
        xorq %rdi, %r13
        xorq %rdi, %r14
        xorq %rdi, %r15
        andq $37, %rdi
        subq %rdi, %r12
        sbbq $0, %r13
        sbbq $0, %r14
        sbbq $0, %r15
        movq %r12, (6*32)+64(%rsp)
        movq %r13, (6*32)+72(%rsp)
        movq %r14, (6*32)+80(%rsp)
        movq %r15, (6*32)+88(%rsp)



        movq 45*32 +16(%rsp), %rax
        movq %rax, %rcx
        shrq $6, %rax
        movq (%rsp,%rax,8), %rax
        shrq %cl, %rax
        andq $15, %rax

        subq $8, %rax
        sbbq %rcx, %rcx
        xorq %rcx, %rax
        subq %rcx, %rax
        movq %rcx, 45*32 +8(%rsp)
        movq %rax, 45*32(%rsp)





        movl $1, %eax
        xorl %ebx, %ebx
        xorl %ecx, %ecx
        xorl %edx, %edx
        movl $1, %r8d
        xorl %r9d, %r9d
        xorl %r10d, %r10d
        xorl %r11d, %r11d

        leaq (13*32)+32(%rsp), %rbp

        cmpq $1, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $2, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $3, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $4, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $5, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $6, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $7, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $8, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 32(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 40(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 48(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 56(%rbp), %rsi
        cmovzq %rsi, %r11

        movq %rax, (2*32)+32(%rsp)
        movq %rbx, (2*32)+40(%rsp)
        movq %rcx, (2*32)+48(%rsp)
        movq %rdx, (2*32)+56(%rsp)
        movq %r8, (2*32)+64(%rsp)
        movq %r9, (2*32)+72(%rsp)
        movq %r10, (2*32)+80(%rsp)
        movq %r11, (2*32)+88(%rsp)



        leaq (13*32)(%rsp), %rbp

        xorl %eax, %eax
        xorl %ebx, %ebx
        xorl %ecx, %ecx
        xorl %edx, %edx
        xorl %r8d, %r8d
        xorl %r9d, %r9d
        xorl %r10d, %r10d
        xorl %r11d, %r11d

        cmpq $1, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $2, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $3, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $4, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $5, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $6, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $7, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
        addq $128, %rbp

        cmpq $8, 45*32(%rsp)
        movq (%rbp), %rsi
        cmovzq %rsi, %rax
        movq 8(%rbp), %rsi
        cmovzq %rsi, %rbx
        movq 16(%rbp), %rsi
        cmovzq %rsi, %rcx
        movq 24(%rbp), %rsi
        cmovzq %rsi, %rdx
        movq 96(%rbp), %rsi
        cmovzq %rsi, %r8
        movq 104(%rbp), %rsi
        cmovzq %rsi, %r9
        movq 112(%rbp), %rsi
        cmovzq %rsi, %r10
        movq 120(%rbp), %rsi
        cmovzq %rsi, %r11
# 1953 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
        movq 45*32 +8(%rsp), %rdi

        xorq %rdi, %rax
        xorq %rdi, %rbx
        xorq %rdi, %rcx
        xorq %rdi, %rdx

        xorq %rdi, %r8
        xorq %rdi, %r9
        xorq %rdi, %r10
        xorq %rdi, %r11

        andq $37, %rdi

        subq %rdi, %rax
        sbbq $0, %rbx
        sbbq $0, %rcx
        sbbq $0, %rdx

        movq %rax, (2*32)(%rsp)
        movq %rbx, (2*32)+8(%rsp)
        movq %rcx, (2*32)+16(%rsp)
        movq %rdx, (2*32)+24(%rsp)

        subq %rdi, %r8
        sbbq $0, %r9
        sbbq $0, %r10
        sbbq $0, %r11

        movq %r8, (2*32)+96(%rsp)
        movq %r9, (2*32)+104(%rsp)
        movq %r10, (2*32)+112(%rsp)
        movq %r11, (2*32)+120(%rsp)



        leaq (9*32)(%rsp), %rdi
        leaq (9*32)(%rsp), %rsi
        callq Ledwards25519_scalarmuldouble_pdouble



        leaq (2*32)(%rsp), %rdi
        leaq (2*32)(%rsp), %rsi
        leaq (6*32)(%rsp), %rbp
        callq Ledwards25519_scalarmuldouble_pepadd



        leaq (9*32)(%rsp), %rdi
        leaq (9*32)(%rsp), %rsi
        callq Ledwards25519_scalarmuldouble_pdouble



        leaq (9*32)(%rsp), %rdi
        leaq (9*32)(%rsp), %rsi
        callq Ledwards25519_scalarmuldouble_epdouble



        leaq (9*32)(%rsp), %rdi
        leaq (9*32)(%rsp), %rsi
        leaq (2*32)(%rsp), %rbp
        callq Ledwards25519_scalarmuldouble_epadd



        movq 45*32 +16(%rsp), %rax
        testq %rax, %rax
        jnz Ledwards25519_scalarmuldouble_loop



        leaq (13*32)(%rsp), %rdi
        leaq (9*32)+64(%rsp), %rsi
# 2037 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
        movq %rdi, 0xc0(%rsp)
        xorl %eax, %eax
        leaq -0x13(%rax), %rcx
        notq %rax
        movq %rcx, (%rsp)
        movq %rax, 0x8(%rsp)
        movq %rax, 0x10(%rsp)
        btr $0x3f, %rax
        movq %rax, 0x18(%rsp)
        movq (%rsi), %rdx
        movq 0x8(%rsi), %rcx
        movq 0x10(%rsi), %r8
        movq 0x18(%rsi), %r9
        movl $0x1, %eax
        xorl %r10d, %r10d
        bts $0x3f, %r9
        adcq %r10, %rax
        imulq $0x13, %rax, %rax
        addq %rax, %rdx
        adcq %r10, %rcx
        adcq %r10, %r8
        adcq %r10, %r9
        movl $0x13, %eax
        cmovbq %r10, %rax
        subq %rax, %rdx
        sbbq %r10, %rcx
        sbbq %r10, %r8
        sbbq %r10, %r9
        btr $0x3f, %r9
        movq %rdx, 0x20(%rsp)
        movq %rcx, 0x28(%rsp)
        movq %r8, 0x30(%rsp)
        movq %r9, 0x38(%rsp)
        xorl %eax, %eax
        movq %rax, 0x40(%rsp)
        movq %rax, 0x48(%rsp)
        movq %rax, 0x50(%rsp)
        movq %rax, 0x58(%rsp)
        movabsq $0xa0f99e2375022099, %rax
        movq %rax, 0x60(%rsp)
        movabsq $0xa8c68f3f1d132595, %rax
        movq %rax, 0x68(%rsp)
        movabsq $0x6c6c893805ac5242, %rax
        movq %rax, 0x70(%rsp)
        movabsq $0x276508b241770615, %rax
        movq %rax, 0x78(%rsp)
        movq $0xa, 0x90(%rsp)
        movq $0x1, 0x98(%rsp)
        jmp Ledwards25519_scalarmuldouble_midloop
Ledwards25519_scalarmuldouble_inverseloop:
        movq %r8, %r9
        sarq $0x3f, %r9
        xorq %r9, %r8
        subq %r9, %r8
        movq %r10, %r11
        sarq $0x3f, %r11
        xorq %r11, %r10
        subq %r11, %r10
        movq %r12, %r13
        sarq $0x3f, %r13
        xorq %r13, %r12
        subq %r13, %r12
        movq %r14, %r15
        sarq $0x3f, %r15
        xorq %r15, %r14
        subq %r15, %r14
        movq %r8, %rax
        andq %r9, %rax
        movq %r10, %rdi
        andq %r11, %rdi
        addq %rax, %rdi
        movq %rdi, 0x80(%rsp)
        movq %r12, %rax
        andq %r13, %rax
        movq %r14, %rsi
        andq %r15, %rsi
        addq %rax, %rsi
        movq %rsi, 0x88(%rsp)
        xorl %ebx, %ebx
        movq (%rsp), %rax
        xorq %r9, %rax
        mulq %r8
        addq %rax, %rdi
        adcq %rdx, %rbx
        movq 0x20(%rsp), %rax
        xorq %r11, %rax
        mulq %r10
        addq %rax, %rdi
        adcq %rdx, %rbx
        xorl %ebp, %ebp
        movq (%rsp), %rax
        xorq %r13, %rax
        mulq %r12
        addq %rax, %rsi
        adcq %rdx, %rbp
        movq 0x20(%rsp), %rax
        xorq %r15, %rax
        mulq %r14
        addq %rax, %rsi
        adcq %rdx, %rbp
        xorl %ecx, %ecx
        movq 0x8(%rsp), %rax
        xorq %r9, %rax
        mulq %r8
        addq %rax, %rbx
        adcq %rdx, %rcx
        movq 0x28(%rsp), %rax
        xorq %r11, %rax
        mulq %r10
        addq %rax, %rbx
        adcq %rdx, %rcx
        shrdq $0x3b, %rbx, %rdi
        movq %rdi, (%rsp)
        xorl %edi, %edi
        movq 0x8(%rsp), %rax
        xorq %r13, %rax
        mulq %r12
        addq %rax, %rbp
        adcq %rdx, %rdi
        movq 0x28(%rsp), %rax
        xorq %r15, %rax
        mulq %r14
        addq %rax, %rbp
        adcq %rdx, %rdi
        shrdq $0x3b, %rbp, %rsi
        movq %rsi, 0x20(%rsp)
        xorl %esi, %esi
        movq 0x10(%rsp), %rax
        xorq %r9, %rax
        mulq %r8
        addq %rax, %rcx
        adcq %rdx, %rsi
        movq 0x30(%rsp), %rax
        xorq %r11, %rax
        mulq %r10
        addq %rax, %rcx
        adcq %rdx, %rsi
        shrdq $0x3b, %rcx, %rbx
        movq %rbx, 0x8(%rsp)
        xorl %ebx, %ebx
        movq 0x10(%rsp), %rax
        xorq %r13, %rax
        mulq %r12
        addq %rax, %rdi
        adcq %rdx, %rbx
        movq 0x30(%rsp), %rax
        xorq %r15, %rax
        mulq %r14
        addq %rax, %rdi
        adcq %rdx, %rbx
        shrdq $0x3b, %rdi, %rbp
        movq %rbp, 0x28(%rsp)
        movq 0x18(%rsp), %rax
        xorq %r9, %rax
        movq %rax, %rbp
        sarq $0x3f, %rbp
        andq %r8, %rbp
        negq %rbp
        mulq %r8
        addq %rax, %rsi
        adcq %rdx, %rbp
        movq 0x38(%rsp), %rax
        xorq %r11, %rax
        movq %rax, %rdx
        sarq $0x3f, %rdx
        andq %r10, %rdx
        subq %rdx, %rbp
        mulq %r10
        addq %rax, %rsi
        adcq %rdx, %rbp
        shrdq $0x3b, %rsi, %rcx
        movq %rcx, 0x10(%rsp)
        shrdq $0x3b, %rbp, %rsi
        movq 0x18(%rsp), %rax
        movq %rsi, 0x18(%rsp)
        xorq %r13, %rax
        movq %rax, %rsi
        sarq $0x3f, %rsi
        andq %r12, %rsi
        negq %rsi
        mulq %r12
        addq %rax, %rbx
        adcq %rdx, %rsi
        movq 0x38(%rsp), %rax
        xorq %r15, %rax
        movq %rax, %rdx
        sarq $0x3f, %rdx
        andq %r14, %rdx
        subq %rdx, %rsi
        mulq %r14
        addq %rax, %rbx
        adcq %rdx, %rsi
        shrdq $0x3b, %rbx, %rdi
        movq %rdi, 0x30(%rsp)
        shrdq $0x3b, %rsi, %rbx
        movq %rbx, 0x38(%rsp)
        movq 0x80(%rsp), %rbx
        movq 0x88(%rsp), %rbp
        xorl %ecx, %ecx
        movq 0x40(%rsp), %rax
        xorq %r9, %rax
        mulq %r8
        addq %rax, %rbx
        adcq %rdx, %rcx
        movq 0x60(%rsp), %rax
        xorq %r11, %rax
        mulq %r10
        addq %rax, %rbx
        adcq %rdx, %rcx
        xorl %esi, %esi
        movq 0x40(%rsp), %rax
        xorq %r13, %rax
        mulq %r12
        movq %rbx, 0x40(%rsp)
        addq %rax, %rbp
        adcq %rdx, %rsi
        movq 0x60(%rsp), %rax
        xorq %r15, %rax
        mulq %r14
        addq %rax, %rbp
        adcq %rdx, %rsi
        movq %rbp, 0x60(%rsp)
        xorl %ebx, %ebx
        movq 0x48(%rsp), %rax
        xorq %r9, %rax
        mulq %r8
        addq %rax, %rcx
        adcq %rdx, %rbx
        movq 0x68(%rsp), %rax
        xorq %r11, %rax
        mulq %r10
        addq %rax, %rcx
        adcq %rdx, %rbx
        xorl %ebp, %ebp
        movq 0x48(%rsp), %rax
        xorq %r13, %rax
        mulq %r12
        movq %rcx, 0x48(%rsp)
        addq %rax, %rsi
        adcq %rdx, %rbp
        movq 0x68(%rsp), %rax
        xorq %r15, %rax
        mulq %r14
        addq %rax, %rsi
        adcq %rdx, %rbp
        movq %rsi, 0x68(%rsp)
        xorl %ecx, %ecx
        movq 0x50(%rsp), %rax
        xorq %r9, %rax
        mulq %r8
        addq %rax, %rbx
        adcq %rdx, %rcx
        movq 0x70(%rsp), %rax
        xorq %r11, %rax
        mulq %r10
        addq %rax, %rbx
        adcq %rdx, %rcx
        xorl %esi, %esi
        movq 0x50(%rsp), %rax
        xorq %r13, %rax
        mulq %r12
        movq %rbx, 0x50(%rsp)
        addq %rax, %rbp
        adcq %rdx, %rsi
        movq 0x70(%rsp), %rax
        xorq %r15, %rax
        mulq %r14
        addq %rax, %rbp
        adcq %rdx, %rsi
        movq %rbp, 0x70(%rsp)
        movq 0x58(%rsp), %rax
        xorq %r9, %rax
        movq %r9, %rbx
        andq %r8, %rbx
        negq %rbx
        mulq %r8
        addq %rax, %rcx
        adcq %rdx, %rbx
        movq 0x78(%rsp), %rax
        xorq %r11, %rax
        movq %r11, %rdx
        andq %r10, %rdx
        subq %rdx, %rbx
        mulq %r10
        addq %rax, %rcx
        adcq %rbx, %rdx
        movq %rdx, %rbx
        shldq $0x1, %rcx, %rdx
        sarq $0x3f, %rbx
        addq %rbx, %rdx
        movl $0x13, %eax
        imulq %rdx
        movq 0x40(%rsp), %r8
        addq %rax, %r8
        movq %r8, 0x40(%rsp)
        movq 0x48(%rsp), %r8
        adcq %rdx, %r8
        movq %r8, 0x48(%rsp)
        movq 0x50(%rsp), %r8
        adcq %rbx, %r8
        movq %r8, 0x50(%rsp)
        adcq %rbx, %rcx
        shlq $0x3f, %rax
        addq %rax, %rcx
        movq 0x58(%rsp), %rax
        movq %rcx, 0x58(%rsp)
        xorq %r13, %rax
        movq %r13, %rcx
        andq %r12, %rcx
        negq %rcx
        mulq %r12
        addq %rax, %rsi
        adcq %rdx, %rcx
        movq 0x78(%rsp), %rax
        xorq %r15, %rax
        movq %r15, %rdx
        andq %r14, %rdx
        subq %rdx, %rcx
        mulq %r14
        addq %rax, %rsi
        adcq %rcx, %rdx
        movq %rdx, %rcx
        shldq $0x1, %rsi, %rdx
        sarq $0x3f, %rcx
        movl $0x13, %eax
        addq %rcx, %rdx
        imulq %rdx
        movq 0x60(%rsp), %r8
        addq %rax, %r8
        movq %r8, 0x60(%rsp)
        movq 0x68(%rsp), %r8
        adcq %rdx, %r8
        movq %r8, 0x68(%rsp)
        movq 0x70(%rsp), %r8
        adcq %rcx, %r8
        movq %r8, 0x70(%rsp)
        adcq %rcx, %rsi
        shlq $0x3f, %rax
        addq %rax, %rsi
        movq %rsi, 0x78(%rsp)
Ledwards25519_scalarmuldouble_midloop:
        movq 0x98(%rsp), %rsi
        movq (%rsp), %rdx
        movq 0x20(%rsp), %rcx
        movq %rdx, %rbx
        andq $0xfffff, %rbx
        movabsq $0xfffffe0000000000, %rax
        orq %rax, %rbx
        andq $0xfffff, %rcx
        movabsq $0xc000000000000000, %rax
        orq %rax, %rcx
        movq $0xfffffffffffffffe, %rax
        xorl %ebp, %ebp
        movl $0x2, %edx
        movq %rbx, %rdi
        movq %rax, %r8
        testq %rsi, %rsi
        cmovs %rbp, %r8
        testq $0x1, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        sarq $1, %rcx
        movl $0x100000, %eax
        leaq (%rbx,%rax), %rdx
        leaq (%rcx,%rax), %rdi
        shlq $0x16, %rdx
        shlq $0x16, %rdi
        sarq $0x2b, %rdx
        sarq $0x2b, %rdi
        movabsq $0x20000100000, %rax
        leaq (%rbx,%rax), %rbx
        leaq (%rcx,%rax), %rcx
        sarq $0x2a, %rbx
        sarq $0x2a, %rcx
        movq %rdx, 0xa0(%rsp)
        movq %rbx, 0xa8(%rsp)
        movq %rdi, 0xb0(%rsp)
        movq %rcx, 0xb8(%rsp)
        movq (%rsp), %r12
        imulq %r12, %rdi
        imulq %rdx, %r12
        movq 0x20(%rsp), %r13
        imulq %r13, %rbx
        imulq %rcx, %r13
        addq %rbx, %r12
        addq %rdi, %r13
        sarq $0x14, %r12
        sarq $0x14, %r13
        movq %r12, %rbx
        andq $0xfffff, %rbx
        movabsq $0xfffffe0000000000, %rax
        orq %rax, %rbx
        movq %r13, %rcx
        andq $0xfffff, %rcx
        movabsq $0xc000000000000000, %rax
        orq %rax, %rcx
        movq $0xfffffffffffffffe, %rax
        movl $0x2, %edx
        movq %rbx, %rdi
        movq %rax, %r8
        testq %rsi, %rsi
        cmovs %rbp, %r8
        testq $0x1, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        sarq $1, %rcx
        movl $0x100000, %eax
        leaq (%rbx,%rax), %r8
        leaq (%rcx,%rax), %r10
        shlq $0x16, %r8
        shlq $0x16, %r10
        sarq $0x2b, %r8
        sarq $0x2b, %r10
        movabsq $0x20000100000, %rax
        leaq (%rbx,%rax), %r15
        leaq (%rcx,%rax), %r11
        sarq $0x2a, %r15
        sarq $0x2a, %r11
        movq %r13, %rbx
        movq %r12, %rcx
        imulq %r8, %r12
        imulq %r15, %rbx
        addq %rbx, %r12
        imulq %r11, %r13
        imulq %r10, %rcx
        addq %rcx, %r13
        sarq $0x14, %r12
        sarq $0x14, %r13
        movq %r12, %rbx
        andq $0xfffff, %rbx
        movabsq $0xfffffe0000000000, %rax
        orq %rax, %rbx
        movq %r13, %rcx
        andq $0xfffff, %rcx
        movabsq $0xc000000000000000, %rax
        orq %rax, %rcx
        movq 0xa0(%rsp), %rax
        imulq %r8, %rax
        movq 0xb0(%rsp), %rdx
        imulq %r15, %rdx
        imulq 0xa8(%rsp), %r8
        imulq 0xb8(%rsp), %r15
        addq %r8, %r15
        leaq (%rax,%rdx), %r9
        movq 0xa0(%rsp), %rax
        imulq %r10, %rax
        movq 0xb0(%rsp), %rdx
        imulq %r11, %rdx
        imulq 0xa8(%rsp), %r10
        imulq 0xb8(%rsp), %r11
        addq %r10, %r11
        leaq (%rax,%rdx), %r13
        movq $0xfffffffffffffffe, %rax
        movl $0x2, %edx
        movq %rbx, %rdi
        movq %rax, %r8
        testq %rsi, %rsi
        cmovs %rbp, %r8
        testq $0x1, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        cmovs %rbp, %r8
        movq %rbx, %rdi
        testq %rdx, %rcx
        cmoveq %rbp, %r8
        cmoveq %rbp, %rdi
        sarq $1, %rcx
        xorq %r8, %rdi
        xorq %r8, %rsi
        btq $0x3f, %r8
        cmovbq %rcx, %rbx
        movq %rax, %r8
        subq %rax, %rsi
        leaq (%rcx,%rdi), %rcx
        sarq $1, %rcx
        movl $0x100000, %eax
        leaq (%rbx,%rax), %r8
        leaq (%rcx,%rax), %r12
        shlq $0x15, %r8
        shlq $0x15, %r12
        sarq $0x2b, %r8
        sarq $0x2b, %r12
        movabsq $0x20000100000, %rax
        leaq (%rbx,%rax), %r10
        leaq (%rcx,%rax), %r14
        sarq $0x2b, %r10
        sarq $0x2b, %r14
        movq %r9, %rax
        imulq %r8, %rax
        movq %r13, %rdx
        imulq %r10, %rdx
        imulq %r15, %r8
        imulq %r11, %r10
        addq %r8, %r10
        leaq (%rax,%rdx), %r8
        movq %r9, %rax
        imulq %r12, %rax
        movq %r13, %rdx
        imulq %r14, %rdx
        imulq %r15, %r12
        imulq %r11, %r14
        addq %r12, %r14
        leaq (%rax,%rdx), %r12
        movq %rsi, 0x98(%rsp)
        decq 0x90(%rsp)
        jne Ledwards25519_scalarmuldouble_inverseloop
        movq (%rsp), %rax
        movq 0x20(%rsp), %rcx
        imulq %r8, %rax
        imulq %r10, %rcx
        addq %rcx, %rax
        sarq $0x3f, %rax
        movq %r8, %r9
        sarq $0x3f, %r9
        xorq %r9, %r8
        subq %r9, %r8
        xorq %rax, %r9
        movq %r10, %r11
        sarq $0x3f, %r11
        xorq %r11, %r10
        subq %r11, %r10
        xorq %rax, %r11
        movq %r12, %r13
        sarq $0x3f, %r13
        xorq %r13, %r12
        subq %r13, %r12
        xorq %rax, %r13
        movq %r14, %r15
        sarq $0x3f, %r15
        xorq %r15, %r14
        subq %r15, %r14
        xorq %rax, %r15
        movq %r8, %rax
        andq %r9, %rax
        movq %r10, %r12
        andq %r11, %r12
        addq %rax, %r12
        xorl %r13d, %r13d
        movq 0x40(%rsp), %rax
        xorq %r9, %rax
        mulq %r8
        addq %rax, %r12
        adcq %rdx, %r13
        movq 0x60(%rsp), %rax
        xorq %r11, %rax
        mulq %r10
        addq %rax, %r12
        adcq %rdx, %r13
        xorl %r14d, %r14d
        movq 0x48(%rsp), %rax
        xorq %r9, %rax
        mulq %r8
        addq %rax, %r13
        adcq %rdx, %r14
        movq 0x68(%rsp), %rax
        xorq %r11, %rax
        mulq %r10
        addq %rax, %r13
        adcq %rdx, %r14
        xorl %r15d, %r15d
        movq 0x50(%rsp), %rax
        xorq %r9, %rax
        mulq %r8
        addq %rax, %r14
        adcq %rdx, %r15
        movq 0x70(%rsp), %rax
        xorq %r11, %rax
        mulq %r10
        addq %rax, %r14
        adcq %rdx, %r15
        movq 0x58(%rsp), %rax
        xorq %r9, %rax
        andq %r8, %r9
        negq %r9
        mulq %r8
        addq %rax, %r15
        adcq %rdx, %r9
        movq 0x78(%rsp), %rax
        xorq %r11, %rax
        movq %r11, %rdx
        andq %r10, %rdx
        subq %rdx, %r9
        mulq %r10
        addq %rax, %r15
        adcq %rdx, %r9
        movq %r9, %rax
        shldq $0x1, %r15, %rax
        sarq $0x3f, %r9
        movl $0x13, %ebx
        leaq 0x1(%rax,%r9,1), %rax
        imulq %rbx
        xorl %ebp, %ebp
        addq %rax, %r12
        adcq %rdx, %r13
        adcq %r9, %r14
        adcq %r9, %r15
        shlq $0x3f, %rax
        addq %rax, %r15
        cmovns %rbp, %rbx
        subq %rbx, %r12
        sbbq %rbp, %r13
        sbbq %rbp, %r14
        sbbq %rbp, %r15
        btr $0x3f, %r15
        movq 0xc0(%rsp), %rdi
        movq %r12, (%rdi)
        movq %r13, 0x8(%rdi)
        movq %r14, 0x10(%rdi)
        movq %r15, 0x18(%rdi)



        movq 45*32 +24(%rsp), %rdi
        leaq (9*32)(%rsp), %rsi
        leaq (13*32)(%rsp), %rbp
        xorl %ecx, %ecx ; movq 0(%rbp), %rdx ; mulxq 0(%rsi), %r8, %r9 ; mulxq 0x8+0(%rsi), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+0(%rsi), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+0(%rsi), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+0(%rbp), %rdx ; mulxq 0(%rsi), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+0(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+0(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+0(%rsi), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+0(%rbp), %rdx ; mulxq 0(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+0(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+0(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+0(%rsi), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+0(%rbp), %rdx ; mulxq 0(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+0(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+0(%rsi), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+0(%rsi), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; movl $0x13, %edx ; incq %r12; bts $63, %r11 ; mulxq %r12, %rax, %rbx ; addq %rax, %r8 ; adcq %rbx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; sbbq %rax, %rax ; notq %rax; andq %rdx, %rax ; subq %rax, %r8 ; sbbq %rcx, %r9 ; sbbq %rcx, %r10 ; sbbq %rcx, %r11 ; btr $63, %r11 ; movq %r8, 0(%rdi) ; movq %r9, 0x8+0(%rdi) ; movq %r10, 0x10+0(%rdi) ; movq %r11, 0x18+0(%rdi)

        movq 45*32 +24(%rsp), %rdi
        addq $32, %rdi
        leaq (9*32)+32(%rsp), %rsi
        leaq (13*32)(%rsp), %rbp
        xorl %ecx, %ecx ; movq 0(%rbp), %rdx ; mulxq 0(%rsi), %r8, %r9 ; mulxq 0x8+0(%rsi), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+0(%rsi), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+0(%rsi), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+0(%rbp), %rdx ; mulxq 0(%rsi), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+0(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+0(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+0(%rsi), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+0(%rbp), %rdx ; mulxq 0(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+0(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+0(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+0(%rsi), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+0(%rbp), %rdx ; mulxq 0(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+0(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+0(%rsi), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+0(%rsi), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; movl $0x13, %edx ; incq %r12; bts $63, %r11 ; mulxq %r12, %rax, %rbx ; addq %rax, %r8 ; adcq %rbx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; sbbq %rax, %rax ; notq %rax; andq %rdx, %rax ; subq %rax, %r8 ; sbbq %rcx, %r9 ; sbbq %rcx, %r10 ; sbbq %rcx, %r11 ; btr $63, %r11 ; movq %r8, 0(%rdi) ; movq %r9, 0x8+0(%rdi) ; movq %r10, 0x10+0(%rdi) ; movq %r11, 0x18+0(%rdi)



        addq $46*32, %rsp ; .cfi_adjust_cfa_offset -46*32

        popq %r15 ; .cfi_adjust_cfa_offset -8 ; .cfi_restore %r15
        popq %r14 ; .cfi_adjust_cfa_offset -8 ; .cfi_restore %r14
        popq %r13 ; .cfi_adjust_cfa_offset -8 ; .cfi_restore %r13
        popq %r12 ; .cfi_adjust_cfa_offset -8 ; .cfi_restore %r12
        popq %rbp ; .cfi_adjust_cfa_offset -8 ; .cfi_restore %rbp
        popq %rbx ; .cfi_adjust_cfa_offset -8 ; .cfi_restore %rbx
        retq ; .cfi_endproc




.size aws_lc_0_41_0_edwards25519_scalarmuldouble, .-aws_lc_0_41_0_edwards25519_scalarmuldouble
# 3420 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
.type Ledwards25519_scalarmuldouble_epdouble, %function

Ledwards25519_scalarmuldouble_epdouble:
        .cfi_startproc
        subq $5*32, %rsp ; .cfi_adjust_cfa_offset 5*32
        movq 0(%rsi), %r8 ; xorl %ecx, %ecx ; addq 32(%rsi), %r8 ; movq 0x8+0(%rsi), %r9 ; adcq 0x8+32(%rsi), %r9 ; movq 0x10+0(%rsi), %r10 ; adcq 0x10+32(%rsi), %r10 ; movq 0x18+0(%rsi), %r11 ; adcq 0x18+32(%rsi), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (0*32)(%rsp) ; movq %r9, 0x8+(0*32)(%rsp) ; movq %r10, 0x10+(0*32)(%rsp) ; movq %r11, 0x18+(0*32)(%rsp)
        movq (2*32)(%rsi), %rdx ; mulxq %rdx, %r8, %r15 ; mulxq 0x8+(2*32)(%rsi), %r9, %r10 ; mulxq 0x18+(2*32)(%rsi), %r11, %r12 ; movq 0x10+(2*32)(%rsi), %rdx ; mulxq 0x18+(2*32)(%rsi), %r13, %r14 ; xorl %ebx, %ebx ; mulxq (2*32)(%rsi), %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq 0x8+(2*32)(%rsi), %rax, %rcx ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; movq 0x18+(2*32)(%rsi), %rdx ; mulxq 0x8+(2*32)(%rsi), %rax, %rcx ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rbx, %r13 ; adoxq %rbx, %r14 ; adcq %rbx, %r14 ; xorl %ebx, %ebx ; adcxq %r9, %r9 ; adoxq %r15, %r9 ; movq 0x8+(2*32)(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r10, %r10 ; adoxq %rax, %r10 ; adcxq %r11, %r11 ; adoxq %rdx, %r11 ; movq 0x10+(2*32)(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r12, %r12 ; adoxq %rax, %r12 ; adcxq %r13, %r13 ; adoxq %rdx, %r13 ; movq 0x18+(2*32)(%rsi), %rdx ; mulxq %rdx, %rax, %r15 ; adcxq %r14, %r14 ; adoxq %rax, %r14 ; adcxq %rbx, %r15 ; adoxq %rbx, %r15 ; movl $0x26, %edx ; xorl %ebx, %ebx ; mulxq %r12, %rax, %rcx ; adcxq %rax, %r8 ; adoxq %rcx, %r9 ; mulxq %r13, %rax, %rcx ; adcxq %rax, %r9 ; adoxq %rcx, %r10 ; mulxq %r14, %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; adcxq %rbx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rbx, %r9 ; adcq %rbx, %r10 ; adcq %rbx, %r11 ; movq %r8, (1*32)(%rsp) ; movq %r9, 0x8+(1*32)(%rsp) ; movq %r10, 0x10+(1*32)(%rsp) ; movq %r11, 0x18+(1*32)(%rsp)
        movq 0(%rsi), %rdx ; mulxq %rdx, %r8, %r15 ; mulxq 0x8+0(%rsi), %r9, %r10 ; mulxq 0x18+0(%rsi), %r11, %r12 ; movq 0x10+0(%rsi), %rdx ; mulxq 0x18+0(%rsi), %r13, %r14 ; xorl %ebx, %ebx ; mulxq 0(%rsi), %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq 0x8+0(%rsi), %rax, %rcx ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; movq 0x18+0(%rsi), %rdx ; mulxq 0x8+0(%rsi), %rax, %rcx ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rbx, %r13 ; adoxq %rbx, %r14 ; adcq %rbx, %r14 ; xorl %ebx, %ebx ; adcxq %r9, %r9 ; adoxq %r15, %r9 ; movq 0x8+0(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r10, %r10 ; adoxq %rax, %r10 ; adcxq %r11, %r11 ; adoxq %rdx, %r11 ; movq 0x10+0(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r12, %r12 ; adoxq %rax, %r12 ; adcxq %r13, %r13 ; adoxq %rdx, %r13 ; movq 0x18+0(%rsi), %rdx ; mulxq %rdx, %rax, %r15 ; adcxq %r14, %r14 ; adoxq %rax, %r14 ; adcxq %rbx, %r15 ; adoxq %rbx, %r15 ; movl $0x26, %edx ; xorl %ebx, %ebx ; mulxq %r12, %rax, %rcx ; adcxq %rax, %r8 ; adoxq %rcx, %r9 ; mulxq %r13, %rax, %rcx ; adcxq %rax, %r9 ; adoxq %rcx, %r10 ; mulxq %r14, %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; adcxq %rbx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rbx, %r9 ; adcq %rbx, %r10 ; adcq %rbx, %r11 ; movq %r8, (2*32)(%rsp) ; movq %r9, 0x8+(2*32)(%rsp) ; movq %r10, 0x10+(2*32)(%rsp) ; movq %r11, 0x18+(2*32)(%rsp)
        movq 32(%rsi), %rdx ; mulxq %rdx, %r8, %r15 ; mulxq 0x8+32(%rsi), %r9, %r10 ; mulxq 0x18+32(%rsi), %r11, %r12 ; movq 0x10+32(%rsi), %rdx ; mulxq 0x18+32(%rsi), %r13, %r14 ; xorl %ebx, %ebx ; mulxq 32(%rsi), %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq 0x8+32(%rsi), %rax, %rcx ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; movq 0x18+32(%rsi), %rdx ; mulxq 0x8+32(%rsi), %rax, %rcx ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rbx, %r13 ; adoxq %rbx, %r14 ; adcq %rbx, %r14 ; xorl %ebx, %ebx ; adcxq %r9, %r9 ; adoxq %r15, %r9 ; movq 0x8+32(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r10, %r10 ; adoxq %rax, %r10 ; adcxq %r11, %r11 ; adoxq %rdx, %r11 ; movq 0x10+32(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r12, %r12 ; adoxq %rax, %r12 ; adcxq %r13, %r13 ; adoxq %rdx, %r13 ; movq 0x18+32(%rsi), %rdx ; mulxq %rdx, %rax, %r15 ; adcxq %r14, %r14 ; adoxq %rax, %r14 ; adcxq %rbx, %r15 ; adoxq %rbx, %r15 ; movl $0x26, %edx ; xorl %ebx, %ebx ; mulxq %r12, %rax, %rcx ; adcxq %rax, %r8 ; adoxq %rcx, %r9 ; mulxq %r13, %rax, %rcx ; adcxq %rax, %r9 ; adoxq %rcx, %r10 ; mulxq %r14, %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; adcxq %rbx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rbx, %r9 ; adcq %rbx, %r10 ; adcq %rbx, %r11 ; movq %r8, (3*32)(%rsp) ; movq %r9, 0x8+(3*32)(%rsp) ; movq %r10, 0x10+(3*32)(%rsp) ; movq %r11, 0x18+(3*32)(%rsp)
        movq (1*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq %r8, %r8 ; movq 0x8+(1*32)(%rsp), %r9 ; adcq %r9, %r9 ; movq 0x10+(1*32)(%rsp), %r10 ; adcq %r10, %r10 ; movq 0x18+(1*32)(%rsp), %r11 ; adcq %r11, %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (1*32)(%rsp) ; movq %r9, 0x8+(1*32)(%rsp) ; movq %r10, 0x10+(1*32)(%rsp) ; movq %r11, 0x18+(1*32)(%rsp)
        movq (0*32)(%rsp), %rdx ; mulxq %rdx, %r8, %r15 ; mulxq 0x8+(0*32)(%rsp), %r9, %r10 ; mulxq 0x18+(0*32)(%rsp), %r11, %r12 ; movq 0x10+(0*32)(%rsp), %rdx ; mulxq 0x18+(0*32)(%rsp), %r13, %r14 ; xorl %ebx, %ebx ; mulxq (0*32)(%rsp), %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq 0x8+(0*32)(%rsp), %rax, %rcx ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; movq 0x18+(0*32)(%rsp), %rdx ; mulxq 0x8+(0*32)(%rsp), %rax, %rcx ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rbx, %r13 ; adoxq %rbx, %r14 ; adcq %rbx, %r14 ; xorl %ebx, %ebx ; adcxq %r9, %r9 ; adoxq %r15, %r9 ; movq 0x8+(0*32)(%rsp), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r10, %r10 ; adoxq %rax, %r10 ; adcxq %r11, %r11 ; adoxq %rdx, %r11 ; movq 0x10+(0*32)(%rsp), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r12, %r12 ; adoxq %rax, %r12 ; adcxq %r13, %r13 ; adoxq %rdx, %r13 ; movq 0x18+(0*32)(%rsp), %rdx ; mulxq %rdx, %rax, %r15 ; adcxq %r14, %r14 ; adoxq %rax, %r14 ; adcxq %rbx, %r15 ; adoxq %rbx, %r15 ; movl $0x26, %edx ; xorl %ebx, %ebx ; mulxq %r12, %rax, %rcx ; adcxq %rax, %r8 ; adoxq %rcx, %r9 ; mulxq %r13, %rax, %rcx ; adcxq %rax, %r9 ; adoxq %rcx, %r10 ; mulxq %r14, %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; adcxq %rbx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rbx, %r9 ; adcq %rbx, %r10 ; adcq %rbx, %r11 ; movq %r8, (0*32)(%rsp) ; movq %r9, 0x8+(0*32)(%rsp) ; movq %r10, 0x10+(0*32)(%rsp) ; movq %r11, 0x18+(0*32)(%rsp)
        movq (2*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq (3*32)(%rsp), %r8 ; movq 0x8+(2*32)(%rsp), %r9 ; adcq 0x8+(3*32)(%rsp), %r9 ; movq 0x10+(2*32)(%rsp), %r10 ; adcq 0x10+(3*32)(%rsp), %r10 ; movq 0x18+(2*32)(%rsp), %r11 ; adcq 0x18+(3*32)(%rsp), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (4*32)(%rsp) ; movq %r9, 0x8+(4*32)(%rsp) ; movq %r10, 0x10+(4*32)(%rsp) ; movq %r11, 0x18+(4*32)(%rsp)
        movq (2*32)(%rsp), %r8 ; xorl %ebx, %ebx ; subq (3*32)(%rsp), %r8 ; movq 8+(2*32)(%rsp), %r9 ; sbbq 8+(3*32)(%rsp), %r9 ; movl $38, %ecx ; movq 16+(2*32)(%rsp), %r10 ; sbbq 16+(3*32)(%rsp), %r10 ; movq 24+(2*32)(%rsp), %rax ; sbbq 24+(3*32)(%rsp), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (2*32)(%rsp) ; movq %r9, 8+(2*32)(%rsp) ; movq %r10, 16+(2*32)(%rsp) ; movq %rax, 24+(2*32)(%rsp)
        movq (1*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq (2*32)(%rsp), %r8 ; movq 0x8+(1*32)(%rsp), %r9 ; adcq 0x8+(2*32)(%rsp), %r9 ; movq 0x10+(1*32)(%rsp), %r10 ; adcq 0x10+(2*32)(%rsp), %r10 ; movq 0x18+(1*32)(%rsp), %r11 ; adcq 0x18+(2*32)(%rsp), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (3*32)(%rsp) ; movq %r9, 0x8+(3*32)(%rsp) ; movq %r10, 0x10+(3*32)(%rsp) ; movq %r11, 0x18+(3*32)(%rsp)
        movq (4*32)(%rsp), %r8 ; xorl %ebx, %ebx ; subq (0*32)(%rsp), %r8 ; movq 8+(4*32)(%rsp), %r9 ; sbbq 8+(0*32)(%rsp), %r9 ; movl $38, %ecx ; movq 16+(4*32)(%rsp), %r10 ; sbbq 16+(0*32)(%rsp), %r10 ; movq 24+(4*32)(%rsp), %rax ; sbbq 24+(0*32)(%rsp), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (1*32)(%rsp) ; movq %r9, 8+(1*32)(%rsp) ; movq %r10, 16+(1*32)(%rsp) ; movq %rax, 24+(1*32)(%rsp)
        xorl %ecx, %ecx ; movq (4*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %r8, %r9 ; mulxq 0x8+(2*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(2*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(2*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(4*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(2*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(4*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(2*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(4*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(2*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, 32(%rdi) ; movq %r9, 0x8+32(%rdi) ; movq %r10, 0x10+32(%rdi) ; movq %r11, 0x18+32(%rdi)
        xorl %ecx, %ecx ; movq (2*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %r8, %r9 ; mulxq 0x8+(3*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(3*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(3*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(2*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(3*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(2*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(3*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(2*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(3*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (2*32)(%rdi) ; movq %r9, 0x8+(2*32)(%rdi) ; movq %r10, 0x10+(2*32)(%rdi) ; movq %r11, 0x18+(2*32)(%rdi)
        xorl %ecx, %ecx ; movq (4*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %r8, %r9 ; mulxq 0x8+(1*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(1*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(1*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(4*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(1*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(4*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(1*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(4*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(1*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (3*32)(%rdi) ; movq %r9, 0x8+(3*32)(%rdi) ; movq %r10, 0x10+(3*32)(%rdi) ; movq %r11, 0x18+(3*32)(%rdi)
        xorl %ecx, %ecx ; movq (3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %r8, %r9 ; mulxq 0x8+(1*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(1*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(1*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(1*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(1*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(1*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, 0(%rdi) ; movq %r9, 0x8+0(%rdi) ; movq %r10, 0x10+0(%rdi) ; movq %r11, 0x18+0(%rdi)
        addq $5*32, %rsp ; .cfi_adjust_cfa_offset -5*32
        retq ; .cfi_endproc

.size Ledwards25519_scalarmuldouble_epdouble, .-Ledwards25519_scalarmuldouble_epdouble

.type Ledwards25519_scalarmuldouble_pdouble, %function

Ledwards25519_scalarmuldouble_pdouble:
        .cfi_startproc
        subq $5*32, %rsp ; .cfi_adjust_cfa_offset 5*32
        movq 0(%rsi), %r8 ; xorl %ecx, %ecx ; addq 32(%rsi), %r8 ; movq 0x8+0(%rsi), %r9 ; adcq 0x8+32(%rsi), %r9 ; movq 0x10+0(%rsi), %r10 ; adcq 0x10+32(%rsi), %r10 ; movq 0x18+0(%rsi), %r11 ; adcq 0x18+32(%rsi), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (0*32)(%rsp) ; movq %r9, 0x8+(0*32)(%rsp) ; movq %r10, 0x10+(0*32)(%rsp) ; movq %r11, 0x18+(0*32)(%rsp)
        movq (2*32)(%rsi), %rdx ; mulxq %rdx, %r8, %r15 ; mulxq 0x8+(2*32)(%rsi), %r9, %r10 ; mulxq 0x18+(2*32)(%rsi), %r11, %r12 ; movq 0x10+(2*32)(%rsi), %rdx ; mulxq 0x18+(2*32)(%rsi), %r13, %r14 ; xorl %ebx, %ebx ; mulxq (2*32)(%rsi), %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq 0x8+(2*32)(%rsi), %rax, %rcx ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; movq 0x18+(2*32)(%rsi), %rdx ; mulxq 0x8+(2*32)(%rsi), %rax, %rcx ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rbx, %r13 ; adoxq %rbx, %r14 ; adcq %rbx, %r14 ; xorl %ebx, %ebx ; adcxq %r9, %r9 ; adoxq %r15, %r9 ; movq 0x8+(2*32)(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r10, %r10 ; adoxq %rax, %r10 ; adcxq %r11, %r11 ; adoxq %rdx, %r11 ; movq 0x10+(2*32)(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r12, %r12 ; adoxq %rax, %r12 ; adcxq %r13, %r13 ; adoxq %rdx, %r13 ; movq 0x18+(2*32)(%rsi), %rdx ; mulxq %rdx, %rax, %r15 ; adcxq %r14, %r14 ; adoxq %rax, %r14 ; adcxq %rbx, %r15 ; adoxq %rbx, %r15 ; movl $0x26, %edx ; xorl %ebx, %ebx ; mulxq %r12, %rax, %rcx ; adcxq %rax, %r8 ; adoxq %rcx, %r9 ; mulxq %r13, %rax, %rcx ; adcxq %rax, %r9 ; adoxq %rcx, %r10 ; mulxq %r14, %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; adcxq %rbx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rbx, %r9 ; adcq %rbx, %r10 ; adcq %rbx, %r11 ; movq %r8, (1*32)(%rsp) ; movq %r9, 0x8+(1*32)(%rsp) ; movq %r10, 0x10+(1*32)(%rsp) ; movq %r11, 0x18+(1*32)(%rsp)
        movq 0(%rsi), %rdx ; mulxq %rdx, %r8, %r15 ; mulxq 0x8+0(%rsi), %r9, %r10 ; mulxq 0x18+0(%rsi), %r11, %r12 ; movq 0x10+0(%rsi), %rdx ; mulxq 0x18+0(%rsi), %r13, %r14 ; xorl %ebx, %ebx ; mulxq 0(%rsi), %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq 0x8+0(%rsi), %rax, %rcx ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; movq 0x18+0(%rsi), %rdx ; mulxq 0x8+0(%rsi), %rax, %rcx ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rbx, %r13 ; adoxq %rbx, %r14 ; adcq %rbx, %r14 ; xorl %ebx, %ebx ; adcxq %r9, %r9 ; adoxq %r15, %r9 ; movq 0x8+0(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r10, %r10 ; adoxq %rax, %r10 ; adcxq %r11, %r11 ; adoxq %rdx, %r11 ; movq 0x10+0(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r12, %r12 ; adoxq %rax, %r12 ; adcxq %r13, %r13 ; adoxq %rdx, %r13 ; movq 0x18+0(%rsi), %rdx ; mulxq %rdx, %rax, %r15 ; adcxq %r14, %r14 ; adoxq %rax, %r14 ; adcxq %rbx, %r15 ; adoxq %rbx, %r15 ; movl $0x26, %edx ; xorl %ebx, %ebx ; mulxq %r12, %rax, %rcx ; adcxq %rax, %r8 ; adoxq %rcx, %r9 ; mulxq %r13, %rax, %rcx ; adcxq %rax, %r9 ; adoxq %rcx, %r10 ; mulxq %r14, %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; adcxq %rbx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rbx, %r9 ; adcq %rbx, %r10 ; adcq %rbx, %r11 ; movq %r8, (2*32)(%rsp) ; movq %r9, 0x8+(2*32)(%rsp) ; movq %r10, 0x10+(2*32)(%rsp) ; movq %r11, 0x18+(2*32)(%rsp)
        movq 32(%rsi), %rdx ; mulxq %rdx, %r8, %r15 ; mulxq 0x8+32(%rsi), %r9, %r10 ; mulxq 0x18+32(%rsi), %r11, %r12 ; movq 0x10+32(%rsi), %rdx ; mulxq 0x18+32(%rsi), %r13, %r14 ; xorl %ebx, %ebx ; mulxq 32(%rsi), %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq 0x8+32(%rsi), %rax, %rcx ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; movq 0x18+32(%rsi), %rdx ; mulxq 0x8+32(%rsi), %rax, %rcx ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rbx, %r13 ; adoxq %rbx, %r14 ; adcq %rbx, %r14 ; xorl %ebx, %ebx ; adcxq %r9, %r9 ; adoxq %r15, %r9 ; movq 0x8+32(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r10, %r10 ; adoxq %rax, %r10 ; adcxq %r11, %r11 ; adoxq %rdx, %r11 ; movq 0x10+32(%rsi), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r12, %r12 ; adoxq %rax, %r12 ; adcxq %r13, %r13 ; adoxq %rdx, %r13 ; movq 0x18+32(%rsi), %rdx ; mulxq %rdx, %rax, %r15 ; adcxq %r14, %r14 ; adoxq %rax, %r14 ; adcxq %rbx, %r15 ; adoxq %rbx, %r15 ; movl $0x26, %edx ; xorl %ebx, %ebx ; mulxq %r12, %rax, %rcx ; adcxq %rax, %r8 ; adoxq %rcx, %r9 ; mulxq %r13, %rax, %rcx ; adcxq %rax, %r9 ; adoxq %rcx, %r10 ; mulxq %r14, %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; adcxq %rbx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rbx, %r9 ; adcq %rbx, %r10 ; adcq %rbx, %r11 ; movq %r8, (3*32)(%rsp) ; movq %r9, 0x8+(3*32)(%rsp) ; movq %r10, 0x10+(3*32)(%rsp) ; movq %r11, 0x18+(3*32)(%rsp)
        movq (1*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq %r8, %r8 ; movq 0x8+(1*32)(%rsp), %r9 ; adcq %r9, %r9 ; movq 0x10+(1*32)(%rsp), %r10 ; adcq %r10, %r10 ; movq 0x18+(1*32)(%rsp), %r11 ; adcq %r11, %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (1*32)(%rsp) ; movq %r9, 0x8+(1*32)(%rsp) ; movq %r10, 0x10+(1*32)(%rsp) ; movq %r11, 0x18+(1*32)(%rsp)
        movq (0*32)(%rsp), %rdx ; mulxq %rdx, %r8, %r15 ; mulxq 0x8+(0*32)(%rsp), %r9, %r10 ; mulxq 0x18+(0*32)(%rsp), %r11, %r12 ; movq 0x10+(0*32)(%rsp), %rdx ; mulxq 0x18+(0*32)(%rsp), %r13, %r14 ; xorl %ebx, %ebx ; mulxq (0*32)(%rsp), %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq 0x8+(0*32)(%rsp), %rax, %rcx ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; movq 0x18+(0*32)(%rsp), %rdx ; mulxq 0x8+(0*32)(%rsp), %rax, %rcx ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rbx, %r13 ; adoxq %rbx, %r14 ; adcq %rbx, %r14 ; xorl %ebx, %ebx ; adcxq %r9, %r9 ; adoxq %r15, %r9 ; movq 0x8+(0*32)(%rsp), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r10, %r10 ; adoxq %rax, %r10 ; adcxq %r11, %r11 ; adoxq %rdx, %r11 ; movq 0x10+(0*32)(%rsp), %rdx ; mulxq %rdx, %rax, %rdx ; adcxq %r12, %r12 ; adoxq %rax, %r12 ; adcxq %r13, %r13 ; adoxq %rdx, %r13 ; movq 0x18+(0*32)(%rsp), %rdx ; mulxq %rdx, %rax, %r15 ; adcxq %r14, %r14 ; adoxq %rax, %r14 ; adcxq %rbx, %r15 ; adoxq %rbx, %r15 ; movl $0x26, %edx ; xorl %ebx, %ebx ; mulxq %r12, %rax, %rcx ; adcxq %rax, %r8 ; adoxq %rcx, %r9 ; mulxq %r13, %rax, %rcx ; adcxq %rax, %r9 ; adoxq %rcx, %r10 ; mulxq %r14, %rax, %rcx ; adcxq %rax, %r10 ; adoxq %rcx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; adcxq %rbx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rbx, %r9 ; adcq %rbx, %r10 ; adcq %rbx, %r11 ; movq %r8, (0*32)(%rsp) ; movq %r9, 0x8+(0*32)(%rsp) ; movq %r10, 0x10+(0*32)(%rsp) ; movq %r11, 0x18+(0*32)(%rsp)
        movq (2*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq (3*32)(%rsp), %r8 ; movq 0x8+(2*32)(%rsp), %r9 ; adcq 0x8+(3*32)(%rsp), %r9 ; movq 0x10+(2*32)(%rsp), %r10 ; adcq 0x10+(3*32)(%rsp), %r10 ; movq 0x18+(2*32)(%rsp), %r11 ; adcq 0x18+(3*32)(%rsp), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (4*32)(%rsp) ; movq %r9, 0x8+(4*32)(%rsp) ; movq %r10, 0x10+(4*32)(%rsp) ; movq %r11, 0x18+(4*32)(%rsp)
        movq (2*32)(%rsp), %r8 ; xorl %ebx, %ebx ; subq (3*32)(%rsp), %r8 ; movq 8+(2*32)(%rsp), %r9 ; sbbq 8+(3*32)(%rsp), %r9 ; movl $38, %ecx ; movq 16+(2*32)(%rsp), %r10 ; sbbq 16+(3*32)(%rsp), %r10 ; movq 24+(2*32)(%rsp), %rax ; sbbq 24+(3*32)(%rsp), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (2*32)(%rsp) ; movq %r9, 8+(2*32)(%rsp) ; movq %r10, 16+(2*32)(%rsp) ; movq %rax, 24+(2*32)(%rsp)
        movq (1*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq (2*32)(%rsp), %r8 ; movq 0x8+(1*32)(%rsp), %r9 ; adcq 0x8+(2*32)(%rsp), %r9 ; movq 0x10+(1*32)(%rsp), %r10 ; adcq 0x10+(2*32)(%rsp), %r10 ; movq 0x18+(1*32)(%rsp), %r11 ; adcq 0x18+(2*32)(%rsp), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (3*32)(%rsp) ; movq %r9, 0x8+(3*32)(%rsp) ; movq %r10, 0x10+(3*32)(%rsp) ; movq %r11, 0x18+(3*32)(%rsp)
        movq (4*32)(%rsp), %r8 ; xorl %ebx, %ebx ; subq (0*32)(%rsp), %r8 ; movq 8+(4*32)(%rsp), %r9 ; sbbq 8+(0*32)(%rsp), %r9 ; movl $38, %ecx ; movq 16+(4*32)(%rsp), %r10 ; sbbq 16+(0*32)(%rsp), %r10 ; movq 24+(4*32)(%rsp), %rax ; sbbq 24+(0*32)(%rsp), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (1*32)(%rsp) ; movq %r9, 8+(1*32)(%rsp) ; movq %r10, 16+(1*32)(%rsp) ; movq %rax, 24+(1*32)(%rsp)
        xorl %ecx, %ecx ; movq (4*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %r8, %r9 ; mulxq 0x8+(2*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(2*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(2*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(4*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(2*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(4*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(2*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(4*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(2*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, 32(%rdi) ; movq %r9, 0x8+32(%rdi) ; movq %r10, 0x10+32(%rdi) ; movq %r11, 0x18+32(%rdi)
        xorl %ecx, %ecx ; movq (2*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %r8, %r9 ; mulxq 0x8+(3*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(3*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(3*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(2*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(3*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(2*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(3*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(2*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(3*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (2*32)(%rdi) ; movq %r9, 0x8+(2*32)(%rdi) ; movq %r10, 0x10+(2*32)(%rdi) ; movq %r11, 0x18+(2*32)(%rdi)
        xorl %ecx, %ecx ; movq (3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %r8, %r9 ; mulxq 0x8+(1*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(1*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(1*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(1*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(1*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(1*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, 0(%rdi) ; movq %r9, 0x8+0(%rdi) ; movq %r10, 0x10+0(%rdi) ; movq %r11, 0x18+0(%rdi)
        addq $5*32, %rsp ; .cfi_adjust_cfa_offset -5*32
        retq ; .cfi_endproc

.size Ledwards25519_scalarmuldouble_pdouble, .-Ledwards25519_scalarmuldouble_pdouble

.type Ledwards25519_scalarmuldouble_epadd, %function

Ledwards25519_scalarmuldouble_epadd:
        .cfi_startproc
        subq $6*32, %rsp ; .cfi_adjust_cfa_offset 6*32
        xorl %ecx, %ecx ; movq (3*32)(%rbp), %rdx ; mulxq (3*32)(%rsi), %r8, %r9 ; mulxq 0x8+(3*32)(%rsi), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(3*32)(%rsi), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(3*32)(%rsi), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(3*32)(%rbp), %rdx ; mulxq (3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(3*32)(%rsi), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(3*32)(%rbp), %rdx ; mulxq (3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(3*32)(%rsi), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(3*32)(%rbp), %rdx ; mulxq (3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(3*32)(%rsi), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (0*32)(%rsp) ; movq %r9, 0x8+(0*32)(%rsp) ; movq %r10, 0x10+(0*32)(%rsp) ; movq %r11, 0x18+(0*32)(%rsp)
        movq 32(%rsi), %r8 ; xorl %ebx, %ebx ; subq 0(%rsi), %r8 ; movq 8+32(%rsi), %r9 ; sbbq 8+0(%rsi), %r9 ; movl $38, %ecx ; movq 16+32(%rsi), %r10 ; sbbq 16+0(%rsi), %r10 ; movq 24+32(%rsi), %rax ; sbbq 24+0(%rsi), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (1*32)(%rsp) ; movq %r9, 8+(1*32)(%rsp) ; movq %r10, 16+(1*32)(%rsp) ; movq %rax, 24+(1*32)(%rsp)
        movq 32(%rbp), %r8 ; xorl %ebx, %ebx ; subq 0(%rbp), %r8 ; movq 8+32(%rbp), %r9 ; sbbq 8+0(%rbp), %r9 ; movl $38, %ecx ; movq 16+32(%rbp), %r10 ; sbbq 16+0(%rbp), %r10 ; movq 24+32(%rbp), %rax ; sbbq 24+0(%rbp), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (2*32)(%rsp) ; movq %r9, 8+(2*32)(%rsp) ; movq %r10, 16+(2*32)(%rsp) ; movq %rax, 24+(2*32)(%rsp)
        movq 32(%rsi), %r8 ; xorl %ecx, %ecx ; addq 0(%rsi), %r8 ; movq 0x8+32(%rsi), %r9 ; adcq 0x8+0(%rsi), %r9 ; movq 0x10+32(%rsi), %r10 ; adcq 0x10+0(%rsi), %r10 ; movq 0x18+32(%rsi), %r11 ; adcq 0x18+0(%rsi), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (3*32)(%rsp) ; movq %r9, 0x8+(3*32)(%rsp) ; movq %r10, 0x10+(3*32)(%rsp) ; movq %r11, 0x18+(3*32)(%rsp)
        movq 32(%rbp), %r8 ; xorl %ecx, %ecx ; addq 0(%rbp), %r8 ; movq 0x8+32(%rbp), %r9 ; adcq 0x8+0(%rbp), %r9 ; movq 0x10+32(%rbp), %r10 ; adcq 0x10+0(%rbp), %r10 ; movq 0x18+32(%rbp), %r11 ; adcq 0x18+0(%rbp), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (4*32)(%rsp) ; movq %r9, 0x8+(4*32)(%rsp) ; movq %r10, 0x10+(4*32)(%rsp) ; movq %r11, 0x18+(4*32)(%rsp)
        movq (2*32)(%rbp), %r8 ; xorl %ecx, %ecx ; addq %r8, %r8 ; movq 0x8+(2*32)(%rbp), %r9 ; adcq %r9, %r9 ; movq 0x10+(2*32)(%rbp), %r10 ; adcq %r10, %r10 ; movq 0x18+(2*32)(%rbp), %r11 ; adcq %r11, %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (5*32)(%rsp) ; movq %r9, 0x8+(5*32)(%rsp) ; movq %r10, 0x10+(5*32)(%rsp) ; movq %r11, 0x18+(5*32)(%rsp)
        xorl %ecx, %ecx ; movq (2*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %r8, %r9 ; mulxq 0x8+(1*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(1*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(1*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(2*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(1*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(2*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(1*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(2*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(1*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (1*32)(%rsp) ; movq %r9, 0x8+(1*32)(%rsp) ; movq %r10, 0x10+(1*32)(%rsp) ; movq %r11, 0x18+(1*32)(%rsp)
        xorl %ecx, %ecx ; movq (4*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %r8, %r9 ; mulxq 0x8+(3*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(3*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(3*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(4*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(3*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(4*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(3*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(4*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(3*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (3*32)(%rsp) ; movq %r9, 0x8+(3*32)(%rsp) ; movq %r10, 0x10+(3*32)(%rsp) ; movq %r11, 0x18+(3*32)(%rsp)
        movq $0xebd69b9426b2f159, %rax ; movq %rax, (2*32)(%rsp) ; movq $0x00e0149a8283b156, %rax ; movq %rax, 8+(2*32)(%rsp) ; movq $0x198e80f2eef3d130, %rax ; movq %rax, 16+(2*32)(%rsp) ; movq $0x2406d9dc56dffce7, %rax ; movq %rax, 24+(2*32)(%rsp)
        xorl %ecx, %ecx ; movq (0*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %r8, %r9 ; mulxq 0x8+(2*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(2*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(2*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(0*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(2*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(0*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(2*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(0*32)(%rsp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(2*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (2*32)(%rsp) ; movq %r9, 0x8+(2*32)(%rsp) ; movq %r10, 0x10+(2*32)(%rsp) ; movq %r11, 0x18+(2*32)(%rsp)
        xorl %ecx, %ecx ; movq (5*32)(%rsp), %rdx ; mulxq (2*32)(%rsi), %r8, %r9 ; mulxq 0x8+(2*32)(%rsi), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(2*32)(%rsi), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(2*32)(%rsi), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(5*32)(%rsp), %rdx ; mulxq (2*32)(%rsi), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(2*32)(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(2*32)(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(2*32)(%rsi), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(5*32)(%rsp), %rdx ; mulxq (2*32)(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(2*32)(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(2*32)(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(2*32)(%rsi), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(5*32)(%rsp), %rdx ; mulxq (2*32)(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(2*32)(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(2*32)(%rsi), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(2*32)(%rsi), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (4*32)(%rsp) ; movq %r9, 0x8+(4*32)(%rsp) ; movq %r10, 0x10+(4*32)(%rsp) ; movq %r11, 0x18+(4*32)(%rsp)
        movq (3*32)(%rsp), %r8 ; xorl %ebx, %ebx ; subq (1*32)(%rsp), %r8 ; movq 8+(3*32)(%rsp), %r9 ; sbbq 8+(1*32)(%rsp), %r9 ; movl $38, %ecx ; movq 16+(3*32)(%rsp), %r10 ; sbbq 16+(1*32)(%rsp), %r10 ; movq 24+(3*32)(%rsp), %rax ; sbbq 24+(1*32)(%rsp), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (0*32)(%rsp) ; movq %r9, 8+(0*32)(%rsp) ; movq %r10, 16+(0*32)(%rsp) ; movq %rax, 24+(0*32)(%rsp)
        movq (3*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq (1*32)(%rsp), %r8 ; movq 0x8+(3*32)(%rsp), %r9 ; adcq 0x8+(1*32)(%rsp), %r9 ; movq 0x10+(3*32)(%rsp), %r10 ; adcq 0x10+(1*32)(%rsp), %r10 ; movq 0x18+(3*32)(%rsp), %r11 ; adcq 0x18+(1*32)(%rsp), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (5*32)(%rsp) ; movq %r9, 0x8+(5*32)(%rsp) ; movq %r10, 0x10+(5*32)(%rsp) ; movq %r11, 0x18+(5*32)(%rsp)
        movq (4*32)(%rsp), %r8 ; xorl %ebx, %ebx ; subq (2*32)(%rsp), %r8 ; movq 8+(4*32)(%rsp), %r9 ; sbbq 8+(2*32)(%rsp), %r9 ; movl $38, %ecx ; movq 16+(4*32)(%rsp), %r10 ; sbbq 16+(2*32)(%rsp), %r10 ; movq 24+(4*32)(%rsp), %rax ; sbbq 24+(2*32)(%rsp), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (1*32)(%rsp) ; movq %r9, 8+(1*32)(%rsp) ; movq %r10, 16+(1*32)(%rsp) ; movq %rax, 24+(1*32)(%rsp)
        movq (4*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq (2*32)(%rsp), %r8 ; movq 0x8+(4*32)(%rsp), %r9 ; adcq 0x8+(2*32)(%rsp), %r9 ; movq 0x10+(4*32)(%rsp), %r10 ; adcq 0x10+(2*32)(%rsp), %r10 ; movq 0x18+(4*32)(%rsp), %r11 ; adcq 0x18+(2*32)(%rsp), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (3*32)(%rsp) ; movq %r9, 0x8+(3*32)(%rsp) ; movq %r10, 0x10+(3*32)(%rsp) ; movq %r11, 0x18+(3*32)(%rsp)
        xorl %ecx, %ecx ; movq (5*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %r8, %r9 ; mulxq 0x8+(0*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(0*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(0*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(5*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(0*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(5*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(0*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(5*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(0*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (3*32)(%rdi) ; movq %r9, 0x8+(3*32)(%rdi) ; movq %r10, 0x10+(3*32)(%rdi) ; movq %r11, 0x18+(3*32)(%rdi)
        xorl %ecx, %ecx ; movq (1*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %r8, %r9 ; mulxq 0x8+(0*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(0*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(0*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(1*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(0*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(1*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(0*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(1*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(0*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, 0(%rdi) ; movq %r9, 0x8+0(%rdi) ; movq %r10, 0x10+0(%rdi) ; movq %r11, 0x18+0(%rdi)
        xorl %ecx, %ecx ; movq (5*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %r8, %r9 ; mulxq 0x8+(3*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(3*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(3*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(5*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(3*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(5*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(3*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(5*32)(%rsp), %rdx ; mulxq (3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(3*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(3*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, 32(%rdi) ; movq %r9, 0x8+32(%rdi) ; movq %r10, 0x10+32(%rdi) ; movq %r11, 0x18+32(%rdi)
        xorl %ecx, %ecx ; movq (3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %r8, %r9 ; mulxq 0x8+(1*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(1*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(1*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(1*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(1*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(3*32)(%rsp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(1*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (2*32)(%rdi) ; movq %r9, 0x8+(2*32)(%rdi) ; movq %r10, 0x10+(2*32)(%rdi) ; movq %r11, 0x18+(2*32)(%rdi)
        addq $6*32, %rsp ; .cfi_adjust_cfa_offset -6*32
        retq ; .cfi_endproc

.size Ledwards25519_scalarmuldouble_epadd, .-Ledwards25519_scalarmuldouble_epadd

.type Ledwards25519_scalarmuldouble_pepadd, %function

Ledwards25519_scalarmuldouble_pepadd:
        .cfi_startproc
        subq $6*32, %rsp ; .cfi_adjust_cfa_offset 6*32
        movq (2*32)(%rsi), %r8 ; xorl %ecx, %ecx ; addq %r8, %r8 ; movq 0x8+(2*32)(%rsi), %r9 ; adcq %r9, %r9 ; movq 0x10+(2*32)(%rsi), %r10 ; adcq %r10, %r10 ; movq 0x18+(2*32)(%rsi), %r11 ; adcq %r11, %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (0*32)(%rsp) ; movq %r9, 0x8+(0*32)(%rsp) ; movq %r10, 0x10+(0*32)(%rsp) ; movq %r11, 0x18+(0*32)(%rsp);
        movq 32(%rsi), %r8 ; xorl %ebx, %ebx ; subq 0(%rsi), %r8 ; movq 8+32(%rsi), %r9 ; sbbq 8+0(%rsi), %r9 ; movl $38, %ecx ; movq 16+32(%rsi), %r10 ; sbbq 16+0(%rsi), %r10 ; movq 24+32(%rsi), %rax ; sbbq 24+0(%rsi), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (1*32)(%rsp) ; movq %r9, 8+(1*32)(%rsp) ; movq %r10, 16+(1*32)(%rsp) ; movq %rax, 24+(1*32)(%rsp);
        movq 32(%rsi), %r8 ; xorl %ecx, %ecx ; addq 0(%rsi), %r8 ; movq 0x8+32(%rsi), %r9 ; adcq 0x8+0(%rsi), %r9 ; movq 0x10+32(%rsi), %r10 ; adcq 0x10+0(%rsi), %r10 ; movq 0x18+32(%rsi), %r11 ; adcq 0x18+0(%rsi), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (2*32)(%rsp) ; movq %r9, 0x8+(2*32)(%rsp) ; movq %r10, 0x10+(2*32)(%rsp) ; movq %r11, 0x18+(2*32)(%rsp);
        xorl %ecx, %ecx ; movq (2*32)(%rbp), %rdx ; mulxq (3*32)(%rsi), %r8, %r9 ; mulxq 0x8+(3*32)(%rsi), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(3*32)(%rsi), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(3*32)(%rsi), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(2*32)(%rbp), %rdx ; mulxq (3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(3*32)(%rsi), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(2*32)(%rbp), %rdx ; mulxq (3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(3*32)(%rsi), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(2*32)(%rbp), %rdx ; mulxq (3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(3*32)(%rsi), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(3*32)(%rsi), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (3*32)(%rsp) ; movq %r9, 0x8+(3*32)(%rsp) ; movq %r10, 0x10+(3*32)(%rsp) ; movq %r11, 0x18+(3*32)(%rsp);
        xorl %ecx, %ecx ; movq 0(%rbp), %rdx ; mulxq (1*32)(%rsp), %r8, %r9 ; mulxq 0x8+(1*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(1*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(1*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+0(%rbp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(1*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+0(%rbp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(1*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+0(%rbp), %rdx ; mulxq (1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(1*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(1*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (1*32)(%rsp) ; movq %r9, 0x8+(1*32)(%rsp) ; movq %r10, 0x10+(1*32)(%rsp) ; movq %r11, 0x18+(1*32)(%rsp);
        xorl %ecx, %ecx ; movq 32(%rbp), %rdx ; mulxq (2*32)(%rsp), %r8, %r9 ; mulxq 0x8+(2*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(2*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(2*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+32(%rbp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(2*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+32(%rbp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(2*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+32(%rbp), %rdx ; mulxq (2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(2*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(2*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (2*32)(%rsp) ; movq %r9, 0x8+(2*32)(%rsp) ; movq %r10, 0x10+(2*32)(%rsp) ; movq %r11, 0x18+(2*32)(%rsp);
        movq (0*32)(%rsp), %r8 ; xorl %ebx, %ebx ; subq (3*32)(%rsp), %r8 ; movq 8+(0*32)(%rsp), %r9 ; sbbq 8+(3*32)(%rsp), %r9 ; movl $38, %ecx ; movq 16+(0*32)(%rsp), %r10 ; sbbq 16+(3*32)(%rsp), %r10 ; movq 24+(0*32)(%rsp), %rax ; sbbq 24+(3*32)(%rsp), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (4*32)(%rsp) ; movq %r9, 8+(4*32)(%rsp) ; movq %r10, 16+(4*32)(%rsp) ; movq %rax, 24+(4*32)(%rsp);
        movq (0*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq (3*32)(%rsp), %r8 ; movq 0x8+(0*32)(%rsp), %r9 ; adcq 0x8+(3*32)(%rsp), %r9 ; movq 0x10+(0*32)(%rsp), %r10 ; adcq 0x10+(3*32)(%rsp), %r10 ; movq 0x18+(0*32)(%rsp), %r11 ; adcq 0x18+(3*32)(%rsp), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (0*32)(%rsp) ; movq %r9, 0x8+(0*32)(%rsp) ; movq %r10, 0x10+(0*32)(%rsp) ; movq %r11, 0x18+(0*32)(%rsp);
        movq (2*32)(%rsp), %r8 ; xorl %ebx, %ebx ; subq (1*32)(%rsp), %r8 ; movq 8+(2*32)(%rsp), %r9 ; sbbq 8+(1*32)(%rsp), %r9 ; movl $38, %ecx ; movq 16+(2*32)(%rsp), %r10 ; sbbq 16+(1*32)(%rsp), %r10 ; movq 24+(2*32)(%rsp), %rax ; sbbq 24+(1*32)(%rsp), %rax ; cmovncq %rbx, %rcx ; subq %rcx, %r8 ; sbbq %rbx, %r9 ; sbbq %rbx, %r10 ; sbbq %rbx, %rax ; movq %r8, (5*32)(%rsp) ; movq %r9, 8+(5*32)(%rsp) ; movq %r10, 16+(5*32)(%rsp) ; movq %rax, 24+(5*32)(%rsp);
        movq (2*32)(%rsp), %r8 ; xorl %ecx, %ecx ; addq (1*32)(%rsp), %r8 ; movq 0x8+(2*32)(%rsp), %r9 ; adcq 0x8+(1*32)(%rsp), %r9 ; movq 0x10+(2*32)(%rsp), %r10 ; adcq 0x10+(1*32)(%rsp), %r10 ; movq 0x18+(2*32)(%rsp), %r11 ; adcq 0x18+(1*32)(%rsp), %r11 ; movl $38, %eax ; cmovncq %rcx, %rax ; addq %rax, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (1*32)(%rsp) ; movq %r9, 0x8+(1*32)(%rsp) ; movq %r10, 0x10+(1*32)(%rsp) ; movq %r11, 0x18+(1*32)(%rsp);
        xorl %ecx, %ecx ; movq (0*32)(%rsp), %rdx ; mulxq (4*32)(%rsp), %r8, %r9 ; mulxq 0x8+(4*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(4*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(4*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(0*32)(%rsp), %rdx ; mulxq (4*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(4*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(4*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(4*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(0*32)(%rsp), %rdx ; mulxq (4*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(4*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(4*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(4*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(0*32)(%rsp), %rdx ; mulxq (4*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(4*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(4*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(4*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (2*32)(%rdi) ; movq %r9, 0x8+(2*32)(%rdi) ; movq %r10, 0x10+(2*32)(%rdi) ; movq %r11, 0x18+(2*32)(%rdi);
        xorl %ecx, %ecx ; movq (4*32)(%rsp), %rdx ; mulxq (5*32)(%rsp), %r8, %r9 ; mulxq 0x8+(5*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(5*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(5*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(4*32)(%rsp), %rdx ; mulxq (5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(5*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(4*32)(%rsp), %rdx ; mulxq (5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(5*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(4*32)(%rsp), %rdx ; mulxq (5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(5*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, 0(%rdi) ; movq %r9, 0x8+0(%rdi) ; movq %r10, 0x10+0(%rdi) ; movq %r11, 0x18+0(%rdi);
        xorl %ecx, %ecx ; movq (1*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %r8, %r9 ; mulxq 0x8+(0*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(0*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(0*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(1*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(0*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(1*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(0*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(1*32)(%rsp), %rdx ; mulxq (0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(0*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(0*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, 32(%rdi) ; movq %r9, 0x8+32(%rdi) ; movq %r10, 0x10+32(%rdi) ; movq %r11, 0x18+32(%rdi);
        xorl %ecx, %ecx ; movq (1*32)(%rsp), %rdx ; mulxq (5*32)(%rsp), %r8, %r9 ; mulxq 0x8+(5*32)(%rsp), %rax, %r10 ; addq %rax, %r9 ; mulxq 0x10+(5*32)(%rsp), %rax, %r11 ; adcq %rax, %r10 ; mulxq 0x18+(5*32)(%rsp), %rax, %r12 ; adcq %rax, %r11 ; adcq %rcx, %r12 ; xorl %ecx, %ecx ; movq 0x8+(1*32)(%rsp), %rdx ; mulxq (5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq 0x8+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x10+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x18+(5*32)(%rsp), %rax, %r13 ; adcxq %rax, %r12 ; adoxq %rcx, %r13 ; adcxq %rcx, %r13 ; xorl %ecx, %ecx ; movq 0x10+(1*32)(%rsp), %rdx ; mulxq (5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq 0x8+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x10+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x18+(5*32)(%rsp), %rax, %r14 ; adcxq %rax, %r13 ; adoxq %rcx, %r14 ; adcxq %rcx, %r14 ; xorl %ecx, %ecx ; movq 0x18+(1*32)(%rsp), %rdx ; mulxq (5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r11 ; adoxq %rbx, %r12 ; mulxq 0x8+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r12 ; adoxq %rbx, %r13 ; mulxq 0x10+(5*32)(%rsp), %rax, %rbx ; adcxq %rax, %r13 ; adoxq %rbx, %r14 ; mulxq 0x18+(5*32)(%rsp), %rax, %r15 ; adcxq %rax, %r14 ; adoxq %rcx, %r15 ; adcxq %rcx, %r15 ; movl $0x26, %edx ; xorl %ecx, %ecx ; mulxq %r12, %rax, %rbx ; adcxq %rax, %r8 ; adoxq %rbx, %r9 ; mulxq %r13, %rax, %rbx ; adcxq %rax, %r9 ; adoxq %rbx, %r10 ; mulxq %r14, %rax, %rbx ; adcxq %rax, %r10 ; adoxq %rbx, %r11 ; mulxq %r15, %rax, %r12 ; adcxq %rax, %r11 ; adoxq %rcx, %r12 ; adcxq %rcx, %r12 ; shldq $0x1, %r11, %r12 ; btr $0x3f, %r11 ; movl $0x13, %edx ; imulq %r12, %rdx ; addq %rdx, %r8 ; adcq %rcx, %r9 ; adcq %rcx, %r10 ; adcq %rcx, %r11 ; movq %r8, (3*32)(%rdi) ; movq %r9, 0x8+(3*32)(%rdi) ; movq %r10, 0x10+(3*32)(%rdi) ; movq %r11, 0x18+(3*32)(%rdi);
        addq $6*32, %rsp ; .cfi_adjust_cfa_offset -6*32
        retq ; .cfi_endproc

.size Ledwards25519_scalarmuldouble_pepadd, .-Ledwards25519_scalarmuldouble_pepadd

.size aws_lc_0_41_0_edwards25519_scalarmuldouble, .-aws_lc_0_41_0_edwards25519_scalarmuldouble
# 3533 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-sys-0.41.0/aws-lc/third_party/s2n-bignum/s2n-bignum-imported/x86_att/curve25519/edwards25519_scalarmuldouble.S"
Ledwards25519_scalarmuldouble_table:



        .quad 0x9d103905d740913e
        .quad 0xfd399f05d140beb3
        .quad 0xa5c18434688f8a09
        .quad 0x44fd2f9298f81267
        .quad 0x2fbc93c6f58c3b85
        .quad 0xcf932dc6fb8c0e19
        .quad 0x270b4898643d42c2
        .quad 0x07cf9d3a33d4ba65
        .quad 0xabc91205877aaa68
        .quad 0x26d9e823ccaac49e
        .quad 0x5a1b7dcbdd43598c
        .quad 0x6f117b689f0c65a8



        .quad 0x8a99a56042b4d5a8
        .quad 0x8f2b810c4e60acf6
        .quad 0xe09e236bb16e37aa
        .quad 0x6bb595a669c92555
        .quad 0x9224e7fc933c71d7
        .quad 0x9f469d967a0ff5b5
        .quad 0x5aa69a65e1d60702
        .quad 0x590c063fa87d2e2e
        .quad 0x43faa8b3a59b7a5f
        .quad 0x36c16bdd5d9acf78
        .quad 0x500fa0840b3d6a31
        .quad 0x701af5b13ea50b73



        .quad 0x56611fe8a4fcd265
        .quad 0x3bd353fde5c1ba7d
        .quad 0x8131f31a214bd6bd
        .quad 0x2ab91587555bda62
        .quad 0xaf25b0a84cee9730
        .quad 0x025a8430e8864b8a
        .quad 0xc11b50029f016732
        .quad 0x7a164e1b9a80f8f4
        .quad 0x14ae933f0dd0d889
        .quad 0x589423221c35da62
        .quad 0xd170e5458cf2db4c
        .quad 0x5a2826af12b9b4c6



        .quad 0x95fe050a056818bf
        .quad 0x327e89715660faa9
        .quad 0xc3e8e3cd06a05073
        .quad 0x27933f4c7445a49a
        .quad 0x287351b98efc099f
        .quad 0x6765c6f47dfd2538
        .quad 0xca348d3dfb0a9265
        .quad 0x680e910321e58727
        .quad 0x5a13fbe9c476ff09
        .quad 0x6e9e39457b5cc172
        .quad 0x5ddbdcf9102b4494
        .quad 0x7f9d0cbf63553e2b



        .quad 0x7f9182c3a447d6ba
        .quad 0xd50014d14b2729b7
        .quad 0xe33cf11cb864a087
        .quad 0x154a7e73eb1b55f3
        .quad 0xa212bc4408a5bb33
        .quad 0x8d5048c3c75eed02
        .quad 0xdd1beb0c5abfec44
        .quad 0x2945ccf146e206eb
        .quad 0xbcbbdbf1812a8285
        .quad 0x270e0807d0bdd1fc
        .quad 0xb41b670b1bbda72d
        .quad 0x43aabe696b3bb69a



        .quad 0x499806b67b7d8ca4
        .quad 0x575be28427d22739
        .quad 0xbb085ce7204553b9
        .quad 0x38b64c41ae417884
        .quad 0x3a0ceeeb77157131
        .quad 0x9b27158900c8af88
        .quad 0x8065b668da59a736
        .quad 0x51e57bb6a2cc38bd
        .quad 0x85ac326702ea4b71
        .quad 0xbe70e00341a1bb01
        .quad 0x53e4a24b083bc144
        .quad 0x10b8e91a9f0d61e3



        .quad 0xba6f2c9aaa3221b1
        .quad 0x6ca021533bba23a7
        .quad 0x9dea764f92192c3a
        .quad 0x1d6edd5d2e5317e0
        .quad 0x6b1a5cd0944ea3bf
        .quad 0x7470353ab39dc0d2
        .quad 0x71b2528228542e49
        .quad 0x461bea69283c927e
        .quad 0xf1836dc801b8b3a2
        .quad 0xb3035f47053ea49a
        .quad 0x529c41ba5877adf3
        .quad 0x7a9fbb1c6a0f90a7



        .quad 0xe2a75dedf39234d9
        .quad 0x963d7680e1b558f9
        .quad 0x2c2741ac6e3c23fb
        .quad 0x3a9024a1320e01c3
        .quad 0x59b7596604dd3e8f
        .quad 0x6cb30377e288702c
        .quad 0xb1339c665ed9c323
        .quad 0x0915e76061bce52f
        .quad 0xe7c1f5d9c9a2911a
        .quad 0xb8a371788bcca7d7
        .quad 0x636412190eb62a32
        .quad 0x26907c5c2ecc4e95


.section .note.GNU-stack, "", %progbits
