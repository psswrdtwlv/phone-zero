# Prompt 04 — Milestone 1 Implementation Contract

Status: DRAFT / DO NOT EXECUTE YET

Execution gate:
Only after Genesis v0.1, adversarial review, founder decisions,
Architecture v0.2 and sufficient architecture freeze.

MODE: IMPLEMENTATION CONTRACT

Address: Milestone 1
(from ARCHITECTURE GENESIS v0.1, after review corrections).

Rules:

- Implement ONLY Milestone 1. Nothing from Milestone 2 and beyond.
- No speculative abstractions. No future-proofing layers.
- Every file must be justified by Milestone 1's Definition of Done.
- If a Milestone 1 requirement is ambiguous, choose the simplest reading,
  implement it, and list the ambiguity at the end.
- Build must be reproducible with ONE documented command.
- CI must assert the expected boot signature automatically.
- Include a `make test` style entry point that boots the virtual device.
- Do not write design documents beyond what the code needs.
- Do not add TODOs, stubs, or placeholder APIs.

Before writing code, print the exact file list you will create,
with one line of intent per file.

Then implement.

Stop after Milestone 1 passes.

Report:

- what was built
- what was proven
- what is still fake
- what Milestone 2 should be
