# Prompt 01 and Genesis v0.1 — historical recovery record

Date: 2026-10-03
Agent: Bunny
Gate at time of record: ARCHITECTURE GENESIS v0.1

## PURPOSE

`tasks/CURRENT.md` requires recovering the exact historical body of
`prompts/01_PRODUCT_FIRST_GENESIS.md` and determining whether an
`ARCHITECTURE GENESIS v0.1` already exists in historical material, before
Genesis is written.

This file records what was searched and what was found. It is the evidence
for the provenance gap recorded in the Genesis header.

## SEARCHES PERFORMED

All executed in `/home/nikita/Рабочий стол/phone-zero` and `/home/nikita`.

| # | Search | Command | Result |
|---|---|---|---|
| 1 | Every commit's changed files | `git log --all --oneline --stat` | 8 commits. `prompts/01_PRODUCT_FIRST_GENESIS.md` appears once, at `a33e338`, as a 30-line placeholder. No commit ever touches a `*GENESIS*` output file. |
| 2 | Every path ever in history | `git rev-list --all --objects` | 3 matches: `docs/architecture/` (dir), `docs/architecture/PROJECT_HISTORY.md`, `prompts/01_PRODUCT_FIRST_GENESIS.md`. No `ARCHITECTURE_GENESIS_v0.1.md` blob has ever existed. |
| 3 | Per-commit name scan | `for c in $(git rev-list --all); do git show $c --name-only; done` | no commit adds a Genesis artifact. |
| 4 | Reflog | `git reflog --all` | only the 8 commits; nothing rewritten or dropped. |
| 5 | Stash | `git stash list` | empty. |
| 6 | Unreachable/dangling objects | `git fsck --lost-found`, `git fsck --unreachable --dangling` | exactly one dangling blob, `23c2e7e4`. Inspected with `git cat-file -p`: it is a variant of `AGENTS.md`, not Prompt 01. |
| 7 | Filesystem, project-local | `find . -maxdepth 3 -type d -iname "*phone*" -o -iname "*zero*"` | only `./Рабочий стол/phone-zero`. No second copy, no archive. |
| 8 | Filesystem, user-wide | `find /home/nikita -maxdepth 5 -iname "*genesis*" -o -iname "*01_PRODUCT*" -o -iname "*prompt*01*"` | only the placeholder itself. |
| 9 | Agent conversation archives | `grep -ril "phone zero" ~/.claude ~/.config/Claude ~/.codex` | zero matches. `~/.codex` is 105 MB, `~/.config/Claude` 16 MB — both were searched and contain no reference to the project. |

Searches 6–9 are new; searches 1–5 were already reflected in the repository state.

## FINDINGS

**F1. The exact historical Prompt 01 body is NOT recoverable from anything
accessible.** It is not in git history, not in any git object including
dangling ones, not on the filesystem, and not in the local agent
conversation archives of any installed agent.

**F2. `ARCHITECTURE_GENESIS_v0.1.md` has never existed in this repository.**
Search 2 is conclusive: no blob with that name exists at any revision.

**F3. Substantive requirements ARE preserved in the repository.** They exist
in four places, and they are not guesses:

- `prompts/01_PRODUCT_FIRST_GENESIS.md` — an 11-bullet "known requirements
  from established project history" list, explicitly labelled CONTEXT ONLY
  and explicitly NOT the canonical prompt.
- `docs/architecture/PROJECT_HISTORY.md` — product-first correction, the
  10 architecture principles, the 12-step sequence, the resource assumption.
- `docs/PROJECT_STATE.md` — established principles, agreed sequence, the ten
  open founder decisions, the eleven open risks, the "do not do yet" list.
- **`prompts/03_ADVERSARIAL_REVIEW.md` — present and complete, 16 sections.**

**F4. Prompt 03 is the strongest available specification of Genesis.** It is
an adversarial review *of Genesis v0.1*, and it addresses it section by
section: section 11 "WHAT THE USER ACTUALLY GETS IN 24 MONTHS", section 2
"MUST MATCH / MUST BEAT / CAN LOSE", section 8 "ECOSYSTEM REALITY CHECK",
section 14 "HONEST STATUS", section 16 "THE 10 FOUNDER QUESTIONS", and
eleven more. A reviewer that attacks those sections cannot do so unless the
artifact contains them.

Genesis v0.1 was therefore structured so that every section Prompt 03 names
exists and is answerable, which is the strongest available substitute for the
missing Prompt 01 body.

## F5. COVERAGE AUDIT AGAINST PROMPT 03 — ONE REAL GAP FOUND AND CLOSED

The claim above is only worth something if it is checked. It was.

Method: Prompt 03 names 16 numbered attack sections. For each, the Genesis
section that answers it was identified by machine (`grep -nE '^(##|###) '` on
both files) and compared against the attack list.

Result of the first pass: **15 of 16 covered, 1 missing.**

**GAP FOUND: Prompt 03 section 6 "COST ARCHITECTURE UNDER ATTACK" had no
corresponding Genesis section.** Cost appeared only in passing — per-differentiator
BOM impacts, blocker B-3, weakest decision W4. That was not enough for a
reviewer whose entire section is an attack on cost, and it mattered because
§1 makes lower cost the **load-bearing claim** of the product thesis. Shipping
Genesis with its own thesis claim unaddressed by the section a reviewer would
attack would have been the worst possible gap to leave.

**CLOSED.** `§6 COST ARCHITECTURE` was written, with 7 subsections, including a
cost model whose magnitude cells are deliberately `UNKNOWN` rather than invented
(see §6.4), and a falsification table C1–C5 (§6.6). §6.3 states the finding that
most threatens the thesis, and it confronts ChatGPT's standing premise objection
in `reviews/mailbox/BUNNY_TO_CHATGPT.md` OPEN QUESTION 1 directly rather than
avoiding it.

Final coverage: **16 of 16.** Genesis sections 0–17 are contiguous.

### Structural verification performed

| Check | Result |
|---|---|
| Genesis sections contiguous 0–17 | PASS |
| Genesis line count matches every claim made about it | PASS (1018, after adding a missing trailing newline) |
| Subsection numbers match their parent section | PASS (7 defects found and fixed) |
| All 55 internal `§N` / `§N.M` references resolve to a real heading | PASS |
| Markdown tables well-formed (19 tables) | PASS |
| No heading lost its markdown level during renumber | PASS (7 restored) |
| No currency or price figure anywhere in the artifact | PASS (1 fabricated figure found and removed) |
| Counts quoted in state files match the artifact | PASS (3 wrong counts found and corrected) |

Defects found and fixed during this audit, all introduced by this agent while
renumbering sections 6–16 up by one to make room for the new §6:

1. Two renumber steps omitted (8→9, 11→12), which collided two heading numbers.
2. `###` subsection prefixes were not renumbered, leaving `### 9.1` sitting under
   `## 10`, and `### 6.x` under `## 7` — duplicate numbering across the document.
3. One reference `See §6.` was not renumbered because the sentence-ending period
   was read by the renumber regex as a subsection marker.
4. Two wrong references introduced in the new §6 text: `B3` cited as §3.3 when it
   is defined in §2.2, and the footprint claim cited as §8 when it is §4.3.
5. A repair script consumed the `### ` prefix from 7 headings and failed to write
   it back, flattening them to plain text.
6. **Fabricated cost figures.** The B1 row in §2.2 carried invented BOM numbers
   (`+$3–6` for a larger battery, `−$2–4` for a smaller SoC). These were
   presented as fact in a table while §6.4 declares every cost cell `UNKNOWN` by
   design. That is the exact fabricated precision §6 exists to prevent, and it
   would have handed ChatGPT a legitimate finding against the document's
   honesty. Replaced with a qualitative direction plus a pointer to §6.4. Caught
   by an automated scan for currency figures, which is now part of the
   verification below.
7. Five separate count claims across three files were mutually inconsistent and
   wrong: architecture decisions stated as "eight, five open" (actual: ten —
   4 APPROVED / 3 HYPOTHESIS / 3 OPEN), founder decisions as "13" (actual: 10),
   and reference counts as 52 and 54 (actual: 55). All corrected against the
   artifact rather than against the earlier draft.

All seven were caught by the verification above rather than shipped. No external
file referenced Genesis section numbers, so the renumber broke no cross-document
reference; this was checked before renumbering, not assumed.

## PROVENANCE GAP — DECLARED

```
Prompt 01 canonical body          NOT RECOVERED. Provenance gap.
Genesis v0.1 historical output   DOES NOT EXIST (search 2). Nothing was overwritten.

Genesis v0.1 was therefore written from the repository's own canonical
requirements, NOT reconstructed from memory and NOT presented as a recovered
artifact.

Consequence for review: Prompt 03 will attack a Genesis that was authored
without its original brief. Section 14 "HONEST STATUS" in particular should be
read knowing that MUST BEAT candidates were selected by Bunny from first
principles rather than recovered from a founder-approved list, so the set may
differ from what the founder intended.
```

## WHAT THIS RECORD DOES NOT CLAIM

- It does not claim Prompt 01 could never be recovered. It was not in anything
  this agent can access. The founder may still hold it.
- It does not claim the recovered-requirements reading of Prompt 01 is complete.
  Eleven bullets is not a brief.
- It does not claim Genesis v0.1 is approved. Approval is not Bunny's to give,
  and no ChatGPT review exists yet.