# Build, Check, and Release Workflow

All commands assume the current directory is `pens-paper-latex/`. From its parent, use `make -C pens-paper-latex <target>`.

## Normal validation

```sh
make check-env
make build
make check
```

- `check-env` verifies shell, Make, LaTeX, BibTeX, and checksum tooling.
- `build` runs `latexmk` through repository scripts, writes compiler output to `build/`, and publishes `dist/main.pdf` only after success.
- `check` builds and fails when citations or cross-references remain unresolved.

Use `build/main.log` for diagnostics. Do not expect `main.log` or `main.pdf` beside `main.tex`.

## Continuous preview

```sh
make watch
```

This uses `latexmk` dependency tracking and publishes successful updates to `dist/main.pdf`. It is interactive and must be stopped explicitly; agents should not launch it as a non-terminating validation command.

## Evaluation build

```sh
make evaluation
```

The script creates a generated wrapper in `build/`, activates the evaluation switch, and publishes `dist/evaluation.pdf`. Do not duplicate or edit `main.tex` to create this variant.

## Release

Read `docs/release.md`, then use explicit metadata when reproducibility matters:

```sh
RELEASE_DATE=2026-10-04 PROJECT_SLUG=pens-paper make release
```

The target checks the normal document, builds the evaluation variant, creates dated PDFs under `dist/`, and writes a SHA-256 checksum file. Review PDFs visually; checksums verify bytes, not content correctness.

## Cleanup

```sh
make clean
make clean-all
```

- `clean` removes and recreates `build/`.
- `clean-all` also removes and recreates `dist/`.

Never put source, notes, or evidence in generated directories.

## Docs and artifacts before work

1. Open `docs/README.md`.
2. Read the relevant workflow, release, or metadata document.
3. Search `artifacts/` for matching topic, `related` source path, status, and date.
4. Create a new artifact only when no suitable record exists.
5. Follow `docs/metadata.md` for front matter, ISO dates, provenance, and naming.

## Validation matrix

| Change | Minimum validation |
| --- | --- |
| Prose only | `make build` |
| Labels, references, citations, bibliography | `make check` |
| Variables, options, assets, formatting, packages | `make build` and `make check` |
| Evaluation-mode behavior | `make evaluation` plus normal `make build` |
| Build scripts or `.latexmkrc` | `make clean`, `make build`, and `make check` |
| Formal distribution | `make release` and visual/checksum review |

Report only commands actually run and their observed result.
