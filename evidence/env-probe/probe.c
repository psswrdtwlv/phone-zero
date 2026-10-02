/* Phone Zero environment capability probe.
 * NOT Milestone 1. No Phone Zero kernel code. Single file, deliberately
 * minimal, exists only to prove: can this host build and boot a RISC-V64
 * freestanding binary under QEMU and emit a deterministic serial signature.
 */
typedef unsigned long u64;
typedef unsigned int  u32;

#define UART0   0x10000000UL   /* NS16550A THR, QEMU virt */
#define TEST_DEV 0x00100000UL  /* SiFive test finisher, QEMU virt */
#define PASS_FINISHER 0x5555UL
#define FAIL_FINISHER(code) (0x3333UL | ((u64)(code) << 16))

static void put(char c) { *(volatile u32 *)UART0 = (u32)c; }
static void puts_(const char *s) { while (*s) put(*s++); }
static void fini(u64 code) { *(volatile u32 *)TEST_DEV = (u32)code; for (;;) {} }

void _start(void) {
    puts_("PZ:ENVPROBE_OK\n");
    fini(PASS_FINISHER);
}
