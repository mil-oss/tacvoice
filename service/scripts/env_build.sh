#!/usr/bin/env bash
# Shared build environment for ZTXS (FIPS / aws-lc-sys temp files).
ZTXS_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export TMPDIR="${TMPDIR:-${ZTXS_ROOT}/test}"
mkdir -p "${TMPDIR}"

# GCC 15 + glibc C23 memchr vs aws-lc-fips-sys 0.13.x (OPENSSL_memchr in internal.h).
FIPS_CCFLAGS="-Wno-error=discarded-qualifiers -Wno-discarded-qualifiers"
FIPS_GCC_CCFLAGS="${FIPS_CCFLAGS} -fno-tree-slp-vectorize"
export AWS_LC_FIPS_SYS_CFLAGS="${AWS_LC_FIPS_SYS_CFLAGS:-${FIPS_GCC_CCFLAGS}}"
export AWS_LC_SYS_CFLAGS="${AWS_LC_SYS_CFLAGS:-${FIPS_CCFLAGS}}"
