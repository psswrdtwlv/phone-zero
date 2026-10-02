# HANDOFF TO CHATGPT

Request type: BUNNY -> CHATGPT.

This file briefs a reviewer. It contains no review, no verdict, no prediction
of one, and no argument that the artifact under review is any good.

## REVIEW TARGET

Execute `prompts/03_ADVERSARIAL_REVIEW.md` as its own text instructs, against
the canonical Genesis read from GitHub:

    canonical artifact   docs/architecture/ARCHITECTURE_GENESIS_v0.1.md
    review contract      prompts/03_ADVERSARIAL_REVIEW.md
    supporting record    evidence/recovery/PROMPT_01_RECOVERY.md

Prompt 03 names its own gate: `ONLY AFTER ARCHITECTURE GENESIS v0.1 EXISTS`.
That condition is met.

## COMMIT / ARTIFACT

Review current `main` on `git@github.com:psswrdtwlv/phone-zero.git`:

    de45bed  docs: record commit, assumptions and founder decisions per review 85e4fa7 step 2
    4fe157b  docs: hold the cost-premise question open per ChatGPT review 85e4fa7
    0fcb862  docs: produce ARCHITECTURE GENESIS v0.1 and request independent review

Genesis as first written is `0fcb862`. Genesis after your `85e4fa7` correction is
`4fe157b`. `de45bed` adds only repository bookkeeping, no Genesis content.

Artifacts verified present in `origin/main` and byte-identical to local:

    docs/architecture/ARCHITECTURE_GENESIS_v0.1.md   1065 lines, sections 0-17
    evidence/recovery/PROMPT_01_RECOVERY.md

## NO PREFERRED OUTCOME

Prompt 03 §14 requires exactly one of five verdicts. **Any of the five is an
acceptable result, and three of them would mean this artifact is substantially
wrong.** Engineering has no stake in which is returned and is not asking for a
particular one.

Specifically, engineering asks for **no** verdict and claims **no** credit for:
the coverage mapping below, the section count, the honesty of the admissions,
the §6.3 correction, or the recovery disposition. Treat all of those as claims
by the author, which is what they are.

**Nothing in Genesis has been independently verified.** Every conclusion in it is
the object of this review, not input to it.

## WHAT ACTUALLY EXISTS AS EVIDENCE

Exactly one thing in this repository is independent evidence, and it predates
Genesis:

    evidence/env-probe/README.md

It establishes host capability only: this host can compile a freestanding
RISC-V64 ELF, boot it under QEMU `virt` in bare M-mode and under OpenSBI, emit a
serial signature, and terminate with a deterministic exit code (0 pass, 42 fail).

Per your `85e4fa7`: this is **not** evidence for architecture, ISA, firmware
strategy, product performance, cost, battery, or hardware feasibility, and **not**
evidence that a RISC-V/QEMU experiment is the right Milestone 1.

**Everything else in this repository is either Genesis reasoning, project
history, or unfalsifiable assertion.** Per Prompt 03 §1: plausible reasoning is
not evidence. Please do not let any Genesis internal citation count as
independent support for a Genesis claim.

## THREE HAZARDS THE REVIEWER SHOULD KNOW ABOUT

Disclosed because they affect review correctness. None is an argument for the
artifact.

### 1. Genesis section numbers do NOT correspond to Prompt 03 section numbers

Prompt 03's numbered sections are **attack topics**, not references to Genesis's
section numbers. They collide numerically in the tail, and Genesis was renumbered
late, so naive cross-referencing misleads:

| Prompt 03 section | Genesis section that actually addresses it |
|---|---|
| 1 Claims I failed to prove | 17 (partly), 15 |
| 2 MUST MATCH / MUST BEAT / CAN LOSE | 2 |
| 3 Five weakest decisions | 3.2 |
| 4 Kernel strategy | 4 |
| 5 Language and memory safety | 5 |
| 6 Cost architecture | 6 |
| 7 Ambitions I did not price | 8 |
| 8 Ecosystem reality check | 7 |
| 9 Things I dodged | 9 |
| 10 Phone Zero reality check | 10 |
| 11 What the user gets in 24 months | 11 |
| 12 Three questions that can kill the project | 12 |
| 13 Stripped and sharpened | 13 |
| 14 Honest status | **15** |
| 15 Architecture freeze gates | **16** |
| 16 The 10 founder questions | **14** |

Rows 14–16 are where the collision bites: `Genesis §14` is OPEN FOUNDER DECISIONS,
not HONEST STATUS. The mapping table above is **engineering's self-assessment and
is itself a claim to check**, not a navigation guarantee. Verify it rather than
trusting it.

### 2. Prompt 03 has an internal inconsistency

Line 18–23 lists **five** items under "CRITICAL PATH SECTION — go here first"
(11, 2, 8, 14, 16). Line 25 then says "Answer **those four** to the required
depth." Engineering has not resolved this and deliberately did not pick one.

### 3. The differentiator set is author-selected

Genesis §2.2's MUST BEAT set (B1–B4) was selected by the author under a
provenance gap, not recovered from a founder-approved list. Genesis records this
as blocker B-7. **This is a defect, disclosed so it is attacked rather than
inherited.** Whether the set is wrong is exactly what Prompt 03 §2 and §13 should
decide.

## PROVENANCE, AS A FACT

The canonical historical Prompt 01 body was not recovered. Searched: all git
history, all git objects including the single dangling blob, reflog, stash, the
filesystem under `/home/nikita`, and the local archives of every installed agent.
Nothing. No historical `ARCHITECTURE_GENESIS_v0.1.md` existed at any revision.

Genesis was therefore written from the repository's preserved requirements and is
a reconstruction, not a recovered artifact. Recorded with commands in
`evidence/recovery/PROMPT_01_RECOVERY.md`.

Prompt 03 §16 requires exactly 10 founder questions with Q1 = target price and
Q2 = which properties to beat. **Genesis §14 contains its own list of 10 founder
decisions (F1–F10). Do not treat that list as your answer.** Prompt 03 requires
you to derive your own 10 independently from what survives your attack.

## WHAT THE AUTHOR EXPECTS TO BE ATTACKED

Listed so the reviewer can prioritise. Not a request for emphasis.

- §4.3 concludes the custom kernel is not yet justified.
- §7.3 concludes every ecosystem strategy fails a MUST MATCH.
- §6.3 holds the cost-premise question open; §6.4 leaves BOM magnitudes `UNKNOWN`.
- §11 projects a research phone at 24 months that an ordinary person would not buy.
- §2.4 concedes L11 (English + Russian first) caps the addressable market.

Treat each as a claim. If any is wrong, say so plainly.

## POST-REVIEW PROTOCOL — AGREED IN ADVANCE

So the result is not litigated afterwards.

1. Save the review **verbatim** as `reviews/ADVERSARIAL_REVIEW.md`. No editing,
   no summarising in place, no correcting ChatGPT's typos or claims.
2. **Do not revise Genesis automatically.** Any change requires a separate,
   explicit decision.
3. Build a table with exactly these columns:
   `review finding -> affected Genesis section -> evidence needed -> Bunny response -> founder decision required?`
4. List separately: every contradiction between review and Genesis.
5. List separately: every review finding the author **disagrees** with, with
   evidence — without unilaterally rejecting it.
6. If the review requires a founder decision: **STOP**, record the exact decision
   needed, wait for Nikita. Do not guess.
7. If the review identifies a blocker: **STOP**. Do not route around it with
   implementation.
8. Milestone 1 may be discussed only after the review and after founder
   decisions.

## EXACT REQUEST

Read `docs/architecture/ARCHITECTURE_GENESIS_v0.1.md` from GitHub and execute
`prompts/03_ADVERSARIAL_REVIEW.md` in full, as a hostile independent reviewer,
against the instructions as written.

Your objective is to find out, as early and as cheaply as possible, why this
project dies. Do not soften it. If a premise does not survive, write that it does
not survive.

Do not begin Milestone 1, do not write kernel or OS code, do not freeze ISA,
SoC, OpenSBI-vs-bare-M-mode, language strategy or PCB, and do not revise Genesis.

Bunny has not assigned a gate result and will not. `PASS` is not sought;
`CHANGES REQUIRED`, `MAJOR CORRECTIONS`, `PRODUCT PREMISE REQUIRES
RECONSIDERATION` and `BLOCKED` are all acceptable returns.