---
title: Arsitektur Template PENS LaTeX
created_at: 2026-10-04
updated_at: 2026-10-04
document_type: architecture
status: accepted
author: Template Maintainer
tags:
  - latex
  - pens
  - architecture
---

# Arsitektur Template

`main.tex` adalah satu-satunya entry point. Konfigurasi dipisahkan menjadi opsi, data, package, formatting, dan validasi. Konten dipisahkan ke `pages/`, `chapters/`, dan `appendices/`; aset yang dirender berada di `assets/`.

File sementara hanya boleh berada di `build/`, sedangkan PDF siap pakai berada di `dist/`. Dokumentasi authoritative disimpan di `docs/`; research, notes, referensi mentah, keputusan, dan change notes disimpan di `artifacts/`.
