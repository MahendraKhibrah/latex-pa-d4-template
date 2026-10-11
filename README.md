# PENS Paper LaTeX

Template dan workspace penulisan Proyek Akhir PENS dengan workflow build yang terisolasi. Semua berkas sementara ditulis ke `build/`; PDF yang berhasil dibangun diterbitkan ke `dist/`.

## Mulai cepat

Persyaratan utama:

- shell POSIX (`sh`) dan GNU Make;
- TeX Live atau MiKTeX dengan `latexmk`, `pdflatex`, dan `bibtex`;
- `pdfinfo` dari Poppler untuk validasi PDF.

Ubuntu/Debian (instalasi paling lengkap):

```sh
sudo apt install texlive-full latexmk poppler-utils make git
```

Overleaf dapat digunakan dengan compiler pdfLaTeX, tetapi workflow `make` dan validasi release dijalankan secara lokal.

Jalankan dari direktori proyek ini:

```sh
make check-env
make build
```

Hasil build normal tersedia di `dist/main.pdf`.

## Perintah

| Perintah | Kegunaan |
| --- | --- |
| `make help` | Menampilkan daftar perintah. |
| `make check-env` | Memastikan toolchain wajib tersedia. |
| `make build` | Membangun dokumen utama ke `build/` dan menerbitkan PDF ke `dist/`. |
| `make watch` | Memantau perubahan sumber dan membangun ulang secara kontinu. |
| `make check` | Membangun dokumen lalu menolak referensi/sitasi yang belum terselesaikan. |
| `make evaluation` | Membangun varian evaluasi melalui wrapper sementara yang mengaktifkan `\EvaluationBuildtrue`. |
| `make release` | Menjalankan pemeriksaan, membangun kedua varian, dan membuat checksum rilis. |
| `make clean` | Menghapus seluruh berkas sementara di `build/`. |
| `make clean-all` | Menghapus `build/` dan seluruh keluaran di `dist/`. |

`make watch` berjalan sampai dihentikan dengan `Ctrl-C`. Setiap kompilasi sukses akan memperbarui `dist/main.pdf`. Build gagal tidak akan dipublikasikan; `make check` juga menolak referensi/sitasi belum selesai dan `Overfull \\hbox`.

## Struktur yang dikelola workflow

- `build/` — seluruh output sementara LaTeX; tidak disimpan di Git.
- `dist/` — PDF dan checksum siap distribusi; tidak disimpan di Git.
- `scripts/` — implementasi shell POSIX untuk target Make.
- `docs/` — konvensi workflow, metadata, dan rilis.
- `artifacts/` — catatan pendukung yang dapat ditelusuri.
- `assets/figures/` — gambar yang dirujuk dokumen.
- `assets/attachments/` — lampiran biner pendukung.
- `appendices/` — sumber lampiran LaTeX.

Dokumen utama tetap `main.tex`. Mulai dengan mengisi `config/variables.tex`, lalu atur bagian dan watermark di `config/options.tex`. Referensi lengkap konfigurasi tersedia di [`config/README.md`](config/README.md). Isi laporan berada di `chapters/`, `pages/`, dan `appendices/`.

## Build evaluasi

Target evaluasi membuat `build/evaluation-wrapper.tex` dan menyisipkan aktivasi berikut sebelum dokumen utama dimuat:

```tex
\providecommand{\EvaluationBuildtrue}{}
\EvaluationBuildtrue
\input{main.tex}
```

Dengan demikian workflow tidak mengubah `main.tex` atau berkas di `config/`. Keluaran diterbitkan sebagai `dist/evaluation.pdf`.

## Dokumentasi

Mulai dari [`docs/README.md`](docs/README.md). Konvensi metadata dan tanggal dijelaskan di [`docs/metadata.md`](docs/metadata.md); proses rilis dijelaskan di [`docs/release.md`](docs/release.md).

## Lisensi

Kode workflow dan dokumentasi repositori ini tersedia di bawah [MIT License](LICENSE). Pastikan hak penggunaan tetap tersedia untuk gambar, lampiran, kutipan, dan materi pihak ketiga yang ditambahkan ke laporan.
