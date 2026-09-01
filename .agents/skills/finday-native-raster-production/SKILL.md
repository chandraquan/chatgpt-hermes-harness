---
name: finday-native-raster-production
description: Generate static Finday posts and carousel slides only through native GPT Image 2, with required identity inputs, direct raster resize evidence, and fail-closed provenance.
---

# Finday native raster production

This procedure governs only exact approved Finday briefs and identity references.
For every static post and carousel slide, the sole production route is native GPT
Image 2 (`gpt-image-2`). No alternate image model or production path qualifies.

Load the canonical governance README, governance policy, transition matrix, and
design system from the portable `<finday-shared-root>\Finday Ads` package first.
Missing or conflicting source, identity, approval, or exact-version evidence is
`BLOCKED`.

## Static and carousel production gate

- Require the exact campaign/content/version, accepted text-to-image prompt,
  source facts, Finday logo input, approved brand avatar or model input, and
  expected canvas. Inputs must be readable in the current task context; missing
  or unapproved identity input is `BLOCKED`.
- Request a 4:5 composition from `gpt-image-2` for each static item or carousel
  slide. Preserve its output as the untouched raw native raster.
- Directly resize each raw raster to final `1080x1350` (4:5). This resize is
  mandatory, must be raster-to-raster only, and must never crop, redraw,
  re-render, overlay, composite, screenshot, trace, or vectorize the image.
- Video first frames remain native raster at `1080x1920` (9:16) and follow their
  separate approved-first-frame gate; this static/carousel route does not create
  a shortcut around that gate.
- Do not redraw, reinterpret, face-swap, or synthesize a missing logo or mascot.
  Do not use HTML, SVG, Pillow, vector overlays, screenshots, or post-composited
  text to imitate a native provider output.
- Generate the complete artwork in one native `gpt-image-2` raster request. Do
  not use any alternate model, manual composition, or fallback production route.

Generate each carousel slide independently. Preserve raw provider output and
resized final artifacts as distinct files. Record provider, `gpt-image-2` model
and route, logo and avatar/model input paths plus checksums, prompt/version,
requested and observed raw dimensions, raw path/checksum, final path/checksum,
the literal `direct_raster_resize` operation and parameters, final `1080x1350`
dimensions, timestamp, and deviations. Inspect the actual final PNG dimensions,
alpha/color behavior where relevant, text legibility, identity fidelity, mobile
readability, and data safety.

A raw provider result is never the final artifact until the required direct raster
resize is complete and independently inspected. Each carousel slide is resized
independently from its own preserved native source. Any crop, missing raw/final
pair, absent operation evidence, wrong model, or alternate production route is
`BLOCKED`.

Successful generation proves only `DRAFTED`/produced evidence. It does not imply
visual QA, business approval, publish approval, publication, or verification.
