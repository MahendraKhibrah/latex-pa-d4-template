# Build Workflow

## Prinsip

1. `main.tex` adalah entry point dokumen normal.
2. Build tidak menulis produk sementara ke direktori sumber: seluruh produk berada di `build/`.
3. PDF konsumsi pengguna berada di `dist/` dan hanya diperbarui setelah kompilasi sukses.
4. `build/` dan `dist/` bersifat generated serta diabaikan Git.
5. Semua skrip memakai shell POSIX dan dapat dijalankan melalui target `make`.

## Alur normal

```sh
make check-env
make build
make check
```

`make build` menjalankan `latexmk` dengan `.latexmkrc`. Bibliografi dan pengulangan kompilasi ditangani oleh `latexmk`. PDF akhir adalah `dist/main.pdf`.

`make check` melakukan build melalui dependency tracking, memvalidasi PDF dengan `pdfinfo`, lalu memeriksa `build/main.log`. Target gagal jika LaTeX melaporkan error, sitasi/referensi yang belum terselesaikan, atau `Overfull \\hbox`. `build` dan `evaluation` juga gagal jika kompilasi gagal; PDF invalid tidak pernah diterbitkan ke `dist/`.

## Mode kontinu

```sh
make watch
```

`latexmk -pvc` memantau dependency dokumen. Target watch memasang callback sukses khusus sesi tersebut untuk menerbitkan PDF terbaru secara atomik ke `dist/main.pdf`. Hentikan dengan `Ctrl-C`.

## Varian evaluasi

```sh
make evaluation
```

Skrip membuat wrapper generated di `build/evaluation-wrapper.tex`. Wrapper mendefinisikan fallback no-op bila `\EvaluationBuildtrue` belum tersedia, memanggil switch tersebut, kemudian memuat `main.tex`. Tidak ada berkas `config/` atau sumber inti yang diedit. Hasilnya `dist/evaluation.pdf`.

Ketika sumber menyediakan switch seperti berikut, konten dapat dibedakan:

```tex
\newif\ifEvaluationBuild
% Gunakan \ifEvaluationBuild ... \else ... \fi sesuai kebutuhan.
```

Definisi tersebut harus tersedia sebelum penggunaan kondisi. Workflow tetap berhasil bila template belum mengimplementasikan switch.

## Pembersihan

```sh
make clean      # hapus dan buat ulang build/
make clean-all  # juga hapus dan buat ulang dist/
```

Jangan meletakkan sumber penting di kedua direktori generated tersebut.
