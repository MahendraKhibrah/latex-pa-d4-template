---
title: Pemisahan Build dan Output Distribusi
created_at: 2026-10-04
updated_at: 2026-10-04
document_type: decision
status: accepted
author: Template Maintainer
tags:
  - build
  - maintainability
related_documents:
  - docs/2026-10-04_arsitektur-template.md
---

# Keputusan

Seluruh file sementara LaTeX ditempatkan di `build/`. PDF yang telah berhasil dikompilasi dan divalidasi ditempatkan di `dist/`.

Pemisahan ini menjaga root project tetap bersih, mencegah file generated ikut diedit, dan membuat artefak distribusi mudah ditemukan.
