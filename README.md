# Vibe Coding — course, demo and promo

A six-week course that teaches IT students and juniors to build with AI agents — and to review what those agents write. The project includes a live site, an interactive OpenCode-style demo, a 19-lesson course with progress tracking and a certificate, a poster, a slide deck and a promo video.

**Live:** https://sehaxe.github.io/vibe-coding/

## What is inside

```
site/      landing page + interactive demo + course (19 lessons, localStorage progress, certificate)
poster/    A2 poster (HTML + PDF)
slides/    10-slide deck, keyboard navigation, print to PDF
video/     macOS-style promo stage, Playwright recording, ffmpeg assembly
docs/      fact sheet, roles, 7-minute script
```

## Run locally

```bash
python3 -m http.server 8100
# landing:  http://127.0.0.1:8100/site/
# course:   http://127.0.0.1:8100/site/course.html
# poster:   http://127.0.0.1:8100/poster/poster.html
# slides:   http://127.0.0.1:8100/slides/
```

## Rebuild the promo video

```bash
npm i
node video/record.mjs        # records video/raw/*.webm (needs Chromium)
# put the track at video/music/nangs.mp3, then:
./video/assemble.sh          # video/out/vibe-coding-promo.mp4
```

## Course facts

6 weeks · 36 hours · 19 lessons · 12–16 seats · $290 (early bird $240) · starts 10 Nov 2026 · certificate co-signed by the IT faculty partner.

## Team

Denis — analyst & coordinator · Danik — curriculum developer · Mukhammed — business & value lead · Arseniy — designer & QA.

## Credits

The OpenCode wordmark is the property of its authors and is used here for a course about OpenCode. Fonts: JetBrains Mono and Instrument Serif (SIL Open Font License).
