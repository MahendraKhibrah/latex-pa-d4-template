# Artifacts

Direktori ini menyimpan bukti dan catatan pendukung yang tidak menjadi sumber utama dokumen LaTeX.

- `change-notes/` — ringkasan perubahan penting.
- `decisions/` — keputusan desain/penulisan beserta alasan dan alternatif.
- `notes/` — catatan kerja yang perlu dipelihara.
- `references/` — metadata atau catatan sumber eksternal.
- `research/` — protokol, ringkasan, dan hasil riset pendukung.

Gunakan metadata dan nama berkas dari [`docs/metadata.md`](../docs/metadata.md): `YYYY-MM-DD_nama-dokumen` dan field `created_at`. File biner wajib memiliki sidecar `.metadata.yml`. Jangan menyimpan credential, output kompilasi, atau file besar tanpa mempertimbangkan Git LFS; gunakan `build/` dan `dist/` untuk output workflow.
