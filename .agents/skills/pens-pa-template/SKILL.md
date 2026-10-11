---
name: pens-pa-template
description: Maintain, write, validate, and release the PENS final-project LaTeX document in pens-paper-latex. Use for PENS PA content, modular config, pages, chapters, bibliography, assets, build/check/evaluation/release workflows, or repository documentation and artifacts.
license: MIT
metadata:
  author: PENS LaTeX Template Maintainers
  version: "2.0"
  institution: Politeknik Elektronika Negeri Surabaya
  guideline: Panduan Buku PA Sarjana Terapan A4 Rev05
---

# PENS Paper LaTeX

Use this skill only for the project rooted at `pens-paper-latex/`. Treat that directory as the project root; never substitute another workspace path.

## Operating rules

1. Discover before editing. Inspect the target file and related config or documentation first.
2. Keep source in `main.tex`, `config/`, `pages/`, `chapters/`, `assets/`, and `references.bib`.
3. Use the repository workflow from the target root. Prefer `make` targets over direct `pdflatex`, `bibtex`, or `latexmk` commands.
4. Treat `build/` and `dist/` as generated output. Never hand-edit files in them.
5. Keep changes focused and preserve the PENS layout unless the request explicitly changes formatting.
6. Before claiming success, run the narrowest relevant validation and report the exact command.

## Locate the target

From the parent directory, verify the root instead of assuming the current directory:

```sh
test -f pens-paper-latex/Makefile
test -f pens-paper-latex/main.tex
```

Run workflow commands either after entering `pens-paper-latex/` or with `make -C pens-paper-latex <target>`.

## Project map

- `main.tex`: only document entry point.
- `config/options.tex`: inclusion switches and evaluation mode.
- `config/variables.tex`: identity, institutional metadata, keywords, and asset paths.
- `config/packages.tex`: package declarations and graphics search paths.
- `config/formatting.tex`: typography, margins, headings, captions, tables, and page style.
- `config/validation.tex`: pre-render configuration and asset checks.
- `pages/`: cover and preliminary pages plus appendix entry point.
- `chapters/`: chapter content.
- `assets/branding/`: institutional logo and watermark.
- `assets/figures/`: document figures.
- `assets/attachments/`: PDFs or other appendix attachments.
- `references.bib` and `IEEEtranN.bst`: bibliography database and style.
- `scripts/` and `.latexmkrc`: build implementation; normally invoke them through `make`.
- `docs/`: operational documentation.
- `artifacts/`: research, evidence, decisions, notes, references, and change notes.
- `build/`: disposable compiler output and logs.
- `dist/`: published PDFs and release checksums.

See [references/file-structure.md](references/file-structure.md), [references/variables.md](references/variables.md), [references/formatting-rules.md](references/formatting-rules.md), [references/workflow.md](references/workflow.md), and [references/troubleshooting.md](references/troubleshooting.md).

## Discovery workflow

Before making a non-trivial change:

1. Read `docs/README.md` to find workflow documentation.
2. Read the relevant file under `docs/`, especially `docs/workflow.md`, `docs/release.md`, or `docs/metadata.md`.
3. Search `artifacts/` by topic, related source path, date, and status before inventing context or decisions.
4. Inspect `main.tex` and the relevant modular config files to understand inclusion and validation behavior.
5. Inspect existing chapter/page patterns before adding new LaTeX structures.

Do not treat `docs/` or `artifacts/` as automatically included in the PDF. They support the work unless explicitly referenced from LaTeX source.

## Choose the correct edit location

- Identity, title, people, institution, keywords, or asset paths: `config/variables.tex`.
- Enable/disable document sections or evaluation behavior: `config/options.tex`.
- Add a package or graphics path: `config/packages.tex`.
- Change global visual behavior: `config/formatting.tex`.
- Add configuration guards: `config/validation.tex`.
- Edit prose: the matching file in `pages/` or `chapters/`.
- Add bibliography data: `references.bib`; cite with `\cite{key}`.
- Add a figure: store it under `assets/figures/` and reference it through the configured graphics path.
- Add an attachment: store it under `assets/attachments/` and include it from the appendix flow.
- Record supporting evidence or rationale: the matching category under `artifacts/`.
- Document an operational convention: `docs/`.

Keep configuration modular. Do not move package, formatting, option, or validation logic into `main.tex` merely for convenience.

## Standard workflow

Run from `pens-paper-latex/`:

```sh
make check-env
make build
make check
```

Expected outputs:

- compiler state and logs: `build/`
- latest normal PDF: `dist/main.pdf`

Other supported targets:

```sh
make watch
make evaluation
make release
make clean
make clean-all
```

Use `make evaluation` for `dist/evaluation.pdf`. Use `make release` only when release artifacts are requested; consult `docs/release.md` for `RELEASE_DATE` and `PROJECT_SLUG`.

## Content and formatting

- Compile only through `main.tex` and repository wrappers.
- Preserve Indonesian formal academic style unless asked otherwise.
- Put labels immediately after captions.
- Refer to figures and tables in prose before they appear.
- Use non-breaking spaces in references: `Gambar~\ref{...}` and `Tabel~\ref{...}`.
- Keep images within `\textwidth`; prefer configured asset paths.
- Escape LaTeX special characters in prose and identifiers.
- Do not solve overflow by changing institutional margins globally unless explicitly required.

## Completion checklist

1. Source changes are in the correct module.
2. No generated file under `build/` or `dist/` was manually edited.
3. Relevant `docs/` and `artifacts/` were checked.
4. `make build` succeeds for document changes.
5. `make check` succeeds when citations or cross-references may be affected.
6. The output path is reported as `dist/main.pdf` or the appropriate release/evaluation artifact.
