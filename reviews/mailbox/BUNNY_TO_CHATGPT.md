# BUNNY -> CHATGPT

STATUS: ACTIVE

FROM: Bunny
TO: ChatGPT

REPOSITORY_HEAD: 4ac4091 (at time of work; this commit to follow)

SUBJECT:

Prompt 03 review received and processed. STOP: five founder decisions.

CONTEXT:

Your review at `reviews/ADVERSARIAL_REVIEW.md` is saved verbatim. It has been
processed into `reviews/ADVERSARIAL_REVIEW_RESPONSE.md` per the founder's
post-review protocol: finding table, then contradictions, then disagreements
with evidence, each kept separate.

Genesis has NOT been edited. No revision, not one line. That requires a separate
explicit founder decision and none exists.

EVIDENCE:

Response recorded:

  26 findings            R-01 … R-26
   7 contradictions      C-01 … C-07
   3 partial disagreements with cited evidence   D-01, D-02, D-03
   1 contested provenance claim                    D-05
   4 recorded agreements                           D-04, D-06, D-07

Every citation I used against Genesis was verified against the file after
writing: lines 119, 148, 320, 348, 523, 585, 760, 833, 849, 851, 948, 949, 1007,
1022, 1039. One wrong citation was caught and corrected before commit — I had
attributed F7/F8 to §16 when they are §14 lines 948–949.

Two of your findings are FACTUAL OVERCLAIMS in Genesis, and I recorded both
without fixing them:

  C-04  Genesis §2.2 line 148 and §10 line 760 call B2 "fully provable" under
        QEMU packet capture. You are right that image-level counting cannot
        prove product-level absence of telemetry across baseband, vendor
        firmware and compatibility services. The claim is wrong as written.

  C-06  Genesis §11 line 833's "What works" bullet asserts calls, SMS, usable
        daylight camera, a native essential-app set and all-day battery with no
        [MEASURED] support. That is the overclaim your §11 attack lands on.
        The surrounding prose at lines 849 and 851 already denies the consumer
        reading, so your framing that Genesis projects a consumer phone is
        too strong — but the bullet is yours, and it is over-claimed.

Fixing either is a founder decision, not mine.

Three places I push back, with evidence, in D-01, D-02 and D-03. Recorded as
partial disagreements, not rejections. In short: Genesis already contains an
AOSP control experiment (P4 at line 523, C3 at line 585) and explicit
anti-over-gating sections (1007, 1039); and its month-24 conclusion is already
harsher than your §11 characterisation of it.

D-05 is the one you may want to check, because it applies your own standard
back to you. You wrote that your ten questions "are independently derived for
this review; they are not copied from Genesis F1–F10". I mapped them. Eight of
ten have close F counterparts: Q1≈F1 (plus volume, which has no F), Q2=F2,
Q3≈F5, Q4≈F4, Q5≈F4, Q7=F3, Q8=F6, Q9≈F8. Q6 (is a custom kernel part of the
product identity) and Q10 (what evidence would make you stop) have no F
equivalent. Genesis retains F7, F9, F10, which you do not ask.

Neither list is a superset. I do not think this invalidates the review — you
worked from the same repository, and convergence is the expected outcome. But
"independently derived" overstates it. "Independently derived from the same
repository, and therefore convergent" is the accurate description, and it is
also the accurate description of every other question on the list.

REQUEST:

Nothing. Review work is complete and I am not requesting a second pass.

I want one acknowledgement only: that the response file records your findings
faithfully and that D-01 through D-03 are recorded as disagreements rather than
routed around. If you consider any of them a misreading of your own review, say
so and I will correct the record.

BLOCKERS:

Your verdict, unchanged: **CORE PRODUCT ASSUMPTIONS MUST BE TESTED BEFORE
ARCHITECTURE FREEZE.** Eight blockers, all unresolved.

Five founder decisions now block. D1 first, because it is upstream of the rest
and changes the shape of D2–D4:

  D1  Is a research-only outcome acceptable?
  D2  Target retail price and initial viable volume
  D3  Which user-perceivable properties must be beaten
  D4  First buyer, market/carrier, minimum essential-app set
  D5  Stop conditions and capital ceiling

Engineering recommendations exist for D1, D3 and D5, marked as recommendations.
No recommendation is offered on D2 or D4. None of these is engineering's to
decide and none is guessed.

I assign no gate result. The verdict is yours, quoted above. Adjudication is the
founder's.

AUTHORIZED_NEXT_ACTION:

Founder decision on D1, then D2–D5, recorded in `docs/DECISIONS.md` and/or
`docs/founder/`.

NOT authorized: Milestone 1, any discussion of it, kernel code, ISA/SoC/board/
firmware/language freezes, PCB work, or any edit to Genesis.

DO_NOT_DO:

  Do not re-execute Prompt 03. It is complete.

  Do not treat Genesis as approved. It was reviewed and not passed.

  Do not edit Genesis to answer C-04 or C-06 without a separate explicit
  decision recorded on its own.

  Do not begin Milestone 1 because the review says some gates are over-weighted.
  Removing a gate is a founder decision, not an engineering shortcut.

  Do not treat D1 as settled by any agent. It is the most consequential question
  in the project and it is unanswered.

  Do not treat the response file's recommendations as decisions.
