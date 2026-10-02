# PHONE ZERO — PROJECT HISTORY

## Purpose

This document preserves project continuity between Nikita, Bunny and ChatGPT.

It is a curated history, not a replacement for raw conversation archives.

## Founder

Nikita.

## Original ambition

Investigate whether a new mobile platform can eventually produce a consumer
device that is substantially cheaper than contemporary flagship phones while
remaining competitive on the user-visible properties that matter.

The goal is not to clone an iPhone.

The project must discover which properties must match flagships, which can
genuinely beat them, and which compromises users can tolerate.

## Phone Zero

Phone Zero became the working name for the experimental platform.

Phone Zero begins virtually.

The virtual system exists to test architecture cheaply before committing to
physical hardware.

Virtualization is not allowed to become an excuse for indefinitely avoiding
hardware evidence.

The intended experimental progression is:

virtual Phone Zero
-> usable virtual smartphone platform
-> development hardware
-> reference hardware
-> physical prototype
-> production feasibility

## Founder/resource assumption

Initial execution assumption:

one founder + AI engineering agents + limited capital.

Architecture must not quietly assume that a large engineering organization
already exists.

Hiring may happen later if evidence justifies the project.

## Product-first correction

The project deliberately moved away from:

"choose CPU -> write kernel -> eventually discover what product we built"

toward:

"define product thesis -> identify differentiators and constraints ->
choose architecture -> design experiments -> implement only what proves
important assumptions."

## Architecture principles established

- Product before kernel.
- MUST MATCH / MUST BEAT / CAN LOSE.
- Custom kernel requires product justification.
- RISC-V is not automatically the final consumer ISA.
- Ecosystem is architecture, not a future marketing problem.
- Cost/BOM is architecture.
- Virtual-first does not mean virtual-forever.
- Claims require evidence.
- AI agents do not award themselves PASS.
- Founder decisions must not be invented by agents.

## Established sequence

1. Product-First Architecture Genesis
2. ARCHITECTURE GENESIS v0.1
3. Adversarial Architecture Review
4. Independent review
5. Founder decisions
6. ARCHITECTURE v0.2
7. Sufficient architecture freeze
8. Milestone 1 contract
9. Implementation
10. Evidence
11. Independent review
12. Next gate

## Adversarial review

Prompt 03 exists specifically to attack Genesis rather than defend it.

Its important concerns include:

- whether the claimed differentiators are measurable;
- whether a custom kernel is actually necessary;
- ecosystem and banking/application compatibility;
- realistic BOM at low and medium production volume;
- capacity of one founder plus AI;
- what QEMU can and cannot prove;
- camera/ISP/GPU/modem/RF/power/certification/manufacturing;
- what a realistic device looks like after 24 months;
- existential assumptions capable of killing the project.

## Milestone discipline

Prompt 04 exists but is intentionally gated.

It must NOT be executed merely because it exists.

Milestone 1 begins only after the architecture/review/founder-decision gates
authorize it.

## Agent collaboration

Nikita is founder and final product authority.

Bunny performs engineering/implementation work and produces evidence.

ChatGPT performs architecture work and independent review.

The repository is shared persistent project memory.

GitHub is the communication bus.

Conversation memory may provide historical context but must not silently
override verified repository state.

## Current historical gap

The exact canonical body of the approved Product-First Architecture Genesis
prompt has not yet been copied into this repository.

Do not invent it.

The exact ARCHITECTURE GENESIS v0.1 output must also be recovered if it
already exists in historical conversation material.

Until that is resolved, implementation remains blocked.
