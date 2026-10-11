# Configuration and Variable Reference

All paths are relative to `pens-paper-latex/`.

## Modular configuration

Do not treat every setting as a variable:

- values and asset paths: `config/variables.tex`;
- inclusion and build-mode switches: `config/options.tex`;
- packages and graphics lookup: `config/packages.tex`;
- global visual definitions: `config/formatting.tex`;
- configuration checks: `config/validation.tex`.

`main.tex` loads these modules in that order.

## Identity variables

### Student and title

| Command | Meaning |
| --- | --- |
| `\NamaMahasiswa` | Full student name |
| `\NRP` | Student registration number |
| `\JudulPA` | Final-project title |

### Supervisors

| Command | Meaning |
| --- | --- |
| `\NamaPembimbingSatu` | First required supervisor |
| `\NIPPembimbingSatu` | First supervisor NIP |
| `\NamaPembimbingDua` | Optional second supervisor; leave empty when unused |
| `\NIPPembimbingDua` | Second supervisor NIP; leave empty with its name |
| `\NamaPembimbingTiga` | Optional third academic supervisor |
| `\NIPPembimbingTiga` | Third supervisor NIP; required when the name is filled |
| `\NamaPembimbingIndustri` | Optional industry supervisor |
| `\IdentitasPembimbingIndustri` | Optional industry role or identity |

Leave optional pairs empty when unused; do not insert placeholder punctuation.

### Examiners and program head

| Command | Meaning |
| --- | --- |
| `\NamaPengujiSatu` | First examiner |
| `\NIPPengujiSatu` | First examiner NIP |
| `\NamaPengujiDua` | Second examiner |
| `\NIPPengujiDua` | Second examiner NIP |
| `\NamaKetuaProdi` | Head of study program |
| `\NIPKetuaProdi` | Program-head NIP |

### Institution and date

| Command | Meaning |
| --- | --- |
| `\NamaProdi` | Study program |
| `\NamaDepartemen` | Department |
| `\NamaInstitusi` | Institution name |
| `\GelarLulus` | Awarded degree |
| `\TahunLulus` | Graduation year |
| `\TanggalSidang` | Defense/signature date text |

### Abstract metadata

| Command | Meaning |
| --- | --- |
| `\KataKunci` | Indonesian keywords |
| `\Keywords` | English keywords |

## Asset-path variables

| Command | Default responsibility |
| --- | --- |
| `\LogoPENSPath` | Logo under `assets/branding/` |
| `\WatermarkPENSPath` | Watermark under `assets/branding/` |
| `\FiguresPath` | Figure directory prefix |
| `\AttachmentsPath` | Attachment directory prefix |

Use these centralized paths rather than copying assets to the project root. `config/validation.tex` checks required branding assets, and `config/packages.tex` configures image discovery.

## Option switches

`config/options.tex` defines booleans for cover, title, approval, originality, copyright, abstracts, preface, lists, chapters, bibliography, appendices, and approval watermark. Edit those booleans when a section should be included or excluded; do not comment out `\input` lines in `main.tex`.

The evaluation workflow injects its build marker externally. Run `make evaluation`; do not maintain a separate copy of `main.tex`.

## Validation behavior

`\PENSValidateConfiguration` runs at document start and checks required values, conditional values, assets, and known placeholders. If it fails:

1. read the first relevant message in `build/main.log`;
2. update `config/variables.tex` or the referenced asset;
3. keep the validation unless the project contract itself is intentionally changing;
4. rebuild with `make build`.

## Safe editing rules

- Preserve exact command names because pages and validation depend on them.
- Keep identifiers such as NRP and NIP as text-like macro content; do not perform arithmetic on them.
- Escape special LaTeX characters in values.
- Keep dates human-readable in the document; use ISO `YYYY-MM-DD` for artifact and release filenames as documented under `docs/`.
- After changing variables or options, run `make build`; use `make check` when references or citations may be affected.
