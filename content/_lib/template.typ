#import "@rookery/core:0.1.0": rookery

// Rookery's theme, set from the tokens in `style.css` so ideas and windows
// match the rest of the site.
#let THEME = (
  link-color: "rgba(230, 230, 250, 0.8)",
  fold-color: "rgba(230, 230, 250, 0.4)",
  name-color: rgb("#666666"),
  date-color: rgb("#666666"),
  border-color: rgb("#aaaaaa"),
  rule-width: "1px",
  label-font: "sans-serif",
  label-size: "14px",
)

#let SITE = "Terms and Conditions"
#let GROUP = "Machine Learning Humanities"
#let GROUP-URL = "https://machinelearninghumanities.org"

// The header nav, as (name, page label) pairs.
#let NAV = (
  ("Terms", "index"),
  ("Process", "process"),
)

// `page` is the current page's label. Term pages aren't in the nav, so they
// mark Terms as current.
#let site-nav(page) = {
  let pages = NAV.map(((_, target)) => target)
  let current = if page in pages { page } else { "index" }
  html.elem("nav", attrs: (class: "site-nav"))[
    #for (name, target) in NAV {
      if target == current {
        html.elem("span", attrs: (class: "current"), name)
      } else {
        link(label(target))[#name]
      }
    }
    #link(GROUP-URL)[#GROUP]
  ]
}

#let site-header(page) = html.elem("header", attrs: (class: "site-header"))[
  #html.elem("h1", attrs: (class: "site-title"), link(label("index"))[#SITE])
  #site-nav(page)
]

#let site-footer() = html.elem("footer", attrs: (class: "site-footer"))[
  #html.elem("span", attrs: (class: "last-updated"))[
    Last updated #datetime.today().display("[year]-[month]-[day]")
  ]
  #html.elem("span", attrs: (class: "colophon"))[
    A project of #link(GROUP-URL)[#GROUP]. Built with #link("https://rheo.ohrg.org")[Rheo] and #link("https://rookery.ohrg.org")[Rookery]
  ]
]

// `doc` is not wrapped in an element: pages open on `#set document(..)`,
// which Typst refuses inside a container.
#let chrome(doc, page: none) = {
  context if target() == "html" { site-header(page) }
  doc
  context if target() == "html" { site-footer() }
}

#let idea-page(id: none, note: (:), doc) = {
  let name = if note.len() == 0 {
    [Ideas]
  } else if note.at("title", default: none) != none {
    note.title
  } else {
    raw(id.split(":").last())
  }
  set document(title: [#SITE - #name])
  show: chrome
  doc
}

#let template(doc, page: none) = {
  show: rookery.with(theme: THEME, idea-page-template: idea-page)
  show: chrome.with(page: page)
  doc
}
