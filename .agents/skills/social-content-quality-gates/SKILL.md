---
name: social-content-quality-gates
description: Review Finday social content through separate brief, factual, visual, artifact, approval, publication, and read-back gates for the exact content version and checksum.
---

# Finday social content quality gates

Quality is a chain of evidence, not a single checkbox:

1. **Brief gate** — identity, objective, audience, source facts, exact constraints,
   acceptance criteria, owner, version, and required approvals are complete.
2. **Editorial gate** — facts/claims, brand voice, grammar, platform limits,
   accessibility, links, copyright/consent, disclosures, and compliance pass.
3. **Visual gate** — approved identity provenance, palette/type/layout rules,
   workflow/product proof, mobile crop/readability, data safety, dimensions, and
   native-raster requirements pass.
4. **Artifact gate** — files open, counts/order/dimensions/checksums match, no
   missing assets, and rendered output is inspected.
5. **Approval gate** — QA, business, and publish approval are separate and bound
   to the exact version/checksum.
6. **Publication gate** — authorized account/scope, preflight, duplicate check,
   idempotency, and provider response are evidenced.
7. **Read-back gate** — live or scheduled target matches account, visibility,
   copy, media, links, metadata, time, ID, URL, and expected status.

Return `PASS`, `PASS_WITH_REQUIRED_FIXES`, `FAIL`, or `BLOCKED`. Every finding has
category, severity (`CRITICAL|HIGH|MEDIUM|LOW`), location, evidence, exact required
fix, and approval impact. Never silently rewrite material claims or treat an
earlier gate as proof of a later one.
