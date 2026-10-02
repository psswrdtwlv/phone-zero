#!/usr/bin/env bash
# Reproducible build of the Phone Zero environment capability probe.
# Host-local. No sudo. Not Milestone 1, not Phone Zero kernel code.
set -euo pipefail
cd "$(dirname "$0")"

CLANG="${CLANG:-clang-18}"
LLD="${LLD:-$(find "$HOME/.rustup" -name ld.lld -path '*gcc-ld*' | head -1)}"
if [ ! -x "$LLD" ]; then
  echo "FATAL: no ld.lld found. Install lld (apt) or keep the rustup toolchain." >&2
  exit 1
fi

"$CLANG" --target=riscv64-unknown-elf -march=rv64gc -mabi=lp64d -O2 \
  -ffreestanding -nostdlib -fno-stack-protector \
  -T link.ld -fuse-ld="$LLD" probe.c -o probe.elf

llvm-strip-18 probe.elf
echo "--- built ---"
llvm-readelf-18 -h probe.elf | grep -E 'Class|Machine|Entry'
