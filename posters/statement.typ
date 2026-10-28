// Vibe Coding — A2 statement poster (Typst 0.15)
// Build: typst compile --font-path ../certificates/fonts statement.typ statement.pdf

#set page(width: 420mm, height: 594mm, margin: 0mm)
#set text(font: "Instrument Serif", size: 10pt, fill: rgb("#fdfcfc"))
#set par(leading: 0.8em)

#let ink = rgb("#0d0b0b")
#let cream = rgb("#fdfcfc")
#let blue = rgb("#2f6bff")
#let ember = rgb("#ff5a36")
#let mute = rgb("#9a9898")
#let faint = rgb("#646262")
#let mono = "JetBrains Mono"

// ---------- background ----------
#place(top + left, dx: 0mm, dy: 0mm)[
  #rect(width: 420mm, height: 594mm, fill: ink)
]

// faint grid
#for i in range(0, 40) {
  place(top + left, dx: 0mm, dy: i * 15mm)[
    #line(length: 420mm, stroke: 0.2pt + cream.transparentize(97%))
  ]
}
#for i in range(0, 28) {
  place(top + left, dx: i * 15mm, dy: 0mm)[
    #line(length: 594mm, angle: 90deg, stroke: 0.2pt + cream.transparentize(97%))
  ]
}

// scanlines
#for i in range(0, 198) {
  place(top + left, dx: 0mm, dy: i * 3mm)[
    #line(length: 420mm, stroke: 0.15pt + cream.transparentize(96%))
  ]
}

// dust
#for i in range(0, 160) {
  let x = calc.rem(i * 67, 420) * 1mm
  let y = calc.rem(i * 131, 594) * 1mm
  place(top + left, dx: x, dy: y)[
    #circle(radius: 0.45mm, fill: cream.transparentize(92%))
  ]
}

// soft glows
#for i in range(0, 10) {
  place(top + left, dx: 420mm, dy: 0mm)[
    #circle(radius: (110 - i * 9) * 1mm, fill: blue.transparentize(97%))
  ]
}
#for i in range(0, 10) {
  place(top + left, dx: 0mm, dy: 594mm)[
    #circle(radius: (100 - i * 8) * 1mm, fill: ember.transparentize(97%))
  ]
}

// code rain
#for i in range(0, 18) {
  for j in range(0, 12) {
    place(top + left, dx: i * 23mm, dy: j * 46mm + calc.rem(i * 17, 22) * 1mm)[
      #text(font: mono, size: 5.5pt, fill: cream.transparentize(96%))[
        #if calc.rem(i + j, 3) == 0 { "01" } else { "10" }
      ]
    ]
  }
}

#place(top + left, dx: 161mm, dy: 230mm)[
  #text(font: mono, size: 5.5pt, fill: cream.transparentize(96%))[fsociety]
]

// ghost 04
#place(top + left, dx: 278mm, dy: 64mm)[
  #text(size: 190pt, fill: cream.transparentize(97%))[04]
]

// corner brackets
#place(top + left, dx: 12mm, dy: 12mm)[#line(length: 34mm, stroke: 0.6pt + blue)]
#place(top + left, dx: 12mm, dy: 12mm)[#line(length: 34mm, angle: 90deg, stroke: 0.6pt + blue)]
#place(top + left, dx: 374mm, dy: 12mm)[#line(length: 34mm, stroke: 0.6pt + blue)]
#place(top + left, dx: 408mm, dy: 12mm)[#line(length: 34mm, angle: 90deg, stroke: 0.6pt + blue)]
#place(top + left, dx: 12mm, dy: 548mm)[#line(length: 34mm, stroke: 0.6pt + blue)]
#place(top + left, dx: 12mm, dy: 548mm)[#line(length: 34mm, angle: 90deg, stroke: 0.6pt + blue)]
#place(top + left, dx: 374mm, dy: 548mm)[#line(length: 34mm, stroke: 0.6pt + blue)]
#place(top + left, dx: 408mm, dy: 548mm)[#line(length: 34mm, angle: 90deg, stroke: 0.6pt + blue)]

// ---------- header ----------
#place(top + left, dx: 24mm, dy: 22mm)[
  #box[
    #image("assets/opencode-wordmark-dark.png", height: 9mm)
    #h(4mm)
    #text(font: mono, size: 8pt, fill: cream.transparentize(35%))[vibe-coding]
    #text(font: mono, size: 8pt, fill: faint)[ · cohort 04]
  ]
]
#place(top + right, dx: -24mm, dy: 22mm)[
  #text(font: mono, size: 6.5pt, tracking: 0.18em, fill: faint)[STATEMENT / 01 · A2 · 420 × 594]
]
#place(top + left, dx: 24mm, dy: 34mm)[
  #line(length: 372mm, stroke: 0.4pt + cream.transparentize(82%))
]

// mr. robot microcopy
#place(top + left, dx: 24mm, dy: 66mm)[
  #text(font: mono, size: 7pt, fill: faint)[hello, friend.]
]
#place(top + right, dx: -24mm, dy: 38mm)[
  #text(font: mono, size: 4.2pt, tracking: 0.14em, fill: faint)[E-CORP · INTERNAL USE ONLY]
]
#place(top + right, dx: -24mm, dy: 43mm)[
  #text(font: mono, size: 4.2pt, fill: ember.transparentize(35%))[● REC 00:04:13]
]

// hidden fsociety / control
#place(top + left, dx: 410mm, dy: 300mm)[
  #rotate(-90deg, origin: top + left)[
    #text(font: mono, size: 4.2pt, tracking: 0.24em, fill: cream.transparentize(93%))[fsociety]
  ]
]
#place(top + left, dx: 410mm, dy: 380mm)[
  #rotate(-90deg, origin: top + left)[
    #text(font: mono, size: 3.8pt, tracking: 0.2em, fill: cream.transparentize(95%))[CONTROL IS AN ILLUSION]
  ]
]

// ---------- glitch helper ----------
#let glitch(x, y, size, body, italic: false, color: cream) = {
  let st = if italic { "italic" } else { "normal" }
  place(top + left, dx: x + 2.2mm, dy: y - 0.8mm)[
    #text(size: size, style: st, tracking: -0.02em, fill: blue.transparentize(55%))[#body]
  ]
  place(top + left, dx: x - 1.8mm, dy: y + 0.9mm)[
    #text(size: size, style: st, tracking: -0.02em, fill: ember.transparentize(55%))[#body]
  ]
  place(top + left, dx: x, dy: y)[
    #text(size: size, style: st, tracking: -0.02em, fill: color)[#body]
  ]
}

// ---------- statement ----------
#glitch(24mm, 84mm, 90pt, [YOU DIDN'T])
#glitch(24mm, 119mm, 90pt, [SIGN UP TO])
#glitch(24mm, 153mm, 190pt, [BABYSIT], italic: true, color: ember)
#glitch(24mm, 226mm, 90pt, [AN AGENT.])

// glitch slices over the statement
#for (y, h, c) in (
  (96mm, 2.2mm, blue),
  (108mm, 1.2mm, ember),
  (136mm, 1.8mm, cream),
  (160mm, 3.4mm, blue),
  (188mm, 1.4mm, ember),
  (206mm, 2.6mm, cream),
  (238mm, 1.6mm, blue),
  (250mm, 1.1mm, ember),
) {
  place(top + left, dx: 20mm, dy: y)[
    #rect(width: 380mm, height: h, fill: c.transparentize(88%))
  ]
}

// subline
#place(top + left, dx: 24mm, dy: 292mm)[
  #text(font: mono, size: 13pt, tracking: 0.16em, fill: blue)[THE AGENT ACTS.]
  #h(5mm)
  #text(font: mono, size: 13pt, tracking: 0.16em, fill: cream)[YOU REVIEW.]
]
#place(top + left, dx: 24mm, dy: 302mm)[
  #text(font: mono, size: 9pt, tracking: 0.24em, fill: ember.transparentize(20%))[fix. fix. fix. fix. fix. fix.]
]

// ---------- giant fix ----------
#place(top + left, dx: 22mm, dy: 336mm)[
  #text(size: 250pt, style: "italic", fill: blue.transparentize(55%))[fix.]
]
#place(top + left, dx: 26mm, dy: 340mm)[
  #text(size: 250pt, style: "italic", fill: ember.transparentize(55%))[fix.]
]
#place(top + left, dx: 24mm, dy: 338mm)[
  #text(size: 250pt, style: "italic", fill: ember)[fix.]
]

// glitch slices over the fix
#for (y, h, c) in ((352mm, 2.2mm, blue), (382mm, 1.2mm, cream), (410mm, 2.8mm, blue), (432mm, 1.4mm, ember)) {
  place(top + left, dx: 20mm, dy: y)[
    #rect(width: 380mm, height: h, fill: c.transparentize(88%))
  ]
}

// quiet mr. robot line
#place(top + left, dx: 24mm, dy: 462mm)[
  #text(font: mono, size: 7.5pt, tracking: 0.24em, fill: cream.transparentize(80%))[CONTROL IS AN ILLUSION.]
]

// ---------- footer ----------
#place(top + left, dx: 24mm, dy: 528mm)[
  #text(font: mono, size: 6.5pt, tracking: 0.14em, fill: faint)[A SIX-WEEK COURSE IN SHIPPING WITH AGENTS · 19 LESSONS · 36 HOURS]
]

// barcode
#place(top + left, dx: 24mm, dy: 550mm)[
  #for i in range(0, 34) {
    let w = if calc.rem(i, 3) == 0 { 0.9mm } else { 0.35mm }
    let gap = if calc.rem(i, 5) == 0 { 1.6mm } else { 0.8mm }
    box(width: w, height: 18mm, fill: cream.transparentize(18%))
    h(gap)
  }
  #v(2mm)
  #text(font: mono, size: 6pt, tracking: 0.22em, fill: faint)[VC-04-2026 · fsociety]
]

// QR
#place(top + left, dx: 330mm, dy: 452mm)[
  #box(fill: white, inset: 2.2mm, stroke: 0.35pt + cream.transparentize(80%))[
    #image("assets/qr.png", width: 44mm)
  ]
  #v(1.2mm)
  #text(font: mono, size: 4.8pt, tracking: 0.12em, fill: faint)[SCAN THE COURSE]
  #v(0.8mm)
  #text(font: mono, size: 3.8pt, tracking: 0.1em, fill: faint)[ONE MORE THING...]
]

#place(top + left, dx: 24mm, dy: 580mm)[
  #text(font: mono, size: 5.8pt, tracking: 0.1em, fill: faint)[sehaxe.github.io/vibe-coding]
]
#place(top + right, dx: -24mm, dy: 580mm)[
  #text(font: mono, size: 5.8pt, tracking: 0.1em, fill: faint)[DENIS · DANIK · MUKHAMMED · ARSENIY]
]
