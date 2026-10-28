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

// ---------- terminal card ----------
#place(top + left, dx: 24mm, dy: 326mm)[
  #block(width: 372mm, height: 90mm, fill: rgb("#141212"), stroke: 0.45pt + cream.transparentize(84%))[
    #rect(width: 100%, height: 9mm, fill: rgb("#1b1818"))
    #place(top + left, dx: 5mm, dy: 3mm)[
      #circle(radius: 1.2mm, fill: rgb("#ff5f57"))
      #h(1.2mm)
      #circle(radius: 1.2mm, fill: rgb("#febc2e"))
      #h(1.2mm)
      #circle(radius: 1.2mm, fill: rgb("#28c840"))
    ]
    #place(top + left, dx: 0mm, dy: 3mm)[
      #block(width: 100%)[
        #align(center)[
          #text(font: mono, size: 7pt, fill: faint)[opencode — ~/vibe-demo — live]
        ]
      ]
    ]
    #place(top + left, dx: 10mm, dy: 16mm)[
      #set par(leading: 1.35em)
      #text(font: mono, size: 10pt)[
        #text(fill: blue)[\$] opencode
        #linebreak()
        #text(fill: blue)[›] build a landing page for a coffee shop
        #linebreak()
        #text(fill: faint)[●] Read  #text(fill: cream)[site/index.html]
        #linebreak()
        #text(fill: faint)[●] Write #text(fill: cream)[site/index.html]  #text(fill: rgb("#7ee787"))[+128]
        #linebreak()
        #text(fill: faint)[●] Bash  #text(fill: cream)[npm run dev]
        #linebreak()
        #text(fill: rgb("#7ee787"))[✔ ready in 412ms]  #text(fill: faint)[— localhost:3000]
        #linebreak()
        #text(fill: faint)[●] Review  #text(fill: cream)[diff]  #text(fill: rgb("#7ee787"))[2 files]
        #linebreak()
        #text(fill: rgb("#7ee787"))[✔ tests pass]  #text(fill: faint)[14/14]
        #linebreak()
        #text(fill: faint)[●] Commit  #text(fill: cream)["ship it"]
        #linebreak()
        #text(fill: rgb("#7ee787"))[✔ shipped]  #text(fill: faint)[— 1 file changed]
        #linebreak()
        #text(fill: blue)[›] #text(fill: cream)[\_]
      ]
    ]
    // glitch bars inside the terminal
    #place(top + left, dx: 0mm, dy: 62mm)[
      #rect(width: 100%, height: 2mm, fill: blue.transparentize(86%))
    ]
    #place(top + left, dx: 0mm, dy: 94mm)[
      #rect(width: 100%, height: 1.2mm, fill: ember.transparentize(88%))
    ]
  ]
]

// ---------- footer ----------
#place(top + left, dx: 24mm, dy: 436mm)[
  #text(font: mono, size: 8.5pt, tracking: 0.2em, fill: cream)[SPEC → BUILD → REVIEW → SHIP]
]
#place(top + left, dx: 24mm, dy: 446mm)[
  #text(font: mono, size: 6.5pt, tracking: 0.14em, fill: faint)[A SIX-WEEK COURSE IN SHIPPING WITH AGENTS · 19 LESSONS · 36 HOURS]
]

// barcode
#place(top + left, dx: 24mm, dy: 474mm)[
  #for i in range(0, 34) {
    let w = if calc.rem(i, 3) == 0 { 0.9mm } else { 0.35mm }
    let gap = if calc.rem(i, 5) == 0 { 1.6mm } else { 0.8mm }
    box(width: w, height: 18mm, fill: cream.transparentize(18%))
    h(gap)
  }
  #v(2mm)
  #text(font: mono, size: 6pt, tracking: 0.22em, fill: faint)[VC-04-2026 · STATEMENT]
]

// QR
#place(top + left, dx: 342mm, dy: 448mm)[
  #box(fill: white, inset: 2mm, stroke: 0.35pt + cream.transparentize(80%))[
    #image("assets/qr.png", width: 32mm)
  ]
  #v(1.2mm)
  #text(font: mono, size: 4.8pt, tracking: 0.12em, fill: faint)[THE LOOP]
]

#place(top + left, dx: 24mm, dy: 566mm)[
  #text(font: mono, size: 5.8pt, tracking: 0.1em, fill: faint)[sehaxe.github.io/vibe-coding]
]
#place(top + right, dx: -24mm, dy: 566mm)[
  #text(font: mono, size: 5.8pt, tracking: 0.1em, fill: faint)[DENIS · DANIK · MUKHAMMED · ARSENIY]
]
