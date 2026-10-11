# Metadata and Date Convention

## Tanggal

Gunakan ISO 8601 penuh `YYYY-MM-DD` untuk nama berkas, front matter artifact, catatan perubahan, keputusan, dan rilis.

Contoh tanggal yang valid:

```text
2026-10-04
```

Hindari format ambigu seperti `04/10/2026`. Jika waktu diperlukan, gunakan UTC RFC 3339, misalnya `2026-10-04T09:30:00Z`.

## Metadata artifact

Berkas Markdown di `docs/` dan `artifacts/` (kecuali `README.md`) wajib diawali front matter:

```yaml
---
title: "Validasi hasil eksperimen"
created_at: 2026-10-04
updated_at: 2026-10-04
document_type: research
author: "Nama Penulis"
status: draft
tags:
  - evaluation
  - experiment
sources:
  - "https://example.org/reference"
related:
  - "chapters/bab4.tex"
---
```

Field yang dianjurkan:

- `title`: judul singkat dan spesifik;
- `created_at`: tanggal pembuatan dalam `YYYY-MM-DD` (wajib);
- `document_type`: tipe seperti `research`, `decision`, `note`, atau `change-note` (wajib);
- `status`: `draft`, `reviewed`, `accepted`, atau `superseded` (wajib);
- `updated_at`: tanggal perubahan terakhir;
- `author`: penanggung jawab;

- `tags`: kata kunci pencarian;
- `sources`: URL, DOI, ISBN, atau path bukti;
- `related`: sumber LaTeX atau artifact terkait.

Untuk sumber eksternal, catat tanggal akses secara eksplisit:

```yaml
accessed: 2026-10-04
```

## Nama berkas

Gunakan format `YYYY-MM-DD_nama-dokumen.ext`: tanggal ISO, underscore sebagai pemisah tanggal dan nama, lalu huruf kecil dengan tanda hubung untuk nama. `README.md`, `LICENSE`, `CHANGELOG.md`, dan `CONTRIBUTING.md` adalah pengecualian:

```text
artifacts/change-notes/2026-10-04_initial-workflow.md
artifacts/decisions/2026-10-04_build-output-layout.md
```

Untuk file biner, buat sidecar `YYYY-MM-DD_nama-dokumen.metadata.yml` dengan minimal `title`, `created_at`, `document_type`, `status`, `source`, dan `original_filename`.

Jangan memasukkan rahasia, token, data pribadi yang tidak diperlukan, atau materi tanpa hak distribusi ke metadata maupun artifact.
