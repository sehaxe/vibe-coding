# Memory

- Deploy: repo `sehaxe/vibe-coding`, Pages via GitHub Actions (`.github/workflows/pages.yml`, uploads repo root, root `index.html` redirects to `site/`). Live: https://sehaxe.github.io/vibe-coding/
- Video pipeline: `node video/record.mjs` records `video/raw/*.webm` via playwright-core + system Chromium; `./video/assemble.sh` muxes `video/music/nangs.*` if present. Silent draft lives in `video/out/`.
- Design: opencode DESIGN.md palette (#fdfcfc canvas, #201d1d ink, 4px radius, JetBrains Mono) + Instrument Serif headings; official OpenCode wordmark at `site/assets/brand/opencode-wordmark-{light,dark}.png` (trimmed from opencode.ai/brand).
- Course progress is localStorage (`vibe.done`, `vibe.name`); certificate prints via `window.print()` with print CSS.
