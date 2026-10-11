---
name: pens-pa-pdf-overflow-fix
description: Diagnose and fix failed, blank, corrupted, or overflowing PENS PA PDFs in pens-paper-latex using its make/build/dist workflow. Use for LaTeX build failures, invalid dist PDFs, Overfull hbox warnings, missing assets, unresolved references, stale output, or preview problems.
---

# PENS Paper PDF and Overflow Troubleshooting

Use this skill only for the project rooted at `pens-paper-latex/`. Treat that directory as the root and do not use paths from another workspace.

## Goal

Restore a reproducible build and a valid `dist/main.pdf`, then fix visible overflow at its source without weakening the PENS layout or editing generated files.

## Repository contract

- Entry point: `main.tex`.
- Workflow: `Makefile`, `scripts/`, and `.latexmkrc`.
- Temporary output and logs: `build/`.
- Published output: `dist/`.
- Modular config: `config/options.tex`, `config/variables.tex`, `config/packages.tex`, `config/formatting.tex`, and `config/validation.tex`.
- Supporting guidance: `docs/`.
- Evidence and decisions: `artifacts/`.

Never manually edit generated files in `build/` or `dist/`. Do not compile individual files in `chapters/` or `pages/`.

## First response sequence

From the parent directory, confirm and enter the target, or use `make -C pens-paper-latex`:

```sh
test -f pens-paper-latex/Makefile
test -f pens-paper-latex/main.tex
make -C pens-paper-latex check-env
make -C pens-paper-latex build
```

Then inspect:

- terminal output from `make build`;
- `pens-paper-latex/build/main.log`;
- `pens-paper-latex/dist/main.pdf`;
- `pens-paper-latex/docs/workflow.md`;
- relevant records under `pens-paper-latex/artifacts/`.

For citation or reference problems, run:

```sh
make -C pens-paper-latex check
```

## Classify the failure

### Build does not produce a PDF

Find the first substantive error in `build/main.log`, not only the final fatal summary. Common causes:

- missing TeX package or executable;
- malformed LaTeX in the reported source file;
- missing image or attachment;
- invalid value in `config/variables.tex`;
- validation failure from `config/validation.tex`;
- bibliography syntax error.

Fix the source or modular config that owns the problem. Do not patch generated `.aux`, `.bbl`, `.log`, `.fls`, or `.fdb_latexmk` files.

### `dist/main.pdf` is missing or stale

`make build` compiles into `build/` and publishes a successful result to `dist/main.pdf`. If compilation succeeds but publication appears stale:

1. compare timestamps for `build/main.pdf` and `dist/main.pdf`;
2. inspect `scripts/build.sh`, `scripts/publish-pdf.sh`, and `.latexmkrc`;
3. run `make clean`, then `make build`;
4. reopen the PDF preview after the build completes.

Do not copy partial compiler output over `dist/main.pdf` manually unless debugging the publisher itself.

### PDF is blank or invalid

If available, validate the distributable:

```sh
pdfinfo pens-paper-latex/dist/main.pdf
```

If `pdfinfo` reports xref, trailer, or syntax errors, rebuild through the repository workflow:

```sh
make -C pens-paper-latex clean
make -C pens-paper-latex build
```

If the file is valid but the editor preview is blank, close and reopen the preview before changing LaTeX source. A stale viewer is not a document defect.

### Missing assets

Asset paths are centralized in `config/variables.tex`; graphics discovery is configured in `config/packages.tex`; existence checks live in `config/validation.tex`.

Verify the referenced file under:

- `assets/branding/` for logo or watermark;
- `assets/figures/` for chapter figures;
- `assets/attachments/` for appendix PDFs.

Preserve case-sensitive filenames. Prefer correcting the path variable or source reference over duplicating assets at the project root.

### Unresolved citations or references

Run `make check`. Then inspect `build/main.log`, citation keys in `references.bib`, labels, and references. Allow `latexmk` to perform the required reruns; do not invoke BibTeX against arbitrary paths or edit generated bibliography output.

## Overflow workflow

1. Build once and inspect `build/main.log` for `Overfull \hbox` or `Overfull \vbox`.
2. Use the line range and surrounding source to locate the exact paragraph, caption, table, equation, URL, or identifier.
3. Confirm whether overflow is visible in `dist/main.pdf`; tiny warnings may not require risky global changes.
4. Apply the narrowest semantic fix.
5. Run `make build` again and compare the warning and rendered page.

### Preferred local fixes

- Rewrite or split a dense sentence.
- Use `\url{...}` for URLs.
- Insert legal breakpoints in long technical tokens only when typography remains correct.
- Replace a rigid table column with a wrapping `X` column and set an explicit total width.
- Keep tables and images at or below `\textwidth`.
- Shorten captions without losing meaning.
- Scale diagrams or source images locally.
- Break a long equation with an appropriate multiline math environment.

### Avoid as first-line fixes

- changing institutional margins;
- reducing the entire document font size;
- adding broad `\sloppy` or large `\emergencystretch` settings globally;
- suppressing warnings without checking the PDF;
- shrinking all tables or figures because one object is too wide;
- editing `build/main.log` or other generated files.

A small, documented typography tolerance in `config/formatting.tex` is acceptable only after local fixes are impractical and the rendered result remains compliant.

## Clean and release boundaries

- `make clean`: recreate `build/`; keep distributable output.
- `make clean-all`: recreate both `build/` and `dist/`; use only when discarding generated outputs is intended.
- `make evaluation`: troubleshoot `dist/evaluation.pdf` separately from the normal document.
- `make release`: creates dated PDFs and checksums; do not use it merely to test a source edit.

## Validation and report

For normal source fixes, run:

```sh
make -C pens-paper-latex build
make -C pens-paper-latex check
```

When available, also run `pdfinfo pens-paper-latex/dist/main.pdf` and visually inspect the affected page. Report:

1. root cause;
2. source/config files changed;
3. exact commands run;
4. whether `make build` and `make check` passed;
5. whether `dist/main.pdf` is valid and the overflow is visibly resolved.

See the template skill references [workflow](../pens-pa-template/references/workflow.md) and [troubleshooting](../pens-pa-template/references/troubleshooting.md) for more detail.
