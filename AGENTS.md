# PHONE ZERO — AGENT PROTOCOL

This repository is the shared source of truth for Phone Zero.

Founder: Nikita.

AI roles:
- Bunny: implementation / repository work / testing.
- ChatGPT: architecture / independent review / technical oversight.
- Nikita: founder / product decisions / final approval.

## BEFORE ANY WORK

Every agent MUST:

1. Read this file.
2. Read docs/PROJECT_STATE.md.
3. Read every artifact referenced by PROJECT_STATE.
4. Run `git status`.
5. Inspect recent history with `git log --oneline -10`.
6. Determine the CURRENT project phase before proposing work.

Conversation memory is NOT the source of truth.
Repository state is.

## PROJECT CONTINUITY

Never assume something is new merely because it appears in the latest prompt.

Distinguish:

CURRENT
ALREADY DONE
ALREADY SENT
APPROVED
REJECTED
SUPERSEDED
NOT YET DONE
UNKNOWN

Do not repeat completed work without new evidence.

## ARCHITECTURE

Do not silently change approved architecture.

If implementation evidence contradicts architecture:

STOP and report:

ARCHITECTURE BLOCKER
EXPECTED
OBSERVED
EVIDENCE
MINIMUM DECISION REQUIRED

## MILESTONES

Never start a milestone without an approved milestone contract.

Never automatically begin the next milestone.

Agents may report evidence.

Agents do NOT award themselves PASS.

## EVIDENCE

Claims such as:

WORKS
FIXED
IMPLEMENTED
FAST
SECURE
COMPLETE

require evidence where reasonably testable.

Prefer:

execution
tests
measurements
logs
inspection
reasoning

in that order where applicable.

## HANDOFF

Bunny records implementation results in the repository.

ChatGPT reviews repository state and evidence.

Important review findings belong in reviews/.

Founder decisions belong in docs/founder/ and/or docs/DECISIONS.md.

Do not use Nikita as a human cache between agents.

## SCOPE

Protect the critical path.

No speculative infrastructure.
No unrelated refactors.
No implementation beyond the current approved milestone.

## END OF SUBSTANTIAL WORK

Report:

CURRENT STATE
WHAT CHANGED
WHAT WAS PROVEN
WHAT REMAINS UNPROVEN
BLOCKER
NEXT GATE
NEXT ACTION
DO NOT DO YET

## CHATGPT <-> BUNNY COMMUNICATION PROTOCOL

Bunny and ChatGPT are collaborating agents on Phone Zero.

They MUST NOT assume that they share conversation memory.

The repository is their shared persistent memory.
GitHub is their communication bus.
Nikita must not be used as a human copy/paste transport between agents.

### BUNNY -> CHATGPT

Bunny MUST request independent ChatGPT review when:

- an architecture artifact is completed;
- a milestone implementation becomes evidence-ready;
- implementation evidence contradicts architecture;
- a high-switching-cost technical decision appears;
- a review gate defined by PROJECT_STATE is reached;
- independent review is explicitly required.

Bunny writes the handoff to:

reviews/HANDOFF_TO_CHATGPT.md

It must contain:

REVIEW TARGET
COMMIT / ARTIFACT
CURRENT STATE
WHAT CHANGED
WHAT WAS PROVEN
WHAT REMAINS UNPROVEN
TEST / EXECUTION EVIDENCE
ARCHITECTURE DEVIATIONS
OPEN QUESTIONS
EXACT REVIEW REQUEST

After creating the handoff, Bunny STOPS at the review gate.

Bunny MUST NOT invent, simulate, predict, or write ChatGPT's review.

### CHATGPT -> BUNNY

ChatGPT independently reads:

AGENTS.md
docs/PROJECT_STATE.md
the referenced artifact or commit
the relevant diff
available evidence
reviews/HANDOFF_TO_CHATGPT.md

ChatGPT records the independent review in:

reviews/CHATGPT_REVIEW.md

The review contains:

REVIEW TARGET
FINDINGS
BLOCKERS
REQUIRED CHANGES
NON-BLOCKING NOTES
EVIDENCE ASSESSMENT
GATE RESULT
NEXT AUTHORIZED ACTION

### VALID GATE RESULTS

PASS

PASS WITH NON-BLOCKING NOTES

CHANGES REQUIRED

BLOCKED — FOUNDER DECISION REQUIRED

No agent may assign another agent's gate result.

### AFTER CHATGPT REVIEW

If the result is CHANGES REQUIRED:

Bunny fixes only the required in-scope issues,
produces new evidence,
updates the handoff,
and requests another independent review.

If the result is BLOCKED — FOUNDER DECISION REQUIRED:

STOP.
Record the exact founder decision required.
Wait for Nikita.

If the result is PASS:

Bunny may continue only to the next action explicitly authorized by
docs/PROJECT_STATE.md and the review.

PASS does NOT authorize arbitrary next-milestone work.

### FOUNDER AUTHORITY

Nikita is founder and final product authority.

Founder decisions must never be guessed by either agent.

Questions requiring founder authority must be written explicitly with:

DECISION REQUIRED
WHY IT MATTERS
OPTIONS
CONSEQUENCES
RECOMMENDATION IF APPROPRIATE

### ANTI-FABRICATION RULE

Never claim:

"ChatGPT approved this"

unless an actual ChatGPT review exists in the repository.

Never claim:

"Bunny verified this"

unless corresponding reproducible evidence exists.

Agent statements are not evidence.

Repository artifacts, commits, tests and reproducible results are the
shared project record.
