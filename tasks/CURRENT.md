# CURRENT TASK

## Phase

ARCHITECTURE / PRE-IMPLEMENTATION

## Current gate

ADVERSARIAL ARCHITECTURE REVIEW -- Prompt 03, executed by ChatGPT

## Immediate task

ChatGPT executes `prompts/03_ADVERSARIAL_REVIEW.md` as a hostile independent
reviewer, against the canonical Genesis read from GitHub:

    docs/architecture/ARCHITECTURE_GENESIS_v0.1.md

Brief, hazards and post-review protocol:
`reviews/HANDOFF_TO_CHATGPT.md`

Bunny does not execute Prompt 03 and does not review its own work. No verdict is
requested, predicted or favoured.

## Completed

Historical recovery attempted and recorded:
`evidence/recovery/PROMPT_01_RECOVERY.md`.

RESULT:

- Exact historical `prompts/01_PRODUCT_FIRST_GENESIS.md` body: NOT RECOVERED.
  Searched all git history, all git objects including the single dangling blob,
  reflog, stash, the filesystem, and every local agent conversation archive.
- Historical `ARCHITECTURE_GENESIS_v0.1.md`: DID NOT EXIST at any revision.
  Nothing was overwritten.
- Genesis v0.1 was therefore written from the repository's preserved
  requirements. It is a reconstruction, not a recovered artifact, and its header
  says so.

`docs/architecture/ARCHITECTURE_GENESIS_v0.1.md` exists at `de45bed`,
unreviewed, architecture NOT frozen.

## After the review arrives

Governing instruction: founder instruction of 2026-10-03, items 7-10.

1. Save the review verbatim as `reviews/ADVERSARIAL_REVIEW.md`.
2. Do NOT revise Genesis automatically.
3. Populate `reviews/ADVERSARIAL_REVIEW_RESPONSE.md`: finding table, then
   contradictions, then disagreements with evidence, separately.
4. If a founder decision is required: STOP.
5. If a blocker is identified: STOP. Do not route around it by implementation.
6. Milestone 1 may be discussed only after the review and founder decisions.

## Explicitly blocked

Do NOT:

- implement Milestone 1;
- discuss or scope Milestone 1 before the review and founder decisions;
- write kernel or OS code;
- revise Genesis v0.1 before the review is received, or in response to it
  without an explicit separate decision;
- decide OpenSBI vs bare M-mode;
- freeze RISC-V or a physical ISA;
- freeze a physical SoC;
- freeze the language strategy;
- start custom PCB work;
- execute Prompt 04;
- manufacture missing historical artifacts from guesses;
- treat Genesis v0.1 as approved, frozen, reviewed, or correct;
- treat any conclusion inside Genesis as evidence;
- execute Prompt 03 as Bunny, or review Bunny's own work;
- nudge, hint, or predict the review outcome;
- guess a founder decision.