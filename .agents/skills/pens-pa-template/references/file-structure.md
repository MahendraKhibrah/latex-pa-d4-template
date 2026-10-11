# File Structure Reference

All paths are relative to the `pens-paper-latex/` project root.

## Entry point and workflow

| Path | Purpose | Edit policy |
| --- | --- | --- |
| `main.tex` | Sole document entry point and inclusion order | Edit only orchestration that truly belongs here |
| `Makefile` | Public workflow interface | Prefer its targets over direct script/compiler calls |
| `.latexmkrc` | Compiler, output-directory, and publish settings | Change only for build-system requirements |
| `scripts/` | POSIX workflow implementation | Inspect when debugging workflow behavior |
| `build/` | Generated compiler output and logs | Never hand-edit; safe to clean |
| `dist/` | Published PDFs and checksums | Never hand-edit |

## Modular configuration

Loading order in `main.tex` is significant:

1. `config/options.tex`
2. `config/variables.tex`
3. `config/packages.tex`
4. `config/formatting.tex`
5. `config/validation.tex`

| File | Owns |
| --- | --- |
| `options.tex` | Inclusion switches, evaluation mode, watermark toggle |
| `variables.tex` | Student, title, supervisors, examiners, institution, dates, keywords, asset paths |
| `packages.tex` | Package declarations and graphics path configuration |
| `formatting.tex` | Margins, typography, headings, headers, captions, tables, links |
| `validation.tex` | Required-value, placeholder, and asset checks |

Do not collapse these modules into `main.tex`. Put a change in the module that owns its concern.

## Document source

### `pages/`

Preliminary pages and appendix entry point:

- `cover.tex`
- `halaman_judul.tex`
- `pengesahan.tex`
- `orisinalitas.tex`
- `hak_cipta.tex`
- `abstrak.tex`
- `abstract.tex`
- `kata_pengantar.tex`
- `lampiran.tex`

Their inclusion is controlled by switches in `config/options.tex`.

### `chapters/`

- `bab1.tex`: Pendahuluan
- `bab2.tex`: Kajian Pustaka
- `bab3.tex`: Desain Sistem
- `bab4.tex`: Eksperimen dan Analisis
- `bab5.tex`: Penutup

Compile none of these directly; `main.tex` supplies packages, variables, formatting, numbering, and bibliography context.

### Bibliography

- `references.bib`: BibTeX records.
- `IEEEtranN.bst`: bibliography style used by `main.tex`.

## Assets and appendices

| Directory | Content |
| --- | --- |
| `assets/branding/` | PENS logo and approval-page watermark |
| `assets/figures/` | Figures used by pages and chapters |
| `assets/attachments/` | PDFs or files included as appendices |
| `appendices/` | Appendix-related source or guidance when introduced |

Canonical asset paths are declared in `config/variables.tex`. Check those variables and `config/packages.tex` before adding ad-hoc relative paths.

## Documentation and artifacts discovery

### `docs/`

Start with `docs/README.md`, then consult:

- `docs/workflow.md` for build, watch, check, evaluation, and cleanup;
- `docs/release.md` for dated release files and checksums;
- `docs/metadata.md` for date, metadata, and naming conventions.

### `artifacts/`

Search these categories before creating new supporting records:

- `artifacts/research/`: investigation and source synthesis;
- `artifacts/references/`: local reference notes and provenance;
- `artifacts/decisions/`: accepted technical or editorial decisions;
- `artifacts/notes/`: working notes;
- `artifacts/change-notes/`: dated change summaries.

Artifacts support traceability but are not automatically rendered in the paper. Follow `docs/metadata.md`; use ISO `YYYY-MM-DD`, meaningful status, source provenance, and related source paths.

## Generated-output boundary

A successful normal build leaves compiler products in `build/` and publishes `dist/main.pdf`. Evaluation and release targets create additional files under `dist/`. Important source never belongs in either generated directory.
