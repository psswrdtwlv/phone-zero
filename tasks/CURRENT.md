# CURRENT TASK

## Phase

ARCHITECTURE / PRE-IMPLEMENTATION

## Current gate

FOUNDER DECISION — D1 first, then D2–D5

## Immediate task

ChatGPT executed `prompts/03_ADVERSARIAL_REVIEW.md` as a hostile independent
reviewer against canonical Genesis. The review is saved verbatim at
`reviews/ADVERSARIAL_REVIEW.md`.

Returned verdict: **CORE PRODUCT ASSUMPTIONS MUST BE TESTED BEFORE ARCHITECTURE
FREEZE**, with 8 blockers and 10 founder questions.

Bunny's response, including disagreements with evidence, is recorded at
`reviews/ADVERSARIAL_REVIEW_RESPONSE.md`.

**STOP.** The next action belongs to Nikita, and to nobody else.

Founder decides, in the response file's §4, in this order:

- **D1** Is a research-only outcome acceptable? Upstream of everything else.
- **D2** Target retail price and initial viable volume.
- **D3** Which one or two user-perceivable properties must be beaten.
- **D4** First buyer, first market/carrier, minimum essential-app set.
- **D5** Stop conditions and capital ceiling before further hardware work.

Answers are recorded in `docs/DECISIONS.md` and/or `docs/founder/`.

## Completed

Historical recovery attempted and recorded:
`evidence/recovery/PROMPT_01_RECOVERY.md`.

RESULT:

- Exact historical `prompts/01_PRODUCT_FIRST_GENESIS.md` body: NOT RECOVERED.
- Historical `ARCHITECTURE_GENESIS_v0.1.md`: DID NOT EXIST at any revision.
- Genesis v0.1 was written from the repository's preserved requirements. Its
  header says so.

`docs/architecture/ARCHITECTURE_GENESIS_v0.1.md` exists, was independently
reviewed at `4ac4091`, and is UNCHANGED by that review.

Adversarial review response recorded: 26 findings (R-01…R-26), 7
contradictions (C-01…C-07), 3 partial disagreements with cited line evidence
(D-01, D-02, D-03), 1 contested provenance claim (D-05), 4 recorded agreements
(D-04, D-06, D-07 plus D-03's concession).

Two factual overclaims in Genesis were found and are recorded, NOT fixed:
- C-04: B2 is called "fully provable" in QEMU; the reviewer is right that
  image-level packet counting cannot prove product-level absence of telemetry.
- C-06: the §11 "What works" bullet asserts handset properties with no evidence,
  although the surrounding prose already denies the consumer reading.

Fixing either requires a separate explicit decision. Do not edit Genesis.

## Explicitly blocked

Do NOT:

- implement, scope or discuss Milestone 1 before D1–D5;
- write kernel or OS code;
- revise Genesis v0.1 in response to the review without an explicit separate
  decision;
- re-execute Prompt 03;
- guess, infer or pre-empt any founder decision, including D1;
- decide OpenSBI vs bare M-mode;
- freeze RISC-V or a physical ISA;
- freeze a physical SoC;
- freeze the language strategy;
- start custom PCB work;
- execute Prompt 04;
- manufacture missing historical artifacts from guesses;
- treat Genesis v0.1 as approved, frozen or correct;
- treat any conclusion inside Genesis as evidence.
