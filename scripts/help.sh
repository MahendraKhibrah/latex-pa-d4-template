#!/bin/sh

set -eu

cat <<'EOF'
PENS Paper LaTeX workflow

Usage:
  make <command>

Commands:
  help        Show this command overview.
  check-env   Verify the required POSIX and LaTeX tools.
  build       Build main.tex into build/ and publish dist/main.pdf.
  watch       Continuously rebuild and publish when sources change.
  check       Build and fail on unresolved references or citations.
  evaluation  Build dist/evaluation.pdf using an injected evaluation switch.
  release     Check, build variants, and create dated PDFs plus checksums.
  clean       Remove temporary output under build/.
  clean-all   Remove temporary and distributable output.

Release options are supplied as environment variables:
  RELEASE_DATE=YYYY-MM-DD PROJECT_SLUG=name make release
EOF
