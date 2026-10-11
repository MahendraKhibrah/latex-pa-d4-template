#!/bin/sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
. "$SCRIPT_DIR/common.sh"

ensure_output_dirs
say 'Building main.tex...'
run_latexmk main.tex
[ -f "$BUILD_DIR/main.pdf" ] || fail 'build/main.pdf was not generated'
"$SCRIPT_DIR/publish-pdf.sh" "$BUILD_DIR/main.pdf"
say 'Build complete: dist/main.pdf'
