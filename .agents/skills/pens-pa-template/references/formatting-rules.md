# LaTeX Formatting Rules

These patterns apply to `pens-paper-latex/`. Inspect `config/packages.tex` and `config/formatting.tex` before introducing a new environment; existing project definitions take precedence over generic examples.

## General rules

- Preserve the PENS page geometry and global type style.
- Put reusable visual behavior in `config/formatting.tex`, not individual chapters.
- Put package declarations in `config/packages.tex`.
- Keep a local exception local when only one object needs it.
- Escape `# $ % & _ { }` in prose where appropriate.
- Use `~` before cross-references: `Gambar~\ref{fig:alur}`.

## Figures

Store chapter figures in `assets/figures/`. The project config supplies graphics lookup, so use the established path style found in existing source.

```latex
Gambar~\ref{fig:alur-sistem} menunjukkan alur utama sistem.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.8\textwidth]{alur-sistem.png}
  \caption{Alur utama sistem}
  \label{fig:alur-sistem}
\end{figure}
```

Rules:

- mention and discuss the figure before it appears;
- place the caption below the image;
- place `\label` immediately after `\caption`;
- keep width at or below `\textwidth`;
- use descriptive lowercase filenames with hyphens when adding assets;
- preserve source provenance in prose, caption/source notation, bibliography, or `artifacts/references/` as appropriate.

For externally sourced figures, follow the source-line convention already used by the document and cite the authoritative source. Do not leave raw URLs as ordinary unbreakable text.

## Tables

Use the table environment already established by the project. Prefer flexible columns (`X` in `tabularx` or `tabularray` where available) for prose-heavy data.

```latex
Tabel~\ref{tab:hasil-uji} merangkum hasil pengujian.

\begin{table}[H]
  \centering
  \caption{Ringkasan hasil pengujian}
  \label{tab:hasil-uji}
  \begin{tabularx}{\textwidth}{l X c}
    \toprule
    Skenario & Hasil & Status \\
    \midrule
    Autentikasi & Pengguna valid dapat masuk ke sistem. & Lulus \\
    \bottomrule
  \end{tabularx}
\end{table}
```

Rules:

- caption above the table;
- label immediately after the caption;
- table width no greater than `\textwidth`;
- use wrapping columns instead of shrinking readable text;
- split semantically when a table becomes too dense;
- repeat or preserve headers when a multipage table is intentionally used.

## Equations

```latex
\begin{equation}
  y = f(x)
  \label{eq:model}
\end{equation}
```

Reference it as `Persamaan~\ref{eq:model}`. For long expressions, use an appropriate multiline environment rather than scaling the equation into unreadable text.

## Citations and bibliography

Add records to `references.bib` and cite them with the citation commands supported by the configured `natbib` setup, commonly `\cite{key}`. Keep keys stable, verify required fields, and run `make check` after citation changes.

Never edit generated `.bbl` files under `build/`.

## URLs, paths, and technical tokens

- Use `\url{https://...}` for literal URLs.
- Wrap commands, filenames, or code using the project's established style.
- Rewrite overly long inline identifiers when prose can describe them more clearly.
- Add discretionary breakpoints only when the exact token must be displayed.

## Overflow policy

Fix overflow in this order:

1. improve wording or split the sentence;
2. make the affected table/image/equation responsive to `\textwidth`;
3. permit safe breaks in a URL or technical token;
4. apply a narrow local typography adjustment;
5. consider a documented global setting only when the issue is systemic.

Do not change institutional margins, reduce the entire document font, or add global `\sloppy` merely to silence a warning. Rebuild and inspect `build/main.log` plus the affected page in `dist/main.pdf`.

## Appendices and attachments

Place external PDFs under `assets/attachments/` and include them through the appendix source, normally `pages/lampiran.tex`. Keep the path centralized through `\AttachmentsPath` where the source pattern supports it. Verify page size, orientation, readability, and page numbering in the final PDF.
