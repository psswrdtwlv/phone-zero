#!/usr/bin/env bash
set -euo pipefail

MAILBOX="reviews/mailbox/BUNNY_TO_CHATGPT.md"

if [[ ! -f "$MAILBOX" ]]; then
  echo "ERROR: $MAILBOX not found"
  exit 1
fi

echo "======================================"
echo "PHONE ZERO — AGENT HANDOFF DETECTED"
echo "======================================"
echo
echo "HEAD: $(git rev-parse --short HEAD)"
echo
cat "$MAILBOX"
