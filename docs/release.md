# Release Process

## Membuat rilis

Pastikan working tree dan metadata laporan sesuai, kemudian jalankan:

```sh
RELEASE_DATE=2026-10-04 PROJECT_SLUG=pens-paper make release
```

Target ini:

1. membangun dokumen normal;
2. memeriksa referensi dan sitasi;
3. membangun varian evaluasi;
4. menyalin PDF immutable dengan nama bertanggal;
5. membuat checksum SHA-256.

Output contoh:

```text
dist/pens-paper-2026-10-04.pdf
dist/pens-paper-evaluation-2026-10-04.pdf
dist/SHA256SUMS-2026-10-04.txt
```

Jika `RELEASE_DATE` tidak diberikan, tanggal lokal saat perintah dijalankan digunakan. Untuk rilis yang dapat direproduksi dan ditinjau, tetapkan tanggal secara eksplisit.

## Verifikasi

Di sistem dengan GNU coreutils:

```sh
cd dist
sha256sum -c SHA256SUMS-2026-10-04.txt
```

Tinjau kedua PDF secara visual, khususnya cover, daftar isi, sitasi, gambar, tabel, page break, dan lampiran. Checksum membuktikan integritas berkas, bukan kebenaran isi.

`dist/main.pdf` dan `dist/evaluation.pdf` adalah alias hasil terbaru; gunakan nama bertanggal untuk distribusi formal.
