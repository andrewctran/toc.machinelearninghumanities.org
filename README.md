# “Terms and Conditions”

A project of the [Machine Learning Humanities](https://machinelearninghumanities.org) working group, published at [toc.machinelearninghumanities.org](https://toc.machinelearninghumanities.org).

The site is written in [Typst](https://typst.app) and compiled by [Rheo](https://rheo.ohrg.org), with [Rookery](https://rookery.ohrg.org) loaded. It shares its design system with [machinelearninghumanities.org](https://github.com/andrewctran/machinelearninghumanities.org). GitHub Actions builds the site and deploys it to GitHub Pages on every push to `main`.

## Quick start

You need `bash`, `curl` and `unzip` on macOS or Linux, plus [`just`](https://github.com/casey/just) (`brew install just`). `bin/rheo` downloads the Rheo version pinned in `rheo.toml` on first run.

```sh
just dev
```

This serves the site at http://localhost:3000 with live reload. `just build` builds the deployable site into `build/html`, `just print` builds the PDF and EPUB, and `just clean` deletes `build/`.

## Adding or writing a term

Every term is listed in `content/_lib/terms.typ` with a status, and has a page at `content/<handle>.typ`, where the handle is the name with spaces as hyphens (`eliza effect` is `content/eliza-effect.typ`). The homepage grid is drawn from `TERMS`, so a term appears there once it's in the list.

| Status | Meaning | Grid cell |
| --- | --- | --- |
| `open` | No steward yet | white |
| `in-flight` | Being written | gray |
| `complete` | Finished | lavender |

A term's page calls `entry` with the term's name exactly as it appears in `TERMS`. With an empty body, the page shows a "Not yet written" notice. To write the entry, put it in the body and name the steward and editor:

```typst
#set document(title: "“Terms and Conditions” - attention")

#entry("attention", steward: "Name", editor: "Name")[
  The entry, around 5 to 10 paragraphs.
]
```

Then change the term's status in `terms.typ` to `in-flight`, and to `complete` when it's finished. Link to another term by its handle, for example `#link(label("llm"))[LLM]`.

To add a term, add it to `TERMS` and create its page. The grid has 3 columns on desktop and 2 below 700px, so a multiple of 3 terms keeps the desktop grid full.

## Project layout

```
content/
  index.typ            the term grid, What is this? and Who does this?
  process.typ          how entries are written, adapted from LOLM's Progressing the Terminology
  <handle>.typ         one page per term
  _lib/
    terms.typ          every term and its status
    prelude.typ        spliced into the top of every page
    template.typ       header and nav, footer and the Rookery theme
    components.typ     term-grid and entry, plus the shared page-columns, section-head, listing, item, notice, side-box, entity
style.css              every style on the site
rheo.toml              Rheo settings
Justfile               the dev, build, print and clean recipes
bin/rheo               runs the pinned Rheo, downloading it on first use
build.sh               the production build used by CI and `just build`
CNAME                  the custom domain, copied into the build for GitHub Pages
.github/workflows/     the deploy workflow
```

## Deployment

`.github/workflows/deploy.yml` runs on every push to `main`, runs `bash build.sh` and publishes `build/html` to GitHub Pages, whose source must stay set to "GitHub Actions".

The domain needs a CNAME record at Hover from `toc` to `andrewctran.github.io`.
