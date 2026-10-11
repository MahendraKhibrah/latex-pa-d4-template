# Troubleshooting Reference

All paths are relative to `pens-paper-latex/`.

## Start here

```sh
make check-env
make build
```

Read the first meaningful error in `build/main.log`. Later errors are often consequences.

## Symptom map

| Symptom | Inspect first | Typical action |
| --- | --- | --- |
| Required command missing | `make check-env` output | Install the missing tool, then rerun |
| No PDF generated | terminal output, `build/main.log` | Fix the first source/config error |
| `dist/main.pdf` stale | `build/main.pdf`, publish scripts, `.latexmkrc` | `make clean && make build` |
| Blank editor preview | PDF validity and viewer cache | Reopen preview before changing source |
| Invalid PDF/xref error | `pdfinfo dist/main.pdf` | clean and rebuild through Make |
| Missing logo/watermark | variables, validation, branding assets | Correct centralized asset path/file |
| Missing chapter image | graphics path and `assets/figures/` | Fix filename/path and case |
| Undefined citation/reference | `make check`, log, `.bib`, labels | Correct keys/labels and let latexmk rerun |
| Overfull box | log line range and rendered page | Apply a local semantic/layout fix |
| Evaluation differs unexpectedly | options and generated wrapper behavior | Run and inspect `make evaluation` separately |

## Build-output model

The project deliberately separates source and generated files:

- `build/`: `.aux`, `.bbl`, `.blg`, `.fdb_latexmk`, `.fls`, `.log`, `.out`, `.pdf`, SyncTeX, wrappers, and checks;
- `dist/`: consumer PDFs and release checksums.

Never repair a problem by editing either directory. Fix source, config, assets, scripts, or workflow definitions.

## Safe recovery

```sh
make clean
make build
make check
```

Use `make clean-all` only if removing distributable files is intentional. Do not use release generation as a recovery mechanism.

## Asset failures

1. Inspect path commands in `config/variables.tex`.
2. Inspect graphics setup in `config/packages.tex`.
3. Check the exact case-sensitive filename under `assets/`.
4. Inspect validation behavior in `config/validation.tex`.
5. Rebuild through `make build`.

Avoid placing duplicate files at the root solely to satisfy a broken reference.

## Overflow diagnosis

Search `build/main.log` for `Overfull \hbox` and `Overfull \vbox`. Correlate the line range with source and inspect the rendered page. Prefer:

- clearer or shorter wording;
- wrapping table columns;
- local image sizing;
- breakable URLs;
- multiline equations;
- narrower local adjustments.

Avoid global margin, font-size, or `\sloppy` changes unless evidence shows a systemic issue and compliance is preserved.

## Documentation and evidence

Before changing a workflow or established formatting decision, search `docs/` and `artifacts/decisions/`. For research-backed content, inspect `artifacts/research/` and `artifacts/references/`. Record a new dated decision or change note when the rationale must remain discoverable.

## Completion checks

- `make build` completed successfully.
- `make check` reports no unresolved citations or references when relevant.
- `dist/main.pdf` exists and opens.
- The affected pages were visually checked.
- No generated files were manually modified.
