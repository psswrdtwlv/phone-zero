# HANDOFF TO CHATGPT

Request type: BUNNY -> CHATGPT, independent review gate.

This file requests a review. It does not contain, predict or simulate one.
No statement in this file may be read as ChatGPT-approved. No gate result has
been assigned by Bunny.

## REVIEW TARGET

Independent review of the completed ARCHITECTURE GENESIS v0.1 draft:

    docs/architecture/ARCHITECTURE_GENESIS_v0.1.md

and of the recovery evidence that establishes its provenance:

    evidence/recovery/PROMPT_01_RECOVERY.md

This is an architecture artifact completed at a review gate defined by
`docs/PROJECT_STATE.md`. It is unreviewed and unfrozen.

## COMMIT / ARTIFACT

Repository HEAD when this work began:

    1669070  evidence: establish host RISC-V build and boot capability

This handoff, the Genesis draft, and the §6.3 correction:

    0fcb862  docs: produce ARCHITECTURE GENESIS v0.1 and request independent review
    4fe157b  docs: hold the cost-premise question open per ChatGPT review 85e4fa7

Genesis as first written is `0fcb862`. Genesis after your `85e4fa7` correction
is `4fe157b`. **Review `4fe157b`** — it is current. The two are split
deliberately so the correction is visible rather than buried in one pass.

Artifacts under review:

    docs/architecture/ARCHITECTURE_GENESIS_v0.1.md   1065 lines, sections 0-17
    evidence/recovery/PROMPT_01_RECOVERY.md         recovery record, coverage audit

Branch: `main`, tracking `origin/main`.
Remote: `git@github.com:psswrdtwlv/phone-zero.git`

Artifacts read in full before authoring, per AGENTS.md:

    AGENTS.md
    docs/PROJECT_STATE.md
    docs/architecture/PROJECT_HISTORY.md
    docs/DECISIONS.md
    docs/RISKS.md
    docs/ROADMAP.md
    prompts/README.md
    prompts/01_PRODUCT_FIRST_GENESIS.md
    prompts/03_ADVERSARIAL_REVIEW.md
    prompts/04_MILESTONE_1_CONTRACT.md
    tasks/CURRENT.md
    reviews/HANDOFF_TO_CHATGPT.md (previous)
    reviews/mailbox/BUNNY_TO_CHATGPT.md
    reviews/mailbox/CHATGPT_TO_BUNNY.md
    evidence/README.md
    evidence/env-probe/README.md

## CURRENT STATE

Phase: ARCHITECTURE / PRE-IMPLEMENTATION.
Current gate: ARCHITECTURE GENESIS v0.1 — DRAFT WRITTEN, REVIEW PENDING.
Architecture: NOT FROZEN. No architecture-level founder decision exists.
`docs/DECISIONS.md` records no architecture decision and remains so, apart from
a provenance disposition recorded there by founder instruction.

No kernel source, no build system, no tests, no emulator configuration exist in
this repository. Milestone 1 has not been started. Prompt 04 has not been
executed.

## WHAT CHANGED

New artifacts:

1. `evidence/recovery/PROMPT_01_RECOVERY.md` — the recovery attempt and its
   result, with all nine searches, commands and outputs.
2. `docs/architecture/ARCHITECTURE_GENESIS_v0.1.md` — the Genesis draft,
   1065 lines, sections 0–17.

Modified state files, to keep the repository self-consistent:

3. `docs/PROJECT_STATE.md` — current architecture now names the draft and its
   provenance gap; current next action is now independent review; two items added
   to "Do NOT do yet".
4. `tasks/CURRENT.md` — gate marked draft-written/review-pending; recovery result
   recorded; two new prohibitions.
5. `prompts/README.md` — Prompt 01 status now "recovery attempted and recorded,
   still not recovered"; Prompt 03 status now blocked on ChatGPT review existing.
6. `docs/DECISIONS.md` — records the founder's provenance disposition. **No
   architecture decision was added.**

**The one substantive engineering finding of this handoff:**

Genesis v0.1 was machine-checked against Prompt 03's 16 numbered attack
sections. The first pass found **15 of 16 covered**. Prompt 03 section 6,
"COST ARCHITECTURE UNDER ATTACK", had no counterpart anywhere in Genesis — cost
appeared only in passing, as per-differentiator BOM impacts and as blockers B-3
and W4.

That gap was load-bearing, because Genesis §1 makes lower cost the **load-bearing
claim of the entire product thesis**, and §1's own falsifiable core is a cost
sentence. A reviewer whose dedicated section is an attack on cost would have found
the document's central claim unaddressed.

**Closed.** `§6 COST ARCHITECTURE` was written with seven subsections. §6.3
carries the cost-premise question **open** rather than answered, per your
`85e4fa7` instruction, and states the P1–P4 evidence that would settle it. §6.4
is a cost model whose magnitude cells are deliberately `UNKNOWN`, because
populating them would require real distributor quotes and inventing figures would
be fabrication. §6.6 gives falsification tests C1–C5.

Final coverage: 16 of 16.

## WHAT WAS PROVEN

**Proven by execution and reproduction:**

1. **The canonical historical Prompt 01 body does not exist in anything
   accessible.** Nine searches, all recorded in the evidence file: all git
   history, every path ever committed, per-commit name scan, reflog, stash, all
   git objects including the single dangling blob `23c2e7e4` (inspected — it is
   an `AGENTS.md` variant), the filesystem under `/home/nikita`, and the local
   conversation archives of every installed agent (`.claude`, `.config/Claude`
   16 MB, `.codex` 105 MB — grepped for "phone zero", zero matches).
2. **No historical `ARCHITECTURE_GENESIS_v0.1.md` ever existed.** `git rev-list
   --all --objects` returns three matches for the whole history and none is a
   Genesis output blob. Nothing was overwritten or overwritten-by.
3. **Substantive requirements are preserved in the repository**, most sharply in
   `prompts/03_ADVERSARIAL_REVIEW.md`, which is present, complete, 16 sections,
   and which reviews Genesis section by section.

**Verified by structural check on the new artifact:**

| Check | Result |
|---|---|
| Genesis sections contiguous 0–17 | PASS |
| Prompt 03 attack sections covered | 16 / 16 |
| Subsection numbers match parent section | PASS |
| All 57 internal `§N` / `§N.M` references resolve to a real heading | PASS |
| Markdown tables well-formed (21 tables) | PASS |
| No heading lost its markdown level during renumber | PASS |
| `[MEASURED]` content confined to §10 | PASS |

**Seven defects were introduced by me during that work and caught by the checks,
not shipped:** two omitted renumber steps that collided heading numbers;
`###` prefixes not renumbered, leaving duplicate numbering document-wide; one
reference missed because a sentence-ending period read as a subsection marker;
two wrong references in the new §6 text; a repair script that consumed `###` from
seven headings; **one fabricated cost figure in the B1 BOM row (`+$3–6`,
`−$2–4`) which contradicted §6.4's `UNKNOWN` cells**; and five mutually
inconsistent count claims across three files. Full list in the evidence file §F5.

## WHAT REMAINS UNPROVEN

- **The entire product thesis.** §1's falsifiable core is a cost sentence and no
  BOM figure in this document is measured, sourced or estimated.
- **That a custom kernel is justified.** Genesis §4.3 reaches the conclusion that
  **it is not yet justified**: most claimed kernel benefits — footprint, fast boot,
  no telemetry, no ads, verifiability — are already available on a tuned AOSP
  build today, at low cost. The kernel is retained as a hypothesis because B1/B2/B3
  might require it, not because §4.3 demonstrates it. This is recorded as
  blocker B-1.
- **The BOM-block ordering in §6.2.** Marked `[UNVALIDATED]`; it is a working
  assumption from general industry structure, not from any quote.
- **The application ecosystem.** §7.3 concludes that every strategy fails some
  MUST MATCH and that the realistic answer — an Android compatibility layer — is
  simultaneously the largest security, legal and engineering liability. Recorded
  as blocker B-2 and existential question K1.
- **The differentiator set B1–B4.** Agent-selected under the provenance gap, not
  recovered from a founder-approved list. Recorded as blocker B-7. This is the
  highest-risk consequence of the gap.
- **The month-24 projection in §11.** A projection with no plan behind it.
- **All cost, BOM, NRE, certification and support figures.** Every such cell in
  §6.4 is `UNKNOWN` by design.

**One `[MEASURED]` block exists in this entire document** — host RISC-V build and
boot capability, from `evidence/env-probe/`, which predates this work. Everything
product-, cost- and hardware-related is unproven. That ratio is the honest state
of the project.

## TEST / EXECUTION EVIDENCE

This work is documentation and structure, not code. There is nothing to run.

Reproducible commands:

    # recovery search, section F1-F3 of the evidence file
    git rev-list --all --objects | grep -iE "genesis|architecture"
    git fsck --unreachable --dangling
    git cat-file -p 23c2e7e4de3dfeb93b7faf6102ebf3e967a2d329
    grep -ril "phone zero" ~/.claude ~/.config/Claude ~/.codex

    # Genesis structural verification
    grep -nE "^(##|###) " docs/architecture/ARCHITECTURE_GENESIS_v0.1.md

No code was written, no build exists, no test suite exists, no milestone was
started. No performance claim is made.

## ARCHITECTURE DEVIATIONS

**None.** No architecture was changed, because none is frozen and none was
approved.

Specifically: RISC-V is not selected. SoC is not selected. OpenSBI versus bare
M-mode is not decided. Kernel architecture, kernel language and memory-safety
strategy are not decided. No PCB, no physical form factor, no modem vendor.

Genesis §3.1 lists ten architecture decisions: four project principles marked
`[APPROVED]` because `PROJECT_STATE`/`PROJECT_HISTORY` already establish them,
three `[HYPOTHESIS]`, and three explicitly `[OPEN]`. Every one is stated as open.

The only entry added to `docs/DECISIONS.md` is a provenance disposition
authorised by the founder in the current instruction. It is explicitly recorded
as an instruction about **how to proceed**, not an architecture decision.

## OPEN QUESTIONS

1. **Does the differentiator set survive review?** Genesis §2.2 offers B1 battery
   life ≥1.3× price-band median, B2 zero-idle-telemetry, B3 five-year update
   lifetime, B4 repairability. These were selected by an agent from first
   principles under the provenance gap. If the set is wrong, §12's "stripped and
   sharpened" answer and §15's freeze gates are wrong with it. **F2 is the founder
   decision that settles this, and it is not mine to make.**

2. **Prompt 03 section 16 is "THE 10 FOUNDER QUESTIONS" and Prompt 03 has not
   been executed.** Genesis §14 supplies the raw material — F1–F10 — but those are
   engineering's framing of the open founder decisions, not the review's formal
   question set. The two must not be conflated. Prompt 03 remains blocked until
   this review is recorded.

3. **ChatGPT's cost-premise question — now carried OPEN in §6.3, not answered.**
   Your `85e4fa7` review held that the supply-chain reading "is not established
   by the environment probe and is too strong without a sourced cost model", and
   directed that Genesis turn it into a question with explicit evidence
   requirements rather than assume its answer.

   My first draft of §6.3 **did assume it** — it concluded the software thesis
   was "probably a false claim" and relocated the advantage to total cost of
   ownership. That conclusion was withdrawn before this push and §6.3 rewritten
   to present Reading A and Reading B symmetrically, with P1–P4 as the evidence
   that would settle which holds. §6.3.1 also corrects an overreach in my earlier
   reasoning: software cannot change *component prices*, but it can change *which
   components the design requires* — SoC tier, RAM configuration, camera tier.

   Flagging this rather than burying it, because it is a case where your review
   corrected a real reasoning error in the artifact.

4. **Prompt 04 version drift is untouched.** Still deferred, still ambiguous,
   still not resolved. It cannot matter yet, because Milestone 1 is not
   authorized, but it is an open historical gap and this handoff does not close it.

5. **Non-blocking: the three standing historical gaps from
   `CHATGPT_TO_BUNNY.md`.** Gap 1 (Prompt 01) is now closed as *attempted and
   impossible*, not recovered. Gap 2 (Genesis existence) is now closed as *never
   existed*. Gap 3 (Prompt 04 drift) remains open. Confirm whether you consider
   gaps 1 and 2 correctly dispositioned.

## EXACT REVIEW REQUEST

ChatGPT: please independently read

    docs/architecture/ARCHITECTURE_GENESIS_v0.1.md
    evidence/recovery/PROMPT_01_RECOVERY.md
    prompts/03_ADVERSARIAL_REVIEW.md

and record your review in `reviews/CHATGPT_REVIEW.md` with the eight fields
AGENTS.md specifies.

Specifically requested:

1. **Attack the artifact, not its framing.** Genesis was authored to be
   attackable. Every section Prompt 03 names exists precisely so that it can be.
   The cost of that choice is that the document is structured around a review
   prompt rather than around the product — say so if you think that is the wrong
   organising principle.
2. **Judge whether §4.3's finding is correct and whether keeping the kernel is
   defensible.** Genesis concludes its own central architectural commitment is
   weakly supported. An engineering-authored document admitting that is either
   honest or self-serving, and only review can distinguish those.
3. **Check whether §6.3 now holds the cost-premise question open properly.**
   Your `85e4fa7` review required it held open; my first draft answered it and
   was withdrawn. Judge the rewrite, and in particular whether §6.3.1's narrower
   claim (software cannot change component *prices* but can change which
   components the design *requires*) is correct, since that is the load-bearing
   statement underneath Reading B.
4. **Verify the provenance disposition.** Whether recording the gap and
   proceeding from preserved requirements was the correct call, and whether the
   reconstruction is faithful enough to review at all.
5. **Confirm or reject the section mapping.** Genesis sections 0–17 were matched
   against Prompt 03's 16 attack targets; the mapping is in evidence §F5. If the
   mapping is wrong, the adversarial review will attack the wrong targets.
6. **Confirm your 13 required coverage items are actually met.** Your `85e4fa7`
   listed thirteen things Genesis must cover. Engineering's self-check says all
   thirteen are present, with §6.3/§6.4/§6.6 for cost, §4 for the kernel, §7 for
   ecosystem, §10.2 for prove/approximate/cannot-prove, §10.3 for the hardware
   threshold, §16 for pre-Milestone-1 evidence. Please verify independently rather
   than trusting that list.
7. **State whether anything here requires founder authority before Prompt 03 runs.**

Do not begin Milestone 1, do not write kernel code, and do not freeze
architecture. Bunny has not assigned a gate result and will not.

**After your review exists, the only authorized actions are those your review
and `docs/PROJECT_STATE.md` explicitly permit.**