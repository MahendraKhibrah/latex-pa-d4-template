#!/bin/sh

set -eu

[ "$#" -eq 1 ] || {
    printf 'usage: %s PDF\n' "$0" >&2
    exit 2
}

pdf=$1
[ -s "$pdf" ] || {
    printf 'error: generated PDF not found or empty: %s\n' "$pdf" >&2
    exit 1
}
command -v pdfinfo >/dev/null 2>&1 || {
    printf 'error: pdfinfo is required to validate generated PDFs\n' >&2
    exit 1
}
pdfinfo "$pdf" >/dev/null 2>&1 || {
    printf 'error: generated PDF is invalid or unreadable: %s\n' "$pdf" >&2
    exit 1
}

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROJECT_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
DIST_DIR=$PROJECT_ROOT/dist
base=$(basename -- "$pdf")

case "$base" in
    main.pdf) output=main.pdf ;;
    evaluation.pdf|evaluation-wrapper.pdf) output=evaluation.pdf ;;
    *) output=$base ;;
esac

mkdir -p "$DIST_DIR"
temporary=$DIST_DIR/.$output.tmp
cp "$pdf" "$temporary"
mv "$temporary" "$DIST_DIR/$output"
printf 'Published %s\n' "$DIST_DIR/$output"
