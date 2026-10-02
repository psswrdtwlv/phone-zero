# ADVERSARIAL REVIEW RESPONSE

Status: **EMPTY — NO REVIEW RECEIVED.**

Author: Bunny
Governing instruction: founder instruction of 2026-10-03, items 7–10.

This file is a scaffold created **before** any review exists, so that the result
is processed mechanically rather than improvised under pressure. It contains no
findings, no assessment, and no expectation about the outcome.

Nothing here may be read as predicting, hinting at, or favouring any verdict.

## PRECONDITION

Populate this file only after `reviews/ADVERSARIAL_REVIEW.md` exists, containing
the ChatGPT review **verbatim**.

Rules, in force before the first row is written:

1. `reviews/ADVERSARIAL_REVIEW.md` is saved verbatim. Not edited. Not summarised
   in place. Not corrected for typos, tone, or factual errors — including errors
   about this repository. A review is a record of what was actually returned.
2. Genesis is **not** revised automatically. Any edit to Genesis requires a
   separate explicit decision, recorded as its own change with its own evidence.
3. Disagreement is recorded, not enacted. Bunny does not reject findings.

## SECTION 1 — FINDING TABLE

One row per discrete finding in the review.

| # | Review finding (verbatim or quoted) | Affected Genesis section | Evidence needed to settle it | Bunny response | Founder decision required? |
|---|---|---|---|---|---|
| _(none — no review received)_ | | | | | |

Column notes:

- **Review finding** — quote, do not paraphrase away force.
- **Affected Genesis section** — use Genesis's own numbering, which does **not**
  match Prompt 03's numbering. See the mapping table in
  `reviews/HANDOFF_TO_CHATGPT.md`.
- **Evidence needed** — the cheapest thing that would settle it, or
  `UNOBTAINABLE` if no such evidence exists.
- **Bunny response** — one of: `ACCEPT` / `ACCEPT WITH EVIDENCE` / `DISAGREE,
  evidence in section 3` / `BLOCKED, needs founder` / `NO RESPONSE YET`.
  Nothing else. In particular, no response may be phrased so as to defer a
  founder decision back to the founder without stating the decision.
- **Founder decision required?** — `YES` / `NO`. Every `YES` triggers STOP.

## SECTION 2 — CONTRADICTIONS BETWEEN REVIEW AND GENESIS

Every point where the review and Genesis cannot both be true. Not reconciled, not
resolved — listed.

| # | Genesis says | Review says | Nature of contradiction | Which is better supported | Resolvable by evidence? |
|---|---|---|---|---|---|
| _(none — no review received)_ | | | | | |

Notes:

- "Which is better supported" must cite evidence, not preference.
- A contradiction that cannot be resolved by evidence is a founder decision, and
  belongs in section 4.
- Some contradictions may be terminological rather than substantive. Flag which.

## SECTION 3 — FINDINGS BUNNY DISAGREES WITH, WITH EVIDENCE

Recorded in full even where Bunny believes the finding wrong. Rejecting a finding
is not within Bunny's authority; recording disagreement is.

| # | Review finding | Bunny's disagreement | Evidence Bunny offers | Evidence ChatGPT offered | Status |
|---|---|---|---|---|---|
| _(none — no review received)_ | | | | | |

Rules:

- Every row must cite Bunny's evidence by file path or by reproducible command.
- An assertion that a Genesis claim is "obviously" true is not evidence.
- Bunny may not mark a finding `REJECTED`. Permitted statuses: `RECORDED,
  UNRESOLVED` / `RECORDED, FOUNDER DECISION REQUIRED` / `AGREES AFTER REVIEW`.
- If Bunny cannot produce evidence, the honest entry is
  `RECORDED — NO COUNTER-EVIDENCE OFFERED`.

## SECTION 4 — FOUNDER DECISIONS REQUIRED BY THE REVIEW

Written as the AGENTS.md founder format. Populated only from what the review
actually requires. Bunny does not add decisions here speculatively.

### DECISION REQUIRED D<n>

- **DECISION REQUIRED** — exact question, as the review frames it.
- **WHY IT MATTERS** — what changes depending on the answer.
- **OPTIONS** — as enumerated by the review, verbatim where the review enumerated.
- **CONSEQUENCES** — per option.
- **RECOMMENDATION IF APPROPRIATE** — engineering's recommendation, marked as a
  recommendation. Or explicitly withheld with a reason.

**STOP after writing this section.** No Genesis edit, no Milestone 1 discussion,
no implementation, no inferred answer.

## SECTION 5 — STOP CONDITIONS TRIGGERED

| Condition | Triggered | Action taken |
|---|---|---|
| Review requires a founder decision | ☐ | STOP |
| Review identifies a blocker | ☐ | STOP, do not route around by implementation |
| Genesis requires revision | ☐ | Await explicit decision; do not edit |
| Milestone 1 discussed prematurely | ☐ | Refuse |

## SECTION 6 — STATE AFTER REVIEW, ONCE RECEIVED

To be completed only with received review in hand.

- Prompt 03 verdict as returned: _(pending)_
- Number of findings: _(pending)_
- Number of contradictions with Genesis: _(pending)_
- Number of findings Bunny disagrees with: _(pending)_
- Founder decisions required: _(pending)_
- Next authorized action: **(pending — determined by the review plus founder
  decisions, not by Bunny)_