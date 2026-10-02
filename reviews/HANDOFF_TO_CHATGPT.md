# HANDOFF TO CHATGPT

Request type: BUNNY -> CHATGPT, independent review gate.

This file requests a review. It does not contain, predict or simulate one.

## REVIEW TARGET

Recovered Phone Zero project state after repository resync, and determination
of which historical artifact(s) are still required before
ARCHITECTURE GENESIS v0.1 can proceed.

## COMMIT / ARTIFACT

Repository HEAD at time of handoff:

    a33e338  docs: recover Phone Zero architecture workflow
    5f27a52  chore: establish Phone Zero project baseline
    7cffc1e  Initial commit

Working tree: clean, branch `main`, tracking `origin/main`.

Artifacts read in full:

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

## CURRENT STATE

Phase: ARCHITECTURE / PRE-IMPLEMENTATION.

Current gate: ARCHITECTURE GENESIS v0.1.

Architecture: NOT FROZEN.

Decision log: empty. No architecture-level founder decisions recorded.

No kernel source, no build system, no tests, no emulator configuration
exist in this repository. The project is documentation and prompts only.

## WHAT CHANGED

Commit `a33e338` recovered the workflow skeleton into the repository:
PROJECT_HISTORY, three prompt files, the prompt registry, CURRENT task,
and updated PROJECT_STATE.

No code was added. No architectural decision was taken.

## WHAT WAS PROVEN

Verified by repository inspection only:

- `docs/PROJECT_STATE.md` and `tasks/CURRENT.md` agree on phase, gate and
  blocked actions.
- `prompts/README.md` correctly gates execution: existence of a prompt does
  not authorize executing it.
- `prompts/03_ADVERSARIAL_REVIEW.md` is present and complete.
- `prompts/01_PRODUCT_FIRST_GENESIS.md` contains a context-only summary and
  an explicit refusal to reconstruct. It is a placeholder, not the prompt.
- No file in the repository claims that ChatGPT or Bunny has approved or
  verified anything. No anti-fabrication violation found.

## WHAT REMAINS UNPROVEN

- Whether an ARCHITECTURE GENESIS v0.1 output exists anywhere in project
  history. The repository contains no such artifact.
- Whether the exact approved Prompt 01 body exists outside the repository.
- Whether the historical Prompt 04 body currently stored is the version the
  founder last approved, or an earlier draft.
- Nothing about runtime behaviour. There is nothing to run.

## TEST / EXECUTION EVIDENCE

None. No builds, no executions, no QEMU runs. This is correct for the
current phase and is recorded here so the absence is not mistaken for a gap.

Commands executed during this handoff, for provenance:

    git pull --ff-only        -> already up to date
    git status                -> clean, main == origin/main
    git log --oneline -3      -> as listed above
    git log -1 --stat         -> a33e338, 7 files, 490 insertions
    git remote -v             -> origin git@github.com:psswrdtwlv/phone-zero.git

## ARCHITECTURE DEVIATIONS

None. No architecture exists to deviate from.

## OPEN QUESTIONS

1. ARCHITECTURE GENESIS v0.1 output: does it exist in historical conversation
   or archive material outside this repository?

2. Prompt 01 canonical body: what is the exact approved text? The founder's
   own words, verbatim, not a reconstruction.

3. Prompt 04 drift: the stored version is a compact 39-line contract. Later
   discussion produced a materially different revision that added founder
   placeholders, a mandatory negative test, a toolchain-proof rule, and
   QEMU bare-metal exit specifics. Which text is canonical? Neither agent
   may assume.

4. Whether recovery of historical artifacts is a founder action, given
   AGENTS.md forbids using Nikita as a transport between agents. Retrieval
   of a past prompt from conversation history is not the same as authoring
   one, but the boundary should be stated explicitly.

## EXACT REVIEW REQUEST

Verify the recovered Phone Zero project state and determine what historical
artifact(s) are still required before ARCHITECTURE GENESIS v0.1 can proceed.

Specifically requested in the independent review:

- confirm or contradict that repository state is internally consistent;
- confirm or contradict that no gate has been silently passed;
- state precisely which artifact is missing and who must supply it;
- flag any fabrication risk in the recovery so far;
- do not write Prompt 01, do not execute Prompt 03, do not execute Prompt 04,
  do not decide OpenSBI vs bare M-mode, do not freeze RISC-V.

Recommended review record location, per AGENTS.md:
`reviews/CHATGPT_REVIEW.md`.

BUNNY STOPS HERE AT THE REVIEW GATE.

DO NOT: implement Milestone 1, write kernel code, decide boot environment,
freeze ISA, freeze physical SoC, execute Prompt 03 or 04, or manufacture
missing historical artifacts.
