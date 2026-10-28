# Vibe Coding — course, demo and promo

A six-week course that teaches IT students and juniors to build with AI agents — and to review what those agents write. The project includes a live site, an interactive OpenCode-style demo, a 19-lesson course with progress tracking and a certificate, a poster, a slide deck and a promo video.

**Live:** https://sehaxe.github.io/vibe-coding/

## What is inside

```
site/      landing page + interactive demo + course (19 lessons, localStorage progress, certificate)
poster/    A2 poster (HTML + PDF)
slides/    10-slide deck, keyboard navigation, print to PDF
video/     the 60 fps motion film (canvas), real demo clips, terminal harness
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

## The film

`video/promo/film.html` is a deterministic canvas timeline (108.54 s, 60 fps). Render frames and mux the track:

```bash
cd video/promo
FPS=60 node render.mjs                     # frames/f00000.jpg …
ffmpeg -framerate 60 -i frames/f%05d.jpg -i "/path/to/nangs.opus" \
  -c:v libx264 -crf 18 -pix_fmt yuv420p -c:a aac -b:a 192k -shortest out/nangs-film.mp4
```

The real screen demos live in `video/demos/`; the OpenCode terminal harness is in `video/term/`.

## Course facts

6 weeks · 36 hours · 19 lessons · 12–16 seats · $290 (early bird $240) · starts 10 Nov 2026 · certificate co-signed by the IT faculty partner.

## Team

Denis — analyst & coordinator · Danik — curriculum developer · Mukhammed — business & value lead · Arseniy — designer & QA.

## Credits

The OpenCode wordmark is the property of its authors and is used here for a course about OpenCode. Fonts: JetBrains Mono and Instrument Serif (SIL Open Font License).

## Print materials

- `certificates/` — A4 landscape sample certificate (Typst): `typst compile --font-path fonts certificate.typ certificate.pdf`
- `handout/` — A4 landscape tri-fold, 2 pages (Typst): `typst compile --font-path fonts handout.typ handout.pdf`
- `posters/statement.typ` — A2 portrait statement poster (Typst): `typst compile --font-path ../certificates/fonts statement.typ statement.pdf`

Print the handout double-sided, flip on short edge, fold in thirds. The certificate is A4 landscape; the statement poster is A2 portrait.

## Social card / SEO

`site/og.html` renders the 1200×630 card (`site/assets/og/og.jpg`). The landing and course pages carry canonical URLs, Open Graph, Twitter cards and Course JSON-LD; `sitemap.xml` and `robots.txt` live at the repo root.
