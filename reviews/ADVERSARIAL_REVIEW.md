# PHONE ZERO — ADVERSARIAL ARCHITECTURE REVIEW

Review target: `docs/architecture/ARCHITECTURE_GENESIS_v0.1.md`
Review mode: `prompts/03_ADVERSARIAL_REVIEW.md`
Reviewer: ChatGPT — hostile independent reviewer

This review deliberately does not inherit Genesis's section numbering, founder-question list, or conclusions. Prompt 03 contains a wording defect: the critical-path list names five sections while the next sentence says "those four". I treated all five named sections — Prompt 03 §§11, 2, 8, 14, 16 — as mandatory critical path. No section below was compressed for context reasons.

---

## 11. WHAT THE USER ACTUALLY GETS IN 24 MONTHS

Genesis is strongest when it stops pretending that architecture is the hard part, but even its month-24 projection is too generous in several places.

The most realistic 24-month artifact for one founder plus agents, starting from no handset code, no selected SoC, no modem agreement, no app-distribution agreement, no certification path, no BOM quotes, and no production partner, is **not yet a consumer phone**. It is more plausibly one of these, in descending probability:

1. a virtual platform plus a development-board demonstration of the chosen stack;
2. a bench or handheld prototype assembled around commercially available modules/reference hardware;
3. a research handset that boots, renders a UI, connects over Wi-Fi, exercises selected peripherals and perhaps makes calls in a lab configuration;
4. only under substantially better-than-current assumptions, a daily-drivable founder device.

Genesis asserts that the month-24 device plausibly has calls/SMS, usable daylight camera, Wi-Fi/Bluetooth, verified rollback, a small native essential-app set and all-day battery. None of those handset properties is currently evidenced. Calls depend on modem integration and network/carrier reality. Camera depends on sensor/ISP support and tuning. All-day battery is explicitly outside what QEMU can establish. "A small essential-app set running natively" conflicts with Genesis's own ecosystem analysis: the apps that make a handset essential — banking, maps, transport, government, work, payments — are precisely the ones the founder cannot simply decide to make native.

The realistic 24-month answer therefore is harsher than Genesis's: **an impressive research phone or development platform that its creator may use, but which should not be assumed to replace an ordinary person's existing smartphone.** It may make calls; that is not yet a forecast worth planning around. It is unlikely to be legally saleable as a finished consumer handset without an earlier and funded certification/manufacturing track. An ordinary buyer should not be expected to buy it merely because the software stack is interesting or the BOM is low.

The project is genuinely good at admitting that a research-only outcome is possible. It is merely plausible where it assigns finished-phone properties to month 24 without a physical platform, supplier path or ecosystem path.

---

## 2. MUST MATCH / MUST BEAT / CAN LOSE

### MUST MATCH

The Genesis list is directionally useful but mixes product floors, business commitments and implementation choices.

The true consumer-phone MUST MATCH set is smaller and more brutal:

- **Essential apps and identity/payment flows:** banking, primary messaging, maps/navigation, 2FA/passkeys, transport, government services where relevant, password managers, work authentication, and payments where the target market expects them. Missing several of these makes the device a secondary phone.
- **Telephony/radio reliability:** calls, SMS and data on the target carriers, including whatever IMS/VoLTE/VoNR path the market actually requires.
- **All-day battery under a defined real workload.** QEMU cannot close this.
- **Touch/display responsiveness:** frame pacing and input latency good enough that a normal user does not immediately perceive the device as broken or cheap.
- **Security/update path:** verified boot/root of trust where hardware permits it, vulnerability response, rollback-safe updates, and a support period the project can actually finance.
- **Basic camera competence:** not flagship quality, but reliable capture, focus/exposure and video good enough for documents, QR codes, family snapshots and common apps.
- **Reliability:** suspend/resume, alarms, notifications, storage integrity, crash recovery and updates must behave like an appliance, not a dev board.

Genesis's five-year update lifetime and repairability are valuable product commitments, but they should not be smuggled into baseline parity before their economics are priced. A five-year promise made by a project that cannot finance five years is worse than a shorter honest commitment.

### MUST BEAT

None of Genesis B1–B4 is currently entitled to be called the project's MUST BEAT. They are candidates selected by the author, not founder-approved differentiation.

**B1 battery ≥1.3× price-band median:** measurable, but the proposed explanation is weak. Genesis itself admits modem/display dominate. The statement that engineering cost is "low — mostly PMIC choice and scheduler policy" is not demonstrated and is likely the wrong capacity model for a new handset. Battery optimization crosses display, modem state, firmware, drivers, suspend, radios, thermals, background execution, app behavior and cell/enclosure volume. Phone Zero can test scheduler/policy deltas virtually but cannot prove the headline advantage until a representative board/device exists. **Falsify:** same-class hardware, fixed workload, independent comparison; if the advantage disappears after controlling battery Wh, display and modem, it is not a stack differentiator.

**B2 zero ad tracking/idle telemetry:** cheap to measure and low BOM impact, but Genesis correctly admits buyer value is unknown. It is also achievable on an AOSP-derived product without a custom kernel. **Falsify as a MUST BEAT:** user research shows it does not materially affect purchase/retention, or a tuned AOSP reference reaches the same metric at materially lower engineering cost.

**B3 5+ years updates:** this is primarily a support obligation, not a differentiator until the organization proves it can deliver it. The proposed falsification — one monthly release in ≤5 founder-days — is useful, but one month is insufficient evidence for five years. **Falsify:** update workload does not converge downward, upstream/vendor dependencies prevent patching, or support cost destroys unit economics.

**B4 repairability:** meaningful and testable only on physical mechanical design. It is not a software-stack differentiator. Parts availability for five years is a supply-chain commitment that a prototype cannot prove.

The strongest candidate worth carrying forward is **measured low resource requirement that enables cheaper hardware without degrading the MUST MATCH experience**. That directly connects the unusual stack to the load-bearing lower-cost thesis. Metric: minimum RAM/storage/SoC class required to complete a fixed daily-use workload at parity with a tuned AOSP baseline. Target should not be invented until baseline measurements exist. BOM impact is then directly priceable. Phone Zero can begin this experiment virtually. Falsification is clean: if the focused stack does not permit a materially cheaper hardware configuration after compatibility costs are included, the custom-stack cost thesis loses its strongest technical lever.

### CAN LOSE

Several Genesis concessions are defensible: no mmWave, no 8K/ProRes, 1080p-class display, no gaming-first thermal target, restrained charging. But concessions must follow target-market evidence rather than become architecture by declaration.

The dangerous concessions are camera quality, biometrics, carrier/eSIM behavior and language/market scope because they interact with ordinary daily use or distribution. "English + Russian first" is not inherently wrong; the error is choosing it before target market is fixed. "No biometrics beyond capacitive fingerprint" may be perfectly acceptable, but only if required banking/payment/authentication flows work with it.

---

## 8. ECOSYSTEM REALITY CHECK

Genesis correctly identifies ecosystem as existential, then weakens its own analysis by treating "Android compatibility layer" as if access to APK execution approximately means access to the Android ecosystem. It does not.

**Native-only:** technically clean and commercially fatal for a general consumer handset unless the target market is an unusually narrow niche. Security/performance/battery can be excellent; app availability is the failure.

**Android compatibility layer:** potentially the best technical experiment, but "runs APK" is nowhere near "banking app works." Real apps may depend on Play services, integrity/attestation, hardware-backed keystore, DRM, push messaging, location APIs, camera/media contracts, NFC/payment certification and anti-tamper assumptions. Security cost is high because the compatibility surface becomes part of the trusted maintenance burden. Engineering cost is continuous, not a one-time port.

**Android container/VM:** useful as a compatibility escape hatch and perhaps easier to isolate, but it duplicates substantial runtime/framework surface, consumes RAM/storage, complicates notifications/background execution and can directly erase the low-footprint thesis. Hardware-backed identity and integrity remain hard. It must be measured, not dismissed or blessed.

**Web/PWA-first:** useful for long-tail services and project-owned apps, not a general solution for essential mobile apps. It should be treated as a supplement.

**Remote execution:** unacceptable as the primary ecosystem strategy for a personal phone because availability, latency, privacy, server cost and account/security dependencies become product-critical. It can be a development tool, not the product answer.

**Other strategy worth testing: AOSP-derived product first.** Genesis frames tuned AOSP as an alternative to the thesis, but it is also the most important control group. If AOSP on the same candidate hardware can satisfy the founder's real MUST BEAT/MUST MATCH set and target price, the custom stack must justify every additional year it consumes.

Phone Zero must investigate before custom handset hardware:

1. one real high-friction banking/authentication app, not a toy APK;
2. one mapping/navigation workload;
3. push notifications and background lifecycle;
4. hardware-backed key/attestation expectations;
5. DRM/media path if streaming is target-market essential;
6. actual RAM/storage/idle-power overhead of the compatibility strategy;
7. distribution/legal dependencies separately from technical APK execution.

The Genesis phrase that M4 "cannot be closed by engineering" is too absolute. Parts of M4 are engineering; other parts are licensing, publisher policy and platform trust. The project must separate those failure modes because they require different exits.

---

## 14. HONEST STATUS

**CORE PRODUCT ASSUMPTIONS MUST BE TESTED BEFORE ARCHITECTURE FREEZE**

Exact blockers:

1. **No founder-approved target retail price or initial volume.** Without both, "materially lower cost" has no numerical meaning.
2. **No founder-approved MUST BEAT.** The current B1–B4 are author proposals.
3. **No demonstrated reason for a custom kernel.** Genesis itself shows most claimed benefits are available on AOSP/Linux.
4. **No validated ecosystem path.** APK execution, distribution, Play-service dependence, attestation and banking/payment acceptance are unresolved.
5. **No real cost architecture.** The table is structurally useful but numerically empty at every volume.
6. **No target market/carrier scope.** This prevents meaningful modem, certification, language, payments and app requirements.
7. **No representative physical platform.** Battery, thermals, camera, touch, RF and suspend/resume remain outside the evidence base.
8. **One-founder capacity remains an assumption.** AI reduces code-production cost but not vendor access, certification, industrial design, RF, physical debugging, legal agreements or long-lived support obligations.

This status is not a condemnation. It means the project has reached the point where another architecture document is less valuable than a handful of cheap discriminating experiments and founder product decisions.

---

## 16. THE 10 FOUNDER QUESTIONS

These are independently derived for this review; they are not copied from Genesis F1–F10.

1. **What retail price range must the first sellable Phone Zero hit, and at what initial production volume must that price be viable?**
2. **Which one or two user-perceivable properties must Phone Zero beat contemporary flagships or the chosen comparison class on strongly enough that a buyer would switch?**
3. **Who is the first buyer and in which first market/carrier environment must the device work?**
4. **Which exact everyday apps/services are non-negotiable for that first buyer — name the minimum set whose absence makes the product a failure?**
5. **Is running Android applications an acceptable product dependency, even if doing so becomes the largest compatibility and maintenance layer in the system?**
6. **Is a custom kernel itself part of the product identity, or may the project ship on Linux/AOSP if experiments show that doing so reaches the product goals faster and cheaper?**
7. **Which compromises are actually acceptable on camera, gaming, display, charging, biometrics, repairability and premium radio features for the first sellable device?**
8. **How much capital may be spent before product-market and architecture evidence must justify further physical-hardware work?**
9. **What outcome at 24 months counts as success: research platform, founder-daily-driver, limited developer device, or legally sellable consumer handset?**
10. **What evidence would make you stop the phone path rather than continue because of sunk time — failed price economics, ecosystem failure, no custom-stack advantage, capacity, or some explicit combination?**

---

## 1. CLAIMS I FAILED TO PROVE

The document is unusually candid about its evidence level, but candor does not convert estimates into evidence. Load-bearing unproved claims include:

- **Lower cost:** no target price, no supplier quote, no volume economics. Required evidence: price target + real BOM/NRE/cert/support figures at a stated volume. Actual evidence: none.
- **Focused stack can reduce required hardware tier:** required evidence: same workload on focused stack and tuned AOSP, then price the resulting RAM/storage/SoC delta. Actual evidence: none.
- **Battery can be a 1.3× differentiator:** required evidence: representative hardware and controlled comparative workload. Actual evidence: none.
- **Consumer-perceived quality is reachable by one founder + agents:** required evidence: a production-quality vertical slice tested by non-founders. Actual evidence: none.
- **Android compatibility is a viable ecosystem path:** required evidence: real difficult apps, service dependencies, attestation and distribution. Actual evidence: none.
- **Five-year updates are economically deliverable:** required evidence: repeated release-cycle measurements plus upstream/vendor support assumptions and unit economics. Actual evidence: none.
- **Security credibility:** required evidence: threat model, secure-boot/root-of-trust implementation on representative hardware, vulnerability process, external review/audit. Actual evidence: none.
- **Hardware portability:** required evidence: bring-up across at least two materially different boards/platforms. Actual evidence: none.
- **One-founder execution speed:** required evidence: sustained milestone throughput over months, not code-generation anecdotes. Actual evidence: none.
- **Virtual measurements transfer to handset behavior:** required evidence: correlation against representative hardware. Actual evidence: only host/QEMU capability.
- **Calls/camera/all-day battery in the 24-month device:** required evidence: modem/camera/power work on real hardware. Actual evidence: none.
- **Repair parts can remain available five years:** required evidence: supplier/support commitments and inventory economics. Actual evidence: none.

The only strong evidence in Genesis is exactly what it says: the host can compile and deterministically test a small freestanding RISC-V/QEMU target in two boot configurations. That is good evidence for test-harness feasibility and almost nothing else.

---

## 3. FIVE WEAKEST DECISIONS

### 1. Treating a purpose-written stack as the default experimental center

Assumption: ownership of more stack creates enough buyer or cost advantage to justify the maintenance surface. Alternative: tuned AOSP/Linux as baseline/product, with only differentiated components replaced. Switching cost now: tiny. Month 6: substantial. Month 18: potentially project-ending sunk cost. Earliest experiment: same workload and founder-approved differentiator on AOSP control versus minimal custom stack.

### 2. Carrying Android compatibility while also carrying custom-stack ambition

Assumption: the project can afford both the novel stack and a compatibility surface large enough for hostile real-world apps. Alternative: AOSP product, or a deliberately niche native-only product. Switching cost now: low; month 6: application architecture rewrite; month 18: ecosystem/security/update model rewrite. Earliest experiment: difficult app + attestation + background/push + resource measurement.

### 3. Making five-year updates a first-device promise

Assumption: long support is affordable at low volume and dependencies remain patchable. Alternative: shorter explicit support initially, extend only after economics prove it. Switching later is reputationally expensive if already promised. Earliest experiment: monthly release train plus dependency inventory and support-cost model.

### 4. Selecting B1–B4 before founder product differentiation exists

Assumption: battery/privacy/update lifetime/repairability are the reasons the intended buyer switches. Alternative: founder-defined differentiator set after target buyer/price are fixed. Switching now: free. Month 18: architecture and hardware may have optimized the wrong things. Earliest experiment: founder decision followed by buyer validation.

### 5. Treating low-volume hardware economics as a later-fillable table

Assumption: there exists some realistic component/supplier/certification path compatible with the eventual price. Alternative: begin from an available ODM/reference platform and let its economics constrain architecture. Switching now: free; month 6: painful; month 18: catastrophic if software was designed for hardware that cannot be bought or certified economically. Earliest experiment: real quote basket and ODM/reference-platform inquiry.

---

## 4. KERNEL STRATEGY UNDER SCRUTINY

The strongest rejected architecture is **tuned AOSP on commercially supported hardware**. It starts with the ecosystem, modem/camera/GPU HALs, security model, OTA machinery, developer tooling and years of field hardening already present. It lets the project spend scarce capacity on the product properties users can perceive. Its disadvantage is loss of architectural novelty and less freedom to reduce deep system footprint.

The second strongest is **mainline Linux plus a constrained product shell**, but only for a niche/non-handset or developer device. It provides ownership and a smaller comprehensible system while avoiding writing a kernel. Its consumer-handset weakness is the app ecosystem and mobile hardware support.

A third serious candidate is **AOSP/Linux kernel underneath a radically reduced/custom userspace**. This is especially dangerous to the custom-kernel thesis because it preserves mature hardware enablement while allowing much of the footprint, telemetry, UX and policy experimentation Genesis wants.

**Why do we need our own kernel? At present, we do not know that we do.** Genesis's own §4.3 is correct on this point. Smaller footprint, no telemetry, update verification and UI control can all be pursued without a new kernel. A custom kernel becomes justified only if a founder-approved MUST BEAT depends on kernel behavior and an AOSP/Linux baseline demonstrably cannot meet it at acceptable engineering or BOM cost.

Risk A — wrong architecture — is serious. Risk B — technically elegant architecture consumes the only founder's capacity and prevents a product — is larger. Genesis reaches the same conclusion, and the evidence available does not overturn it.

---

## 5. LANGUAGE AND MEMORY SAFETY

Genesis is right not to freeze a language, but its framing still risks turning memory safety into identity rather than threat reduction.

Memory safety has highest product value at remote-input and privilege boundaries: kernel, network parsing, media parsing, update verification, crypto-adjacent state machines and exposed services. But the real system will touch vendor firmware, modem interfaces, GPU/camera drivers, C ABIs and possibly Android compatibility code. A nominally safe kernel surrounded by enormous unsafe/vendor surfaces is not automatically safer than a mature Linux/Android stack with years of hardening.

The cost of forcing a safe-language rewrite is largest where hardware documentation, vendor code and existing drivers are C-centric. FFI does not merely "reintroduce unsafety"; it creates an ownership/ABI/lifetime boundary that must be designed and tested. Developer velocity should be measured on representative driver and service work rather than argued.

Required now: define threat boundaries and allow the implementation language to remain open. Do not make "no C" a product requirement. Measure defect rate, fuzzability, bring-up time and review burden on Milestone-scale code before freezing a language policy.

---

## 6. COST ARCHITECTURE UNDER ATTACK

The cost section is honest but not yet a cost architecture. Every numeric cell is UNKNOWN. That means the load-bearing product claim has no economic evidence.

The 1k/10k/100k/1M table correctly exposes scale, but none of its assumptions currently holds at any of those volumes because there are no supplier quotes, MOQ terms, yield assumptions, tooling/NRE numbers, certification budgets, logistics, warranty reserves, channel margins, taxes/duties or support costs.

The model `Retail price = BOM + NRE + certification + per-device support + margin` is also incomplete as commercial arithmetic. Depending on route to market, it may need assembly/test loss, freight, duties/tax treatment, packaging/accessories, payment/channel fees, warranty/RMA reserve, inventory financing, returns and retailer/distributor margin. This matters most at low volume.

The statement that software can act on three of five terms is too coarse. Software can influence required hardware tier and support/integration cost, but it can also increase NRE/support dramatically. A custom stack is not automatically a cost reducer; at 1k–10k it may be one of the largest costs per unit.

**Realistic retail price of the first sellable device cannot be responsibly stated from Genesis.** The data required by Prompt 03 is absent. The correct output is not a guessed dollar figure; it is: target retail price unknown, BOM unknown, certification/NRE unknown, support cost unknown, initial volume unknown. Therefore price viability is currently unassessed.

Before Milestone 1, the project does not need a perfect million-unit model. It does need enough real sourcing data to answer whether the founder's target price is even in the same universe as a low-volume first device.

---

## 7. AMBITIONS I DID NOT PRICE

Genesis lists the ambitions but underprices several in capacity terms.

- **Kernel:** agents accelerate implementation/tests; they do not create hardware documentation, production debugging history or a security maintenance community. Can be avoided entirely until justified.
- **Graphics/GPU:** agents help glue/tests; proprietary documentation and driver maturity dominate. Defer custom work; use supported hardware path.
- **UI toolkit:** code is cheap relative to polish, accessibility, internationalization, IME/input, rendering correctness and years of edge cases. Defer novelty.
- **Networking/security:** protocol code can be generated; security assurance, incident response and patch maintenance cannot.
- **SDK/ecosystem:** agents can build tooling; they cannot make banks, governments and messaging vendors support the platform.
- **Camera/ISP:** scaffolding is cheap; tuning and vendor integration are not. Use vendor-supported path or accept visibly weaker camera.
- **Audio:** underestimated; telephony routing, Bluetooth profiles, echo cancellation and device-state interactions are product-critical.
- **Modem/RF:** agents have little leverage over vendor access, firmware, IMS/carrier behavior, antenna/RF validation and certification.
- **Power:** policy code is cheap; instrumentation, firmware interactions, modem/display states and physical validation dominate.
- **Updates:** machinery is buildable; maintaining every dependency for years is the cost.
- **Hardware/PCB/manufacturing:** agents assist review/documentation; physical iteration, DFM, EMC, yield and supplier negotiation remain external work.
- **Certification:** almost no schedule compression from AI.

The hidden capacity assumption is not "can one founder write enough code?" Agents make that question less important. It is **can one founder simultaneously own all external interfaces and long-lived obligations of a handset company?** Genesis does not price that.

---

## 9. THINGS I DODGED

Genesis at least names most dodged areas, which is good. The remaining problem is timing.

- **Camera/ISP:** blocker when M3 becomes real; address when selecting the first supported physical platform, not after kernel architecture.
- **GPU:** blocker for M5; address at board/platform selection. A platform without a maintainable graphics path should be rejected early.
- **Modem/carrier/RF:** blocker for M2 and saleability; vendor/support/certification feasibility belongs before custom PCB.
- **Battery/thermals:** blocker for B1/M1; first representative dev board.
- **Secure boot/root of trust:** blocker for security credibility and possibly app attestation; must influence SoC/platform selection.
- **Payments/DRM/attestation:** blocker for ecosystem; investigate during the first real-app experiment.
- **Manufacturing/repair/warranty:** blocker for first sellable hardware; get ODM/CM reality before custom mechanical commitments.
- **Support lifetime:** blocker before making B3 a promise; model from first release.
- **Funding:** blocker before any path requiring certification/custom hardware. "Limited capital" is not a budget.

The most dangerous dodge is **supplier/platform access**: a technically attractive SoC is useless if the project cannot obtain documentation, BSP support, modem integration help, MOQ/pricing or a production route.

---

## 10. PHONE ZERO REALITY CHECK

### CAN PROVE IN QEMU

Boot/test harness, deterministic success/failure, core memory/scheduler/IPC correctness, selected update-state logic, protocol/unit behavior, rough footprint of the software being run, reproducible builds and failure injection.

### CAN APPROXIMATE

Relative software overhead, some frame-pacing logic, workload memory behavior, app lifecycle mechanics, policy-level energy proxies. These approximations become useful only after correlation with real hardware.

### NEEDS DEV BOARD

Real suspend/resume, hardware timers/interrupt behavior, GPU/display pipeline, touch latency, Wi-Fi/BT behavior, camera pipeline, modem integration, power states, thermals and battery measurements.

### NEEDS CUSTOM HARDWARE

Antenna/RF design, enclosure/thermal interactions, chosen battery/mechanical constraints, custom PCB behavior, secure-element integration if not present on dev hardware.

### NEEDS PRODUCTION-LIKE HARDWARE

Yield, calibration, assembly/test time, final RF/certification behavior, warranty failure modes and actual manufacturing economics.

Genesis overclaims one item: outbound-connection counting in QEMU can prove the tested image emitted no unexpected flows under the tested scenario; it cannot prove the future product has "zero telemetry" across modem/baseband, vendor firmware, compatibility services and production integrations.

Minimum exit from QEMU: **as soon as a candidate product architecture depends on a physical MUST MATCH/MUST BEAT or on vendor hardware support.** Practically, board selection should happen before substantial custom-kernel investment because GPU, modem, camera, suspend and secure-boot realities can invalidate an otherwise elegant virtual architecture.

---

## 12. THE THREE QUESTIONS THAT CAN KILL THE PROJECT

### KILL 1 — Can the first target buyer use the essential apps/services on a legally and technically sustainable stack?

Why existential: without it, Phone Zero is a secondary/research device regardless of kernel quality. Earliest signal: one hostile real app fails due to services/attestation/distribution assumptions. Cheapest experiment: define minimum app set, then test the hardest representative apps and their dependencies. Deadline: before significant custom-kernel work.

### KILL 2 — Can a first sellable device hit the founder's price at realistic low volume after BOM, NRE, certification, support, warranty and channel costs?

Why existential: lower cost is the stated load-bearing thesis. Earliest signal: quote basket plus low-volume overhead already exceeds the price envelope. Cheapest experiment: founder price/volume target + real sourcing/ODM quotes + rough landed-cost model. Deadline: before architecture freeze that assumes custom hardware economics.

### KILL 3 — Does the custom stack create a buyer-relevant or cost-relevant advantage large enough to pay for its permanent maintenance burden?

Why existential: if not, the project can reach the same product faster with AOSP/Linux and the custom stack is self-imposed cost. Earliest signal: AOSP control matches the chosen MUST BEAT while requiring less engineering or equal hardware. Cheapest experiment: one fixed workload and one founder-approved differentiator measured on custom path versus tuned AOSP. Deadline: before the custom kernel becomes the critical path.

Genesis's one-founder capacity risk is real, but it is downstream of Kill 3: if the project chooses less novel architecture, capacity changes radically. Do not confuse a scope choice with an immutable existential fact.

---

## 13. STRIPPED AND SHARPENED

Phone Zero tests whether a focused mobile software stack can enable a materially cheaper daily-drivable phone without losing the essential smartphone experience. The custom kernel, RISC-V and every other deep architectural choice are hypotheses, not the product. If the focused stack cannot produce a measurable buyer-relevant or hardware-cost advantage over a supported AOSP/Linux baseline, the project should use the baseline rather than preserve novelty.

**Strongest MUST BEAT candidate:** lower required hardware resources for the same founder-defined daily-use experience, sufficient to reduce the priced hardware configuration.

**Cheapest MUST MATCH:** deterministic, reliable appliance behavior in the virtual platform — boot, crash recovery and update rollback — because it is cheap to test before hardware. App availability is cheaper to investigate than to build, but it is not technically cheap to match.

**Deliberate CAN LOSE:** premium camera imaging for the first device, provided basic document/QR/everyday capture remains acceptable.

---

## 15. ARCHITECTURE FREEZE GATES

### MUST RESOLVE BEFORE MILESTONE 1

- Founder target price **and initial viable volume**.
- Founder-approved MUST BEAT set.
- First target buyer/market and minimum essential-app set.
- Define what Milestone 1 is intended to falsify. It must not become "start writing our kernel" by default.
- Decide the **experimental baseline**: a tuned AOSP/Linux control must exist wherever the experiment claims custom-stack advantage.

A complete production BOM and final ecosystem strategy do **not** need to be solved before a small experimental Milestone 1 if Milestone 1 is explicitly designed to answer architecture questions. Genesis currently over-gates Milestone 1 by demanding several answers that can be learned in parallel or by the experiment itself.

### MAY REMAIN OPEN DURING MILESTONE 1

- Exact physical ISA/SoC, if Milestone 1 is architecture-neutral.
- OpenSBI versus bare M-mode.
- Final kernel language, provided the experiment does not create an irreversible language commitment.
- Final compatibility strategy, while one representative compatibility experiment runs separately.
- Final industrial design, camera tier and modem vendor.

### MUST RESOLVE BEFORE MONTH 3

- Whether custom stack beats the AOSP/Linux control on the chosen measurable property.
- Whether one representative hard app can work under the ecosystem strategy.
- Whether the founder/agent throughput is converging rather than accumulating maintenance debt.
- Candidate physical platform with viable GPU/camera/modem/security support.
- First real sourcing economics.

### MUST RESOLVE BEFORE PHYSICAL HARDWARE COMMITMENT

- Budget/capital gate.
- Supplier access and production route.
- Modem/RF/certification route.
- Secure-boot/root-of-trust requirements.
- Power/thermal target and enclosure constraints.
- BOM/NRE/certification economics at the intended prototype and sellable volumes.

---

# FINAL REVIEW FINDING

Genesis is **genuinely good** where it labels evidence honestly, refuses to freeze RISC-V/SoC/kernel language, recognizes ecosystem and capacity risks, and explicitly admits that its own custom kernel is not justified. It is **merely plausible** where it projects handset capabilities, treats proposed differentiators as product candidates without founder/buyer evidence, and discusses cost without a single validated economic magnitude.

The most important result of the review is not "custom kernel bad" or "AOSP good." It is that **the architecture is currently upstream of missing product facts**. Price, initial volume, target buyer/market, minimum essential-app set and the actual reason a buyer switches must constrain the architecture before the architecture can be frozen.

Prompt 03 is complete. No v0.2 is proposed. No implementation is authorized.