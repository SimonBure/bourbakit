#import "@preview/arkheion:0.1.1": *
#import "@preview/physica:0.9.8": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/equate:0.3.2": *

#let thm-names = (
    en: (theorem: "Theorem", lemma: "Lemma", corollary: "Corollary", proposition: "Proposition", remark: "Remark", proof: "Proof", example: "Example", definition: "Definition"),
    fr: (theorem: "Théorème", lemma: "Lemme", corollary: "Corollaire", proposition: "Proposition", remark: "Remarque", proof: "Preuve", example: "Exemple", definition: "Définition"),
  )
// Template function: applies document-wide settings via #show: bourbakit.with(...)
#let bourbakit(
  title: "This is a great title!",
  authors: (
    (name: "Author 1", email: "user@domain.com", affiliation: "Company", orcid: "0000-0000-0000-0000"),
    (name: "Author 2", email: "user@domain.com", affiliation: "Company"),
  ),
  abstract: lorem(200),
  keywords: ("First keyword", "Second keyword", "etc."),
  date: datetime.today().display("[month repr:long] [day], [year]"),
  lang: "en",

  header-numbering: "1.1",

  vec-delim: "[",
  qed-symbol: $square$,
  eq-numbering: "(1.1)",
  eq-breakable: true,
  eq-sub-numbering: true,
  eq-number-mode: "label",

  bib-path: "template/bibliography.bib",
  citation-style: "chicago-author-date",
  doc,
) = {
  show: thmrules.with(qed-symbol: qed-symbol)
  show: equate.with(breakable: eq-breakable, sub-numbering: eq-sub-numbering, number-mode: eq-number-mode)
  set math.equation(numbering: eq-numbering)
  set math.vec(delim: vec-delim)
  set math.mat(delim: vec-delim)

  set heading(numbering: header-numbering)
  show link: underline

  set cite(style: citation-style)

  show: arkheion.with(
    title: title,
    authors: authors,
    abstract: abstract,
    keywords: keywords,
    date: date,
  )

  let t = thm-names.at(lang)

  doc

  bibliography(bib-path)
}
