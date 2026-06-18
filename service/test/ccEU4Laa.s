	.file	"ocsp_asn.c"
	.text
.Ltext0:
	.file 0 "/mnt/HARDONE/NSI_Repos/tacvoice/service/target/debug/build/aws-lc-fips-sys-d437d42e962aa361/out/build/aws-lc/crypto" "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/ocsp_asn.c"
	.section	.rodata
.LC0:
	.string	"signatureAlgorithm"
.LC1:
	.string	"signature"
.LC2:
	.string	"certs"
	.section	.data.rel.ro.OCSP_SIGNATURE_seq_tt,"aw"
	.align 32
	.type	OCSP_SIGNATURE_seq_tt, @object
	.size	OCSP_SIGNATURE_seq_tt, 96
OCSP_SIGNATURE_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC0
	.quad	aws_lc_fips_0_13_14_X509_ALGOR_it
	.long	0
	.long	0
	.quad	8
	.quad	.LC1
	.quad	aws_lc_fips_0_13_14_ASN1_BIT_STRING_it
	.long	149
	.long	0
	.quad	16
	.quad	.LC2
	.quad	aws_lc_fips_0_13_14_X509_it
	.globl	aws_lc_fips_0_13_14_OCSP_SIGNATURE_it
	.section	.rodata
.LC3:
	.string	"OCSP_SIGNATURE"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_SIGNATURE_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_SIGNATURE_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_SIGNATURE_it, 48
aws_lc_fips_0_13_14_OCSP_SIGNATURE_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_SIGNATURE_seq_tt
	.quad	3
	.quad	0
	.quad	24
	.quad	.LC3
	.section	.rodata
.LC4:
	.string	"hashAlgorithm"
.LC5:
	.string	"issuerNameHash"
.LC6:
	.string	"issuerKeyHash"
.LC7:
	.string	"serialNumber"
	.section	.data.rel.ro.OCSP_CERTID_seq_tt,"aw"
	.align 32
	.type	OCSP_CERTID_seq_tt, @object
	.size	OCSP_CERTID_seq_tt, 128
OCSP_CERTID_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC4
	.quad	aws_lc_fips_0_13_14_X509_ALGOR_it
	.long	0
	.long	0
	.quad	8
	.quad	.LC5
	.quad	aws_lc_fips_0_13_14_ASN1_OCTET_STRING_it
	.long	0
	.long	0
	.quad	16
	.quad	.LC6
	.quad	aws_lc_fips_0_13_14_ASN1_OCTET_STRING_it
	.long	0
	.long	0
	.quad	24
	.quad	.LC7
	.quad	aws_lc_fips_0_13_14_ASN1_INTEGER_it
	.globl	aws_lc_fips_0_13_14_OCSP_CERTID_it
	.section	.rodata
.LC8:
	.string	"OCSP_CERTID"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_CERTID_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_CERTID_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_CERTID_it, 48
aws_lc_fips_0_13_14_OCSP_CERTID_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_CERTID_seq_tt
	.quad	4
	.quad	0
	.quad	32
	.quad	.LC8
	.section	.rodata
.LC9:
	.string	"reqCert"
.LC10:
	.string	"singleRequestExtensions"
	.section	.data.rel.ro.OCSP_ONEREQ_seq_tt,"aw"
	.align 32
	.type	OCSP_ONEREQ_seq_tt, @object
	.size	OCSP_ONEREQ_seq_tt, 64
OCSP_ONEREQ_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC9
	.quad	aws_lc_fips_0_13_14_OCSP_CERTID_it
	.long	149
	.long	0
	.quad	8
	.quad	.LC10
	.quad	aws_lc_fips_0_13_14_X509_EXTENSION_it
	.globl	aws_lc_fips_0_13_14_OCSP_ONEREQ_it
	.section	.rodata
.LC11:
	.string	"OCSP_ONEREQ"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_ONEREQ_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_ONEREQ_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_ONEREQ_it, 48
aws_lc_fips_0_13_14_OCSP_ONEREQ_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_ONEREQ_seq_tt
	.quad	2
	.quad	0
	.quad	16
	.quad	.LC11
	.section	.rodata
.LC12:
	.string	"version"
.LC13:
	.string	"requestorName"
.LC14:
	.string	"requestList"
.LC15:
	.string	"requestExtensions"
	.section	.data.rel.ro.OCSP_REQINFO_seq_tt,"aw"
	.align 32
	.type	OCSP_REQINFO_seq_tt, @object
	.size	OCSP_REQINFO_seq_tt, 128
OCSP_REQINFO_seq_tt:
	.long	145
	.long	0
	.quad	0
	.quad	.LC12
	.quad	aws_lc_fips_0_13_14_ASN1_INTEGER_it
	.long	145
	.long	1
	.quad	8
	.quad	.LC13
	.quad	aws_lc_fips_0_13_14_GENERAL_NAME_it
	.long	4
	.long	0
	.quad	16
	.quad	.LC14
	.quad	aws_lc_fips_0_13_14_OCSP_ONEREQ_it
	.long	149
	.long	2
	.quad	24
	.quad	.LC15
	.quad	aws_lc_fips_0_13_14_X509_EXTENSION_it
	.globl	aws_lc_fips_0_13_14_OCSP_REQINFO_it
	.section	.rodata
.LC16:
	.string	"OCSP_REQINFO"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_REQINFO_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_REQINFO_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_REQINFO_it, 48
aws_lc_fips_0_13_14_OCSP_REQINFO_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_REQINFO_seq_tt
	.quad	4
	.quad	0
	.quad	32
	.quad	.LC16
	.section	.rodata
.LC17:
	.string	"tbsRequest"
.LC18:
	.string	"optionalSignature"
	.section	.data.rel.ro.OCSP_REQUEST_seq_tt,"aw"
	.align 32
	.type	OCSP_REQUEST_seq_tt, @object
	.size	OCSP_REQUEST_seq_tt, 64
OCSP_REQUEST_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC17
	.quad	aws_lc_fips_0_13_14_OCSP_REQINFO_it
	.long	145
	.long	0
	.quad	8
	.quad	.LC18
	.quad	aws_lc_fips_0_13_14_OCSP_SIGNATURE_it
	.globl	aws_lc_fips_0_13_14_OCSP_REQUEST_it
	.section	.rodata
.LC19:
	.string	"OCSP_REQUEST"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_REQUEST_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_REQUEST_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_REQUEST_it, 48
aws_lc_fips_0_13_14_OCSP_REQUEST_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_REQUEST_seq_tt
	.quad	2
	.quad	0
	.quad	16
	.quad	.LC19
	.section	.rodata
.LC20:
	.string	"responseType"
.LC21:
	.string	"response"
	.section	.data.rel.ro.OCSP_RESPBYTES_seq_tt,"aw"
	.align 32
	.type	OCSP_RESPBYTES_seq_tt, @object
	.size	OCSP_RESPBYTES_seq_tt, 64
OCSP_RESPBYTES_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC20
	.quad	aws_lc_fips_0_13_14_ASN1_OBJECT_it
	.long	0
	.long	0
	.quad	8
	.quad	.LC21
	.quad	aws_lc_fips_0_13_14_ASN1_OCTET_STRING_it
	.globl	aws_lc_fips_0_13_14_OCSP_RESPBYTES_it
	.section	.rodata
.LC22:
	.string	"OCSP_RESPBYTES"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_RESPBYTES_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_RESPBYTES_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_RESPBYTES_it, 48
aws_lc_fips_0_13_14_OCSP_RESPBYTES_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_RESPBYTES_seq_tt
	.quad	2
	.quad	0
	.quad	16
	.quad	.LC22
	.section	.rodata
.LC23:
	.string	"responseStatus"
.LC24:
	.string	"responseBytes"
	.section	.data.rel.ro.OCSP_RESPONSE_seq_tt,"aw"
	.align 32
	.type	OCSP_RESPONSE_seq_tt, @object
	.size	OCSP_RESPONSE_seq_tt, 64
OCSP_RESPONSE_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC23
	.quad	aws_lc_fips_0_13_14_ASN1_ENUMERATED_it
	.long	145
	.long	0
	.quad	8
	.quad	.LC24
	.quad	aws_lc_fips_0_13_14_OCSP_RESPBYTES_it
	.globl	aws_lc_fips_0_13_14_OCSP_RESPONSE_it
	.section	.rodata
.LC25:
	.string	"OCSP_RESPONSE"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_RESPONSE_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_RESPONSE_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_RESPONSE_it, 48
aws_lc_fips_0_13_14_OCSP_RESPONSE_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_RESPONSE_seq_tt
	.quad	2
	.quad	0
	.quad	16
	.quad	.LC25
	.section	.rodata
.LC26:
	.string	"value.byName"
.LC27:
	.string	"value.byKey"
	.section	.data.rel.ro.OCSP_RESPID_ch_tt,"aw"
	.align 32
	.type	OCSP_RESPID_ch_tt, @object
	.size	OCSP_RESPID_ch_tt, 64
OCSP_RESPID_ch_tt:
	.long	144
	.long	1
	.quad	8
	.quad	.LC26
	.quad	aws_lc_fips_0_13_14_X509_NAME_it
	.long	144
	.long	2
	.quad	8
	.quad	.LC27
	.quad	aws_lc_fips_0_13_14_ASN1_OCTET_STRING_it
	.hidden	aws_lc_fips_0_13_14_OCSP_RESPID_it
	.globl	aws_lc_fips_0_13_14_OCSP_RESPID_it
	.section	.rodata
.LC28:
	.string	"OCSP_RESPID"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_RESPID_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_RESPID_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_RESPID_it, 48
aws_lc_fips_0_13_14_OCSP_RESPID_it:
	.byte	2
	.zero	3
	.long	0
	.quad	OCSP_RESPID_ch_tt
	.quad	2
	.quad	0
	.quad	16
	.quad	.LC28
	.section	.rodata
.LC29:
	.string	"revocationTime"
.LC30:
	.string	"revocationReason"
	.section	.data.rel.ro.OCSP_REVOKEDINFO_seq_tt,"aw"
	.align 32
	.type	OCSP_REVOKEDINFO_seq_tt, @object
	.size	OCSP_REVOKEDINFO_seq_tt, 64
OCSP_REVOKEDINFO_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC29
	.quad	aws_lc_fips_0_13_14_ASN1_GENERALIZEDTIME_it
	.long	145
	.long	0
	.quad	8
	.quad	.LC30
	.quad	aws_lc_fips_0_13_14_ASN1_ENUMERATED_it
	.globl	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it
	.section	.rodata
.LC31:
	.string	"OCSP_REVOKEDINFO"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it, 48
aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_REVOKEDINFO_seq_tt
	.quad	2
	.quad	0
	.quad	16
	.quad	.LC31
	.section	.rodata
.LC32:
	.string	"value.good"
.LC33:
	.string	"value.revoked"
.LC34:
	.string	"value.unknown"
	.section	.data.rel.ro.OCSP_CERTSTATUS_ch_tt,"aw"
	.align 32
	.type	OCSP_CERTSTATUS_ch_tt, @object
	.size	OCSP_CERTSTATUS_ch_tt, 96
OCSP_CERTSTATUS_ch_tt:
	.long	136
	.long	0
	.quad	8
	.quad	.LC32
	.quad	aws_lc_fips_0_13_14_ASN1_NULL_it
	.long	136
	.long	1
	.quad	8
	.quad	.LC33
	.quad	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it
	.long	136
	.long	2
	.quad	8
	.quad	.LC34
	.quad	aws_lc_fips_0_13_14_ASN1_NULL_it
	.hidden	aws_lc_fips_0_13_14_OCSP_CERTSTATUS_it
	.globl	aws_lc_fips_0_13_14_OCSP_CERTSTATUS_it
	.section	.rodata
.LC35:
	.string	"OCSP_CERTSTATUS"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_CERTSTATUS_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_CERTSTATUS_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_CERTSTATUS_it, 48
aws_lc_fips_0_13_14_OCSP_CERTSTATUS_it:
	.byte	2
	.zero	3
	.long	0
	.quad	OCSP_CERTSTATUS_ch_tt
	.quad	3
	.quad	0
	.quad	16
	.quad	.LC35
	.section	.rodata
.LC36:
	.string	"certId"
.LC37:
	.string	"certStatus"
.LC38:
	.string	"thisUpdate"
.LC39:
	.string	"nextUpdate"
.LC40:
	.string	"singleExtensions"
	.section	.data.rel.ro.OCSP_SINGLERESP_seq_tt,"aw"
	.align 32
	.type	OCSP_SINGLERESP_seq_tt, @object
	.size	OCSP_SINGLERESP_seq_tt, 160
OCSP_SINGLERESP_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC36
	.quad	aws_lc_fips_0_13_14_OCSP_CERTID_it
	.long	0
	.long	0
	.quad	8
	.quad	.LC37
	.quad	aws_lc_fips_0_13_14_OCSP_CERTSTATUS_it
	.long	0
	.long	0
	.quad	16
	.quad	.LC38
	.quad	aws_lc_fips_0_13_14_ASN1_GENERALIZEDTIME_it
	.long	145
	.long	0
	.quad	24
	.quad	.LC39
	.quad	aws_lc_fips_0_13_14_ASN1_GENERALIZEDTIME_it
	.long	149
	.long	1
	.quad	32
	.quad	.LC40
	.quad	aws_lc_fips_0_13_14_X509_EXTENSION_it
	.globl	aws_lc_fips_0_13_14_OCSP_SINGLERESP_it
	.section	.rodata
.LC41:
	.string	"OCSP_SINGLERESP"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_SINGLERESP_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_SINGLERESP_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_SINGLERESP_it, 48
aws_lc_fips_0_13_14_OCSP_SINGLERESP_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_SINGLERESP_seq_tt
	.quad	5
	.quad	0
	.quad	40
	.quad	.LC41
	.section	.rodata
.LC42:
	.string	"responderId"
.LC43:
	.string	"producedAt"
.LC44:
	.string	"responses"
.LC45:
	.string	"responseExtensions"
	.section	.data.rel.ro.OCSP_RESPDATA_seq_tt,"aw"
	.align 32
	.type	OCSP_RESPDATA_seq_tt, @object
	.size	OCSP_RESPDATA_seq_tt, 160
OCSP_RESPDATA_seq_tt:
	.long	145
	.long	0
	.quad	0
	.quad	.LC12
	.quad	aws_lc_fips_0_13_14_ASN1_INTEGER_it
	.long	0
	.long	0
	.quad	8
	.quad	.LC42
	.quad	aws_lc_fips_0_13_14_OCSP_RESPID_it
	.long	0
	.long	0
	.quad	16
	.quad	.LC43
	.quad	aws_lc_fips_0_13_14_ASN1_GENERALIZEDTIME_it
	.long	4
	.long	0
	.quad	24
	.quad	.LC44
	.quad	aws_lc_fips_0_13_14_OCSP_SINGLERESP_it
	.long	149
	.long	1
	.quad	32
	.quad	.LC45
	.quad	aws_lc_fips_0_13_14_X509_EXTENSION_it
	.globl	aws_lc_fips_0_13_14_OCSP_RESPDATA_it
	.section	.rodata
.LC46:
	.string	"OCSP_RESPDATA"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_RESPDATA_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_RESPDATA_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_RESPDATA_it, 48
aws_lc_fips_0_13_14_OCSP_RESPDATA_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_RESPDATA_seq_tt
	.quad	5
	.quad	0
	.quad	40
	.quad	.LC46
	.section	.rodata
.LC47:
	.string	"tbsResponseData"
	.section	.data.rel.ro.OCSP_BASICRESP_seq_tt,"aw"
	.align 32
	.type	OCSP_BASICRESP_seq_tt, @object
	.size	OCSP_BASICRESP_seq_tt, 128
OCSP_BASICRESP_seq_tt:
	.long	0
	.long	0
	.quad	0
	.quad	.LC47
	.quad	aws_lc_fips_0_13_14_OCSP_RESPDATA_it
	.long	0
	.long	0
	.quad	8
	.quad	.LC0
	.quad	aws_lc_fips_0_13_14_X509_ALGOR_it
	.long	0
	.long	0
	.quad	16
	.quad	.LC1
	.quad	aws_lc_fips_0_13_14_ASN1_BIT_STRING_it
	.long	149
	.long	0
	.quad	24
	.quad	.LC2
	.quad	aws_lc_fips_0_13_14_X509_it
	.globl	aws_lc_fips_0_13_14_OCSP_BASICRESP_it
	.section	.rodata
.LC48:
	.string	"OCSP_BASICRESP"
	.section	.data.rel.ro.local.aws_lc_fips_0_13_14_OCSP_BASICRESP_it,"aw"
	.align 32
	.type	aws_lc_fips_0_13_14_OCSP_BASICRESP_it, @object
	.size	aws_lc_fips_0_13_14_OCSP_BASICRESP_it, 48
aws_lc_fips_0_13_14_OCSP_BASICRESP_it:
	.byte	1
	.zero	3
	.long	16
	.quad	OCSP_BASICRESP_seq_tt
	.quad	4
	.quad	0
	.quad	32
	.quad	.LC48
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_SIGNATURE,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_SIGNATURE
	.type	aws_lc_fips_0_13_14_d2i_OCSP_SIGNATURE, @function
aws_lc_fips_0_13_14_d2i_OCSP_SIGNATURE:
.LFB1040:
	.file 1 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/ocsp_asn.c"
	.loc 1 95 1
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
	.loc 1 95 1
	movq	aws_lc_fips_0_13_14_OCSP_SIGNATURE_it@GOTPCREL(%rip), %rax
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
.LFE1040:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_SIGNATURE, .-aws_lc_fips_0_13_14_d2i_OCSP_SIGNATURE
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_SIGNATURE,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_SIGNATURE
	.type	aws_lc_fips_0_13_14_i2d_OCSP_SIGNATURE, @function
aws_lc_fips_0_13_14_i2d_OCSP_SIGNATURE:
.LFB1041:
	.loc 1 95 1
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
	.loc 1 95 1
	movq	aws_lc_fips_0_13_14_OCSP_SIGNATURE_it@GOTPCREL(%rip), %rax
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
.LFE1041:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_SIGNATURE, .-aws_lc_fips_0_13_14_i2d_OCSP_SIGNATURE
	.section	.text.aws_lc_fips_0_13_14_OCSP_SIGNATURE_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_SIGNATURE_new
	.type	aws_lc_fips_0_13_14_OCSP_SIGNATURE_new, @function
aws_lc_fips_0_13_14_OCSP_SIGNATURE_new:
.LFB1042:
	.loc 1 95 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 95 1
	movq	aws_lc_fips_0_13_14_OCSP_SIGNATURE_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1042:
	.size	aws_lc_fips_0_13_14_OCSP_SIGNATURE_new, .-aws_lc_fips_0_13_14_OCSP_SIGNATURE_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_SIGNATURE_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_SIGNATURE_free
	.type	aws_lc_fips_0_13_14_OCSP_SIGNATURE_free, @function
aws_lc_fips_0_13_14_OCSP_SIGNATURE_free:
.LFB1043:
	.loc 1 95 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 95 1
	movq	aws_lc_fips_0_13_14_OCSP_SIGNATURE_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1043:
	.size	aws_lc_fips_0_13_14_OCSP_SIGNATURE_free, .-aws_lc_fips_0_13_14_OCSP_SIGNATURE_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_CERTID,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_CERTID
	.type	aws_lc_fips_0_13_14_d2i_OCSP_CERTID, @function
aws_lc_fips_0_13_14_d2i_OCSP_CERTID:
.LFB1044:
	.loc 1 96 1
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
	.loc 1 96 1
	movq	aws_lc_fips_0_13_14_OCSP_CERTID_it@GOTPCREL(%rip), %rax
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
.LFE1044:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_CERTID, .-aws_lc_fips_0_13_14_d2i_OCSP_CERTID
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_CERTID,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_CERTID
	.type	aws_lc_fips_0_13_14_i2d_OCSP_CERTID, @function
aws_lc_fips_0_13_14_i2d_OCSP_CERTID:
.LFB1045:
	.loc 1 96 1
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
	.loc 1 96 1
	movq	aws_lc_fips_0_13_14_OCSP_CERTID_it@GOTPCREL(%rip), %rax
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
.LFE1045:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_CERTID, .-aws_lc_fips_0_13_14_i2d_OCSP_CERTID
	.section	.text.aws_lc_fips_0_13_14_OCSP_CERTID_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_CERTID_new
	.type	aws_lc_fips_0_13_14_OCSP_CERTID_new, @function
aws_lc_fips_0_13_14_OCSP_CERTID_new:
.LFB1046:
	.loc 1 96 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 96 1
	movq	aws_lc_fips_0_13_14_OCSP_CERTID_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1046:
	.size	aws_lc_fips_0_13_14_OCSP_CERTID_new, .-aws_lc_fips_0_13_14_OCSP_CERTID_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_CERTID_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_CERTID_free
	.type	aws_lc_fips_0_13_14_OCSP_CERTID_free, @function
aws_lc_fips_0_13_14_OCSP_CERTID_free:
.LFB1047:
	.loc 1 96 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 96 1
	movq	aws_lc_fips_0_13_14_OCSP_CERTID_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1047:
	.size	aws_lc_fips_0_13_14_OCSP_CERTID_free, .-aws_lc_fips_0_13_14_OCSP_CERTID_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_ONEREQ,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_ONEREQ
	.type	aws_lc_fips_0_13_14_d2i_OCSP_ONEREQ, @function
aws_lc_fips_0_13_14_d2i_OCSP_ONEREQ:
.LFB1048:
	.loc 1 97 1
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
	.loc 1 97 1
	movq	aws_lc_fips_0_13_14_OCSP_ONEREQ_it@GOTPCREL(%rip), %rax
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
.LFE1048:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_ONEREQ, .-aws_lc_fips_0_13_14_d2i_OCSP_ONEREQ
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_ONEREQ,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_ONEREQ
	.type	aws_lc_fips_0_13_14_i2d_OCSP_ONEREQ, @function
aws_lc_fips_0_13_14_i2d_OCSP_ONEREQ:
.LFB1049:
	.loc 1 97 1
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
	.loc 1 97 1
	movq	aws_lc_fips_0_13_14_OCSP_ONEREQ_it@GOTPCREL(%rip), %rax
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
.LFE1049:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_ONEREQ, .-aws_lc_fips_0_13_14_i2d_OCSP_ONEREQ
	.section	.text.aws_lc_fips_0_13_14_OCSP_ONEREQ_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_ONEREQ_new
	.type	aws_lc_fips_0_13_14_OCSP_ONEREQ_new, @function
aws_lc_fips_0_13_14_OCSP_ONEREQ_new:
.LFB1050:
	.loc 1 97 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 97 1
	movq	aws_lc_fips_0_13_14_OCSP_ONEREQ_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1050:
	.size	aws_lc_fips_0_13_14_OCSP_ONEREQ_new, .-aws_lc_fips_0_13_14_OCSP_ONEREQ_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_ONEREQ_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_ONEREQ_free
	.type	aws_lc_fips_0_13_14_OCSP_ONEREQ_free, @function
aws_lc_fips_0_13_14_OCSP_ONEREQ_free:
.LFB1051:
	.loc 1 97 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 97 1
	movq	aws_lc_fips_0_13_14_OCSP_ONEREQ_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1051:
	.size	aws_lc_fips_0_13_14_OCSP_ONEREQ_free, .-aws_lc_fips_0_13_14_OCSP_ONEREQ_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_REQINFO,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_REQINFO
	.type	aws_lc_fips_0_13_14_d2i_OCSP_REQINFO, @function
aws_lc_fips_0_13_14_d2i_OCSP_REQINFO:
.LFB1052:
	.loc 1 98 1
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
	.loc 1 98 1
	movq	aws_lc_fips_0_13_14_OCSP_REQINFO_it@GOTPCREL(%rip), %rax
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
.LFE1052:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_REQINFO, .-aws_lc_fips_0_13_14_d2i_OCSP_REQINFO
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_REQINFO,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_REQINFO
	.type	aws_lc_fips_0_13_14_i2d_OCSP_REQINFO, @function
aws_lc_fips_0_13_14_i2d_OCSP_REQINFO:
.LFB1053:
	.loc 1 98 1
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
	.loc 1 98 1
	movq	aws_lc_fips_0_13_14_OCSP_REQINFO_it@GOTPCREL(%rip), %rax
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
.LFE1053:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_REQINFO, .-aws_lc_fips_0_13_14_i2d_OCSP_REQINFO
	.section	.text.aws_lc_fips_0_13_14_OCSP_REQINFO_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_REQINFO_new
	.type	aws_lc_fips_0_13_14_OCSP_REQINFO_new, @function
aws_lc_fips_0_13_14_OCSP_REQINFO_new:
.LFB1054:
	.loc 1 98 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 98 1
	movq	aws_lc_fips_0_13_14_OCSP_REQINFO_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1054:
	.size	aws_lc_fips_0_13_14_OCSP_REQINFO_new, .-aws_lc_fips_0_13_14_OCSP_REQINFO_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_REQINFO_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_REQINFO_free
	.type	aws_lc_fips_0_13_14_OCSP_REQINFO_free, @function
aws_lc_fips_0_13_14_OCSP_REQINFO_free:
.LFB1055:
	.loc 1 98 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 98 1
	movq	aws_lc_fips_0_13_14_OCSP_REQINFO_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1055:
	.size	aws_lc_fips_0_13_14_OCSP_REQINFO_free, .-aws_lc_fips_0_13_14_OCSP_REQINFO_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_REQUEST,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_REQUEST
	.type	aws_lc_fips_0_13_14_d2i_OCSP_REQUEST, @function
aws_lc_fips_0_13_14_d2i_OCSP_REQUEST:
.LFB1056:
	.loc 1 99 1
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
	.loc 1 99 1
	movq	aws_lc_fips_0_13_14_OCSP_REQUEST_it@GOTPCREL(%rip), %rax
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
.LFE1056:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_REQUEST, .-aws_lc_fips_0_13_14_d2i_OCSP_REQUEST
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_REQUEST,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_REQUEST
	.type	aws_lc_fips_0_13_14_i2d_OCSP_REQUEST, @function
aws_lc_fips_0_13_14_i2d_OCSP_REQUEST:
.LFB1057:
	.loc 1 99 1
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
	.loc 1 99 1
	movq	aws_lc_fips_0_13_14_OCSP_REQUEST_it@GOTPCREL(%rip), %rax
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
.LFE1057:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_REQUEST, .-aws_lc_fips_0_13_14_i2d_OCSP_REQUEST
	.section	.text.aws_lc_fips_0_13_14_OCSP_REQUEST_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_REQUEST_new
	.type	aws_lc_fips_0_13_14_OCSP_REQUEST_new, @function
aws_lc_fips_0_13_14_OCSP_REQUEST_new:
.LFB1058:
	.loc 1 99 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 99 1
	movq	aws_lc_fips_0_13_14_OCSP_REQUEST_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1058:
	.size	aws_lc_fips_0_13_14_OCSP_REQUEST_new, .-aws_lc_fips_0_13_14_OCSP_REQUEST_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_REQUEST_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_REQUEST_free
	.type	aws_lc_fips_0_13_14_OCSP_REQUEST_free, @function
aws_lc_fips_0_13_14_OCSP_REQUEST_free:
.LFB1059:
	.loc 1 99 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 99 1
	movq	aws_lc_fips_0_13_14_OCSP_REQUEST_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1059:
	.size	aws_lc_fips_0_13_14_OCSP_REQUEST_free, .-aws_lc_fips_0_13_14_OCSP_REQUEST_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE
	.type	aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE, @function
aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE:
.LFB1060:
	.loc 1 100 1
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
	.loc 1 100 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPONSE_it@GOTPCREL(%rip), %rax
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
.LFE1060:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE, .-aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE
	.type	aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE, @function
aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE:
.LFB1061:
	.loc 1 100 1
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
	.loc 1 100 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPONSE_it@GOTPCREL(%rip), %rax
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
.LFE1061:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE, .-aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE
	.section	.text.aws_lc_fips_0_13_14_OCSP_RESPONSE_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_RESPONSE_new
	.type	aws_lc_fips_0_13_14_OCSP_RESPONSE_new, @function
aws_lc_fips_0_13_14_OCSP_RESPONSE_new:
.LFB1062:
	.loc 1 100 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 100 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPONSE_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1062:
	.size	aws_lc_fips_0_13_14_OCSP_RESPONSE_new, .-aws_lc_fips_0_13_14_OCSP_RESPONSE_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_RESPONSE_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_RESPONSE_free
	.type	aws_lc_fips_0_13_14_OCSP_RESPONSE_free, @function
aws_lc_fips_0_13_14_OCSP_RESPONSE_free:
.LFB1063:
	.loc 1 100 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 100 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPONSE_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1063:
	.size	aws_lc_fips_0_13_14_OCSP_RESPONSE_free, .-aws_lc_fips_0_13_14_OCSP_RESPONSE_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_RESPBYTES,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_RESPBYTES
	.type	aws_lc_fips_0_13_14_d2i_OCSP_RESPBYTES, @function
aws_lc_fips_0_13_14_d2i_OCSP_RESPBYTES:
.LFB1064:
	.loc 1 101 1
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
	.loc 1 101 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPBYTES_it@GOTPCREL(%rip), %rax
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
.LFE1064:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_RESPBYTES, .-aws_lc_fips_0_13_14_d2i_OCSP_RESPBYTES
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_RESPBYTES,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_RESPBYTES
	.type	aws_lc_fips_0_13_14_i2d_OCSP_RESPBYTES, @function
aws_lc_fips_0_13_14_i2d_OCSP_RESPBYTES:
.LFB1065:
	.loc 1 101 1
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
	.loc 1 101 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPBYTES_it@GOTPCREL(%rip), %rax
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
.LFE1065:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_RESPBYTES, .-aws_lc_fips_0_13_14_i2d_OCSP_RESPBYTES
	.section	.text.aws_lc_fips_0_13_14_OCSP_RESPBYTES_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_RESPBYTES_new
	.type	aws_lc_fips_0_13_14_OCSP_RESPBYTES_new, @function
aws_lc_fips_0_13_14_OCSP_RESPBYTES_new:
.LFB1066:
	.loc 1 101 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 101 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPBYTES_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1066:
	.size	aws_lc_fips_0_13_14_OCSP_RESPBYTES_new, .-aws_lc_fips_0_13_14_OCSP_RESPBYTES_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_RESPBYTES_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_RESPBYTES_free
	.type	aws_lc_fips_0_13_14_OCSP_RESPBYTES_free, @function
aws_lc_fips_0_13_14_OCSP_RESPBYTES_free:
.LFB1067:
	.loc 1 101 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 101 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPBYTES_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1067:
	.size	aws_lc_fips_0_13_14_OCSP_RESPBYTES_free, .-aws_lc_fips_0_13_14_OCSP_RESPBYTES_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_RESPDATA,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_RESPDATA
	.type	aws_lc_fips_0_13_14_d2i_OCSP_RESPDATA, @function
aws_lc_fips_0_13_14_d2i_OCSP_RESPDATA:
.LFB1068:
	.loc 1 102 1
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
	.loc 1 102 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPDATA_it@GOTPCREL(%rip), %rax
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
.LFE1068:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_RESPDATA, .-aws_lc_fips_0_13_14_d2i_OCSP_RESPDATA
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_RESPDATA,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_RESPDATA
	.type	aws_lc_fips_0_13_14_i2d_OCSP_RESPDATA, @function
aws_lc_fips_0_13_14_i2d_OCSP_RESPDATA:
.LFB1069:
	.loc 1 102 1
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
	.loc 1 102 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPDATA_it@GOTPCREL(%rip), %rax
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
.LFE1069:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_RESPDATA, .-aws_lc_fips_0_13_14_i2d_OCSP_RESPDATA
	.section	.text.aws_lc_fips_0_13_14_OCSP_RESPDATA_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_RESPDATA_new
	.type	aws_lc_fips_0_13_14_OCSP_RESPDATA_new, @function
aws_lc_fips_0_13_14_OCSP_RESPDATA_new:
.LFB1070:
	.loc 1 102 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 102 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPDATA_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1070:
	.size	aws_lc_fips_0_13_14_OCSP_RESPDATA_new, .-aws_lc_fips_0_13_14_OCSP_RESPDATA_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_RESPDATA_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_RESPDATA_free
	.type	aws_lc_fips_0_13_14_OCSP_RESPDATA_free, @function
aws_lc_fips_0_13_14_OCSP_RESPDATA_free:
.LFB1071:
	.loc 1 102 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 102 1
	movq	aws_lc_fips_0_13_14_OCSP_RESPDATA_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1071:
	.size	aws_lc_fips_0_13_14_OCSP_RESPDATA_free, .-aws_lc_fips_0_13_14_OCSP_RESPDATA_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_REVOKEDINFO,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_REVOKEDINFO
	.type	aws_lc_fips_0_13_14_d2i_OCSP_REVOKEDINFO, @function
aws_lc_fips_0_13_14_d2i_OCSP_REVOKEDINFO:
.LFB1072:
	.loc 1 103 1
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
	.loc 1 103 1
	movq	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it@GOTPCREL(%rip), %rax
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
.LFE1072:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_REVOKEDINFO, .-aws_lc_fips_0_13_14_d2i_OCSP_REVOKEDINFO
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_REVOKEDINFO,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_REVOKEDINFO
	.type	aws_lc_fips_0_13_14_i2d_OCSP_REVOKEDINFO, @function
aws_lc_fips_0_13_14_i2d_OCSP_REVOKEDINFO:
.LFB1073:
	.loc 1 103 1
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
	.loc 1 103 1
	movq	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it@GOTPCREL(%rip), %rax
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
.LFE1073:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_REVOKEDINFO, .-aws_lc_fips_0_13_14_i2d_OCSP_REVOKEDINFO
	.section	.text.aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_new
	.type	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_new, @function
aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_new:
.LFB1074:
	.loc 1 103 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 103 1
	movq	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1074:
	.size	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_new, .-aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_free
	.type	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_free, @function
aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_free:
.LFB1075:
	.loc 1 103 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 103 1
	movq	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1075:
	.size	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_free, .-aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_BASICRESP,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_BASICRESP
	.type	aws_lc_fips_0_13_14_d2i_OCSP_BASICRESP, @function
aws_lc_fips_0_13_14_d2i_OCSP_BASICRESP:
.LFB1076:
	.loc 1 104 1
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
	.loc 1 104 1
	movq	aws_lc_fips_0_13_14_OCSP_BASICRESP_it@GOTPCREL(%rip), %rax
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
.LFE1076:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_BASICRESP, .-aws_lc_fips_0_13_14_d2i_OCSP_BASICRESP
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_BASICRESP,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_BASICRESP
	.type	aws_lc_fips_0_13_14_i2d_OCSP_BASICRESP, @function
aws_lc_fips_0_13_14_i2d_OCSP_BASICRESP:
.LFB1077:
	.loc 1 104 1
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
	.loc 1 104 1
	movq	aws_lc_fips_0_13_14_OCSP_BASICRESP_it@GOTPCREL(%rip), %rax
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
.LFE1077:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_BASICRESP, .-aws_lc_fips_0_13_14_i2d_OCSP_BASICRESP
	.section	.text.aws_lc_fips_0_13_14_OCSP_BASICRESP_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_BASICRESP_new
	.type	aws_lc_fips_0_13_14_OCSP_BASICRESP_new, @function
aws_lc_fips_0_13_14_OCSP_BASICRESP_new:
.LFB1078:
	.loc 1 104 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 104 1
	movq	aws_lc_fips_0_13_14_OCSP_BASICRESP_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1078:
	.size	aws_lc_fips_0_13_14_OCSP_BASICRESP_new, .-aws_lc_fips_0_13_14_OCSP_BASICRESP_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_BASICRESP_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_BASICRESP_free
	.type	aws_lc_fips_0_13_14_OCSP_BASICRESP_free, @function
aws_lc_fips_0_13_14_OCSP_BASICRESP_free:
.LFB1079:
	.loc 1 104 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 104 1
	movq	aws_lc_fips_0_13_14_OCSP_BASICRESP_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1079:
	.size	aws_lc_fips_0_13_14_OCSP_BASICRESP_free, .-aws_lc_fips_0_13_14_OCSP_BASICRESP_free
	.section	.text.aws_lc_fips_0_13_14_OCSP_CERTID_dup,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_CERTID_dup
	.type	aws_lc_fips_0_13_14_OCSP_CERTID_dup, @function
aws_lc_fips_0_13_14_OCSP_CERTID_dup:
.LFB1080:
	.loc 1 105 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 105 1
	movq	-8(%rbp), %rax
	movq	aws_lc_fips_0_13_14_OCSP_CERTID_it@GOTPCREL(%rip), %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_dup@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1080:
	.size	aws_lc_fips_0_13_14_OCSP_CERTID_dup, .-aws_lc_fips_0_13_14_OCSP_CERTID_dup
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_SINGLERESP,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_SINGLERESP
	.type	aws_lc_fips_0_13_14_d2i_OCSP_SINGLERESP, @function
aws_lc_fips_0_13_14_d2i_OCSP_SINGLERESP:
.LFB1081:
	.loc 1 106 1
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
	.loc 1 106 1
	movq	aws_lc_fips_0_13_14_OCSP_SINGLERESP_it@GOTPCREL(%rip), %rax
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
.LFE1081:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_SINGLERESP, .-aws_lc_fips_0_13_14_d2i_OCSP_SINGLERESP
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_SINGLERESP,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_SINGLERESP
	.type	aws_lc_fips_0_13_14_i2d_OCSP_SINGLERESP, @function
aws_lc_fips_0_13_14_i2d_OCSP_SINGLERESP:
.LFB1082:
	.loc 1 106 1
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
	.loc 1 106 1
	movq	aws_lc_fips_0_13_14_OCSP_SINGLERESP_it@GOTPCREL(%rip), %rax
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
.LFE1082:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_SINGLERESP, .-aws_lc_fips_0_13_14_i2d_OCSP_SINGLERESP
	.section	.text.aws_lc_fips_0_13_14_OCSP_SINGLERESP_new,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_SINGLERESP_new
	.type	aws_lc_fips_0_13_14_OCSP_SINGLERESP_new, @function
aws_lc_fips_0_13_14_OCSP_SINGLERESP_new:
.LFB1083:
	.loc 1 106 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	.loc 1 106 1
	movq	aws_lc_fips_0_13_14_OCSP_SINGLERESP_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_new@PLT
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1083:
	.size	aws_lc_fips_0_13_14_OCSP_SINGLERESP_new, .-aws_lc_fips_0_13_14_OCSP_SINGLERESP_new
	.section	.text.aws_lc_fips_0_13_14_OCSP_SINGLERESP_free,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_OCSP_SINGLERESP_free
	.type	aws_lc_fips_0_13_14_OCSP_SINGLERESP_free, @function
aws_lc_fips_0_13_14_OCSP_SINGLERESP_free:
.LFB1084:
	.loc 1 106 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 106 1
	movq	aws_lc_fips_0_13_14_OCSP_SINGLERESP_it@GOTPCREL(%rip), %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_free@PLT
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1084:
	.size	aws_lc_fips_0_13_14_OCSP_SINGLERESP_free, .-aws_lc_fips_0_13_14_OCSP_SINGLERESP_free
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE_bio,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE_bio
	.type	aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE_bio, @function
aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE_bio:
.LFB1085:
	.loc 1 108 70
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
	.loc 1 109 10
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	aws_lc_fips_0_13_14_OCSP_RESPONSE_it@GOTPCREL(%rip), %rcx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_d2i_bio@PLT
	.loc 1 110 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1085:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE_bio, .-aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE_bio
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE_bio,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE_bio
	.type	aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE_bio, @function
aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE_bio:
.LFB1086:
	.loc 1 112 58
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
	.loc 1 113 10
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	aws_lc_fips_0_13_14_OCSP_RESPONSE_it@GOTPCREL(%rip), %rcx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_i2d_bio@PLT
	.loc 1 114 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1086:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE_bio, .-aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE_bio
	.section	.text.aws_lc_fips_0_13_14_d2i_OCSP_REQUEST_bio,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_d2i_OCSP_REQUEST_bio
	.type	aws_lc_fips_0_13_14_d2i_OCSP_REQUEST_bio, @function
aws_lc_fips_0_13_14_d2i_OCSP_REQUEST_bio:
.LFB1087:
	.loc 1 116 66
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
	.loc 1 117 10
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	aws_lc_fips_0_13_14_OCSP_REQUEST_it@GOTPCREL(%rip), %rcx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_d2i_bio@PLT
	.loc 1 118 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1087:
	.size	aws_lc_fips_0_13_14_d2i_OCSP_REQUEST_bio, .-aws_lc_fips_0_13_14_d2i_OCSP_REQUEST_bio
	.section	.text.aws_lc_fips_0_13_14_i2d_OCSP_REQUEST_bio,"ax",@progbits
	.globl	aws_lc_fips_0_13_14_i2d_OCSP_REQUEST_bio
	.type	aws_lc_fips_0_13_14_i2d_OCSP_REQUEST_bio, @function
aws_lc_fips_0_13_14_i2d_OCSP_REQUEST_bio:
.LFB1088:
	.loc 1 120 55
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
	.loc 1 121 10
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	aws_lc_fips_0_13_14_OCSP_REQUEST_it@GOTPCREL(%rip), %rcx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	aws_lc_fips_0_13_14_ASN1_item_i2d_bio@PLT
	.loc 1 122 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1088:
	.size	aws_lc_fips_0_13_14_i2d_OCSP_REQUEST_bio, .-aws_lc_fips_0_13_14_i2d_OCSP_REQUEST_bio
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/15/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h"
	.file 5 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/base.h"
	.file 6 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/asn1t.h"
	.file 7 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/../x509/../asn1/internal.h"
	.file 8 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/asn1.h"
	.file 9 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/x509.h"
	.file 10 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/../x509/internal.h"
	.file 11 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/bio.h"
	.file 12 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/buf.h"
	.file 13 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/thread.h"
	.file 14 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/ex_data.h"
	.file 15 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/include/openssl/ocsp.h"
	.file 16 "/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/internal.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1cb4
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x21
	.long	.LASF309
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.long	.LLRL0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0xb
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x9
	.long	.LASF11
	.byte	0x2
	.byte	0xe5
	.byte	0x17
	.long	0x3d
	.uleb128 0xb
	.byte	0x8
	.byte	0x7
	.long	.LASF3
	.uleb128 0x22
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xb
	.byte	0x8
	.byte	0x5
	.long	.LASF4
	.uleb128 0xb
	.byte	0x10
	.byte	0x4
	.long	.LASF5
	.uleb128 0xb
	.byte	0x1
	.byte	0x8
	.long	.LASF6
	.uleb128 0x13
	.long	0x59
	.uleb128 0xb
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0xb
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0xb
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0xb
	.byte	0x2
	.byte	0x5
	.long	.LASF10
	.uleb128 0x9
	.long	.LASF12
	.byte	0x3
	.byte	0x2a
	.byte	0x16
	.long	0x6c
	.uleb128 0x9
	.long	.LASF13
	.byte	0x3
	.byte	0x2d
	.byte	0x1b
	.long	0x3d
	.uleb128 0x23
	.byte	0x8
	.uleb128 0x1
	.long	0xa0
	.uleb128 0xb
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x13
	.long	0xa0
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0x1a
	.byte	0x14
	.long	0x81
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0x1b
	.byte	0x14
	.long	0x8d
	.uleb128 0xb
	.byte	0x8
	.byte	0x7
	.long	.LASF17
	.uleb128 0x1
	.long	0xd0
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF18
	.byte	0x5
	.value	0x106
	.byte	0x1d
	.long	0xde
	.uleb128 0x14
	.long	.LASF96
	.uleb128 0x6
	.long	.LASF19
	.byte	0x5
	.value	0x108
	.byte	0xd
	.long	0x44
	.uleb128 0x6
	.long	.LASF20
	.byte	0x5
	.value	0x109
	.byte	0x1d
	.long	0x102
	.uleb128 0x13
	.long	0xf0
	.uleb128 0x11
	.long	.LASF29
	.byte	0x30
	.byte	0x6
	.value	0x1c8
	.byte	0x8
	.long	0x173
	.uleb128 0x4
	.long	.LASF21
	.byte	0x6
	.value	0x1c9
	.byte	0x6
	.long	0xa0
	.byte	0
	.uleb128 0x4
	.long	.LASF22
	.byte	0x6
	.value	0x1ca
	.byte	0x5
	.long	0x44
	.byte	0x4
	.uleb128 0x4
	.long	.LASF23
	.byte	0x6
	.value	0x1cb
	.byte	0x16
	.long	0x987
	.byte	0x8
	.uleb128 0x4
	.long	.LASF24
	.byte	0x6
	.value	0x1cc
	.byte	0x6
	.long	0x2a
	.byte	0x10
	.uleb128 0x4
	.long	.LASF25
	.byte	0x6
	.value	0x1cd
	.byte	0xd
	.long	0xcb
	.byte	0x18
	.uleb128 0x4
	.long	.LASF26
	.byte	0x6
	.value	0x1ce
	.byte	0x6
	.long	0x2a
	.byte	0x20
	.uleb128 0x4
	.long	.LASF27
	.byte	0x6
	.value	0x1cf
	.byte	0xd
	.long	0x5b2
	.byte	0x28
	.byte	0
	.uleb128 0x6
	.long	.LASF28
	.byte	0x5
	.value	0x10a
	.byte	0x1f
	.long	0x180
	.uleb128 0xa
	.long	.LASF30
	.byte	0x28
	.byte	0x7
	.byte	0x70
	.long	0x1d9
	.uleb128 0x18
	.string	"sn"
	.byte	0x7
	.byte	0x71
	.byte	0xf
	.long	0x5b2
	.byte	0
	.uleb128 0x18
	.string	"ln"
	.byte	0x7
	.byte	0x71
	.byte	0x14
	.long	0x5b2
	.byte	0x8
	.uleb128 0x18
	.string	"nid"
	.byte	0x7
	.byte	0x72
	.byte	0x7
	.long	0x44
	.byte	0x10
	.uleb128 0x3
	.long	.LASF31
	.byte	0x7
	.byte	0x73
	.byte	0x7
	.long	0x44
	.byte	0x14
	.uleb128 0x3
	.long	.LASF32
	.byte	0x7
	.byte	0x74
	.byte	0x18
	.long	0x726
	.byte	0x18
	.uleb128 0x3
	.long	.LASF33
	.byte	0x7
	.byte	0x75
	.byte	0x7
	.long	0x44
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.long	.LASF34
	.byte	0x5
	.value	0x10c
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x11
	.long	.LASF35
	.byte	0x18
	.byte	0x8
	.value	0x252
	.byte	0x8
	.long	0x22d
	.uleb128 0x4
	.long	.LASF31
	.byte	0x8
	.value	0x253
	.byte	0x7
	.long	0x44
	.byte	0
	.uleb128 0x4
	.long	.LASF36
	.byte	0x8
	.value	0x254
	.byte	0x7
	.long	0x44
	.byte	0x4
	.uleb128 0x4
	.long	.LASF32
	.byte	0x8
	.value	0x255
	.byte	0x12
	.long	0x730
	.byte	0x8
	.uleb128 0x4
	.long	.LASF33
	.byte	0x8
	.value	0x256
	.byte	0x8
	.long	0x2a
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.long	.LASF37
	.byte	0x5
	.value	0x10d
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF38
	.byte	0x5
	.value	0x10e
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF39
	.byte	0x5
	.value	0x10f
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF40
	.byte	0x5
	.value	0x110
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF41
	.byte	0x5
	.value	0x111
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF42
	.byte	0x5
	.value	0x112
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF43
	.byte	0x5
	.value	0x113
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF44
	.byte	0x5
	.value	0x114
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF45
	.byte	0x5
	.value	0x115
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF46
	.byte	0x5
	.value	0x116
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF47
	.byte	0x5
	.value	0x118
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF48
	.byte	0x5
	.value	0x119
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF49
	.byte	0x5
	.value	0x11a
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF50
	.byte	0x5
	.value	0x11b
	.byte	0x1f
	.long	0x1e6
	.uleb128 0x6
	.long	.LASF51
	.byte	0x5
	.value	0x11c
	.byte	0x1d
	.long	0x2f0
	.uleb128 0x11
	.long	.LASF52
	.byte	0x10
	.byte	0x8
	.value	0x642
	.byte	0x8
	.long	0x31b
	.uleb128 0x4
	.long	.LASF36
	.byte	0x8
	.value	0x643
	.byte	0x7
	.long	0x44
	.byte	0
	.uleb128 0x4
	.long	.LASF53
	.byte	0x8
	.value	0x65b
	.byte	0x5
	.long	0x7b2
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF54
	.byte	0x5
	.value	0x121
	.byte	0x20
	.long	0x328
	.uleb128 0x11
	.long	.LASF55
	.byte	0x10
	.byte	0x9
	.value	0x76d
	.byte	0x8
	.long	0x351
	.uleb128 0x4
	.long	.LASF36
	.byte	0x9
	.value	0x76e
	.byte	0x7
	.long	0x44
	.byte	0
	.uleb128 0x1a
	.string	"d"
	.byte	0x9
	.value	0x780
	.byte	0x5
	.long	0xa42
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF56
	.byte	0x5
	.value	0x128
	.byte	0x1e
	.long	0x35e
	.uleb128 0x11
	.long	.LASF57
	.byte	0x10
	.byte	0x9
	.value	0x1147
	.byte	0x8
	.long	0x389
	.uleb128 0x4
	.long	.LASF58
	.byte	0x9
	.value	0x1148
	.byte	0x10
	.long	0x7a1
	.byte	0
	.uleb128 0x4
	.long	.LASF59
	.byte	0x9
	.value	0x1149
	.byte	0xe
	.long	0x917
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF60
	.byte	0x5
	.value	0x12d
	.byte	0x1d
	.long	0x396
	.uleb128 0xa
	.long	.LASF61
	.byte	0x28
	.byte	0xa
	.byte	0x5f
	.long	0x3e4
	.uleb128 0x3
	.long	.LASF62
	.byte	0xa
	.byte	0x60
	.byte	0x1e
	.long	0xb20
	.byte	0
	.uleb128 0x3
	.long	.LASF63
	.byte	0xa
	.byte	0x61
	.byte	0x7
	.long	0x44
	.byte	0x8
	.uleb128 0x3
	.long	.LASF64
	.byte	0xa
	.byte	0x62
	.byte	0xc
	.long	0xf88
	.byte	0x10
	.uleb128 0x3
	.long	.LASF65
	.byte	0xa
	.byte	0x63
	.byte	0x12
	.long	0x730
	.byte	0x18
	.uleb128 0x3
	.long	.LASF66
	.byte	0xa
	.byte	0x64
	.byte	0x7
	.long	0x44
	.byte	0x20
	.byte	0
	.uleb128 0x6
	.long	.LASF67
	.byte	0x5
	.value	0x134
	.byte	0x1e
	.long	0x3f6
	.uleb128 0x13
	.long	0x3e4
	.uleb128 0x11
	.long	.LASF68
	.byte	0x50
	.byte	0xb
	.value	0x3ca
	.byte	0x8
	.long	0x491
	.uleb128 0x4
	.long	.LASF36
	.byte	0xb
	.value	0x3cb
	.byte	0x7
	.long	0x44
	.byte	0
	.uleb128 0x4
	.long	.LASF69
	.byte	0xb
	.value	0x3cc
	.byte	0xf
	.long	0x5b2
	.byte	0x8
	.uleb128 0x4
	.long	.LASF70
	.byte	0xb
	.value	0x3cd
	.byte	0x9
	.long	0x68b
	.byte	0x10
	.uleb128 0x4
	.long	.LASF71
	.byte	0xb
	.value	0x3ce
	.byte	0x9
	.long	0x6a9
	.byte	0x18
	.uleb128 0x4
	.long	.LASF72
	.byte	0xb
	.value	0x3cf
	.byte	0x9
	.long	0x6c2
	.byte	0x20
	.uleb128 0x4
	.long	.LASF73
	.byte	0xb
	.value	0x3d0
	.byte	0x9
	.long	0x6a9
	.byte	0x28
	.uleb128 0x4
	.long	.LASF74
	.byte	0xb
	.value	0x3d1
	.byte	0xa
	.long	0x6e5
	.byte	0x30
	.uleb128 0x4
	.long	.LASF75
	.byte	0xb
	.value	0x3d2
	.byte	0x9
	.long	0x6f9
	.byte	0x38
	.uleb128 0x4
	.long	.LASF76
	.byte	0xb
	.value	0x3d3
	.byte	0x9
	.long	0x6f9
	.byte	0x40
	.uleb128 0x4
	.long	.LASF77
	.byte	0xb
	.value	0x3d4
	.byte	0xa
	.long	0x717
	.byte	0x48
	.byte	0
	.uleb128 0x25
	.string	"BIO"
	.byte	0x5
	.value	0x135
	.byte	0x17
	.long	0x49e
	.uleb128 0x11
	.long	.LASF78
	.byte	0x58
	.byte	0xb
	.value	0x3d7
	.byte	0x8
	.long	0x571
	.uleb128 0x4
	.long	.LASF79
	.byte	0xb
	.value	0x3d8
	.byte	0x15
	.long	0x71c
	.byte	0
	.uleb128 0x4
	.long	.LASF80
	.byte	0xb
	.value	0x3d9
	.byte	0x12
	.long	0x5ca
	.byte	0x8
	.uleb128 0x4
	.long	.LASF81
	.byte	0xb
	.value	0x3e3
	.byte	0x16
	.long	0x629
	.byte	0x10
	.uleb128 0x4
	.long	.LASF82
	.byte	0xb
	.value	0x3e5
	.byte	0x9
	.long	0x9b
	.byte	0x18
	.uleb128 0x4
	.long	.LASF83
	.byte	0xb
	.value	0x3e8
	.byte	0x7
	.long	0x44
	.byte	0x20
	.uleb128 0x4
	.long	.LASF84
	.byte	0xb
	.value	0x3ed
	.byte	0x7
	.long	0x44
	.byte	0x24
	.uleb128 0x4
	.long	.LASF33
	.byte	0xb
	.value	0x3ee
	.byte	0x7
	.long	0x44
	.byte	0x28
	.uleb128 0x4
	.long	.LASF85
	.byte	0xb
	.value	0x3ef
	.byte	0x7
	.long	0x44
	.byte	0x2c
	.uleb128 0x1a
	.string	"num"
	.byte	0xb
	.value	0x3f2
	.byte	0x7
	.long	0x44
	.byte	0x30
	.uleb128 0x4
	.long	.LASF86
	.byte	0xb
	.value	0x3f3
	.byte	0x15
	.long	0x5be
	.byte	0x34
	.uleb128 0x1a
	.string	"ptr"
	.byte	0xb
	.value	0x3f4
	.byte	0x9
	.long	0x99
	.byte	0x38
	.uleb128 0x4
	.long	.LASF87
	.byte	0xb
	.value	0x3f7
	.byte	0x8
	.long	0x5f9
	.byte	0x40
	.uleb128 0x4
	.long	.LASF88
	.byte	0xb
	.value	0x3f8
	.byte	0xc
	.long	0xb8
	.byte	0x48
	.uleb128 0x4
	.long	.LASF89
	.byte	0xb
	.value	0x3f8
	.byte	0x16
	.long	0xb8
	.byte	0x50
	.byte	0
	.uleb128 0x6
	.long	.LASF90
	.byte	0x5
	.value	0x139
	.byte	0x1b
	.long	0x57e
	.uleb128 0xa
	.long	.LASF91
	.byte	0x18
	.byte	0xc
	.byte	0x47
	.long	0x5b2
	.uleb128 0x3
	.long	.LASF31
	.byte	0xc
	.byte	0x48
	.byte	0xa
	.long	0x31
	.byte	0
	.uleb128 0x3
	.long	.LASF32
	.byte	0xc
	.byte	0x49
	.byte	0x9
	.long	0x9b
	.byte	0x8
	.uleb128 0x18
	.string	"max"
	.byte	0xc
	.byte	0x4a
	.byte	0xa
	.long	0x31
	.byte	0x10
	.byte	0
	.uleb128 0x1
	.long	0xa7
	.uleb128 0xb
	.byte	0x8
	.byte	0x4
	.long	.LASF92
	.uleb128 0x9
	.long	.LASF93
	.byte	0xd
	.byte	0x67
	.byte	0x12
	.long	0xac
	.uleb128 0x9
	.long	.LASF94
	.byte	0xe
	.byte	0x80
	.byte	0x22
	.long	0x5d6
	.uleb128 0xa
	.long	.LASF95
	.byte	0x8
	.byte	0xe
	.byte	0xc3
	.long	0x5ef
	.uleb128 0x18
	.string	"sk"
	.byte	0xe
	.byte	0xc4
	.byte	0x13
	.long	0x5f4
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF97
	.uleb128 0x1
	.long	0x5ef
	.uleb128 0x1
	.long	0x491
	.uleb128 0x6
	.long	.LASF98
	.byte	0xb
	.value	0x11b
	.byte	0x10
	.long	0x60b
	.uleb128 0x1
	.long	0x610
	.uleb128 0x15
	.long	0x2a
	.long	0x629
	.uleb128 0x5
	.long	0x5f9
	.uleb128 0x5
	.long	0x44
	.uleb128 0x5
	.long	0x44
	.byte	0
	.uleb128 0x6
	.long	.LASF99
	.byte	0xb
	.value	0x126
	.byte	0x10
	.long	0x636
	.uleb128 0x1
	.long	0x63b
	.uleb128 0x15
	.long	0x2a
	.long	0x66d
	.uleb128 0x5
	.long	0x5f9
	.uleb128 0x5
	.long	0x44
	.uleb128 0x5
	.long	0x5b2
	.uleb128 0x5
	.long	0x31
	.uleb128 0x5
	.long	0x44
	.uleb128 0x5
	.long	0x2a
	.uleb128 0x5
	.long	0x44
	.uleb128 0x5
	.long	0x66d
	.byte	0
	.uleb128 0x1
	.long	0x31
	.uleb128 0x15
	.long	0x44
	.long	0x68b
	.uleb128 0x5
	.long	0x5f9
	.uleb128 0x5
	.long	0x5b2
	.uleb128 0x5
	.long	0x44
	.byte	0
	.uleb128 0x1
	.long	0x672
	.uleb128 0x15
	.long	0x44
	.long	0x6a9
	.uleb128 0x5
	.long	0x5f9
	.uleb128 0x5
	.long	0x9b
	.uleb128 0x5
	.long	0x44
	.byte	0
	.uleb128 0x1
	.long	0x690
	.uleb128 0x15
	.long	0x44
	.long	0x6c2
	.uleb128 0x5
	.long	0x5f9
	.uleb128 0x5
	.long	0x5b2
	.byte	0
	.uleb128 0x1
	.long	0x6ae
	.uleb128 0x15
	.long	0x2a
	.long	0x6e5
	.uleb128 0x5
	.long	0x5f9
	.uleb128 0x5
	.long	0x44
	.uleb128 0x5
	.long	0x2a
	.uleb128 0x5
	.long	0x99
	.byte	0
	.uleb128 0x1
	.long	0x6c7
	.uleb128 0x15
	.long	0x44
	.long	0x6f9
	.uleb128 0x5
	.long	0x5f9
	.byte	0
	.uleb128 0x1
	.long	0x6ea
	.uleb128 0x15
	.long	0x2a
	.long	0x717
	.uleb128 0x5
	.long	0x5f9
	.uleb128 0x5
	.long	0x44
	.uleb128 0x5
	.long	0x5fe
	.byte	0
	.uleb128 0x1
	.long	0x6fe
	.uleb128 0x1
	.long	0x3f1
	.uleb128 0x1
	.long	0x726
	.uleb128 0x1
	.long	0x60
	.uleb128 0x1
	.long	0x730
	.uleb128 0x1
	.long	0x59
	.uleb128 0x6
	.long	.LASF100
	.byte	0x8
	.value	0x13f
	.byte	0x19
	.long	0xfd
	.uleb128 0x6
	.long	.LASF101
	.byte	0x8
	.value	0x14a
	.byte	0x1e
	.long	0x74f
	.uleb128 0x14
	.long	.LASF102
	.uleb128 0x12
	.long	.LASF103
	.byte	0x8
	.value	0x2ee
	.long	0xfd
	.uleb128 0x12
	.long	.LASF104
	.byte	0x8
	.value	0x404
	.long	0xfd
	.uleb128 0x1
	.long	0x26e
	.uleb128 0x12
	.long	.LASF105
	.byte	0x8
	.value	0x46f
	.long	0xfd
	.uleb128 0x12
	.long	.LASF106
	.byte	0x8
	.value	0x4ad
	.long	0xfd
	.uleb128 0x12
	.long	.LASF107
	.byte	0x8
	.value	0x533
	.long	0xfd
	.uleb128 0x12
	.long	.LASF108
	.byte	0x8
	.value	0x5e2
	.long	0xfd
	.uleb128 0x1
	.long	0x173
	.uleb128 0x12
	.long	.LASF109
	.byte	0x8
	.value	0x615
	.long	0xfd
	.uleb128 0x1e
	.byte	0x8
	.value	0x644
	.long	0x8cc
	.uleb128 0x16
	.string	"ptr"
	.byte	0x8
	.value	0x645
	.byte	0xb
	.long	0x9b
	.uleb128 0x7
	.long	.LASF110
	.byte	0x8
	.value	0x646
	.byte	0x12
	.long	0xe3
	.uleb128 0x7
	.long	.LASF111
	.byte	0x8
	.value	0x647
	.byte	0x12
	.long	0x8cc
	.uleb128 0x7
	.long	.LASF112
	.byte	0x8
	.value	0x648
	.byte	0x12
	.long	0x7a1
	.uleb128 0x7
	.long	.LASF113
	.byte	0x8
	.value	0x649
	.byte	0x13
	.long	0x76c
	.uleb128 0x7
	.long	.LASF114
	.byte	0x8
	.value	0x64a
	.byte	0x16
	.long	0x8d1
	.uleb128 0x7
	.long	.LASF115
	.byte	0x8
	.value	0x64b
	.byte	0x16
	.long	0x8d6
	.uleb128 0x7
	.long	.LASF116
	.byte	0x8
	.value	0x64c
	.byte	0x18
	.long	0x8db
	.uleb128 0x7
	.long	.LASF117
	.byte	0x8
	.value	0x64d
	.byte	0x1b
	.long	0x8e0
	.uleb128 0x7
	.long	.LASF118
	.byte	0x8
	.value	0x64e
	.byte	0x15
	.long	0x8e5
	.uleb128 0x7
	.long	.LASF119
	.byte	0x8
	.value	0x64f
	.byte	0x15
	.long	0x8ea
	.uleb128 0x7
	.long	.LASF120
	.byte	0x8
	.value	0x650
	.byte	0x19
	.long	0x8ef
	.uleb128 0x7
	.long	.LASF121
	.byte	0x8
	.value	0x651
	.byte	0x15
	.long	0x8f4
	.uleb128 0x7
	.long	.LASF122
	.byte	0x8
	.value	0x652
	.byte	0x1b
	.long	0x8f9
	.uleb128 0x7
	.long	.LASF123
	.byte	0x8
	.value	0x653
	.byte	0x13
	.long	0x8fe
	.uleb128 0x7
	.long	.LASF124
	.byte	0x8
	.value	0x654
	.byte	0x1b
	.long	0x903
	.uleb128 0x7
	.long	.LASF125
	.byte	0x8
	.value	0x655
	.byte	0x19
	.long	0x908
	.uleb128 0x7
	.long	.LASF126
	.byte	0x8
	.value	0x656
	.byte	0x16
	.long	0x90d
	.uleb128 0x16
	.string	"set"
	.byte	0x8
	.value	0x658
	.byte	0x12
	.long	0x8cc
	.uleb128 0x7
	.long	.LASF127
	.byte	0x8
	.value	0x659
	.byte	0x12
	.long	0x8cc
	.uleb128 0x7
	.long	.LASF128
	.byte	0x8
	.value	0x65a
	.byte	0x11
	.long	0x912
	.byte	0
	.uleb128 0x1
	.long	0x295
	.uleb128 0x1
	.long	0x23a
	.uleb128 0x1
	.long	0x1d9
	.uleb128 0x1
	.long	0x27b
	.uleb128 0x1
	.long	0x288
	.uleb128 0x1
	.long	0x2a2
	.uleb128 0x1
	.long	0x261
	.uleb128 0x1
	.long	0x254
	.uleb128 0x1
	.long	0x22d
	.uleb128 0x1
	.long	0x2af
	.uleb128 0x1
	.long	0x2bc
	.uleb128 0x1
	.long	0x247
	.uleb128 0x1
	.long	0x2d6
	.uleb128 0x1
	.long	0x2c9
	.uleb128 0x1
	.long	0x742
	.uleb128 0x1
	.long	0x2e3
	.uleb128 0x9
	.long	.LASF129
	.byte	0x6
	.byte	0x4b
	.byte	0x21
	.long	0x92d
	.uleb128 0x13
	.long	0x91c
	.uleb128 0x11
	.long	.LASF130
	.byte	0x20
	.byte	0x6
	.value	0x15e
	.byte	0x8
	.long	0x982
	.uleb128 0x4
	.long	.LASF33
	.byte	0x6
	.value	0x15f
	.byte	0xa
	.long	0xac
	.byte	0
	.uleb128 0x1a
	.string	"tag"
	.byte	0x6
	.value	0x160
	.byte	0x5
	.long	0x44
	.byte	0x4
	.uleb128 0x4
	.long	.LASF131
	.byte	0x6
	.value	0x161
	.byte	0xf
	.long	0x3d
	.byte	0x8
	.uleb128 0x4
	.long	.LASF132
	.byte	0x6
	.value	0x162
	.byte	0xd
	.long	0x5b2
	.byte	0x10
	.uleb128 0x4
	.long	.LASF133
	.byte	0x6
	.value	0x163
	.byte	0x10
	.long	0x982
	.byte	0x18
	.byte	0
	.uleb128 0x1
	.long	0x735
	.uleb128 0x1
	.long	0x928
	.uleb128 0x1
	.long	0x912
	.uleb128 0x1
	.long	0xfd
	.uleb128 0x14
	.long	.LASF134
	.uleb128 0x1
	.long	0x996
	.uleb128 0xc
	.long	.LASF135
	.byte	0x9
	.byte	0x80
	.long	0xfd
	.uleb128 0x1
	.long	0x31b
	.uleb128 0x1
	.long	0x389
	.uleb128 0x12
	.long	.LASF136
	.byte	0x9
	.value	0x571
	.long	0xfd
	.uleb128 0x12
	.long	.LASF137
	.byte	0x9
	.value	0x6b4
	.long	0xfd
	.uleb128 0x14
	.long	.LASF138
	.uleb128 0x11
	.long	.LASF139
	.byte	0x10
	.byte	0x9
	.value	0x753
	.byte	0x10
	.long	0x9fd
	.uleb128 0x4
	.long	.LASF140
	.byte	0x9
	.value	0x754
	.byte	0x10
	.long	0x7a1
	.byte	0
	.uleb128 0x4
	.long	.LASF53
	.byte	0x9
	.value	0x755
	.byte	0xe
	.long	0x917
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF141
	.byte	0x9
	.value	0x756
	.byte	0x3
	.long	0x9d2
	.uleb128 0x11
	.long	.LASF142
	.byte	0x10
	.byte	0x9
	.value	0x758
	.byte	0x10
	.long	0xa35
	.uleb128 0x4
	.long	.LASF143
	.byte	0x9
	.value	0x759
	.byte	0x10
	.long	0x8cc
	.byte	0
	.uleb128 0x4
	.long	.LASF144
	.byte	0x9
	.value	0x75a
	.byte	0x10
	.long	0x8cc
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.long	.LASF145
	.byte	0x9
	.value	0x75b
	.byte	0x3
	.long	0xa0a
	.uleb128 0x1e
	.byte	0x9
	.value	0x76f
	.long	0xb00
	.uleb128 0x16
	.string	"ptr"
	.byte	0x9
	.value	0x770
	.byte	0xb
	.long	0x9b
	.uleb128 0x7
	.long	.LASF146
	.byte	0x9
	.value	0x771
	.byte	0x10
	.long	0xb00
	.uleb128 0x7
	.long	.LASF147
	.byte	0x9
	.value	0x772
	.byte	0x15
	.long	0x8ea
	.uleb128 0x7
	.long	.LASF148
	.byte	0x9
	.value	0x773
	.byte	0x15
	.long	0x8ea
	.uleb128 0x7
	.long	.LASF149
	.byte	0x9
	.value	0x774
	.byte	0x12
	.long	0x8cc
	.uleb128 0x7
	.long	.LASF150
	.byte	0x9
	.value	0x775
	.byte	0x10
	.long	0x9b0
	.uleb128 0x7
	.long	.LASF151
	.byte	0x9
	.value	0x776
	.byte	0x13
	.long	0xb05
	.uleb128 0x7
	.long	.LASF152
	.byte	0x9
	.value	0x777
	.byte	0x15
	.long	0x8ea
	.uleb128 0x7
	.long	.LASF153
	.byte	0x9
	.value	0x778
	.byte	0x18
	.long	0x8db
	.uleb128 0x7
	.long	.LASF154
	.byte	0x9
	.value	0x779
	.byte	0x12
	.long	0x7a1
	.uleb128 0x16
	.string	"ip"
	.byte	0x9
	.value	0x77c
	.byte	0x18
	.long	0x8db
	.uleb128 0x7
	.long	.LASF155
	.byte	0x9
	.value	0x77d
	.byte	0x10
	.long	0x9b0
	.uleb128 0x16
	.string	"ia5"
	.byte	0x9
	.value	0x77e
	.byte	0x15
	.long	0x8ea
	.uleb128 0x16
	.string	"rid"
	.byte	0x9
	.value	0x77f
	.byte	0x12
	.long	0x7a1
	.byte	0
	.uleb128 0x1
	.long	0x9fd
	.uleb128 0x1
	.long	0xa35
	.uleb128 0x1
	.long	0x351
	.uleb128 0x12
	.long	.LASF156
	.byte	0x9
	.value	0x7ff
	.long	0xfd
	.uleb128 0x14
	.long	.LASF157
	.uleb128 0x1
	.long	0xb1b
	.uleb128 0x9
	.long	.LASF158
	.byte	0xf
	.byte	0x5b
	.byte	0x20
	.long	0xb31
	.uleb128 0xa
	.long	.LASF159
	.byte	0x20
	.byte	0x10
	.byte	0x28
	.long	0xb72
	.uleb128 0x3
	.long	.LASF160
	.byte	0x10
	.byte	0x29
	.byte	0xf
	.long	0xb0a
	.byte	0
	.uleb128 0x3
	.long	.LASF161
	.byte	0x10
	.byte	0x2a
	.byte	0x16
	.long	0x8db
	.byte	0x8
	.uleb128 0x3
	.long	.LASF162
	.byte	0x10
	.byte	0x2b
	.byte	0x16
	.long	0x8db
	.byte	0x10
	.uleb128 0x3
	.long	.LASF163
	.byte	0x10
	.byte	0x2c
	.byte	0x11
	.long	0x76c
	.byte	0x18
	.byte	0
	.uleb128 0x9
	.long	.LASF164
	.byte	0xf
	.byte	0x5c
	.byte	0x24
	.long	0xb7e
	.uleb128 0xa
	.long	.LASF165
	.byte	0x10
	.byte	0x10
	.byte	0x33
	.long	0xba5
	.uleb128 0x3
	.long	.LASF166
	.byte	0x10
	.byte	0x34
	.byte	0x10
	.long	0xe65
	.byte	0
	.uleb128 0x3
	.long	.LASF167
	.byte	0x10
	.byte	0x35
	.byte	0x1d
	.long	0xebb
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF168
	.byte	0xf
	.byte	0x5d
	.byte	0x21
	.long	0xbb1
	.uleb128 0xa
	.long	.LASF169
	.byte	0x20
	.byte	0x10
	.byte	0x3e
	.long	0xbf2
	.uleb128 0x3
	.long	.LASF170
	.byte	0x10
	.byte	0x3f
	.byte	0x11
	.long	0x76c
	.byte	0
	.uleb128 0x3
	.long	.LASF171
	.byte	0x10
	.byte	0x40
	.byte	0x11
	.long	0x9ab
	.byte	0x8
	.uleb128 0x3
	.long	.LASF172
	.byte	0x10
	.byte	0x41
	.byte	0x1a
	.long	0xec5
	.byte	0x10
	.uleb128 0x3
	.long	.LASF173
	.byte	0x10
	.byte	0x42
	.byte	0x1d
	.long	0xebb
	.byte	0x18
	.byte	0
	.uleb128 0x9
	.long	.LASF174
	.byte	0xf
	.byte	0x5e
	.byte	0x22
	.long	0xbfe
	.uleb128 0xa
	.long	.LASF175
	.byte	0x18
	.byte	0x10
	.byte	0x4a
	.long	0xc32
	.uleb128 0x3
	.long	.LASF176
	.byte	0x10
	.byte	0x4b
	.byte	0xf
	.long	0xb0a
	.byte	0
	.uleb128 0x3
	.long	.LASF177
	.byte	0x10
	.byte	0x4c
	.byte	0x14
	.long	0x8d6
	.byte	0x8
	.uleb128 0x3
	.long	.LASF178
	.byte	0x10
	.byte	0x4d
	.byte	0x13
	.long	0x99b
	.byte	0x10
	.byte	0
	.uleb128 0x9
	.long	.LASF179
	.byte	0xf
	.byte	0x5f
	.byte	0x20
	.long	0xc3e
	.uleb128 0xa
	.long	.LASF180
	.byte	0x10
	.byte	0x10
	.byte	0x54
	.long	0xc65
	.uleb128 0x3
	.long	.LASF181
	.byte	0x10
	.byte	0x55
	.byte	0x11
	.long	0xeca
	.byte	0
	.uleb128 0x3
	.long	.LASF182
	.byte	0x10
	.byte	0x56
	.byte	0x13
	.long	0xecf
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF183
	.byte	0xf
	.byte	0x60
	.byte	0x23
	.long	0xc71
	.uleb128 0xa
	.long	.LASF184
	.byte	0x10
	.byte	0x10
	.byte	0x74
	.long	0xc98
	.uleb128 0x3
	.long	.LASF185
	.byte	0x10
	.byte	0x75
	.byte	0x10
	.long	0x7a1
	.byte	0
	.uleb128 0x3
	.long	.LASF186
	.byte	0x10
	.byte	0x76
	.byte	0x16
	.long	0x8db
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF187
	.byte	0xf
	.byte	0x61
	.byte	0x25
	.long	0xca4
	.uleb128 0xa
	.long	.LASF188
	.byte	0x10
	.byte	0x10
	.byte	0x9c
	.long	0xccb
	.uleb128 0x3
	.long	.LASF189
	.byte	0x10
	.byte	0x9d
	.byte	0x19
	.long	0x903
	.byte	0
	.uleb128 0x3
	.long	.LASF190
	.byte	0x10
	.byte	0x9e
	.byte	0x14
	.long	0x8d1
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF191
	.byte	0xf
	.byte	0x62
	.byte	0x24
	.long	0xcd7
	.uleb128 0xa
	.long	.LASF192
	.byte	0x10
	.byte	0x10
	.byte	0xa6
	.long	0xcfe
	.uleb128 0x3
	.long	.LASF36
	.byte	0x10
	.byte	0xa7
	.byte	0x7
	.long	0x44
	.byte	0
	.uleb128 0x3
	.long	.LASF53
	.byte	0x10
	.byte	0xac
	.byte	0x5
	.long	0xef6
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF193
	.byte	0xf
	.byte	0x63
	.byte	0x28
	.long	0xd0a
	.uleb128 0xa
	.long	.LASF194
	.byte	0x28
	.byte	0x10
	.byte	0xb6
	.long	0xd58
	.uleb128 0x3
	.long	.LASF195
	.byte	0x10
	.byte	0xb7
	.byte	0x10
	.long	0xe65
	.byte	0
	.uleb128 0x3
	.long	.LASF196
	.byte	0x10
	.byte	0xb8
	.byte	0x14
	.long	0xf28
	.byte	0x8
	.uleb128 0x3
	.long	.LASF197
	.byte	0x10
	.byte	0xb9
	.byte	0x19
	.long	0x903
	.byte	0x10
	.uleb128 0x3
	.long	.LASF198
	.byte	0x10
	.byte	0xba
	.byte	0x19
	.long	0x903
	.byte	0x18
	.uleb128 0x3
	.long	.LASF199
	.byte	0x10
	.byte	0xbb
	.byte	0x1d
	.long	0xebb
	.byte	0x20
	.byte	0
	.uleb128 0x9
	.long	.LASF200
	.byte	0xf
	.byte	0x64
	.byte	0x26
	.long	0xd64
	.uleb128 0xa
	.long	.LASF201
	.byte	0x28
	.byte	0x10
	.byte	0xc5
	.long	0xdb2
	.uleb128 0x3
	.long	.LASF170
	.byte	0x10
	.byte	0xc6
	.byte	0x11
	.long	0x76c
	.byte	0
	.uleb128 0x3
	.long	.LASF202
	.byte	0x10
	.byte	0xc7
	.byte	0x10
	.long	0xe6f
	.byte	0x8
	.uleb128 0x3
	.long	.LASF203
	.byte	0x10
	.byte	0xc8
	.byte	0x19
	.long	0x903
	.byte	0x10
	.uleb128 0x3
	.long	.LASF204
	.byte	0x10
	.byte	0xc9
	.byte	0x1e
	.long	0xf32
	.byte	0x18
	.uleb128 0x3
	.long	.LASF205
	.byte	0x10
	.byte	0xca
	.byte	0x1d
	.long	0xebb
	.byte	0x20
	.byte	0
	.uleb128 0x9
	.long	.LASF206
	.byte	0xf
	.byte	0x65
	.byte	0x21
	.long	0xdbe
	.uleb128 0xa
	.long	.LASF207
	.byte	0x10
	.byte	0x10
	.byte	0x7d
	.long	0xde5
	.uleb128 0x3
	.long	.LASF208
	.byte	0x10
	.byte	0x7e
	.byte	0x14
	.long	0x8d1
	.byte	0
	.uleb128 0x3
	.long	.LASF209
	.byte	0x10
	.byte	0x7f
	.byte	0x13
	.long	0xed4
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF210
	.byte	0xf
	.byte	0x66
	.byte	0x25
	.long	0xdf1
	.uleb128 0xa
	.long	.LASF211
	.byte	0x10
	.byte	0x10
	.byte	0x90
	.long	0xe18
	.uleb128 0x3
	.long	.LASF36
	.byte	0x10
	.byte	0x91
	.byte	0x7
	.long	0x44
	.byte	0
	.uleb128 0x3
	.long	.LASF53
	.byte	0x10
	.byte	0x95
	.byte	0x5
	.long	0xed9
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.long	.LASF212
	.byte	0xf
	.byte	0x67
	.byte	0x27
	.long	0xe24
	.uleb128 0xa
	.long	.LASF213
	.byte	0x20
	.byte	0x10
	.byte	0xe5
	.long	0xe65
	.uleb128 0x3
	.long	.LASF214
	.byte	0x10
	.byte	0xe6
	.byte	0x12
	.long	0xf37
	.byte	0
	.uleb128 0x3
	.long	.LASF176
	.byte	0x10
	.byte	0xe7
	.byte	0xf
	.long	0xb0a
	.byte	0x8
	.uleb128 0x3
	.long	.LASF177
	.byte	0x10
	.byte	0xe8
	.byte	0x14
	.long	0x8d6
	.byte	0x10
	.uleb128 0x3
	.long	.LASF178
	.byte	0x10
	.byte	0xe9
	.byte	0x13
	.long	0x99b
	.byte	0x18
	.byte	0
	.uleb128 0x1
	.long	0xb25
	.uleb128 0x1
	.long	0xb72
	.uleb128 0x1
	.long	0xde5
	.uleb128 0x1
	.long	0xcfe
	.uleb128 0xc
	.long	.LASF215
	.byte	0xf
	.byte	0x6e
	.long	0xfd
	.uleb128 0xc
	.long	.LASF216
	.byte	0xf
	.byte	0x6f
	.long	0xfd
	.uleb128 0xc
	.long	.LASF217
	.byte	0xf
	.byte	0x70
	.long	0xfd
	.uleb128 0xc
	.long	.LASF218
	.byte	0xf
	.byte	0x71
	.long	0xfd
	.uleb128 0xc
	.long	.LASF219
	.byte	0xf
	.byte	0x72
	.long	0xfd
	.uleb128 0xc
	.long	.LASF220
	.byte	0xf
	.byte	0x73
	.long	0xfd
	.uleb128 0x1
	.long	0x9cd
	.uleb128 0x14
	.long	.LASF221
	.uleb128 0x1
	.long	0xec0
	.uleb128 0x1
	.long	0xba5
	.uleb128 0x1
	.long	0xbf2
	.uleb128 0x1
	.long	0xc65
	.uleb128 0x1f
	.byte	0x92
	.long	0xef6
	.uleb128 0x19
	.long	.LASF222
	.byte	0x93
	.byte	0x10
	.long	0x9b0
	.uleb128 0x19
	.long	.LASF223
	.byte	0x94
	.byte	0x18
	.long	0x8db
	.byte	0
	.uleb128 0x1f
	.byte	0xa8
	.long	0xf1e
	.uleb128 0x19
	.long	.LASF224
	.byte	0xa9
	.byte	0x10
	.long	0xf1e
	.uleb128 0x19
	.long	.LASF225
	.byte	0xaa
	.byte	0x17
	.long	0xf23
	.uleb128 0x19
	.long	.LASF226
	.byte	0xab
	.byte	0x10
	.long	0xf1e
	.byte	0
	.uleb128 0x1
	.long	0xd1
	.uleb128 0x1
	.long	0xc98
	.uleb128 0x1
	.long	0xccb
	.uleb128 0x14
	.long	.LASF227
	.uleb128 0x1
	.long	0xf2d
	.uleb128 0x1
	.long	0xd58
	.uleb128 0xc
	.long	.LASF228
	.byte	0x10
	.byte	0xec
	.long	0xfd
	.uleb128 0xc
	.long	.LASF229
	.byte	0x10
	.byte	0xed
	.long	0xfd
	.uleb128 0xc
	.long	.LASF230
	.byte	0x10
	.byte	0xee
	.long	0xfd
	.uleb128 0xc
	.long	.LASF231
	.byte	0x10
	.byte	0xef
	.long	0xfd
	.uleb128 0xc
	.long	.LASF232
	.byte	0x10
	.byte	0xf0
	.long	0xfd
	.uleb128 0xb
	.byte	0x10
	.byte	0x5
	.long	.LASF233
	.uleb128 0xb
	.byte	0x10
	.byte	0x7
	.long	.LASF234
	.uleb128 0xb
	.byte	0x1
	.byte	0x2
	.long	.LASF235
	.uleb128 0x1
	.long	0x571
	.uleb128 0xc
	.long	.LASF236
	.byte	0xa
	.byte	0xfa
	.long	0xfd
	.uleb128 0x1b
	.long	0x928
	.long	0xfa8
	.uleb128 0x1c
	.long	0x3d
	.byte	0x2
	.byte	0
	.uleb128 0x13
	.long	0xf98
	.uleb128 0xd
	.long	.LASF237
	.byte	0x10
	.long	0xfa8
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_SIGNATURE_seq_tt
	.uleb128 0xe
	.long	0xf52
	.byte	0x14
	.byte	0x22
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_SIGNATURE_it
	.uleb128 0x1b
	.long	0x928
	.long	0xfe2
	.uleb128 0x1c
	.long	0x3d
	.byte	0x3
	.byte	0
	.uleb128 0x13
	.long	0xfd2
	.uleb128 0xd
	.long	.LASF238
	.byte	0x16
	.long	0xfe2
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_CERTID_seq_tt
	.uleb128 0xe
	.long	0xe8f
	.byte	0x1b
	.byte	0x20
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_CERTID_it
	.uleb128 0x1b
	.long	0x928
	.long	0x101c
	.uleb128 0x1c
	.long	0x3d
	.byte	0x1
	.byte	0
	.uleb128 0x13
	.long	0x100c
	.uleb128 0xd
	.long	.LASF239
	.byte	0x1d
	.long	0x101c
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_ONEREQ_seq_tt
	.uleb128 0xe
	.long	0xeb0
	.byte	0x20
	.byte	0x32
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_ONEREQ_it
	.uleb128 0xd
	.long	.LASF240
	.byte	0x22
	.long	0xfe2
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_REQINFO_seq_tt
	.uleb128 0xe
	.long	0xf47
	.byte	0x27
	.byte	0x22
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_REQINFO_it
	.uleb128 0xd
	.long	.LASF241
	.byte	0x29
	.long	0x101c
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_REQUEST_seq_tt
	.uleb128 0xe
	.long	0xe9a
	.byte	0x2c
	.byte	0x16
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_REQUEST_it
	.uleb128 0xd
	.long	.LASF242
	.byte	0x2e
	.long	0x101c
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_RESPBYTES_seq_tt
	.uleb128 0xe
	.long	0xf5d
	.byte	0x31
	.byte	0x25
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_RESPBYTES_it
	.uleb128 0xd
	.long	.LASF243
	.byte	0x33
	.long	0x101c
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_RESPONSE_seq_tt
	.uleb128 0xe
	.long	0xe84
	.byte	0x36
	.byte	0x16
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_RESPONSE_it
	.uleb128 0xd
	.long	.LASF244
	.byte	0x38
	.long	0x101c
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_RESPID_ch_tt
	.uleb128 0x20
	.long	.LASF245
	.byte	0x3b
	.long	0xfd
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_RESPID_it
	.uleb128 0xd
	.long	.LASF246
	.byte	0x3d
	.long	0x101c
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_REVOKEDINFO_seq_tt
	.uleb128 0xe
	.long	0xf68
	.byte	0x40
	.byte	0x16
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it
	.uleb128 0xd
	.long	.LASF247
	.byte	0x42
	.long	0xfa8
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_CERTSTATUS_ch_tt
	.uleb128 0x20
	.long	.LASF248
	.byte	0x46
	.long	0xfd
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_CERTSTATUS_it
	.uleb128 0x1b
	.long	0x928
	.long	0x115f
	.uleb128 0x1c
	.long	0x3d
	.byte	0x4
	.byte	0
	.uleb128 0x13
	.long	0x114f
	.uleb128 0xd
	.long	.LASF249
	.byte	0x48
	.long	0x115f
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_SINGLERESP_seq_tt
	.uleb128 0xe
	.long	0xea5
	.byte	0x4e
	.byte	0x22
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_SINGLERESP_it
	.uleb128 0xd
	.long	.LASF250
	.byte	0x50
	.long	0x115f
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_RESPDATA_seq_tt
	.uleb128 0xe
	.long	0xf3c
	.byte	0x56
	.byte	0x22
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_RESPDATA_it
	.uleb128 0xd
	.long	.LASF251
	.byte	0x58
	.long	0xfe2
	.uleb128 0x9
	.byte	0x3
	.quad	OCSP_BASICRESP_seq_tt
	.uleb128 0xe
	.long	0xe79
	.byte	0x5d
	.byte	0x22
	.uleb128 0x9
	.byte	0x3
	.quad	aws_lc_fips_0_13_14_OCSP_BASICRESP_it
	.uleb128 0x17
	.long	.LASF252
	.value	0x1b2
	.byte	0x14
	.long	0x44
	.long	0x11f3
	.uleb128 0x5
	.long	0x991
	.uleb128 0x5
	.long	0x5f9
	.uleb128 0x5
	.long	0x99
	.byte	0
	.uleb128 0x17
	.long	.LASF253
	.value	0x1a9
	.byte	0x16
	.long	0x99
	.long	0x1213
	.uleb128 0x5
	.long	0x991
	.uleb128 0x5
	.long	0x5f9
	.uleb128 0x5
	.long	0x99
	.byte	0
	.uleb128 0x17
	.long	.LASF254
	.value	0x19d
	.byte	0x16
	.long	0x99
	.long	0x122e
	.uleb128 0x5
	.long	0x991
	.uleb128 0x5
	.long	0x99
	.byte	0
	.uleb128 0x26
	.long	.LASF310
	.byte	0x8
	.value	0x166
	.byte	0x15
	.long	0x1246
	.uleb128 0x5
	.long	0x912
	.uleb128 0x5
	.long	0x991
	.byte	0
	.uleb128 0x17
	.long	.LASF255
	.value	0x15a
	.byte	0x1c
	.long	0x912
	.long	0x125c
	.uleb128 0x5
	.long	0x991
	.byte	0
	.uleb128 0x17
	.long	.LASF256
	.value	0x186
	.byte	0x14
	.long	0x44
	.long	0x127c
	.uleb128 0x5
	.long	0x912
	.uleb128 0x5
	.long	0x72b
	.uleb128 0x5
	.long	0x991
	.byte	0
	.uleb128 0x17
	.long	.LASF257
	.value	0x178
	.byte	0x1c
	.long	0x912
	.long	0x12a1
	.uleb128 0x5
	.long	0x98c
	.uleb128 0x5
	.long	0x721
	.uleb128 0x5
	.long	0x2a
	.uleb128 0x5
	.long	0x991
	.byte	0
	.uleb128 0x8
	.long	.LASF259
	.byte	0x78
	.byte	0x5
	.long	0x44
	.quad	.LFB1088
	.quad	.LFE1088-.LFB1088
	.uleb128 0x1
	.byte	0x9c
	.long	0x12de
	.uleb128 0x2
	.string	"bp"
	.byte	0x78
	.byte	0x1f
	.long	0x5f9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.long	.LASF258
	.byte	0x78
	.byte	0x31
	.long	0x12de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1
	.long	0xc32
	.uleb128 0x8
	.long	.LASF260
	.byte	0x74
	.byte	0xf
	.long	0x12de
	.quad	.LFB1087
	.quad	.LFE1087-.LFB1087
	.uleb128 0x1
	.byte	0x9c
	.long	0x1320
	.uleb128 0x2
	.string	"bp"
	.byte	0x74
	.byte	0x29
	.long	0x5f9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.long	.LASF258
	.byte	0x74
	.byte	0x3c
	.long	0x1320
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1
	.long	0x12de
	.uleb128 0x8
	.long	.LASF261
	.byte	0x70
	.byte	0x5
	.long	0x44
	.quad	.LFB1086
	.quad	.LFE1086-.LFB1086
	.uleb128 0x1
	.byte	0x9c
	.long	0x1362
	.uleb128 0x2
	.string	"bp"
	.byte	0x70
	.byte	0x20
	.long	0x5f9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.long	.LASF262
	.byte	0x70
	.byte	0x33
	.long	0x1362
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1
	.long	0xdb2
	.uleb128 0x8
	.long	.LASF263
	.byte	0x6c
	.byte	0x10
	.long	0x1362
	.quad	.LFB1085
	.quad	.LFE1085-.LFB1085
	.uleb128 0x1
	.byte	0x9c
	.long	0x13a4
	.uleb128 0x2
	.string	"bp"
	.byte	0x6c
	.byte	0x2b
	.long	0x5f9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.long	.LASF262
	.byte	0x6c
	.byte	0x3f
	.long	0x13a4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x1
	.long	0x1362
	.uleb128 0xf
	.long	.LASF267
	.byte	0x6a
	.quad	.LFB1084
	.quad	.LFE1084-.LFB1084
	.uleb128 0x1
	.byte	0x9c
	.long	0x13d2
	.uleb128 0x2
	.string	"a"
	.byte	0x6a
	.byte	0x1
	.long	0xe74
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF269
	.byte	0x6a
	.long	0xe74
	.quad	.LFB1083
	.quad	.LFE1083-.LFB1083
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF264
	.byte	0x6a
	.byte	0x1
	.long	0x44
	.quad	.LFB1082
	.quad	.LFE1082-.LFB1082
	.uleb128 0x1
	.byte	0x9c
	.long	0x142a
	.uleb128 0x2
	.string	"a"
	.byte	0x6a
	.byte	0x1
	.long	0xe74
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x6a
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF265
	.byte	0x6a
	.byte	0x1
	.long	0xe74
	.quad	.LFB1081
	.quad	.LFE1081-.LFB1081
	.uleb128 0x1
	.byte	0x9c
	.long	0x1473
	.uleb128 0x2
	.string	"a"
	.byte	0x6a
	.byte	0x1
	.long	0x1473
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x6a
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x6a
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1
	.long	0xe74
	.uleb128 0x8
	.long	.LASF266
	.byte	0x69
	.byte	0x1
	.long	0xe65
	.quad	.LFB1080
	.quad	.LFE1080-.LFB1080
	.uleb128 0x1
	.byte	0x9c
	.long	0x14a6
	.uleb128 0x2
	.string	"x"
	.byte	0x69
	.byte	0x1
	.long	0xe65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0xf
	.long	.LASF268
	.byte	0x68
	.quad	.LFB1079
	.quad	.LFE1079-.LFB1079
	.uleb128 0x1
	.byte	0x9c
	.long	0x14cf
	.uleb128 0x2
	.string	"a"
	.byte	0x68
	.byte	0x1
	.long	0x14cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x1
	.long	0xe18
	.uleb128 0x10
	.long	.LASF270
	.byte	0x68
	.long	0x14cf
	.quad	.LFB1078
	.quad	.LFE1078-.LFB1078
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF271
	.byte	0x68
	.byte	0x1
	.long	0x44
	.quad	.LFB1077
	.quad	.LFE1077-.LFB1077
	.uleb128 0x1
	.byte	0x9c
	.long	0x152c
	.uleb128 0x2
	.string	"a"
	.byte	0x68
	.byte	0x1
	.long	0x14cf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x68
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF272
	.byte	0x68
	.byte	0x1
	.long	0x14cf
	.quad	.LFB1076
	.quad	.LFE1076-.LFB1076
	.uleb128 0x1
	.byte	0x9c
	.long	0x1575
	.uleb128 0x2
	.string	"a"
	.byte	0x68
	.byte	0x1
	.long	0x1575
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x68
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x68
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1
	.long	0x14cf
	.uleb128 0xf
	.long	.LASF273
	.byte	0x67
	.quad	.LFB1075
	.quad	.LFE1075-.LFB1075
	.uleb128 0x1
	.byte	0x9c
	.long	0x15a3
	.uleb128 0x2
	.string	"a"
	.byte	0x67
	.byte	0x1
	.long	0xf23
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF274
	.byte	0x67
	.long	0xf23
	.quad	.LFB1074
	.quad	.LFE1074-.LFB1074
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF275
	.byte	0x67
	.byte	0x1
	.long	0x44
	.quad	.LFB1073
	.quad	.LFE1073-.LFB1073
	.uleb128 0x1
	.byte	0x9c
	.long	0x15fb
	.uleb128 0x2
	.string	"a"
	.byte	0x67
	.byte	0x1
	.long	0xf23
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x67
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF276
	.byte	0x67
	.byte	0x1
	.long	0xf23
	.quad	.LFB1072
	.quad	.LFE1072-.LFB1072
	.uleb128 0x1
	.byte	0x9c
	.long	0x1644
	.uleb128 0x2
	.string	"a"
	.byte	0x67
	.byte	0x1
	.long	0x1644
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x67
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x67
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1
	.long	0xf23
	.uleb128 0xf
	.long	.LASF277
	.byte	0x66
	.quad	.LFB1071
	.quad	.LFE1071-.LFB1071
	.uleb128 0x1
	.byte	0x9c
	.long	0x1672
	.uleb128 0x2
	.string	"a"
	.byte	0x66
	.byte	0x1
	.long	0xf37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF278
	.byte	0x66
	.long	0xf37
	.quad	.LFB1070
	.quad	.LFE1070-.LFB1070
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF279
	.byte	0x66
	.byte	0x1
	.long	0x44
	.quad	.LFB1069
	.quad	.LFE1069-.LFB1069
	.uleb128 0x1
	.byte	0x9c
	.long	0x16ca
	.uleb128 0x2
	.string	"a"
	.byte	0x66
	.byte	0x1
	.long	0xf37
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x66
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF280
	.byte	0x66
	.byte	0x1
	.long	0xf37
	.quad	.LFB1068
	.quad	.LFE1068-.LFB1068
	.uleb128 0x1
	.byte	0x9c
	.long	0x1713
	.uleb128 0x2
	.string	"a"
	.byte	0x66
	.byte	0x1
	.long	0x1713
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x66
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x66
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1
	.long	0xf37
	.uleb128 0xf
	.long	.LASF281
	.byte	0x65
	.quad	.LFB1067
	.quad	.LFE1067-.LFB1067
	.uleb128 0x1
	.byte	0x9c
	.long	0x1741
	.uleb128 0x2
	.string	"a"
	.byte	0x65
	.byte	0x1
	.long	0xed4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF282
	.byte	0x65
	.long	0xed4
	.quad	.LFB1066
	.quad	.LFE1066-.LFB1066
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF283
	.byte	0x65
	.byte	0x1
	.long	0x44
	.quad	.LFB1065
	.quad	.LFE1065-.LFB1065
	.uleb128 0x1
	.byte	0x9c
	.long	0x1799
	.uleb128 0x2
	.string	"a"
	.byte	0x65
	.byte	0x1
	.long	0xed4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x65
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF284
	.byte	0x65
	.byte	0x1
	.long	0xed4
	.quad	.LFB1064
	.quad	.LFE1064-.LFB1064
	.uleb128 0x1
	.byte	0x9c
	.long	0x17e2
	.uleb128 0x2
	.string	"a"
	.byte	0x65
	.byte	0x1
	.long	0x17e2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x65
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x65
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1
	.long	0xed4
	.uleb128 0xf
	.long	.LASF285
	.byte	0x64
	.quad	.LFB1063
	.quad	.LFE1063-.LFB1063
	.uleb128 0x1
	.byte	0x9c
	.long	0x1810
	.uleb128 0x2
	.string	"a"
	.byte	0x64
	.byte	0x1
	.long	0x1362
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF286
	.byte	0x64
	.long	0x1362
	.quad	.LFB1062
	.quad	.LFE1062-.LFB1062
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF287
	.byte	0x64
	.byte	0x1
	.long	0x44
	.quad	.LFB1061
	.quad	.LFE1061-.LFB1061
	.uleb128 0x1
	.byte	0x9c
	.long	0x1868
	.uleb128 0x2
	.string	"a"
	.byte	0x64
	.byte	0x1
	.long	0x1362
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x64
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF288
	.byte	0x64
	.byte	0x1
	.long	0x1362
	.quad	.LFB1060
	.quad	.LFE1060-.LFB1060
	.uleb128 0x1
	.byte	0x9c
	.long	0x18b1
	.uleb128 0x2
	.string	"a"
	.byte	0x64
	.byte	0x1
	.long	0x13a4
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x64
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x64
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0xf
	.long	.LASF289
	.byte	0x63
	.quad	.LFB1059
	.quad	.LFE1059-.LFB1059
	.uleb128 0x1
	.byte	0x9c
	.long	0x18da
	.uleb128 0x2
	.string	"a"
	.byte	0x63
	.byte	0x1
	.long	0x12de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF290
	.byte	0x63
	.long	0x12de
	.quad	.LFB1058
	.quad	.LFE1058-.LFB1058
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF291
	.byte	0x63
	.byte	0x1
	.long	0x44
	.quad	.LFB1057
	.quad	.LFE1057-.LFB1057
	.uleb128 0x1
	.byte	0x9c
	.long	0x1932
	.uleb128 0x2
	.string	"a"
	.byte	0x63
	.byte	0x1
	.long	0x12de
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x63
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF292
	.byte	0x63
	.byte	0x1
	.long	0x12de
	.quad	.LFB1056
	.quad	.LFE1056-.LFB1056
	.uleb128 0x1
	.byte	0x9c
	.long	0x197b
	.uleb128 0x2
	.string	"a"
	.byte	0x63
	.byte	0x1
	.long	0x1320
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x63
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x63
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0xf
	.long	.LASF293
	.byte	0x62
	.quad	.LFB1055
	.quad	.LFE1055-.LFB1055
	.uleb128 0x1
	.byte	0x9c
	.long	0x19a4
	.uleb128 0x2
	.string	"a"
	.byte	0x62
	.byte	0x1
	.long	0xeca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF294
	.byte	0x62
	.long	0xeca
	.quad	.LFB1054
	.quad	.LFE1054-.LFB1054
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF295
	.byte	0x62
	.byte	0x1
	.long	0x44
	.quad	.LFB1053
	.quad	.LFE1053-.LFB1053
	.uleb128 0x1
	.byte	0x9c
	.long	0x19fc
	.uleb128 0x2
	.string	"a"
	.byte	0x62
	.byte	0x1
	.long	0xeca
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x62
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF296
	.byte	0x62
	.byte	0x1
	.long	0xeca
	.quad	.LFB1052
	.quad	.LFE1052-.LFB1052
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a45
	.uleb128 0x2
	.string	"a"
	.byte	0x62
	.byte	0x1
	.long	0x1a45
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x62
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x62
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1
	.long	0xeca
	.uleb128 0xf
	.long	.LASF297
	.byte	0x61
	.quad	.LFB1051
	.quad	.LFE1051-.LFB1051
	.uleb128 0x1
	.byte	0x9c
	.long	0x1a73
	.uleb128 0x2
	.string	"a"
	.byte	0x61
	.byte	0x1
	.long	0xe6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF298
	.byte	0x61
	.long	0xe6a
	.quad	.LFB1050
	.quad	.LFE1050-.LFB1050
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF299
	.byte	0x61
	.byte	0x1
	.long	0x44
	.quad	.LFB1049
	.quad	.LFE1049-.LFB1049
	.uleb128 0x1
	.byte	0x9c
	.long	0x1acb
	.uleb128 0x2
	.string	"a"
	.byte	0x61
	.byte	0x1
	.long	0xe6a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x61
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF300
	.byte	0x61
	.byte	0x1
	.long	0xe6a
	.quad	.LFB1048
	.quad	.LFE1048-.LFB1048
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b14
	.uleb128 0x2
	.string	"a"
	.byte	0x61
	.byte	0x1
	.long	0x1b14
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x61
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x61
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1
	.long	0xe6a
	.uleb128 0xf
	.long	.LASF301
	.byte	0x60
	.quad	.LFB1047
	.quad	.LFE1047-.LFB1047
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b42
	.uleb128 0x2
	.string	"a"
	.byte	0x60
	.byte	0x1
	.long	0xe65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF302
	.byte	0x60
	.long	0xe65
	.quad	.LFB1046
	.quad	.LFE1046-.LFB1046
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF303
	.byte	0x60
	.byte	0x1
	.long	0x44
	.quad	.LFB1045
	.quad	.LFE1045-.LFB1045
	.uleb128 0x1
	.byte	0x9c
	.long	0x1b9a
	.uleb128 0x2
	.string	"a"
	.byte	0x60
	.byte	0x1
	.long	0xe65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x60
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF304
	.byte	0x60
	.byte	0x1
	.long	0xe65
	.quad	.LFB1044
	.quad	.LFE1044-.LFB1044
	.uleb128 0x1
	.byte	0x9c
	.long	0x1be3
	.uleb128 0x2
	.string	"a"
	.byte	0x60
	.byte	0x1
	.long	0x1be3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x60
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x60
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1
	.long	0xe65
	.uleb128 0xf
	.long	.LASF305
	.byte	0x5f
	.quad	.LFB1043
	.quad	.LFE1043-.LFB1043
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c11
	.uleb128 0x2
	.string	"a"
	.byte	0x5f
	.byte	0x1
	.long	0xecf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x10
	.long	.LASF306
	.byte	0x5f
	.long	0xecf
	.quad	.LFB1042
	.quad	.LFE1042-.LFB1042
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.long	.LASF307
	.byte	0x5f
	.byte	0x1
	.long	0x44
	.quad	.LFB1041
	.quad	.LFE1041-.LFB1041
	.uleb128 0x1
	.byte	0x9c
	.long	0x1c69
	.uleb128 0x2
	.string	"a"
	.byte	0x5f
	.byte	0x1
	.long	0xecf
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"out"
	.byte	0x5f
	.byte	0x1
	.long	0x72b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x8
	.long	.LASF308
	.byte	0x5f
	.byte	0x1
	.long	0xecf
	.quad	.LFB1040
	.quad	.LFE1040-.LFB1040
	.uleb128 0x1
	.byte	0x9c
	.long	0x1cb2
	.uleb128 0x2
	.string	"a"
	.byte	0x5f
	.byte	0x1
	.long	0x1cb2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"in"
	.byte	0x5f
	.byte	0x1
	.long	0x721
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"len"
	.byte	0x5f
	.byte	0x1
	.long	0x2a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.byte	0
	.uleb128 0x1
	.long	0xecf
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
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
	.uleb128 0x5
	.uleb128 0x5
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.sleb128 1
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
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
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
	.sleb128 1
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
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x21
	.sleb128 8
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
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 16
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x21
	.sleb128 18
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x32c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB1040
	.quad	.LFE1040-.LFB1040
	.quad	.LFB1041
	.quad	.LFE1041-.LFB1041
	.quad	.LFB1042
	.quad	.LFE1042-.LFB1042
	.quad	.LFB1043
	.quad	.LFE1043-.LFB1043
	.quad	.LFB1044
	.quad	.LFE1044-.LFB1044
	.quad	.LFB1045
	.quad	.LFE1045-.LFB1045
	.quad	.LFB1046
	.quad	.LFE1046-.LFB1046
	.quad	.LFB1047
	.quad	.LFE1047-.LFB1047
	.quad	.LFB1048
	.quad	.LFE1048-.LFB1048
	.quad	.LFB1049
	.quad	.LFE1049-.LFB1049
	.quad	.LFB1050
	.quad	.LFE1050-.LFB1050
	.quad	.LFB1051
	.quad	.LFE1051-.LFB1051
	.quad	.LFB1052
	.quad	.LFE1052-.LFB1052
	.quad	.LFB1053
	.quad	.LFE1053-.LFB1053
	.quad	.LFB1054
	.quad	.LFE1054-.LFB1054
	.quad	.LFB1055
	.quad	.LFE1055-.LFB1055
	.quad	.LFB1056
	.quad	.LFE1056-.LFB1056
	.quad	.LFB1057
	.quad	.LFE1057-.LFB1057
	.quad	.LFB1058
	.quad	.LFE1058-.LFB1058
	.quad	.LFB1059
	.quad	.LFE1059-.LFB1059
	.quad	.LFB1060
	.quad	.LFE1060-.LFB1060
	.quad	.LFB1061
	.quad	.LFE1061-.LFB1061
	.quad	.LFB1062
	.quad	.LFE1062-.LFB1062
	.quad	.LFB1063
	.quad	.LFE1063-.LFB1063
	.quad	.LFB1064
	.quad	.LFE1064-.LFB1064
	.quad	.LFB1065
	.quad	.LFE1065-.LFB1065
	.quad	.LFB1066
	.quad	.LFE1066-.LFB1066
	.quad	.LFB1067
	.quad	.LFE1067-.LFB1067
	.quad	.LFB1068
	.quad	.LFE1068-.LFB1068
	.quad	.LFB1069
	.quad	.LFE1069-.LFB1069
	.quad	.LFB1070
	.quad	.LFE1070-.LFB1070
	.quad	.LFB1071
	.quad	.LFE1071-.LFB1071
	.quad	.LFB1072
	.quad	.LFE1072-.LFB1072
	.quad	.LFB1073
	.quad	.LFE1073-.LFB1073
	.quad	.LFB1074
	.quad	.LFE1074-.LFB1074
	.quad	.LFB1075
	.quad	.LFE1075-.LFB1075
	.quad	.LFB1076
	.quad	.LFE1076-.LFB1076
	.quad	.LFB1077
	.quad	.LFE1077-.LFB1077
	.quad	.LFB1078
	.quad	.LFE1078-.LFB1078
	.quad	.LFB1079
	.quad	.LFE1079-.LFB1079
	.quad	.LFB1080
	.quad	.LFE1080-.LFB1080
	.quad	.LFB1081
	.quad	.LFE1081-.LFB1081
	.quad	.LFB1082
	.quad	.LFE1082-.LFB1082
	.quad	.LFB1083
	.quad	.LFE1083-.LFB1083
	.quad	.LFB1084
	.quad	.LFE1084-.LFB1084
	.quad	.LFB1085
	.quad	.LFE1085-.LFB1085
	.quad	.LFB1086
	.quad	.LFE1086-.LFB1086
	.quad	.LFB1087
	.quad	.LFE1087-.LFB1087
	.quad	.LFB1088
	.quad	.LFE1088-.LFB1088
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
	.quad	.LFB1040
	.uleb128 .LFE1040-.LFB1040
	.byte	0x7
	.quad	.LFB1041
	.uleb128 .LFE1041-.LFB1041
	.byte	0x7
	.quad	.LFB1042
	.uleb128 .LFE1042-.LFB1042
	.byte	0x7
	.quad	.LFB1043
	.uleb128 .LFE1043-.LFB1043
	.byte	0x7
	.quad	.LFB1044
	.uleb128 .LFE1044-.LFB1044
	.byte	0x7
	.quad	.LFB1045
	.uleb128 .LFE1045-.LFB1045
	.byte	0x7
	.quad	.LFB1046
	.uleb128 .LFE1046-.LFB1046
	.byte	0x7
	.quad	.LFB1047
	.uleb128 .LFE1047-.LFB1047
	.byte	0x7
	.quad	.LFB1048
	.uleb128 .LFE1048-.LFB1048
	.byte	0x7
	.quad	.LFB1049
	.uleb128 .LFE1049-.LFB1049
	.byte	0x7
	.quad	.LFB1050
	.uleb128 .LFE1050-.LFB1050
	.byte	0x7
	.quad	.LFB1051
	.uleb128 .LFE1051-.LFB1051
	.byte	0x7
	.quad	.LFB1052
	.uleb128 .LFE1052-.LFB1052
	.byte	0x7
	.quad	.LFB1053
	.uleb128 .LFE1053-.LFB1053
	.byte	0x7
	.quad	.LFB1054
	.uleb128 .LFE1054-.LFB1054
	.byte	0x7
	.quad	.LFB1055
	.uleb128 .LFE1055-.LFB1055
	.byte	0x7
	.quad	.LFB1056
	.uleb128 .LFE1056-.LFB1056
	.byte	0x7
	.quad	.LFB1057
	.uleb128 .LFE1057-.LFB1057
	.byte	0x7
	.quad	.LFB1058
	.uleb128 .LFE1058-.LFB1058
	.byte	0x7
	.quad	.LFB1059
	.uleb128 .LFE1059-.LFB1059
	.byte	0x7
	.quad	.LFB1060
	.uleb128 .LFE1060-.LFB1060
	.byte	0x7
	.quad	.LFB1061
	.uleb128 .LFE1061-.LFB1061
	.byte	0x7
	.quad	.LFB1062
	.uleb128 .LFE1062-.LFB1062
	.byte	0x7
	.quad	.LFB1063
	.uleb128 .LFE1063-.LFB1063
	.byte	0x7
	.quad	.LFB1064
	.uleb128 .LFE1064-.LFB1064
	.byte	0x7
	.quad	.LFB1065
	.uleb128 .LFE1065-.LFB1065
	.byte	0x7
	.quad	.LFB1066
	.uleb128 .LFE1066-.LFB1066
	.byte	0x7
	.quad	.LFB1067
	.uleb128 .LFE1067-.LFB1067
	.byte	0x7
	.quad	.LFB1068
	.uleb128 .LFE1068-.LFB1068
	.byte	0x7
	.quad	.LFB1069
	.uleb128 .LFE1069-.LFB1069
	.byte	0x7
	.quad	.LFB1070
	.uleb128 .LFE1070-.LFB1070
	.byte	0x7
	.quad	.LFB1071
	.uleb128 .LFE1071-.LFB1071
	.byte	0x7
	.quad	.LFB1072
	.uleb128 .LFE1072-.LFB1072
	.byte	0x7
	.quad	.LFB1073
	.uleb128 .LFE1073-.LFB1073
	.byte	0x7
	.quad	.LFB1074
	.uleb128 .LFE1074-.LFB1074
	.byte	0x7
	.quad	.LFB1075
	.uleb128 .LFE1075-.LFB1075
	.byte	0x7
	.quad	.LFB1076
	.uleb128 .LFE1076-.LFB1076
	.byte	0x7
	.quad	.LFB1077
	.uleb128 .LFE1077-.LFB1077
	.byte	0x7
	.quad	.LFB1078
	.uleb128 .LFE1078-.LFB1078
	.byte	0x7
	.quad	.LFB1079
	.uleb128 .LFE1079-.LFB1079
	.byte	0x7
	.quad	.LFB1080
	.uleb128 .LFE1080-.LFB1080
	.byte	0x7
	.quad	.LFB1081
	.uleb128 .LFE1081-.LFB1081
	.byte	0x7
	.quad	.LFB1082
	.uleb128 .LFE1082-.LFB1082
	.byte	0x7
	.quad	.LFB1083
	.uleb128 .LFE1083-.LFB1083
	.byte	0x7
	.quad	.LFB1084
	.uleb128 .LFE1084-.LFB1084
	.byte	0x7
	.quad	.LFB1085
	.uleb128 .LFE1085-.LFB1085
	.byte	0x7
	.quad	.LFB1086
	.uleb128 .LFE1086-.LFB1086
	.byte	0x7
	.quad	.LFB1087
	.uleb128 .LFE1087-.LFB1087
	.byte	0x7
	.quad	.LFB1088
	.uleb128 .LFE1088-.LFB1088
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF129:
	.string	"ASN1_TEMPLATE"
.LASF73:
	.string	"bgets"
.LASF108:
	.string	"aws_lc_fips_0_13_14_ASN1_NULL_it"
.LASF29:
	.string	"ASN1_ITEM_st"
.LASF84:
	.string	"shutdown"
.LASF186:
	.string	"response"
.LASF292:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_REQUEST"
.LASF253:
	.string	"aws_lc_fips_0_13_14_ASN1_item_d2i_bio"
.LASF89:
	.string	"num_write"
.LASF295:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_REQINFO"
.LASF107:
	.string	"aws_lc_fips_0_13_14_ASN1_GENERALIZEDTIME_it"
.LASF174:
	.string	"OCSP_SIGNATURE"
.LASF157:
	.string	"stack_st_X509_NAME_ENTRY"
.LASF136:
	.string	"aws_lc_fips_0_13_14_X509_NAME_it"
.LASF132:
	.string	"field_name"
.LASF145:
	.string	"EDIPARTYNAME"
.LASF24:
	.string	"tcount"
.LASF228:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPDATA_it"
.LASF217:
	.string	"aws_lc_fips_0_13_14_OCSP_CERTID_it"
.LASF96:
	.string	"asn1_null_st"
.LASF97:
	.string	"stack_st_void"
.LASF307:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_SIGNATURE"
.LASF121:
	.string	"bmpstring"
.LASF113:
	.string	"integer"
.LASF149:
	.string	"x400Address"
.LASF63:
	.string	"modified"
.LASF146:
	.string	"otherName"
.LASF232:
	.string	"aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_it"
.LASF170:
	.string	"version"
.LASF269:
	.string	"aws_lc_fips_0_13_14_OCSP_SINGLERESP_new"
.LASF175:
	.string	"ocsp_signature_st"
.LASF95:
	.string	"crypto_ex_data_st"
.LASF197:
	.string	"thisUpdate"
.LASF301:
	.string	"aws_lc_fips_0_13_14_OCSP_CERTID_free"
.LASF38:
	.string	"ASN1_ENUMERATED"
.LASF166:
	.string	"reqCert"
.LASF62:
	.string	"entries"
.LASF284:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_RESPBYTES"
.LASF46:
	.string	"ASN1_T61STRING"
.LASF200:
	.string	"OCSP_RESPDATA"
.LASF221:
	.string	"stack_st_OCSP_ONEREQ"
.LASF233:
	.string	"__int128"
.LASF106:
	.string	"aws_lc_fips_0_13_14_ASN1_ENUMERATED_it"
.LASF300:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_ONEREQ"
.LASF258:
	.string	"preq"
.LASF288:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE"
.LASF25:
	.string	"funcs"
.LASF48:
	.string	"ASN1_UTCTIME"
.LASF82:
	.string	"cb_arg"
.LASF77:
	.string	"callback_ctrl"
.LASF278:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPDATA_new"
.LASF220:
	.string	"aws_lc_fips_0_13_14_OCSP_ONEREQ_it"
.LASF207:
	.string	"ocsp_response_st"
.LASF75:
	.string	"create"
.LASF137:
	.string	"aws_lc_fips_0_13_14_X509_EXTENSION_it"
.LASF162:
	.string	"issuerKeyHash"
.LASF238:
	.string	"OCSP_CERTID_seq_tt"
.LASF267:
	.string	"aws_lc_fips_0_13_14_OCSP_SINGLERESP_free"
.LASF9:
	.string	"signed char"
.LASF130:
	.string	"ASN1_TEMPLATE_st"
.LASF213:
	.string	"ocsp_basic_response_st"
.LASF15:
	.string	"uint32_t"
.LASF19:
	.string	"ASN1_BOOLEAN"
.LASF80:
	.string	"ex_data"
.LASF203:
	.string	"producedAt"
.LASF294:
	.string	"aws_lc_fips_0_13_14_OCSP_REQINFO_new"
.LASF293:
	.string	"aws_lc_fips_0_13_14_OCSP_REQINFO_free"
.LASF273:
	.string	"aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_free"
.LASF103:
	.string	"aws_lc_fips_0_13_14_ASN1_OCTET_STRING_it"
.LASF118:
	.string	"t61string"
.LASF98:
	.string	"bio_info_cb"
.LASF250:
	.string	"OCSP_RESPDATA_seq_tt"
.LASF91:
	.string	"buf_mem_st"
.LASF123:
	.string	"utctime"
.LASF291:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_REQUEST"
.LASF256:
	.string	"aws_lc_fips_0_13_14_ASN1_item_i2d"
.LASF279:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_RESPDATA"
.LASF17:
	.string	"long long unsigned int"
.LASF225:
	.string	"revoked"
.LASF131:
	.string	"offset"
.LASF50:
	.string	"ASN1_VISIBLESTRING"
.LASF265:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_SINGLERESP"
.LASF49:
	.string	"ASN1_UTF8STRING"
.LASF114:
	.string	"enumerated"
.LASF190:
	.string	"revocationReason"
.LASF187:
	.string	"OCSP_REVOKEDINFO"
.LASF74:
	.string	"ctrl"
.LASF177:
	.string	"signature"
.LASF181:
	.string	"tbsRequest"
.LASF53:
	.string	"value"
.LASF122:
	.string	"universalstring"
.LASF285:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPONSE_free"
.LASF61:
	.string	"X509_name_st"
.LASF11:
	.string	"size_t"
.LASF272:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_BASICRESP"
.LASF199:
	.string	"singleExtensions"
.LASF54:
	.string	"GENERAL_NAME"
.LASF229:
	.string	"aws_lc_fips_0_13_14_OCSP_REQINFO_it"
.LASF147:
	.string	"rfc822Name"
.LASF99:
	.string	"BIO_callback_fn_ex"
.LASF140:
	.string	"type_id"
.LASF235:
	.string	"_Bool"
.LASF112:
	.string	"object"
.LASF222:
	.string	"byName"
.LASF209:
	.string	"responseBytes"
.LASF64:
	.string	"bytes"
.LASF290:
	.string	"aws_lc_fips_0_13_14_OCSP_REQUEST_new"
.LASF44:
	.string	"ASN1_PRINTABLESTRING"
.LASF13:
	.string	"__uint64_t"
.LASF286:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPONSE_new"
.LASF124:
	.string	"generalizedtime"
.LASF297:
	.string	"aws_lc_fips_0_13_14_OCSP_ONEREQ_free"
.LASF117:
	.string	"printablestring"
.LASF305:
	.string	"aws_lc_fips_0_13_14_OCSP_SIGNATURE_free"
.LASF94:
	.string	"CRYPTO_EX_DATA"
.LASF47:
	.string	"ASN1_UNIVERSALSTRING"
.LASF214:
	.string	"tbsResponseData"
.LASF67:
	.string	"BIO_METHOD"
.LASF65:
	.string	"canon_enc"
.LASF309:
	.ascii	"GNU C11 15"
	.string	".2.0 -m64 -mtune=generic -march=x86-64 -ggdb -g -std=gnu11 -ffunction-sections -fdata-sections -fvisibility=hidden -fno-common -fPIC -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection -fzero-init-padding-bits=all"
.LASF224:
	.string	"good"
.LASF34:
	.string	"ASN1_BIT_STRING"
.LASF262:
	.string	"presp"
.LASF226:
	.string	"unknown"
.LASF306:
	.string	"aws_lc_fips_0_13_14_OCSP_SIGNATURE_new"
.LASF14:
	.string	"char"
.LASF100:
	.string	"ASN1_ITEM_EXP"
.LASF247:
	.string	"OCSP_CERTSTATUS_ch_tt"
.LASF143:
	.string	"nameAssigner"
.LASF183:
	.string	"OCSP_RESPBYTES"
.LASF299:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_ONEREQ"
.LASF141:
	.string	"OTHERNAME"
.LASF22:
	.string	"utype"
.LASF263:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_RESPONSE_bio"
.LASF169:
	.string	"ocsp_req_info_st"
.LASF32:
	.string	"data"
.LASF126:
	.string	"utf8string"
.LASF8:
	.string	"unsigned int"
.LASF148:
	.string	"dNSName"
.LASF70:
	.string	"bwrite"
.LASF168:
	.string	"OCSP_REQINFO"
.LASF93:
	.string	"CRYPTO_refcount_t"
.LASF178:
	.string	"certs"
.LASF58:
	.string	"algorithm"
.LASF128:
	.string	"asn1_value"
.LASF219:
	.string	"aws_lc_fips_0_13_14_OCSP_SINGLERESP_it"
.LASF204:
	.string	"responses"
.LASF193:
	.string	"OCSP_SINGLERESP"
.LASF298:
	.string	"aws_lc_fips_0_13_14_OCSP_ONEREQ_new"
.LASF245:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPID_it"
.LASF104:
	.string	"aws_lc_fips_0_13_14_ASN1_BIT_STRING_it"
.LASF138:
	.string	"stack_st_X509_EXTENSION"
.LASF261:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE_bio"
.LASF110:
	.string	"boolean"
.LASF184:
	.string	"ocsp_resp_bytes_st"
.LASF252:
	.string	"aws_lc_fips_0_13_14_ASN1_item_i2d_bio"
.LASF236:
	.string	"aws_lc_fips_0_13_14_GENERAL_NAME_it"
.LASF227:
	.string	"stack_st_OCSP_SINGLERESP"
.LASF116:
	.string	"octet_string"
.LASF66:
	.string	"canon_enclen"
.LASF4:
	.string	"long long int"
.LASF155:
	.string	"dirn"
.LASF264:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_SINGLERESP"
.LASF277:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPDATA_free"
.LASF191:
	.string	"OCSP_CERTSTATUS"
.LASF275:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_REVOKEDINFO"
.LASF30:
	.string	"asn1_object_st"
.LASF240:
	.string	"OCSP_REQINFO_seq_tt"
.LASF205:
	.string	"responseExtensions"
.LASF243:
	.string	"OCSP_RESPONSE_seq_tt"
.LASF164:
	.string	"OCSP_ONEREQ"
.LASF37:
	.string	"ASN1_BMPSTRING"
.LASF268:
	.string	"aws_lc_fips_0_13_14_OCSP_BASICRESP_free"
.LASF223:
	.string	"byKey"
.LASF41:
	.string	"ASN1_IA5STRING"
.LASF192:
	.string	"ocsp_cert_status_st"
.LASF173:
	.string	"requestExtensions"
.LASF206:
	.string	"OCSP_RESPONSE"
.LASF26:
	.string	"size"
.LASF87:
	.string	"next_bio"
.LASF57:
	.string	"X509_algor_st"
.LASF201:
	.string	"ocsp_response_data_st"
.LASF163:
	.string	"serialNumber"
.LASF304:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_CERTID"
.LASF3:
	.string	"long unsigned int"
.LASF255:
	.string	"aws_lc_fips_0_13_14_ASN1_item_new"
.LASF115:
	.string	"bit_string"
.LASF152:
	.string	"uniformResourceIdentifier"
.LASF289:
	.string	"aws_lc_fips_0_13_14_OCSP_REQUEST_free"
.LASF60:
	.string	"X509_NAME"
.LASF239:
	.string	"OCSP_ONEREQ_seq_tt"
.LASF111:
	.string	"asn1_string"
.LASF189:
	.string	"revocationTime"
.LASF271:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_BASICRESP"
.LASF172:
	.string	"requestList"
.LASF248:
	.string	"aws_lc_fips_0_13_14_OCSP_CERTSTATUS_it"
.LASF310:
	.string	"aws_lc_fips_0_13_14_ASN1_item_free"
.LASF85:
	.string	"retry_reason"
.LASF18:
	.string	"ASN1_NULL"
.LASF5:
	.string	"long double"
.LASF211:
	.string	"ocsp_responder_id_st"
.LASF282:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPBYTES_new"
.LASF237:
	.string	"OCSP_SIGNATURE_seq_tt"
.LASF308:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_SIGNATURE"
.LASF270:
	.string	"aws_lc_fips_0_13_14_OCSP_BASICRESP_new"
.LASF127:
	.string	"sequence"
.LASF171:
	.string	"requestorName"
.LASF165:
	.string	"ocsp_one_request_st"
.LASF202:
	.string	"responderId"
.LASF33:
	.string	"flags"
.LASF120:
	.string	"generalstring"
.LASF179:
	.string	"OCSP_REQUEST"
.LASF254:
	.string	"aws_lc_fips_0_13_14_ASN1_item_dup"
.LASF135:
	.string	"aws_lc_fips_0_13_14_X509_it"
.LASF196:
	.string	"certStatus"
.LASF215:
	.string	"aws_lc_fips_0_13_14_OCSP_BASICRESP_it"
.LASF52:
	.string	"asn1_type_st"
.LASF10:
	.string	"short int"
.LASF59:
	.string	"parameter"
.LASF208:
	.string	"responseStatus"
.LASF216:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPONSE_it"
.LASF287:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_RESPONSE"
.LASF167:
	.string	"singleRequestExtensions"
.LASF2:
	.string	"long int"
.LASF151:
	.string	"ediPartyName"
.LASF56:
	.string	"X509_ALGOR"
.LASF31:
	.string	"length"
.LASF144:
	.string	"partyName"
.LASF153:
	.string	"iPAddress"
.LASF23:
	.string	"templates"
.LASF280:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_RESPDATA"
.LASF276:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_REVOKEDINFO"
.LASF105:
	.string	"aws_lc_fips_0_13_14_ASN1_INTEGER_it"
.LASF16:
	.string	"uint64_t"
.LASF21:
	.string	"itype"
.LASF35:
	.string	"asn1_string_st"
.LASF92:
	.string	"double"
.LASF259:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_REQUEST_bio"
.LASF266:
	.string	"aws_lc_fips_0_13_14_OCSP_CERTID_dup"
.LASF176:
	.string	"signatureAlgorithm"
.LASF69:
	.string	"name"
.LASF156:
	.string	"aws_lc_fips_0_13_14_X509_ALGOR_it"
.LASF210:
	.string	"OCSP_RESPID"
.LASF246:
	.string	"OCSP_REVOKEDINFO_seq_tt"
.LASF83:
	.string	"init"
.LASF39:
	.string	"ASN1_GENERALIZEDTIME"
.LASF159:
	.string	"ocsp_cert_id_st"
.LASF251:
	.string	"OCSP_BASICRESP_seq_tt"
.LASF257:
	.string	"aws_lc_fips_0_13_14_ASN1_item_d2i"
.LASF43:
	.string	"ASN1_OCTET_STRING"
.LASF296:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_REQINFO"
.LASF160:
	.string	"hashAlgorithm"
.LASF28:
	.string	"ASN1_OBJECT"
.LASF119:
	.string	"ia5string"
.LASF212:
	.string	"OCSP_BASICRESP"
.LASF274:
	.string	"aws_lc_fips_0_13_14_OCSP_REVOKEDINFO_new"
.LASF88:
	.string	"num_read"
.LASF231:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPBYTES_it"
.LASF36:
	.string	"type"
.LASF40:
	.string	"ASN1_GENERALSTRING"
.LASF6:
	.string	"unsigned char"
.LASF283:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_RESPBYTES"
.LASF12:
	.string	"__uint32_t"
.LASF139:
	.string	"otherName_st"
.LASF76:
	.string	"destroy"
.LASF150:
	.string	"directoryName"
.LASF249:
	.string	"OCSP_SINGLERESP_seq_tt"
.LASF198:
	.string	"nextUpdate"
.LASF109:
	.string	"aws_lc_fips_0_13_14_ASN1_OBJECT_it"
.LASF86:
	.string	"references"
.LASF79:
	.string	"method"
.LASF241:
	.string	"OCSP_REQUEST_seq_tt"
.LASF281:
	.string	"aws_lc_fips_0_13_14_OCSP_RESPBYTES_free"
.LASF303:
	.string	"aws_lc_fips_0_13_14_i2d_OCSP_CERTID"
.LASF194:
	.string	"ocsp_single_response_st"
.LASF72:
	.string	"bputs"
.LASF154:
	.string	"registeredID"
.LASF20:
	.string	"ASN1_ITEM"
.LASF133:
	.string	"item"
.LASF45:
	.string	"ASN1_STRING"
.LASF78:
	.string	"bio_st"
.LASF195:
	.string	"certId"
.LASF81:
	.string	"callback_ex"
.LASF230:
	.string	"aws_lc_fips_0_13_14_OCSP_SIGNATURE_it"
.LASF68:
	.string	"bio_method_st"
.LASF7:
	.string	"short unsigned int"
.LASF260:
	.string	"aws_lc_fips_0_13_14_d2i_OCSP_REQUEST_bio"
.LASF218:
	.string	"aws_lc_fips_0_13_14_OCSP_REQUEST_it"
.LASF55:
	.string	"GENERAL_NAME_st"
.LASF51:
	.string	"ASN1_TYPE"
.LASF161:
	.string	"issuerNameHash"
.LASF242:
	.string	"OCSP_RESPBYTES_seq_tt"
.LASF302:
	.string	"aws_lc_fips_0_13_14_OCSP_CERTID_new"
.LASF182:
	.string	"optionalSignature"
.LASF234:
	.string	"__int128 unsigned"
.LASF27:
	.string	"sname"
.LASF134:
	.string	"stack_st_X509"
.LASF180:
	.string	"ocsp_request_st"
.LASF158:
	.string	"OCSP_CERTID"
.LASF90:
	.string	"BUF_MEM"
.LASF125:
	.string	"visiblestring"
.LASF42:
	.string	"ASN1_INTEGER"
.LASF102:
	.string	"ASN1_VALUE_st"
.LASF71:
	.string	"bread"
.LASF101:
	.string	"ASN1_VALUE"
.LASF244:
	.string	"OCSP_RESPID_ch_tt"
.LASF142:
	.string	"EDIPartyName_st"
.LASF185:
	.string	"responseType"
.LASF188:
	.string	"ocsp_revoked_info_st"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/mnt/HARDONE/NSI_Repos/tacvoice/service/target/debug/build/aws-lc-fips-sys-d437d42e962aa361/out/build/aws-lc/crypto"
.LASF0:
	.string	"/home/jdn/.cargo/registry/src/index.crates.io-1949cf8c6b5b557f/aws-lc-fips-sys-0.13.14/aws-lc/crypto/ocsp/ocsp_asn.c"
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
