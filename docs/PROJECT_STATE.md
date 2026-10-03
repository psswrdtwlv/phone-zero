# PHONE ZERO — PROJECT STATE

Last updated: 2026-10-03

## Project

Phone Zero

## Founder

Nikita

## Current phase

ARCHITECTURE / PRE-IMPLEMENTATION

## Product thesis

Explore whether a fundamentally different mobile hardware/software platform
can eventually deliver:

FLAGSHIP-CLASS EXPERIENCE
+
MEANINGFUL USER ADVANTAGES
+
SUBSTANTIALLY LOWER COST

Phone Zero is the experimental machine used to test this thesis.
It is not automatically the final consumer product.

## Current architecture

NOT FROZEN.

ARCHITECTURE GENESIS v0.1 exists as a DRAFT:
`docs/architecture/ARCHITECTURE_GENESIS_v0.1.md`.

It has now been independently reviewed. The review is saved verbatim at
`reviews/ADVERSARIAL_REVIEW.md`. Its returned verdict is:

**CORE PRODUCT ASSUMPTIONS MUST BE TESTED BEFORE ARCHITECTURE FREEZE.**

Genesis remains unapproved and unfrozen. It carries a declared provenance gap:
the canonical historical Prompt 01 body was never recovered (see
`evidence/recovery/PROMPT_01_RECOVERY.md`), so the artifact was reconstructed
from the repository's own preserved requirements.

Of its ten architecture decisions, three are explicitly OPEN and three are
HYPOTHESIS; the four marked APPROVED are pre-existing project principles, not
new architecture. Nothing is frozen.

The review response is recorded at `reviews/ADVERSARIAL_REVIEW_RESPONSE.md`:
26 findings, 7 contradictions, 5 founder decisions (D1–D5). Genesis has NOT been
edited in response.

## Established principles

- Product before kernel.
- MUST MATCH / MUST BEAT / CAN LOSE.
- Own kernel is a hypothesis, not automatically a product advantage.
- RISC-V is a hypothesis, not automatically the final physical ISA.
- Ecosystem/app compatibility is a first-class risk.
- Cost/BOM is part of architecture.
- Founder starts as one person with AI engineering agents.
- Do not assume a future 100-person team.
- Virtual-first, but simulation must not continue past the point where real
  hardware is required for meaningful evidence.
- Architecture and implementation claims require evidence.
- Agents do not award themselves PASS.

## Agreed project sequence

1. Product-First Architecture Genesis
2. ARCHITECTURE GENESIS v0.1
3. Adversarial Architecture Review
4. Independent architecture review
5. Founder decisions
6. ARCHITECTURE v0.2
7. Architecture freeze sufficient for experiment
8. Milestone 1 contract
9. Implementation
10. Evidence
11. Independent review
12. Next milestone only after gate

## Current gate

FOUNDER DECISION — D1 first, then D2–D5

## Current next action

Founder decides, in `reviews/ADVERSARIAL_REVIEW_RESPONSE.md` §4:

- **D1** Is a research-only outcome acceptable? Upstream of the rest.
- **D2** Target retail price and initial viable volume.
- **D3** Which user-perceivable properties must be beaten.
- **D4** First buyer, first market/carrier, minimum essential-app set.
- **D5** Stop conditions and capital ceiling before further hardware work.

Answers are recorded in `docs/DECISIONS.md` / `docs/founder/`.

ARCHITECTURE GENESIS v0.1 has been independently reviewed; the review is saved
verbatim at `reviews/ADVERSARIAL_REVIEW.md` and its returned verdict is
CORE PRODUCT ASSUMPTIONS MUST BE TESTED BEFORE ARCHITECTURE FREEZE. The
response, including one factual overclaim the reviewer found in Genesis, is at
`reviews/ADVERSARIAL_REVIEW_RESPONSE.md`.

Genesis remains UNEDITED, unapproved and unfrozen. Revising it in response to
the review requires a separate explicit founder decision, which does not exist.

Historical recovery was attempted and its result recorded:
`evidence/recovery/PROMPT_01_RECOVERY.md`. Exact Prompt 01 wording was NOT
recovered; no historical Genesis existed to preserve. The founder authorized
proceeding from the repository's canonical requirements with the gap recorded,
which is what the artifact does.

## Do NOT do yet

- Do NOT implement or scope Milestone 1 before founder decisions D1–D5.
- Do NOT revise Genesis v0.1 in response to the review without an explicit
  separate founder decision.
- Do not treat Genesis v0.1 as approved, frozen, or correct. It has been
  reviewed and it was not passed.
- Do not treat any conclusion inside Genesis as evidence.
- Do not guess or infer a founder decision, including D1.
- Do not start kernel coding.
- Do not freeze physical SoC.
- Do not design custom PCB.
- Do not treat RISC-V as decided.
- Do not treat custom kernel as commercially justified. The review found this
  unproven independently.
- Do not begin hardware implementation.

## Prepared but NOT YET authorized for execution

- Milestone 1 implementation contract / Prompt 04

Prompt 03 is complete and is not to be re-executed.

Prompt 04 is used only after founder decisions D1–D5, an Architecture v0.2 that
incorporates them, and sufficient architecture freeze.

## Major open founder decisions

- Target retail price / price range.
- Specific user-perceivable MUST BEAT properties.
- Acceptable CAN LOSE compromises.

## Major open technical/product risks

- Application ecosystem.
- Justification for custom kernel.
- Kernel architecture.
- Physical ISA / SoC strategy.
- Cost at realistic production volumes.
- Camera/ISP.
- GPU.
- Cellular/modem and RF.
- Power/battery/thermals.
- Security and secure boot.
- Certification/manufacturing.
- One-founder execution capacity.

## Source-of-truth rule

If conversation memory conflicts with verified repository artifacts,
investigate the conflict.

Do not silently overwrite history.
