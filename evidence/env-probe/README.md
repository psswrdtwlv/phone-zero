# PHONE ZERO — ENVIRONMENT CAPABILITY PROBE

Date: 2026-10-03
Agent: Bunny
Gate at time of probe: ARCHITECTURE GENESIS v0.1 (pre-implementation)

## WHAT THIS IS

A single-file freestanding C program built for RISC-V64 and executed under QEMU
on this host machine, in order to answer one class of question:

> Can this host actually build, boot, and deterministically terminate a
> freestanding RISC-V64 program?

## WHAT THIS IS NOT

- NOT Milestone 1.
- NOT Phone Zero kernel code.
- NOT an architecture decision.
- NOT a decision about OpenSBI vs bare M-mode, about ISA choice, about
  kernel architecture, or about language.

No phone-zero architecture file was created or modified by this probe.

## WHY IT WAS DONE

Milestone 1's canonical contract requires a deterministic boot with a
machine-checkable signature and an intentional exit code. If the host cannot
satisfy that, every downstream artifact (milestone contract, toolchain
placeholders, CI design) is written against a fiction.

This was cheaper to establish by experiment than to assume.

## BUILD

    cd evidence/env-probe && ./build.sh

Toolchain used, all present on host, no sudo required:

    clang-18        --target=riscv64-unknown-elf -march=rv64gc -mabi=lp64d
    ld.lld          from the existing rustup stable toolchain
    llvm-strip-18   /usr/bin/llvm-strip-18
    llvm-readelf-18 /usr/bin/llvm-readelf-18

Built artifact:

    Class:   ELF64
    Machine: RISC-V
    Entry:   0x80000000

## EXECUTION

QEMU is NOT installed system-wide on this host and passwordless sudo is
unavailable. QEMU 8.2.2 was obtained as an unpacked Debian package under
/tmp/opencode with its runtime libraries resolved via LD_LIBRARY_PATH. This is
a probe-environment detail, not a project decision. A real project setup would
install qemu-system-misc properly.

Machine: `virt`. Serial: NS16550A at 0x10000000.

### CASE 1 — bare M-mode, no firmware

    qemu-system-riscv64 -M virt -nographic -no-reboot -bios none -kernel probe.elf

Result:  serial emitted `PZ:ENVPROBE_OK`, QEMU exited with code 0.

### CASE 2 — negative case, fail finisher with code 42

Same binary logic, finisher word replaced by `0x3333 | (42 << 16)`.

Result:  serial emitted `PZ:ENVPROBE_OK`, QEMU exited with code 42.

This is the important half. A test harness that can only observe success
cannot distinguish a working device from a hung one.

### CASE 3 — with OpenSBI firmware

    qemu-system-riscv64 -M virt -nographic -no-reboot \
      -bios opensbi-riscv64-generic-fw_dynamic.bin -kernel probe.elf

with the link address moved to 0x80200000.

Result:  OpenSBI v1.3 booted, reported `riscv-virtio,qemu`, HART count 1,
timer `aclint-mtimer`, console `uart8250`, reboot device `sifive_test`.
The guest then emitted `PZ:ENVPROBE_OK` and QEMU exited with code 0.

Note: at link address 0x80000000 with the OpenSBI image loaded, QEMU refuses
to start with overlapping ROM regions. The 0x80200000 link address is
required in that configuration.

## RESULTS

FACT, established by execution on this host:

- A freestanding RISC-V64 target can be compiled here with an existing
  toolchain and no privileged installation.
- QEMU `virt` can boot it in both bare M-mode and under OpenSBI.
- Serial output is captured deterministically.
- The SiFive test finisher device at 0x100000 provides a real, observable
  process exit code in both configurations: pass yields 0, fail yields the
  encoded code.
- A milestone test asserting "signature present AND exit code correct" is
  therefore implementable on this host today.

## WHAT THIS DOES NOT ESTABLISH

- Nothing about Phone Zero's architecture.
- Nothing about whether RISC-V is the right physical ISA.
- Nothing about OpenSBI vs bare M-mode for the real target. Both work here;
  which one Phone Zero should use remains an open architecture decision.
- Nothing about physical hardware.
- Nothing about performance, battery, or any product property.

## REPRODUCTION

On a host with qemu-system-riscv64 installed system-wide, `build.sh` and a
direct qemu invocation reproduce the above without the unpacked-package
workaround. The workaround exists only because this host has no
passwordless sudo and no installed QEMU.
