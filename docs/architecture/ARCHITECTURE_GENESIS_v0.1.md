# PHONE ZERO — PRODUCT-FIRST ARCHITECTURE GENESIS v0.1

Date: 2026-10-03
Author: Bunny (engineering agent)
Status: **DRAFT v0.1 — NOT APPROVED. NOT FROZEN.**
Gate: this artifact IS the ARCHITECTURE GENESIS v0.1 gate deliverable.
Next gate after acceptance: `prompts/03_ADVERSARIAL_REVIEW.md`.

---

## 0. PROVENANCE AND AUTHORITY

**The canonical historical Prompt 01 body was not recovered.** Searched: all
git history, all git objects including dangling ones, reflog, stash, the whole
filesystem under `/home/nikita`, and the local conversation archives of every
installed agent. Nothing. Full record with commands and results:
`evidence/recovery/PROMPT_01_RECOVERY.md`.

No historical `ARCHITECTURE_GENESIS_v0.1.md` exists — not at any revision.

This document was therefore written from the repository's own canonical
requirements:

- `prompts/01_PRODUCT_FIRST_GENESIS.md` — the 11-bullet context summary,
  explicitly labelled CONTEXT ONLY
- `docs/architecture/PROJECT_HISTORY.md`
- `docs/PROJECT_STATE.md`
- `docs/RISKS.md`, `docs/ROADMAP.md`, `docs/DECISIONS.md`
- **`prompts/03_ADVERSARIAL_REVIEW.md`** — present, complete, 16 sections

**It is a reconstruction from preserved requirements, not a recovered
artifact.** The one structural decision taken under the gap: every section
Prompt 03 names is present and independently answerable, because a reviewer
cannot attack a section that does not exist. This biases Genesis toward being
attacked rather than toward looking complete.

That coverage claim was machine-checked, not asserted. The first pass found 15
of 16 covered, with Prompt 03's own section 6 "COST ARCHITECTURE UNDER ATTACK"
having no counterpart — a gap that mattered because §1 makes cost the
load-bearing claim. `§6 COST ARCHITECTURE` was written to close it. Final
coverage 16 of 16, sections 0–17 contiguous, all internal references resolving.
Method, the defect list, and the structural verification are in
`evidence/recovery/PROMPT_01_RECOVERY.md` §F5.

**Consequence for the adversarial review:** the MUST BEAT candidates in §2.2
were selected by an agent from first principles, not recovered from a
founder-approved list. The set may differ from what the founder intended. That
is the highest-risk consequence of the provenance gap and is stated again as
blocker B-7 in §15.

### Evidence labelling

Every claim in this document is one of:

- **[MEASURED]** — established by execution, artifact in `evidence/`
- **[ESTIMATE]** — reasoned figure, explicitly unvalidated
- **[HYPOTHESIS]** — a bet, named as such, with its falsification test
- **[OPEN]** — a founder decision or an unresolved unknown

**There is exactly one [MEASURED] block in this entire document** (§10, host
capability). Everything else about the product, the hardware and the cost is
unproven. That ratio is the honest state of the project, not modesty.

---

## 1. PRODUCT THESIS

Phone Zero is an experiment in whether a phone can be built with a
purpose-written software stack and a commercially sourced hardware platform at
**materially lower cost** than a contemporary flagship, while being **competitive
on a small number of user-perceivable properties** and **defensible on a few
where a focused stack can genuinely win**.

Three clauses, deliberately narrow:

1. **Lower cost is the load-bearing claim.** It is the one property that, if
   achieved, changes who can own the device.
2. **Competitive, not superior, on the user-perceivable properties.** Most
   perceived quality comes from silicon and industrial design, not from
   software ownership.
3. **A few genuine wins from a focused stack** — and §3 names only ones with a
   falsification test.

**What this is not.** Not an iPhone clone. Not a claims-driven platform. Not a
flagship competitor. At the first sellable volume, if it succeeds, it is a
*good, cheap, honest phone* — and the honest failure mode is a research device
only its creator would use.

### 1.1 The falsifiable core

> A phone whose bill of materials and software-maintenance cost are low enough
> to sell at a price band that excludes no one on income alone, while remaining
> daily-drivable by a non-founder.

If that sentence cannot be made true with evidence, the project dies regardless
of how good the kernel is. It is the spine; everything else is instrumentation.

---

## 2. MUST MATCH / MUST BEAT / CAN LOSE

### 2.1 MUST MATCH

A device is unacceptable if materially worse on any of these. Not "close enough" —
*materially* worse means a normal user notices and complains.

| # | Property | Unacceptable if | Why it is non-negotiable |
|---|---|---|---|
| M1 | **Battery: all-day** | Cannot survive 08:00–23:00 on mixed use with a charge | A phone that dies at 15:00 is not a phone |
| M2 | **Call and SMS reliability** | Dropped calls, failed SMS, no VoLTE/IMS in practice | The floor of telephony. Nothing else compensates |
| M3 | **Camera: acceptable** | Photos unusable in daylight; video unusable when moving | Camera is now a primary purchase criterion |
| M4 | **App availability: essential set** | Missing banking, maps, messaging, 2FA, transport, gov services | See §7 — this is the largest existential risk |
| M5 | **Touch and display feel** | Visible input lag, janky scrolling, dim or inaccurate panel | Perceived quality is dominated here, and users feel it within 60 seconds |
| M6 | **Security credibility** | No verified boot, no patch path, no supported lifecycle | Irreversible: a breach or an unpatchable CVE ends trust permanently |
| M7 | **Storage and RAM headroom** | Cannot run the essential app set with today's apps | App growth is a one-way ratchet |
| M8 | **Durability and repair** | Fails within warranty; unopenable for battery | A cheap phone that dies in year 1 is not cheap |
| M9 | **Update lifetime ≥ 5 years** | No committed security-update path | Determines whether the device can be sold responsibly at all |

**[OPEN]** M4 cannot be closed by engineering. It is a licensing and
distribution question. See §7.

### 2.2 MUST BEAT

Only advantages that are (a) user-perceivable, (b) measurable, (c) survivable
by a focused stack, and (d) falsifiable. Everything in §1's ambition is
rejected unless it clears all four.

**B1 — Battery life, measured against device class, not against a spec sheet.**

| | |
|---|---|
| Metric | Hours of mixed use to 10% (fixed scripted workload, screen 400 nit, LTE+Wi-Fi) |
| Target | ≥ 1.3× the median of the comparable price band |
| Engineering cost | Low — mostly PMIC choice and scheduler policy |
| BOM impact | **UNKNOWN magnitude.** Directionally: a larger battery raises BOM, a smaller SoC could lower it. Net effect unpriced — see §6.4, cell deliberately empty |
| Phone Zero experiment | Virtual: scheduler + power-model only. **Needs dev board** for real battery figures |
| Falsification | If BMR-matched runtime is not ≥1.3× median on the first dev board, B1 is dead |
| Honest risk | **[HYPOTHESIS]** Most of battery life comes from the modem and display, not the OS. If so B1 is a modem choice, not a software win, and it stops being a differentiator |

**B2 — Zero-ad tracking and no background telemetry, verifiable without configuration.**

| | |
|---|---|
| Metric | Count of outbound connections per idle hour; verifiable via packet capture |
| Target | 0 outbound when idle except user-initiated sync and OS-critical EMM/IMS |
| Engineering cost | Medium — requires owning the full network stack's policy surface |
| BOM impact | ~0 |
| Phone Zero experiment | Virtual: fully provable — packet capture under QEMU slirp counts flows |
| Falsification | If any non-essential flow appears idle, B2 fails; measured on first boot, not argued |
| Honest risk | **[HYPOTHESIS]** Users may not care, or may care and still switch. Perceived-privacy benefit is [ESTIMATE] weak-to-moderate. This is the differentiator most likely to be **indistinguishable to a buyer** — which is exactly why it is here and not assumed |

**B3 — Update lifetime as a product feature: 5+ years of security updates for a device expected to cost less than a mid-range phone.**

| | |
|---|---|
| Metric | Years of published security updates; update install success rate |
| Target | ≥5 years, installable over Wi-Fi and LTE without a PC |
| Engineering cost | **High** — this is the single most expensive item in the project (§8) |
| BOM impact | ~0 direct; software amortised over a small volume |
| Phone Zero experiment | Virtual: OTA state machine, delta format, rollback, power-loss recovery — all provable |
| Falsification | If a single month's release cannot be produced and tested in ≤5 working days by one founder + agents, B3 is dead and the device is unsellable |
| Honest risk | **[HYPOTHESIS]** This is a *liability* dressed as a feature. At low volume, per-device support cost dominates margin. It may be the reason the project is uneconomic |

**B4 — Repairability and parts availability: user-replaceable battery and screen with published part numbers.**

| | |
|---|---|
| Metric | Time and cost of battery replacement; parts available at 24 months |
| Target | Battery swap ≤10 minutes with common tools; parts sold for 5 years |
| Engineering cost | Medium — mechanical and supply-chain, not software |
| BOM impact | Slightly negative (connectors, less glue) |
| Phone Zero experiment | **Needs physical hardware.** Cannot be tested virtually at all |
| Falsification | Not falsifiable before dev hardware exists. Treat as a commitment, not a hypothesis |
| Honest risk | Under a cheap-BOM target, glue and potting are the standard cost levers. Repairability directly fights that. This is a real tension, not a solved problem |

### 2.3 Explicitly REJECTED as differentiators

Per Prompt 03 §2, these are not differentiators until measured:

| Claim | Why rejected |
|---|---|
| "Revolutionary UI" | Requires a design team and years. Not a v0.1 differentiator |
| "Better privacy" | Overlaps B2 but is broader and unfalsifiable as stated |
| "Faster" | Perceived speed is dominated by SoC and memory bandwidth, both purchased |
| "AI-native" | No user-perceivable property defined |
| "More open" | Vague; also somewhat available today via AOSP-derived devices |
| "Better battery" | Only counts as B1 with a measured ratio |
| "We own the kernel" | A means, never a benefit. See §4 |

### 2.4 CAN LOSE

| # | Concession | What it saves | Who it loses | Reversible? |
|---|---|---|---|---|
| L1 | **Camera quality: flagship-class imaging** | Largest single BOM block after the SoC; ISP is years of work | Camera-first buyers | Yes, later SoC |
| L2 | **Video codec breadth: no 8K/ProRes/AV1 encode** | Media engine and RAM | Content creators | Yes |
| L3 | **Gaming: no sustained-performance mode** | Thermal envelope, power budget | Gamers — a shrinking but visible group | Partly |
| L4 | **Display: no LTPO/ProMotion-class variable refresh** | Display cost | Scrollers notice this. **Borderline unacceptable** — see §16 | Yes |
| L5 | **Display: 1080p-class, not QHD+** | Panel and GPU bandwidth | Spec-sheet buyers. Users rarely notice | Yes |
| L6 | **Fast charging: ≤30 W** | Battery longevity, thermals, PMIC cost | Buyers who compare charge curves | Yes |
| L7 | **No 5G mmWave** | Modem cost, RF complexity, certification | Urban high-density users only | Yes |
| L8 | **No eSIM multi-profile / carrier aggregation beyond mainstream** | Modem firmware, certification | Travellers, premium carriers | Yes |
| L9 | **No biometrics beyond capacitive fingerprint** | Secure-element and sensor cost | Security-conscious buyers. **Borderline M6** | Yes |
| L10 | **No IR blaster, no desktop mode, no multi-desktop** | Software surface | Power users | Yes |
| L11 | **Regional language support: English + Russian first** | Translation and support | Rest of world. **Kills any non-RU/US market thesis** | Yes, software |

**L11 is the most strategically dangerous concession in this document.** A
Russian-first-only software stack cannot be sold at scale in any market except
Russia and CIS, which caps the addressable market at the single most
sanctioned, most supply-constrained, most certification-hostile market in the
consumer device space. Flagged here rather than buried.

---

## 3. ARCHITECTURE DECISIONS AND THE FIVE WEAKEST

### 3.1 Decisions taken at v0.1

| ID | Decision | Status |
|---|---|---|
| A1 | Product-first sequencing: thesis → constraints → architecture → experiment | **[APPROVED]** project principle |
| A2 | Virtual-first, with a named exit criterion (§10) | **[APPROVED]** project principle |
| A3 | Architecture is served by a focused stack, not by a general-purpose OS | **[HYPOTHESIS]** — see §4 |
| A4 | Source-available software stack on commercially sourced hardware | **[HYPOTHESIS]** |
| A5 | **RISC-V is NOT decided.** Treated as one candidate among several | **[OPEN]** founder + evidence |
| A6 | **OpenSBI vs bare M-mode NOT decided.** Env-probe shows both boot | **[OPEN]** — decision, not fact |
| A7 | **No SoC, no ISA, no memory-interface choice frozen** | **[OPEN]** |
| A8 | Cost is an architecture input, reviewed per subsystem at 1k/10k/100k/1M | **[APPROVED]** project principle |
| A9 | Rust-family language for safety-critical components, **[HYPOTHESIS]** — not decided | **[OPEN]** |
| A10 | Ecosystem risk is first-class and is the top existential risk (§7, §13) | **[APPROVED]** project principle |

**Explicitly NOT decided:** physical ISA, SoC, boot firmware strategy, kernel
init, memory management model, GPU architecture, kernel language, physical form
factor, display technology, modem vendor.

### 3.2 The five weakest decisions, by switching cost

Ranked by cost to reverse at month 18, because that is where expensive mistakes
surface.

---

**W1 — Android application compatibility as the assumed answer (§7).**

- *Assumption:* that a licensing or distribution path to Android apps exists or
  can be created.
- *Credible alternative:* native-only, or web/PWA-first, or remote execution.
  Each fails differently; none is automatically worse.
- *Switching cost:* now ≈ 0. **Month 6** — a prototype shape. **Month 18** —
  the entire application layer, plus possibly the security model and the
  distribution story.
- *Earliest settling experiment:* not technical. A written licensing enquiry to
  AOSP-compatible distribution terms, or a decision to target native-only.
  **This is the cheapest and highest-leverage experiment in the project and it
  is a legal question, not an engineering one.**

---

**W2 — That a focused software stack can reach consumer-perceived quality at all.**

- *Assumption:* that users experience a purpose-built stack as good enough.
- *Credible alternative:* a highly-tuned mainline Android derivative delivers
  90% of perceived quality for 10% of the effort, making W2 moot.
- *Switching cost:* now low. **Month 6** — a year of stack work. **Month 18** —
  total.
- *Earliest settling experiment:* build one vertical slice (camera capture →
  gallery → share) to production quality in the existing stack, and let a
  non-founder judge it blind against a commercial phone.

---

**W3 — Update lifetime as a commercial differentiator (B3).**

- *Assumption:* that ≥5 years of updates is affordable at low volume.
- *Credible alternative:* 2–3 years, honestly marketed, with a clear end-of-life
  date and a trade-in/recycling path.
- *Switching cost:* now low. **Month 6** — release infrastructure. **Month 18** —
  the entire support organisation model.
- *Earliest settling experiment:* measure founder+agent hours per monthly release
  in the first three months. If >5 days, the commercial model is wrong.

---

**W4 — Cost target as the load-bearing property (§1).**

- *Assumption:* a BOM low enough for the target price band is achievable without
  inheriting unacceptable compromise.
- *Credible alternative:* target a higher band, accept a smaller market.
- *Switching cost:* low technically, **very** high strategically — the price band
  determines the addressable market and the whole thesis.
- *Earliest settling experiment:* a real BOM from actual distributor quotes at
  10k units, with a written volume break analysis. Not [ESTIMATE] — quotes.

---

**W5 — One-founder + AI execution capacity.**

- *Assumption:* that an agent-assisted founder can sustain kernel + BSP + camera
  + modem + RF + certification + support.
- *Credible alternative:* a small funded team, or narrowing scope to a
  non-handset device first.
- *Switching cost:* now 0. **Month 6** — a committed trajectory. **Month 18** —
  sunk cost plus a founder's life.
- *Earliest settling experiment:* track weekly founder-hours and whether the
  critical path is getting shorter. If the curve is flat after 6 months, the
  capacity assumption is false and scope must shrink.

---

## 4. KERNEL STRATEGY UNDER JUSTIFICATION

### 4.1 The honest question

> **Why do we need our own kernel?**

Not "it is our platform". The answer must be a product benefit that Android or
Linux cannot deliver at acceptable cost.

### 4.2 Why not the alternatives

**Alternative 1 — tune an existing AOSP-derived Android.** Strongest case.
Delivers M1–M3, M7, M8 and the entire app ecosystem immediately. Defeats the
project's own thesis, because it is what every Android phone already is. It is
rejected as the *thesis*, not because it is bad. **If it turns out that this is
good enough, the project should stop, and that is a legitimate outcome.**

**Alternative 2 — mainline Linux + a display/compositor stack, no Android.**
Genuinely owns the UX and the boot chain. Fails M4 outright. Requires building
every app that matters. Rejected for M4.

**Alternative 3 — Android compatibility layer over a custom kernel.** Preserves
the app ecosystem while owning the kernel. **The serious candidate.** Costs: a
sustained kernel team, HAL compatibility work, and possible incompatibility with
artisan apps and Android Go. Whether it survives contact with current apps is
**[OPEN]** and is one of the first things Phone Zero must test.

**Alternative 4 — full clean-room OS, native apps only.** Total control, total
cost. Fails M4 so completely that it is not viable as a consumer phone. Viable
only for a niche device. Rejected for M4.

### 4.3 Claimed benefit, per benefit, honestly

| Claimed benefit | Can Android/Linux do it? | Cost to do it there | Can Phone Zero prove the advantage? |
|---|---|---|---|
| Smaller RAM/flash footprint | Yes, marginally — a tuned Android is not bloated | Low on both sides | Yes, virtually |
| Faster boot | Yes, trivially | Negligible | Yes, but nobody cares past ~2 s |
| Smaller attack surface | **Yes, and better** — mainline Android is audited by thousands | The real cost is paying for that auditing, which only a large vendor can | **No** — we cannot claim an audit we have not had |
| Verifiable updates | Yes, with project Treble | Low | Yes, virtually |
| No telemetry | **Yes, today, on any AOSP phone with a supported unlock process** | Negligible | Yes, but this is **not a differentiator** — it is available without a custom kernel |
| No forced ads/preinstalls | Yes | Negligible | Yes, again available today |

**The finding that matters: most claimed kernel benefits are already available
on a tuned AOSP build.** The genuinely differentiated ones are footprint,
update verifiability and the ability to change UI behaviour without fighting a
vendor — and none of them is user-perceivable in the way battery life is.

**Therefore: the kernel is not yet justified.** It is retained as a hypothesis
because B1/B2/B3 might require it, and because the project's real commitment
may be to *control* the stack rather than to own the kernel specifically. §15
treats this as a core assumption requiring test.

### 4.4 Risk A vs Risk B

- **Risk A — wrong architecture.** Wrong ISA, wrong kernel shape, wasted months.
- **Risk B — right architecture that consumes the entire capacity and no phone
  ever ships.**

**Risk B is larger.** Risk A is recoverable — architectures are replaced all the
time, and the artifacts of a failed one are reusable. Risk B produces a complete,
correct, beautiful system that never reaches a user, and it consumes the one
resource that cannot be bought: the founder's years.

**Implication:** scope aggressively. Every ambition in §8 that can be deferred
must be, because Risk B is the dominant failure mode.

---

## 5. LANGUAGE AND MEMORY SAFETY

**[HYPOTHESIS] — not decided. Stated so Prompt 03 has something to attack.**

**Position at v0.1:** a memory-safe language for safety-critical components
(kernel, drivers, network parsing, media), and the *system* language is an open
question with cost and ecosystem consequences either way.

### 5.1 Where memory safety has real product value

| Component | Why safety matters here | Cost if wrong |
|---|---|---|
| Network stack / TLS | Remote, adversarial input | Remote code execution |
| Media parsers (camera, codec, image) | Untrusted input, historically the richest bug source | Memory corruption from any received file |
| Kernel | Privilege boundary | Full compromise |
| Driver boundary (hardware abstraction) | Hardware is untrusted in practice | Silent data corruption |
| Update/OTA verification | Integrity-critical | Arbitrary code at boot |

### 5.2 Where forcing it creates disproportionate cost

| Area | Honest assessment |
|---|---|
| UI and application runtime | Memory safety costs iteration speed. This is the "developer velocity" cost and it is real |
| Build system, tooling | The memory-safety ecosystem's tooling maturity gap is a genuine productivity tax today |
| Legacy driver porting | Porting C drivers is often *faster* than trusting them unchanged — a source-safety trade, not a solved problem |
| Debugging | Safe languages remove whole bug classes and remove entire diagnostic techniques. Net: usually a win, but not free |
| FFI boundary | Each FFI boundary reintroduces unsafety exactly where it is most dangerous |

### 5.3 What is required now vs what stays open

**Required at v0.1:** nothing is frozen. The language decision belongs to Milestone
1's contract, and that contract is not authorized.

**Stays open deliberately:** system language; kernel language; driver language;
whether to permit any C at all.

**[HYPOTHESIS]** The strongest form of this position — "a memory-safety mandate
is a product requirement" — is **not yet supported by evidence**, and Prompt 03
should be expected to say so.

---

## 6. COST ARCHITECTURE

### 6.1 The cost claim, restated as arithmetic

Section 1 claims lower cost is the load-bearing property. This section exists so
that claim can be attacked, and it starts by admitting the part of it that
engineering does not control.

A device's cost is not one number. It is:

    Retail price = BOM + NRE + certification + per-device support + margin

Software ownership can act on **three of those five terms**. It cannot act on
BOM silicon, and it cannot act on certification. Any cost thesis that implies
otherwise is wrong.

### 6.2 Where the money actually is

**[UNVALIDATED]** The qualitative ordering below is the project's working
assumption, taken from general industry structure. **It has not been verified
against any real quote, and this document contains no supplier pricing.**

| Block | Typical share of a modern phone BOM | Can a focused software stack reduce it? |
|---|---|---|
| Display panel | Largest single block | **No.** Purchased. Software cannot make a cheaper panel |
| SoC | Second | **No.** Software cannot make a cheaper SoC. It may allow a *smaller* one |
| Memory (RAM + storage) | Third | **Partly.** A focused stack can lower the *required* capacity |
| Camera module + ISP | Significant | **Partly**, via L1 conceding flagship imaging |
| Modem + RF | Significant, volume-sensitive | **No.** Certification-bound regardless |
| Battery + charging | Moderate | **Partly.** Larger battery costs money |
| PCB + passive + assembly | Moderate | **Yes**, via design, not via software |
| Enclosure | Moderate | **Yes**, mechanically, and it fights repairability (B4/L-items) |
| Software licences per device | Can be large | **Yes.** Often the largest *software* saving |

### 6.3 THE COST-PREMISE QUESTION — unresolved, not answered here

This is the question ChatGPT's review of the environment probe required Genesis
to carry rather than assume (`reviews/mailbox/CHATGPT_TO_BUNNY.md`, commit
`85e4fa7`): **is "cheaper than a flagship at comparable experience" a hardware
supply-chain play, or a software/platform play?**

**This section does not answer it. It states what is at stake and what would
settle it.**

An earlier draft of this section concluded the software thesis was "probably a
false claim" and relocated the advantage to total cost of ownership. That
conclusion was withdrawn. It assumed the answer to the very question it claimed
to price. The correction is recorded here because the reasoning error is
instructive, not because it is embarrassing.

#### 6.3.1 What is structurally true, independent of any BOM

Software ownership can influence some cost terms and cannot influence others.
This is a statement about causal reach, not about magnitude:

| Cost term | Can software/platform choices move it? |
|---|---|
| Display panel | **No.** Purchased component |
| Manufacturing, assembly, test time | **Partly** — design and yield, mechanically |
| Camera module / ISP cost | **Partly** — by choosing a lower tier the stack can live with |
| SoC price | **Partly** — not the silicon price itself, but **which SoC tier the stack must require** |
| Required RAM / storage | **Yes**, directly |
| Per-device licences | **Yes**, directly and per-device |
| Support / update cost over lifetime | **Yes**, directly |
| Integration and bring-up effort | **Yes** — BSP and HAL cost |
| RF, modem hardware, certification | **No.** Certification is external and legal |

An earlier draft understated this by writing that software "cannot touch" the
display and the SoC. The correct statement is narrower: software cannot change
*component prices*, but it can change *which components the design requires* — a
cheaper SoC tier, a smaller RAM configuration, a lower camera tier. Those are
real levers, and §2.4's L1/L5 concessions are exactly the act of using them.

#### 6.3.2 What is NOT established

**Whether the movable terms dominate the immovable ones at a realistic volume is
unknown. Nobody has quoted a BOM for this project.** §6.2's block ordering is an
`[UNVALIDATED]` working assumption from general industry structure.

So both of the following remain open, and this document deliberately refuses to
pick one:

- **Reading A — the hardware terms dominate.** Software ownership then buys
  margin protection and lower per-device cost, not a headline price reduction,
  and the price advantage comes from purchasing and volume.
- **Reading B — the movable terms are large enough to matter.** Required RAM and
  storage configuration, SoC tier, licence elimination and support cost can
  together shift the achievable price band, making software ownership a genuine
  contributor to the headline number.

**Reading A and Reading B imply different architectures and different founder
answers.** Under A, optimising the stack is margin protection and the
differentiators should lean elsewhere. Under B, footprint work is the highest-
leverage engineering in the project. This is why it cannot be waved through.

#### 6.3.3 What would settle it

Not argument. In ascending cost:

| # | Evidence required | Settles |
|---|---|---|
| P1 | Real distributor quotes for a complete BOM at 10k units | The magnitudes |
| P2 | BOM total against the retail price of the cheapest device in the target band | Whether any price gap exists at all |
| P3 | Movable terms priced separately from immovable ones | **Which of A or B holds** |
| P4 | Required RAM/storage and feasible SoC tier for one fixed workload in our stack vs a tuned AOSP build | Size of the software lever |

P3 is the decision-relevant number and it is **not** derivable from P1–P2 alone.
Until P3 exists, any claim that this project is a supply-chain play — **including
the claim this section previously made** — is unsupported in both directions.

**[OPEN]** Until F1 (§14) states a target price and P1–P4 exist, the cost premise
of §1 is unexamined and §1's falsifiable core cannot be evaluated.

### 6.4 Cost model structure — deliberately unpopulated

This is the *shape* of the model, with magnitudes left empty on purpose.
**Populating it requires real distributor quotes. Inventing figures here would
be fabrication, so the cells are marked UNKNOWN and are not estimates.**

| Term | 1k units | 10k units | 100k units | 1M units |
|---|---|---|---|---|
| SoC | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Display | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Memory | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Camera module | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Modem + RF | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Battery + charging | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| PCB + assembly | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Enclosure | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Other BOM | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| **Total BOM** | **UNKNOWN** | **UNKNOWN** | **UNKNOWN** | **UNKNOWN** |
| NRE (mask, tooling, cert) | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Certification | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Per-device support, 5 yr | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| Per-device licences | UNKNOWN | UNKNOWN | UNKNOWN | UNKNOWN |
| **Total unit economics** | **UNKNOWN** | **UNKNOWN** | **UNKNOWN** | **UNKNOWN** |

Volume columns matter more than the total: NRE per unit falls with volume while
unit BOM rises. **A project can be cheap at 1M and impossible at 1k.** Which
volume this project is actually viable at is **[OPEN]** and depends on F1/F6.

### 6.5 Cost attack surfaces a software owner genuinely has

Ordered by how defensible they are, best first:

1. **Per-device licence cost.** Eliminating it is a real, recurring, per-device
   saving that a large vendor also wants. Not differentiating, but real.
2. **Required memory footprint.** Lower RAM requirements let the BOM carry a
   cheaper memory configuration. Real, and it compounds with §4.3's "smaller
   footprint" claim — this is where owning the stack has genuine leverage.
3. **Required storage.** Same mechanism, smaller magnitude.
4. **Per-device support cost over 5 years.** Potentially the largest software-
   attributable term at low volume, and the one B3 puts at risk. If monthly
   release cost per device exceeds margin, nothing else matters.
5. **Certification.** Software rarely changes certification cost. Listed only
   to be dismissed.
6. **Silicon cost.** Not on this list. Software does not reach it.

### 6.6 Falsification tests for the cost thesis

Cheapest first. All are evidence, not argument.

| # | Test | Kills what | Cost | When |
|---|---|---|---|---|
| C1 | One real distributor quote basket for a complete BOM at 10k units | The cost thesis, immediately | Low, days | Before architecture freeze |
| C2 | Compare that BOM total against the retail price of the target band's cheapest phone | The whole product thesis | Low, hours, after C1 | Immediately after C1 |
| C3 | Measure required RAM/storage for one fixed workload in our stack vs a tuned AOSP build | §4.3's footprint claim | Low, virtual | Milestone 1 window |
| C4 | Measure hours per monthly release, extrapolate to cost per device over 5 years | B3, and the support term of the model | Low, ongoing | From first release |
| C5 | Write down the 5-year TCO for our device vs the cheapest comparable phone | The "total cost to own" claim | Low | After C1+C4 |

**C1 followed by C2 is the single most decisive pair of experiments in this
project, and neither requires any code.** If C2 shows a competitive device can be
assembled at the target price without any software advantage whatsoever, then
the software thesis is unnecessary and the project is a supply-chain exercise.

### 6.7 What this section does not claim

- No BOM figure in this document is measured. None is sourced. All are UNKNOWN.
- The BOM-block ordering in 6.2 is an unvalidated working assumption.
- No claim is made that a purpose-written stack reduces device cost by any
  specific amount.
- No NRE figure, no certification figure, no support-cost figure exists yet.
- Cost is not architecture-frozen until C1 and C2 are executed.

## 7. ECOSYSTEM REALITY CHECK

### 7.1 The question the user asks

> **"Where is my banking app?"**

Every strategy below is scored against that sentence. A strategy that cannot
answer it does not produce a consumer phone.

### 7.2 Comparison

| Strategy | Banking/payments | Security cost | Performance | Battery | Engineering | Legal dependency | UX |
|---|---|---|---|---|---|---|---|
| **Native-only** | **Fails.** No banking app exists | Excellent | Excellent | Excellent | **Enormous** — every essential app | None | Excellent for what exists |
| **Android compatibility layer** | **Passes**, if it survives real apps | **Poor** — legacy Android attack surface, kernel underneath ours | Moderate | Moderate | **Very large** — sustained compatibility work | **High** — GMS/Play licensing | Good |
| **Android container (framework in a VM)** | **Partially** — Play Store presence solves access, not trust | Poor — large trusted/unchtrusted surface | Moderate | Poor — VM overhead | Very large | **Very high** | Mixed |
| **Web/PWA-first** | **Fails** for most Russian/CIS banking today; 2FA is the blocker | Good — the browser is the sandbox | Poor–moderate | Good | **Small** — the cheapest path | Lowest | Poor: no calls, weak notifications, no NFC payments |
| **Remote execution** | Passes trivially | **Very poor** — latency and availability bound to a server, contrary to the thesis | Poor | Poor | Small | Server-side | Poor |
| **Sideloaded / self-distributed app store** | Passes if the APK exists | Moderate | — | — | Moderate | **Very high** — distribution rights | Moderate |

### 7.3 The honest conclusion

**No strategy is safe.** Each fails a different MUST MATCH.

- Native-only fails M4 so completely it is not a consumer phone.
- PWA-first fails M2 (calls), M3 partly, and 2FA today.
- Remote execution contradicts the offline-first thesis outright.

**The realistic answer is the Android compatibility layer — which is precisely
the option that drags in the largest security and legal surface and the largest
engineering load.**

**This is the project's central tension and it is not solved at v0.1.** §13
treats it as existential.

**[HYPOTHESIS]** The strategy most likely to be right: *a small, auditable,
independently-sourced application layer that runs the essential set, while
declining to claim the whole ecosystem*, with the honest label "Phone Zero
OS — essential apps only". Whether that is a product or a hobby is a founder
decision (§14).

### 7.4 What must be investigated during Phone Zero, not deferred

1. Does an independent app layer run today's banking, maps and 2FA apps
   unmodified? **This is the first experiment, before any kernel work.**
2. What is the actual RAM and boot-time overhead of a compatibility layer
   versus native on the same SoC?
3. Can 2FA be supported without Play Services? If not, M4 is unreachable.
4. What is the minimum app set for a real market, and does it shrink or grow?

---

## 8. AMBITIONS NOT YET PRICED

Unpriced means: no honest estimate of founder+agent capacity exists yet.

| Ambition | What agents materially reduce | What agents cannot remove | Deferrable? |
|---|---|---|---|
| Kernel | Boot, memory, drivers, tests, review, fuzzing, CI | Architecture decisions; hardware bring-up judgement; real-hardware debugging | Partly |
| Boot firmware | Integration, config, test harness | The decision itself; vendor quirks | Yes — use OpenSBI first |
| Graphics stack | Driver scaffolding, bring-up | **GPU driver bring-up. AI cannot fix a missing or undocumented GPU.** Highest unpriceable risk in the list | Yes — defer entirely |
| UI toolkit | Widgets, layout, bindings | Visual quality judgement; design language | Yes |
| Networking stack | Protocol implementation, tests | RF certification; modem firmware | Partly |
| Security | Implementation, fuzzing, test generation | **The audit.** We cannot buy or generate it. Claiming "verified" without an audit is the project's largest honesty risk | No |
| SDK / app tooling | Toolchain, docs, samples | Developer adoption, which is a market problem | Yes |
| App ecosystem | Nothing material. **Apps are written by companies, not by us.** | The entire problem | **No — the core problem** |
| Camera + ISP | Driver scaffolding, tuning harness | ISP bring-up and image-quality judgement; tuning is craft | Yes — L1 concedes it |
| Audio | Routing config, HAL glue | Codec bring-up; HAL is a compatibility nightmare | Yes |
| Modem | Protocol handling, AT command glue | **RF certification. Non-delegable, non-acceleratable.** | No |
| Power management | Policy engine, profiling, regression tests | Thermal validation; the physics | Partly |
| Update system | OTA machinery, delta format, test generation | The 5-year staffing commitment (B3) | No — and it is the expensive one |
| Hardware bring-up | Schematic review, driver code | Physical iteration; oscilloscope work | No |
| PCB | Layout assistance | DFM review cycles, EMC tuning | No |
| Manufacturing | Supplier liaison, documentation | **Certification. Months. Legal and monetary.** | No |
| Certification | Document preparation | **The authority. External. Non-acceleratable.** | No |

**The four that are neither acceleratable nor deferrable: GPU drivers, the
security audit, the application ecosystem, RF/certification.** Three of those
four cannot be solved by adding effort, only by spending money, negotiating, or
changing the product. That is the shape of the project's real difficulty.

---

## 9. AREAS DELIBERATELY DEFERRED

Deferred, not solved. Each: why deferred, when it becomes a blocker, earliest
address point.

| Area | Why deferred | Becomes a blocker when | Earliest address point |
|---|---|---|---|
| Camera / ISP | L1 concedes flagship imaging | M3 requires acceptable photos | Dev board with a real sensor |
| GPU | No purchased GPU; bring-up unpriceable | M5 scroll/jank, or any UI | Dev board, week 1 |
| Modem / RF | Vendor-dependent, certification-bound | M2 — calls are non-negotiable | Vendor evaluation before any board spend |
| Carrier certification | Legal, monetary, slow | Any real sale | Before any physical prototype is designed |
| Thermals | Cannot simulate | M1, M8 | First enclosed dev board |
| Secure boot | Requires hardware root of trust | M6 | Board with a secure element |
| Device certification | External authority | Commercial sale | After M1–M3 are demonstrated |
| Payments / DRM | Licensing | M4 banking, content playback | During ecosystem investigation |
| Manufacturing | Capital | Production | After B4 BOM is validated by quotes |
| Repair / warranty | Business model | M8 | First physical prototype |
| App distribution | Legal | M4 | Immediately — see W1 |
| Funding | Founder | Everything past prototype | Before physical spend |

**Not one of these is a "later" item. All of them are on the critical path and
none has been started.**

---

## 10. PHONE ZERO REALITY CHECK

### 10.1 [MEASURED] Host capability

The only [MEASURED] evidence in this project.
Source: `evidence/env-probe/README.md`, reproduced by `./build.sh`.

FACT, established by execution:

- A freestanding RISC-V64 target compiles on this host with an existing
  toolchain, no privileged installation (clang-18, `--target=riscv64-unknown-elf`,
  `ld.lld`).
- QEMU `virt` boots it in **both bare M-mode (`-bios none`) and under OpenSBI
  v1.3**.
- Serial output is deterministic.
- The SiFive test finisher gives a real process exit code: **0 on pass, 42 on
  fail**, in both configurations. A harness that can only see success cannot
  distinguish a working device from a hung one.
- With OpenSBI loaded, the link address must be `0x80200000`; `0x80000000`
  overlaps QEMU's ROM and QEMU refuses to start.

**[MEASURED] consequences:**

1. A milestone asserting *"boot signature present AND exit code correct"* is
   implementable on this host today.
2. Deterministic success **and failure** testing is possible. This is
   unusually good and should be preserved.
3. QEMU is not installed system-wide and there is no passwordless sudo; it was
   obtained as an unpacked package with `LD_LIBRARY_PATH`. An environment
   detail, but it means CI design assumes a fixable setup gap.

**[MEASURED] does NOT establish:** anything about architecture, ISA choice,
OpenSBI-vs-M-mode, physical hardware, performance, battery, or any product
property.

### 10.2 Capability split

**CAN PROVE — virtual, deterministic, cheap**

- Boot chain correctness and ordering; deterministic hang/fail detection
- Memory management correctness under fault injection
- Scheduler behaviour, IPC cost, syscall overhead
- Process and app lifecycle; crash handling; restart behaviour
- Update system: OTA state machine, delta application, **rollback**, power-loss
  recovery — all of it
- Network stack correctness and protocol conformance
- Security mechanisms in isolation, as code: parsing, crypto, permission
  enforcement
- Update *verifiability* as a property
- **Outbound connection counting under idle** → B2 is **fully provable now**
- Long-horizon resource behaviour: leaks, fragmentation, thermal *proxy*
- Deterministic boot time as a metric
- Footprint: RAM and flash for a given workload

**CAN APPROXIMATE — directionally useful, not decisive**

- Interactive latency feel (useful for gross regressions, not for M5 judgement)
- Memory footprint under realistic mixed workload
- Energy efficiency *ratios* between policies
- Storage throughput in aggregate
- Multi-app switching behaviour under a realistic trace
- UI jank detection

**NEEDS DEV BOARD — physical hardware, off-the-shelf**

- Battery life. Real figures only. Modem and display dominate; a model is a guess
- Thermals, sustained performance, thermal throttling
- Touch latency and haptic feel
- Camera capture and image quality
- Real display colour, brightness, refresh behaviour
- Wi-Fi/BT RF behaviour
- Suspend/resume time on real silicon
- Power consumption in every radio state

**NEEDS CUSTOM HARDWARE**

- RF certification, carrier certification
- Antenna design
- Custom SoC feasibility, and its NRE
- Anything about the BOM at volume
- Production yield, calibration, test time

**NEEDS PRODUCTION-LIKE HARDWARE**

- Manufacturing and assembly cost at volume
- Yield and rework rates
- Certification cost and timeline
- Warranty and RMA economics
- Supply-chain resilience

### 10.3 The exit criterion

Virtual-first is permitted **until** either:

- **E1** — a required MUST MATCH can only be evaluated on physical hardware
  (first candidate: **M1 battery**, then M5, then M2), **or**
- **E2** — a required MUST BEAT can only be *falsified* on physical hardware
  (first candidate: **B1**).

**E1 fires at M1. E2 fires at B1.** Both point to a development board, and both
should be expected to fire early. Virtual-first is a means to avoid expensive
hardware before the architecture is worth committing to — not a strategy.

**[OPEN]** Founder decision: how much capital may be committed before the first
board. Without that number, "virtual-first" has no stopping rule.

---

## 11. WHAT THE USER ACTUALLY GETS IN 24 MONTHS

Ignoring §1's ambition. One founder, AI agents, limited capital, hiring only
after the project proves itself.

**[ESTIMATE] — a projection, not a plan.** No hardware exists, no design has
been frozen, and no budget has been set.

**Most realistic device at month 24:**

- **Form factor:** a single-screen slab. No novel industrial design. Reusing a
  reference-board layout is the only way to reach hardware at all.
- **What works:** calls and SMS over a real modem; camera capture that produces
  usable daylight photos; Wi-Fi and Bluetooth; a working update mechanism with
  verified rollback; a small essential-app set running natively; battery good
  enough for a day.
- **What is incomplete:** the app set. Maps, banking, transit, gov services and
  work apps will mostly be missing. **This is the defining limitation.**
- **What is ugly:** the software. A focused stack without thousands of person-
  years of UI refinement will look and feel behind a commercial phone, and it
  should be assumed it will.
- **Camera:** functional. Not good. L1 concedes more.
- **Can it make calls:** yes, if certification is addressed. This is the
  highest-risk non-software item.
- **Can it be daily-driven by the founder:** plausibly yes, if §7 is resolved
  favourably.
- **Can another person use it without the founder:** **probably not at month 24.**
  Provisioning, updates, support and app gaps are founder-operated.
- **Could it be legally sold:** not at month 24. Certification is not on this
  timeline.
- **Would an ordinary person buy it:** **no.** At month 24 it is a prototype.

**The honest answer, stated plainly: at month 24 the realistic outcome is an
impressive research phone only its creator would currently use.**

**That is an acceptable 24-month outcome for a research project and an
unacceptable outcome for a business.** The project must be willing to accept
the first, and must not claim the second. Anyone reading this document should
treat "consumer product in 24 months" as unsupported by this plan.

---

## 12. THREE QUESTIONS THAT CAN KILL THE PROJECT

Existential only. Not implementation risks.

---

**K1 — Does an application ecosystem path exist that we can legally and
technically use?**

- *Why existential:* §7 shows every strategy fails a MUST MATCH. Without a
  usable app set there is no consumer phone, and M4 has no engineering solution.
- *Earliest observable signal:* an app that runs on an independent stack and is
  materially better than its web version — or is not.
- *Cheapest experiment:* **a written licensing enquiry plus running one real
  banking app on a prototype stack.** Weeks and near-zero cost.
- *Deadline to learn the answer:* **before any kernel work begins.** This is
  unusual — usually K1-class questions are answered late. Here it is first,
  because it is cheap and it can invalidate everything.

---

**K2 — Is the per-device software cost at low volume survivable?**

- *Why existential:* §8 shows the update and support burden (§2.2 B3) plus
  certification are real, recurring, per-device costs with no revenue until
  volume exists. If support cost per device exceeds margin, there is no business
  regardless of BOM.
- *Earliest observable signal:* founder-hours per monthly release failing to fall
  month over month.
- *Cheapest experiment:* measure hours per monthly release from the first
  release; project cost per 1k/10k/100k devices with actual support scenarios.
- *Deadline:* before the third milestone.

---

**K3 — Is one founder + AI agents sufficient capacity for the critical path?**

- *Why existential:* §8's four non-acceleratable items — GPU bring-up, the
  security audit, the ecosystem, RF certification — require human judgement,
  negotiation, money or time that agents cannot supply. §11's month-24 outcome
  assumes this capacity holds.
- *Earliest observable signal:* the critical path failing to shorten after six
  months.
- *Cheapest experiment:* track weekly founder-hours and whether the path is
  shortening; if flat at six months, scope must shrink to a non-handset device.
- *Deadline:* **six months from the first kernel milestone**, not later.

---

## 13. STRIPPED AND SHARPENED

The thesis in three sentences:

> Phone Zero tests whether a phone with a purpose-written software stack and
> commercially sourced hardware can be sold at materially lower cost than a
> flagship while remaining daily-drivable. Lower cost is the load-bearing
> claim; everything else is either parity to protect or a narrow win to test. If
> the app ecosystem cannot be solved, nothing else matters.

**Strongest MUST BEAT candidate:** **B1 — battery life, ≥1.3× the price-band
median on a fixed scripted workload.** It is measurable, falsifiable on a dev
board, and it is the only candidate where software and hardware choices could
plausibly beat a much larger organisation. *Recommendation, not a decision.*

**Cheapest MUST MATCH:** **M4 — essential app availability.** Not cheap in
engineering; cheap *to learn about*. One app on one prototype answers more than a
year of planning.

**One deliberate CAN LOSE:** **L1 — flagship-class camera imaging.** The largest
BOM block after the SoC, the most expensive engineering area, and the concession
a first device is most defensible without.

---

## 14. OPEN FOUNDER DECISIONS

These change product, cost, architecture, scope or timeline. **Bunny must not
guess them.** Prompt 03 §17 will produce the formal question set.

| # | Decision | Why it matters | Blocks |
|---|---|---|---|
| F1 | **Target retail price or price range** | Defines BOM ceiling, volume and addressable market | B4, §7.4, everything cost-related |
| F2 | **Which user-perceivable properties must be beaten** | Determines whether B1–B4 are the right set at all | §2.2 selection |
| F3 | **Acceptable CAN LOSE compromises** | L1–L11 are Bunny's proposal, not the founder's | §2.4, scope |
| F4 | **Application ecosystem strategy** | Whether native-only, compatibility layer, or another path | K1, M4 |
| F5 | **Target market and languages** | L11 (RU-first) caps the market; this decides it | L11, §7 |
| F6 | **Capital available before the first board, and total** | Gives §10's exit criterion a stopping rule | §10.3 |
| F7 | **Target schedule for first sellable device** | Makes §11's projection checkable or not | §11 |
| F8 | **Is a research-only outcome acceptable?** | If yes, the risk profile changes completely | Whole thesis |
| F9 | **Substitute device option** — if the phone path fails, is a non-handset device in scope? | K3's cheapest escape | K3, scope |
| F10 | **Hiring trigger and source** | The capacity assumption (W5) has no defined failure mode | W5, K3 |

**F1 and F2 are the two that must be answered first.** F1 sets the cost ceiling
every other decision is constrained by; F2 determines whether this document's
differentiator set is the right one.

---

## 15. HONEST STATUS

**[OPEN] CORE PRODUCT ASSUMPTIONS MUST BE TESTED BEFORE ARCHITECTURE FREEZE**

*Selected from the four permitted values. Not "PROCEED AS SPECIFIED" — that is
forbidden and is not claimed.*

### Blockers

| # | Blocker | Kind | Cheapest settling test |
|---|---|---|---|
| B-1 | **Own kernel is not justified** (§4.3). Most claimed benefits are available on a tuned AOSP build today | Architectural | Vertical slice judged blind against a commercial phone |
| B-2 | **No ecosystem strategy** (§7.3). Every option fails a MUST MATCH | Product/legal | One real banking app on a prototype stack; written licensing enquiry |
| B-3 | **No validated BOM.** §7 cost is unpriced | Cost | Real distributor quotes at 10k units |
| B-4 | **No target price** (F1). Every cost constraint is unanchored | Founder | Founder decision |
| B-5 | **Language strategy unevidenced** (§5.3) | Architectural | Decide in Milestone 1 contract, not now |
| B-6 | **No capacity plan.** One-founder + AI across kernel+modem+camera+certification is unpriced (§8) | Execution | Track critical-path slope over six months |
| B-7 | **Differentiator set is agent-selected** under the Prompt 01 provenance gap (§0). May not be the founder's intended set | **Provenance** | F2 founder decision |
| B-8 | **RISC-V, SoC, firmware strategy all undecided** by design. No ISA strategy exists | Architectural | Evidence from board selection |

### What the founder should weigh

The project has one strong asset — a disciplined, explicitly adversarial
process, and a founder who is not assuming success. It has one strong liability —
**the application ecosystem (K1) is the largest risk, it is the cheapest to
investigate, and it is not a software problem.** Solving it late is the most
likely way this project dies expensively.

The second liability is §4.3: **this document cannot currently justify its own
central architectural commitment.** The kernel is retained as a hypothesis, and
that hypothesis is weakly supported.

---

## 16. ARCHITECTURE FREEZE GATES

Evidence required before v0.2 is frozen for Milestone 1.

### MUST RESOLVE BEFORE MILESTONE 1

- B-2: ecosystem strategy chosen, with evidence, not assumption
- B-3: real BOM from quotes at a stated volume
- B-4: target price range (**founder**)
- F2: differentiator set confirmed (**founder**)
- F5: target market and language scope (**founder**)
- One kernel scope decision: which of §4.2's alternatives is being built
- One language decision (§5.3)

### MAY REMAIN OPEN DURING MILESTONE 1

Do not demand answers Milestone 1 exists to discover:

- Exact ISA, SoC, board part numbers
- Memory management model and kernel internals
- Driver architecture details
- GPU strategy beyond "deferred"
- Physical form factor and industrial design
- Update-format internals beyond the state machine
- Whether the compatibility layer or native-first is correct **at scale**
- Any product property requiring physical hardware

### MUST RESOLVE BEFORE MONTH 3 OF IMPLEMENTATION

- B-1: does the custom kernel beat a tuned AOSP on any measurable property?
- B-6: capacity slope — is the critical path shortening?
- Per-device software cost model (K2)
- Whether B2 is falsifiable, on a real board
- Vertical-slice quality judged by a non-founder

### MUST RESOLVE BEFORE PHYSICAL HARDWARE

- Battery: real figures on a dev board (E1 fires here)
- Thermal envelope
- Modem/RF feasibility and vendor
- Camera strategy beyond L1
- Secure boot / root of trust
- Certification path and budget
- Supply chain and volume quotes
- K3: capacity verdict — or a scope reduction to a non-handset device

### Must NOT be required of Milestone 1

Milestone 1 must not be asked to demonstrate battery life, camera quality,
certification feasibility, app compatibility at scale, or cost. **Those need
hardware or decisions Milestone 1 is meant to inform.** Demanding them here
would make the gate unpassable and would be a specification error, not rigor.

---

## 17. WHAT THIS DOCUMENT DOES NOT CLAIM

- Not approved. Approval is ChatGPT's and Nikita's, not Bunny's.
- Not frozen. Of ten architecture decisions, three are explicitly OPEN and three
  are HYPOTHESIS. Only four are marked APPROVED, and those four are pre-existing
  project principles already established in `PROJECT_STATE`/`PROJECT_HISTORY`, not
  new architecture.
- No chatGPT review exists. **No statement here may be read as ChatGPT-approved.**
- No architecture-level founder decision is recorded. `docs/DECISIONS.md` is
  still empty and remains so.
- No product property is proven. One host-capability fact is
  [MEASURED]; everything product-, cost- and hardware-related is unproven.
- No BOM is validated. §7 is a structure for pricing, not a price.
- The differentiator set is agent-selected under a documented provenance gap.
- The month-24 outcome is a projection with no plan behind it.

**No implementation is authorized by this document.** No kernel code, no
Milestone 1, no SoC, no PCB, no ISA freeze.
