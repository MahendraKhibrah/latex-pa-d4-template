# Konfigurasi Template

Edit konfigurasi dalam urutan berikut:

1. `variables.tex` — identitas, judul, dosen, program studi, tanggal, tahun, kata kunci, dan path aset.
2. `options.tex` — bagian dokumen yang diaktifkan atau dinonaktifkan.
3. `packages.tex` — ubah hanya ketika membutuhkan package LaTeX tambahan.
4. `formatting.tex` — aturan layout PENS; sebaiknya tidak diubah tanpa acuan resmi.
5. `validation.tex` — pemeriksaan konfigurasi saat build.

## Opsi dokumen

Semua opsi menggunakan pasangan perintah `...true` dan `...false` di `options.tex`.

| Opsi | Default | Fungsi |
| --- | --- | --- |
| `\IncludeCover` | true | Sampul berwarna |
| `\IncludeTitlePage` | true | Halaman judul dalam |
| `\IncludeApprovalPage` | true | Halaman pengesahan |
| `\IncludeOriginalityPage` | true | Pernyataan orisinalitas |
| `\IncludeCopyrightPage` | true | Pernyataan hak cipta |
| `\IncludeIndonesianAbstract` | true | Abstrak Indonesia |
| `\IncludeEnglishAbstract` | true | Abstract Inggris |
| `\IncludePreface` | true | Kata pengantar |
| `\IncludeTableOfContents` | true | Daftar isi |
| `\IncludeListOfFigures` | true | Daftar gambar |
| `\IncludeListOfTables` | true | Daftar tabel |
| `\IncludeChapterOne` … `\IncludeChapterFive` | true | Bab 1–5 secara individual |
| `\IncludeBibliography` | true | Daftar pustaka |
| `\IncludeAppendices` | true | Seluruh lampiran |
| `\EnableWatermark` | false | Watermark mulai preliminary sampai akhir |

Contoh:

```tex
\IncludeChapterFourfalse
\IncludeAppendicesfalse
\EnableWatermarktrue
```

Cover, halaman judul, dan pengesahan selalu bebas watermark. Opacity diatur melalui `\WatermarkOpacity` pada `variables.tex`.

## Mode evaluasi

Jalankan:

```sh
make evaluation
```

Mode ini dibentuk tanpa mengubah file konfigurasi dan menghasilkan `dist/evaluation.pdf`. Isinya adalah halaman judul serta Bab 1–5 yang aktif. Front matter, pustaka, dan lampiran dimatikan.

## Data opsional

Kosongkan nilai pembimbing opsional agar barisnya tidak dirender:

```tex
\newcommand{\NamaPembimbingTiga}{}
\newcommand{\NIPPembimbingTiga}{}
\newcommand{\NamaPembimbingIndustri}{}
\newcommand{\IdentitasPembimbingIndustri}{}
```

Jangan menghapus definisi command-nya. Setelah mengubah konfigurasi, jalankan `make check`.
