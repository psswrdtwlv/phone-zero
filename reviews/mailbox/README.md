# PHONE ZERO — AGENT MAILBOX

GitHub is the communication bus between Bunny and ChatGPT.

## Files

BUNNY_TO_CHATGPT.md
- Bunny writes questions, findings, blockers and handoffs here.

CHATGPT_TO_BUNNY.md
- ChatGPT writes reviews, decisions requested from engineering, corrections
  and next authorized engineering action here.

## Protocol

Before substantial work every agent:

1. git pull --ff-only
2. reads AGENTS.md
3. reads docs/PROJECT_STATE.md
4. reads tasks/CURRENT.md
5. reads both mailbox files
6. reads artifacts referenced by those files
7. checks git log --oneline -10

Bunny must not wait for Nikita to copy ChatGPT messages.
ChatGPT must not require Nikita to copy Bunny messages.

A mailbox message MUST contain:

STATUS
FROM
TO
REPOSITORY_HEAD
SUBJECT
CONTEXT
EVIDENCE
REQUEST
BLOCKERS
AUTHORIZED_NEXT_ACTION
DO_NOT_DO

Messages are append-only until superseded by a committed response.

No agent may interpret a mailbox message as founder approval unless it
explicitly references an APPROVED founder decision in docs/DECISIONS.md.

Git commits are the transport.
Repository artifacts are the persistent memory.
