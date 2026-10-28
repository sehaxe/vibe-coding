// Vibe Coding — tri-fold handout (A4 landscape, double-sided, fold in thirds)
// Build: typst compile --font-path fonts handout.typ handout.pdf

#set page(width: 297mm, height: 210mm, margin: 0mm)
#set text(font: "Instrument Serif", size: 8pt, fill: rgb("#201d1d"))
#set par(leading: 0.9em)

#let ink = rgb("#201d1d")
#let cream = rgb("#fdfcfc")
#let blue = rgb("#007aff")
#let ember = rgb("#ff5a36")
#let mute = rgb("#646262")
#let faint = rgb("#9a9898")
#let lineCol = rgb("#201d1d").transparentize(84%)
#let mono = "JetBrains Mono"

#let mark(size, col) = box(width: size, height: size, stroke: 0.7pt + col)[
  #place(center + horizon)[
    #rect(width: size * 0.36, height: size * 0.36, fill: col)
  ]
]

#let panel(x, fill, body) = {
  place(top + left, dx: x * 99mm, dy: 0mm)[
    #rect(width: 99mm, height: 210mm, fill: fill)
  ]
  place(top + left, dx: x * 99mm, dy: 0mm)[
    #block(width: 99mm, height: 210mm, inset: (x: 9mm, y: 9mm))[#body]
  ]
}

#let fold() = {
  for x in (99mm, 198mm) {
    place(top + left, dx: x, dy: 0mm)[
      #line(length: 210mm, angle: 90deg, stroke: 0.25pt + ink.transparentize(82%))
    ]
  }
}

// ============================================================
// OUTSIDE — back cover | front cover | inside flap
// ============================================================

#panel(1, cream)[
  #box[#mark(4mm, ink) #h(2mm) #text(font: mono, size: 6.5pt, weight: "bold")[vibe-coding]]
  #v(20mm)
  #text(size: 16pt)[The team]
  #v(3mm)
  #text(font: mono, size: 6.8pt)[Denis — programme lead]
  #v(1.2mm)
  #text(font: mono, size: 6.8pt)[Danik — curriculum]
  #v(1.2mm)
  #text(font: mono, size: 6.8pt)[Mukhammed — business & value]
  #v(1.2mm)
  #text(font: mono, size: 6.8pt)[Arseniy — design & QA]
  #v(6mm)
  #text(style: "italic", size: 8pt, fill: mute)[built with the loop.]
  #v(12mm)
  #box(fill: white, inset: 1.5mm, stroke: 0.3pt + lineCol)[
    #image("assets/qr.png", width: 24mm)
  ]
  #v(1.2mm)
  #text(font: mono, size: 4.8pt, tracking: 0.1em, fill: mute)[SCAN FOR THE COURSE]
  #v(1.2mm)
  #text(font: mono, size: 4.8pt, fill: mute)[sehaxe.github.io/vibe-coding]
  #v(8mm)
  #line(length: 30mm, stroke: 0.5pt + lineCol)
  #v(2mm)
  #text(font: mono, size: 4pt, fill: faint)[PRINT A4 LANDSCAPE · DOUBLE-SIDED · FLIP ON SHORT EDGE · FOLD IN THIRDS]
]

#panel(0, ink)[
  #set text(fill: cream)
  #image("assets/opencode-wordmark-dark.png", height: 5.5mm)
  #v(1.5mm)
  #text(font: mono, size: 5.8pt, fill: cream.transparentize(45%))[vibe-coding · cohort 04]
  #v(25mm)
  #text(font: mono, size: 5.4pt, tracking: 0.22em, fill: cream.transparentize(45%))[A SIX-WEEK COURSE IN SHIPPING WITH AGENTS]
  #v(3mm)
  #text(size: 30pt)[Ship apps #linebreak() by #text(style: "italic", fill: blue)[vibes.]]
  #v(4mm)
  #text(size: 8pt, fill: cream.transparentize(28%))[From the first prompt to a reviewed, shipped feature.]
  #v(30mm)
  #line(length: 30mm, stroke: 1pt + blue)
  #v(3mm)
  #text(font: mono, size: 6.2pt)[STARTS NOV 10 · 12–16 SEATS]
  #v(1.5mm)
  #text(font: mono, size: 6.2pt, fill: blue)[open →]
]

#panel(2, cream)[
  #text(font: mono, size: 5.4pt, tracking: 0.18em, fill: mute)[WHAT YOU'LL SHIP]
  #v(4mm)
  #text(size: 18pt)[Three things #linebreak() you can show.]
  #v(6mm)
  #text(font: mono, size: 6pt, fill: blue)[01]
  #v(0.6mm)
  #text(size: 8pt)[A deployed landing page]
  #v(0.6mm)
  #text(size: 6.4pt, fill: mute)[brief → build → ship, in one session.]
  #v(4mm)
  #text(font: mono, size: 6pt, fill: blue)[02]
  #v(0.6mm)
  #text(size: 8pt)[A reviewed pull request]
  #v(0.6mm)
  #text(size: 6.4pt, fill: mute)[diffs, tests and edge cases — not vibes alone.]
  #v(4mm)
  #text(font: mono, size: 6pt, fill: blue)[03]
  #v(0.6mm)
  #text(size: 8pt)[A capstone you can show]
  #v(0.6mm)
  #text(size: 6.4pt, fill: mute)[a real feature, deployed and presented.]
  #v(10mm)
  #text(font: mono, size: 5.4pt, tracking: 0.18em, fill: mute)[WHO IT'S FOR]
  #v(2mm)
  #text(size: 7.5pt)[Students, juniors, designers and PMs who want to ship with agents — no CS degree required.]
  #v(8mm)
  #text(font: mono, size: 5.8pt, fill: mute)[19 LESSONS · 36 HOURS · 6 MODULES]
]

#fold()

// ============================================================
// INSIDE — gap + loop | curriculum | cohort & price
// ============================================================

#pagebreak()

#panel(0, cream)[
  #text(font: mono, size: 5.4pt, tracking: 0.18em, fill: mute)[THE GAP]
  #v(4mm)
  #text(size: 18pt)[AI writes code. #linebreak() Nobody teaches review.]
  #v(5mm)
  #text(font: mono, size: 6pt, fill: blue)[01] #text(size: 7.2pt)[Speed without safety.]
  #v(1.2mm)
  #text(font: mono, size: 6pt, fill: blue)[02] #text(size: 7.2pt)[Prototypes leak keys and skip edge cases.]
  #v(1.2mm)
  #text(font: mono, size: 6pt, fill: blue)[03] #text(size: 7.2pt)[Tutorials show prompts, not the loop.]
  #v(9mm)
  #text(font: mono, size: 5.4pt, tracking: 0.18em, fill: mute)[THE LOOP]
  #v(3mm)
  #text(font: mono, size: 6.2pt)[01  spec] #linebreak()
  #text(size: 6.6pt, fill: mute)[write the brief] #v(1.6mm)
  #text(font: mono, size: 6.2pt)[02  build] #linebreak()
  #text(size: 6.6pt, fill: mute)[vibe in opencode] #v(1.6mm)
  #text(font: mono, size: 6.2pt)[03  review] #linebreak()
  #text(size: 6.6pt, fill: mute)[hunt the bugs] #v(1.6mm)
  #text(font: mono, size: 6.2pt)[04  ship] #linebreak()
  #text(size: 6.6pt, fill: mute)[own the result] #v(7mm)
  #text(style: "italic", size: 7.4pt, fill: mute)[One loop, repeated until it is muscle memory.]
]

#panel(1, cream)[
  #text(font: mono, size: 5.4pt, tracking: 0.18em, fill: mute)[CURRICULUM]
  #v(4mm)
  #text(size: 18pt)[6 modules. 19 lessons.]
  #v(5mm)
  #text(font: mono, size: 6pt, fill: blue)[01] #text(size: 7.4pt, weight: "bold")[Foundations]
  #linebreak()
  #text(size: 6.2pt, fill: mute)[the agent loop · setup · first ship] #v(2.4mm)
  #text(font: mono, size: 6pt, fill: blue)[02] #text(size: 7.4pt, weight: "bold")[Prompting]
  #linebreak()
  #text(size: 6.2pt, fill: mute)[briefs · context · constraints] #v(2.4mm)
  #text(font: mono, size: 6pt, fill: blue)[03] #text(size: 7.4pt, weight: "bold")[Building]
  #linebreak()
  #text(size: 6.2pt, fill: mute)[UI · state · assets] #v(2.4mm)
  #text(font: mono, size: 6pt, fill: blue)[04] #text(size: 7.4pt, weight: "bold")[Review & test]
  #linebreak()
  #text(size: 6.2pt, fill: mute)[diffs · tests · edge cases] #v(2.4mm)
  #text(font: mono, size: 6pt, fill: blue)[05] #text(size: 7.4pt, weight: "bold")[Security]
  #linebreak()
  #text(size: 6.2pt, fill: mute)[secrets · auth · input] #v(2.4mm)
  #text(font: mono, size: 6pt, fill: blue)[06] #text(size: 7.4pt, weight: "bold")[Capstone]
  #linebreak()
  #text(size: 6.2pt, fill: mute)[ship · present · defend] #v(6mm)
  #text(size: 6.4pt, fill: mute)[Every module ends with a lab and a checkpoint.]
]

#panel(2, cream)[
  #text(font: mono, size: 5.4pt, tracking: 0.18em, fill: mute)[COHORT 04]
  #v(4mm)
  #text(size: 20pt)[Starts Nov 10]
  #v(4mm)
  #text(font: mono, size: 6.4pt)[6 weeks · 36 hours · 12–16 seats]
  #v(6mm)
  #text(size: 26pt)[\$290]
  #v(1mm)
  #text(font: mono, size: 6pt, fill: mute)[early bird \$240 until 3 November]
  #v(7mm)
  #text(font: mono, size: 5.4pt, tracking: 0.18em, fill: mute)[INCLUDED]
  #v(2mm)
  #text(size: 6.6pt)[19 lessons · labs · checkpoints]
  #v(1mm)
  #text(size: 6.6pt)[reviewed capstone · certificate]
  #v(1mm)
  #text(size: 6.6pt)[a shipped feature you can show]
  #v(8mm)
  #box(fill: white, inset: 1.2mm, stroke: 0.3pt + lineCol)[
    #image("assets/qr.png", width: 21mm)
  ]
  #v(1mm)
  #text(font: mono, size: 4.6pt, tracking: 0.1em, fill: mute)[DETAILS / APPLY]
  #v(2mm)
  #text(font: mono, size: 4.8pt, fill: mute)[sehaxe.github.io/vibe-coding]
]

#fold()
