// Vibe Coding — sample certificate (Typst 0.15)
// Build: typst compile --font-path fonts certificate.typ certificate.pdf

#set page(width: 297mm, height: 210mm, margin: 0mm)
#set text(font: "Instrument Serif", size: 11pt, fill: rgb("#201d1d"))
#set par(leading: 0.75em)

#let ink = rgb("#201d1d")
#let cream = rgb("#fdfcfc")
#let blue = rgb("#007aff")
#let ember = rgb("#ff5a36")
#let mute = rgb("#646262")
#let faint = rgb("#9a9898")
#let lineCol = rgb("#201d1d").transparentize(86%)
#let mono = "JetBrains Mono"

// ---------- background ----------
#place(top + left, dx: 0mm, dy: 0mm)[
  #rect(width: 297mm, height: 210mm, fill: cream)
]

#place(top + left, dx: -55mm, dy: -70mm)[
  #circle(radius: 105mm, fill: ember.transparentize(95%))
]
#place(top + left, dx: 205mm, dy: -80mm)[
  #circle(radius: 115mm, fill: blue.transparentize(95%))
]
#place(top + left, dx: 190mm, dy: 150mm)[
  #circle(radius: 80mm, fill: ember.transparentize(97%))
]

// grid
#for i in range(0, 24) {
  place(top + left, dx: 0mm, dy: i * 9mm)[
    #line(length: 297mm, stroke: 0.25pt + ink.transparentize(96%))
  ]
}
#for i in range(0, 34) {
  place(top + left, dx: i * 9mm, dy: 0mm)[
    #line(length: 210mm, angle: 90deg, stroke: 0.25pt + ink.transparentize(96%))
  ]
}

// frame
#place(top + left, dx: 9mm, dy: 9mm)[
  #rect(width: 279mm, height: 192mm, stroke: 0.6pt + ink.transparentize(78%))
]
#place(top + left, dx: 11mm, dy: 11mm)[
  #rect(width: 275mm, height: 188mm, stroke: 0.35pt + ink.transparentize(90%))
]

// corner accents
#place(top + left, dx: 9mm, dy: 9mm)[
  #line(length: 18mm, stroke: 1.1pt + blue)
]
#place(top + left, dx: 9mm, dy: 9mm)[
  #line(length: 18mm, angle: 90deg, stroke: 1.1pt + blue)
]
#place(top + left, dx: 270mm, dy: 201mm)[
  #line(length: 18mm, stroke: 1.1pt + blue)
]
#place(top + left, dx: 288mm, dy: 183mm)[
  #line(length: 18mm, angle: 90deg, stroke: 1.1pt + blue)
]

// ---------- top bar ----------
#place(top + left, dx: 18mm, dy: 15mm)[
  #box[
    #image("assets/opencode-wordmark-light.png", height: 6.2mm)
    #h(3mm)
    #text(font: mono, size: 7.5pt, weight: "bold")[vibe-coding]
    #text(font: mono, size: 7.5pt, fill: mute)[ · cohort 04]
  ]
]
#place(top + right, dx: -18mm, dy: 15mm)[
  #text(font: mono, size: 6.2pt, tracking: 0.16em, fill: mute)[CERTIFICATE · VC-04-2026-001]
]

// ---------- hero ----------
#place(top + left, dx: 0mm, dy: 43mm)[
  #block(width: 297mm)[
    #align(center)[
      #text(font: mono, size: 7pt, tracking: 0.34em, fill: mute)[CERTIFICATE OF COMPLETION]
    ]
  ]
]
#place(top + left, dx: 0mm, dy: 52mm)[
  #block(width: 297mm)[
    #align(center)[
      #text(size: 34pt, tracking: -0.012em)[Vibe Coding]
    ]
  ]
]
#place(top + left, dx: 0mm, dy: 68mm)[
  #block(width: 297mm)[
    #align(center)[
      #text(style: "italic", size: 12pt, fill: mute)[ship apps by vibes, not by syntax]
    ]
  ]
]
#place(top + left, dx: 128mm, dy: 82mm)[
  #line(length: 41mm, stroke: 1.1pt + blue)
]
#place(top + left, dx: 0mm, dy: 87mm)[
  #block(width: 297mm)[
    #align(center)[
      #text(font: mono, size: 6.6pt, tracking: 0.2em, fill: mute)[THIS CERTIFIES THAT]
    ]
  ]
]
#place(top + left, dx: 0mm, dy: 95mm)[
  #block(width: 297mm)[
    #align(center)[
      #text(size: 27pt)[Dernovski Arseniy]
    ]
  ]
]
#place(top + left, dx: 0mm, dy: 111mm)[
  #block(width: 297mm)[
    #align(center)[
      #text(size: 9.5pt)[has completed the six-week Vibe Coding course]
    ]
  ]
]
#place(top + left, dx: 0mm, dy: 119mm)[
  #block(width: 297mm)[
    #align(center)[
      #text(font: mono, size: 6.8pt, tracking: 0.1em, fill: mute)[36 HOURS · 19 LESSONS · 6 MODULES · REVIEWED CAPSTONE]
    ]
  ]
]
#place(top + left, dx: 0mm, dy: 127mm)[
  #block(width: 297mm)[
    #align(center)[
      #text(style: "italic", size: 8.5pt, fill: mute)[with a shipped feature and a reviewed capstone]
    ]
  ]
]

// ---------- seal ----------
#place(top + left, dx: 236mm, dy: 80mm)[
  #block(width: 40mm, height: 40mm)[
    #place(center + horizon)[
      #circle(radius: 20mm, stroke: 0.7pt + blue)
    ]
    #place(center + horizon)[
      #circle(radius: 16.4mm, stroke: 0.35pt + blue.transparentize(40%))
    ]
    #place(center + horizon, dy: -2.2mm)[
      #text(font: "DejaVu Sans", size: 15pt, fill: blue)[✓]
    ]
    #place(center + horizon, dy: 5.8mm)[
      #text(font: mono, size: 4.6pt, tracking: 0.16em, fill: blue)[VERIFIED]
    ]
  ]
]

// ---------- signatures ----------
#place(top + left, dx: 24mm, dy: 158mm)[
  #block(width: 64mm)[
    #line(length: 64mm, stroke: 0.5pt + lineCol)
    #v(2mm)
    #text(style: "italic", size: 12pt)[Denis]
    #v(0.6mm)
    #text(font: mono, size: 5.8pt, tracking: 0.12em, fill: mute)[PROGRAMME LEAD]
  ]
]
#place(top + left, dx: 104mm, dy: 158mm)[
  #block(width: 64mm)[
    #line(length: 64mm, stroke: 0.5pt + lineCol)
    #v(2mm)
    #text(style: "italic", size: 12pt)[Danik]
    #v(0.6mm)
    #text(font: mono, size: 5.8pt, tracking: 0.12em, fill: mute)[CURRICULUM LEAD]
  ]
]

// ---------- QR ----------
#place(top + left, dx: 246mm, dy: 148mm)[
  #box(fill: white, inset: 2mm, stroke: 0.35pt + lineCol)[
    #image("assets/qr.png", width: 25mm)
  ]
  #v(1.2mm)
  #text(font: mono, size: 4.6pt, tracking: 0.12em, fill: mute)[SCAN TO VERIFY]
]

// ---------- footer ----------
#place(top + left, dx: 18mm, dy: 183mm)[
  #text(font: mono, size: 5.6pt, tracking: 0.1em, fill: mute)[ISSUED 28 OCTOBER 2026 · COHORT 04 · 12–16 SEATS]
]
#place(top + left, dx: 18mm, dy: 189mm)[
  #text(font: mono, size: 5.6pt, tracking: 0.1em, fill: mute)[DENIS · DANIK · MUKHAMMED · ARSENIY]
]
#place(top + left, dx: 18mm, dy: 195mm)[
  #text(font: mono, size: 5.6pt, tracking: 0.1em, fill: mute)[SEHAXE.GITHUB.IO/VIBE-CODING]
]
