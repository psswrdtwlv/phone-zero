# Prompt 03 — Adversarial Architecture Review

Status: READY
Execution gate: ONLY AFTER ARCHITECTURE GENESIS v0.1 EXISTS

MODE: ADVERSARIAL ARCHITECTURE REVIEW

You just delivered PHONE ZERO — PRODUCT-FIRST ARCHITECTURE GENESIS v0.1.
You are no longer its author. You are a hostile independent reviewer.
Your job is NOT to defend this architecture. Your job is to find out, as
early and as cheaply as possible, why this project dies.

The founder is one person with AI engineering agents.
Ambition is not evidence. Attack the plan.

NO CODE. NO FILES. NO REPO. NO MILESTONE 1. DO NOT REVISE GENESIS.

CRITICAL PATH SECTION — go here first, do not skip:
11. WHAT THE USER ACTUALLY GETS IN 24 MONTHS
2.  MUST MATCH / MUST BEAT / CAN LOSE
8.  ECOSYSTEM REALITY CHECK
14. HONEST STATUS
16. THE 10 FOUNDER QUESTIONS

Answer those four to the required depth, then cover the rest. Explicitly
state if you had to compress any section and why.

---

1. CLAIMS I FAILED TO PROVE

Every important assertion in Genesis that was asserted, not demonstrated.
Flag ones that are load-bearing: perceived performance, system overhead,
RAM footprint, battery, security, cost, vertical integration, why we need
our own kernel, app compatibility, one-person execution speed, hardware
portability. Do not count plausible reasoning as evidence.

2. MUST MATCH / MUST BEAT / CAN LOSE

- MUST MATCH: what makes the device unacceptable if we are materially worse.
- MUST BEAT: only genuinely purchasable advantages. Each needs metric,
  target, engineering cost, BOM impact, Phone Zero experiment, and a
  falsification criterion.
- CAN LOSE: each concession — what it saves, whom it loses, whether reversible.

"Revolutionary UI", "better privacy", "faster", "AI-native", "more open"
are NOT differentiators until measured.

3. FIVE WEAKEST DECISIONS

Prefer decisions with high switching cost. For each: assumption it rests on,
credible alternative, cost of switching now / month 6 / month 18, and the
earliest experiment that settles it.

4. KERNEL STRATEGY UNDER SCRUTINY

Strongest case for at least two rejected alternatives. Then answer
explicitly: WHY DO WE NEED OUR OWN KERNEL? Not "it's our platform".
For each claimed benefit: can Android/Linux achieve it, at what cost, and
can Phone Zero actually prove the advantage?

Then compare risk A (wrong architecture) against risk B (right architecture
that eats the entire capacity and no phone ever ships). State which is larger.

5. LANGUAGE AND MEMORY SAFETY

Attack the language strategy. Unsafe boundaries, FFI, drivers, debugging,
developer velocity. Where does memory safety create real product value, and
where does forcing it create disproportionate cost? What is truly required
now vs what stays open.

6. COST ARCHITECTURE UNDER ATTACK

Audit the BOM for internal consistency. Subsystems: SoC, RAM, storage,
display, touch, camera, battery, PMIC, PCB, Wi-Fi/BT, cellular, audio,
enclosure, assembly, test, warranty.

Does each assumption hold at 1,000 / 10,000 / 100,000 / 1,000,000 units?
Name every place we assume scale we do not have.

Then: what is the realistic retail price of the FIRST sellable device.
Not the dream product. The first one. If data is missing, say exactly what.

7. AMBITIONS I DID NOT PRICE

What quietly assumes capacity we do not have: kernel, graphics, UI toolkit,
networking, security, SDK, app ecosystem, camera, audio, modem, power
management, updates, hardware bring-up, PCB, manufacturing, certification.

For each: what AI agents materially reduce, what AI cannot remove,
whether it can be deferred. Be unsparing.

8. ECOSYSTEM REALITY CHECK

The user asks: "where is my banking app?"

Also: messaging, maps, ride-hailing, gov services, password managers, 2FA,
streaming, work apps, payments.

Compare NATIVE-ONLY / ANDROID COMPATIBILITY LAYER / ANDROID CONTAINER-VM /
WEB-PWA-FIRST / REMOTE EXECUTION / other.

For each: security cost, performance, battery, engineering, legal dependency,
user experience.

Then recommend what MUST be experimentally investigated during Phone Zero
rather than deferred to hardware.

9. THINGS I DODGED

Inspect: camera and ISP, GPU, modem, carrier certification, RF, battery,
thermals, secure boot, device certification, payments, DRM, manufacturing,
repair, warranty, support lifetime, app distribution, funding.

For each dodged area: why dodged, when it becomes a blocker, earliest
address point. Expose them. Do not solve them now.

10. PHONE ZERO REALITY CHECK

What can a virtual machine genuinely prove, approximate, or never prove?

Split:

CAN PROVE
CAN APPROXIMATE
NEEDS DEV BOARD
NEEDS CUSTOM HW
NEEDS PRODUCTION-LIKE HW

Address UI latency, memory footprint, IPC, scheduler, security, app lifecycle,
battery, thermals, camera, GPU, radio, suspend/resume, touch latency, cost.

Then: the minimum point at which we MUST leave QEMU, and why.

11. WHAT THE USER ACTUALLY GETS IN 24 MONTHS

Ignore the vision statement. Assume: one founder, AI agents, limited capital,
hiring only after the project proves itself.

Describe the most realistic device we could possess in 24 months. Concrete.
What works. What is incomplete. What is ugly. What apps run. Can it make
calls. Can it be daily-driven. Can another person use it without the founder.
Could it be legally sold. Would an ordinary person buy it.

If the honest answer is "an impressive research phone only its creator would
currently use" — say exactly that. It is more useful than fantasy.

12. THE THREE QUESTIONS THAT CAN KILL THE PROJECT

Existential assumptions only, not implementation risks.

For each: the question, why it is existential, earliest observable signal,
cheapest experiment, deadline to learn the answer.

13. STRIPPED AND SHARPENED

Restate the product thesis in exactly three sentences.

Then:
ONE strongest MUST BEAT candidate.
ONE cheapest MUST MATCH.
ONE deliberate CAN LOSE.

Recommendations, not founder decisions.

14. HONEST STATUS

Pick exactly one:

ARCHITECTURE REQUIRES MINOR CORRECTIONS
ARCHITECTURE REQUIRES MAJOR CORRECTIONS
CORE PRODUCT ASSUMPTIONS MUST BE TESTED BEFORE ARCHITECTURE FREEZE
PRODUCT PREMISE REQUIRES RECONSIDERATION

"PROCEED AS SPECIFIED" is forbidden.

List the exact blockers.

15. ARCHITECTURE FREEZE GATES

What evidence must exist before v0.2 is frozen for Milestone 1:

MUST RESOLVE BEFORE MILESTONE 1
MAY REMAIN OPEN DURING MILESTONE 1
MUST RESOLVE BEFORE MONTH 3
MUST RESOLVE BEFORE PHYSICAL HARDWARE

Do not demand answers that Milestone 1 itself exists to discover.

16. THE 10 FOUNDER QUESTIONS

Exactly 10.

Only questions whose answers materially change product, cost,
architecture, scope or timeline.

Q1 MUST be the target retail price or price range.

Q2 MUST be which user-perceivable properties the founder most wants to beat
contemporary flagships on.

No implementation trivia.

THEN STOP.

Do not propose v0.2.
Do not write code.

Next step is independent review and founder decisions.
