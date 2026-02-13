#import "@preview/ctheorems:1.1.3": *

#import "../lib.typ": bourbakit, thm-names
#import "variables.typ": *

#let lang = "fr"

// Apply document-wide settings
#show: bourbakit.with(lang: lang)

// Academic tables style
#set table(
    stroke: (_, y) => if y == 0 { (top: 0.6pt, bottom: 0.6pt)} else if y ==  - 1 {(top: 0.6pt, bottom: 0.6pt)},
)

// Definition box
#let def-box(body) = block(
  width: 100%,
  inset: 12pt,
  radius: 3pt,
  stroke: 0.5pt + luma(160),
  fill: luma(245),
  body,
)

// Customize the look of ctheorem environments
#let global_stroke = 0.5pt + luma(160)
#let global_fill = luma(240)

#let t = thm-names.at(lang)

#let definition = thmbox("definition", t.definition, base_level: 1, stroke: global_stroke, fill: global_fill)
#let theorem = thmbox("theorem", t.theorem, base_level: 1, stroke: global_stroke, fill: global_fill)
#let lemma = thmbox("lemma", t.lemma, base_level: 1, stroke: none, fill: none)
#let proposition = thmbox("proposition", t.proposition, base_level: 1, stroke: none, fill: none)
#let corollary = thmplain("corollary", t.corollary, base: "theorem", titlefmt: strong)
#let remark = thmplain("remark", t.remark)
#let example = thmplain("example", t.example)
#let proof = thmproof("proof", t.proof)

= Example

#theorem("A great theorem")[
    This is a theorem.
]

#definition[
  Let a thing be a thing.
]
