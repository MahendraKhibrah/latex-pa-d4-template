#!/bin/sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
. "$SCRIPT_DIR/common.sh"

"$SCRIPT_DIR/build.sh"
log=$BUILD_DIR/main.log
[ -f "$log" ] || fail 'build/main.log was not generated'

issues=$BUILD_DIR/check-issues.txt
if grep -E 'LaTeX Warning: (There were undefined references|Reference .+ undefined|Citation .+ undefined)|Package .* Warning: Citation .+ undefined|Rerun to get (cross-references|citations) right|LaTeX Error:|Package .* Error:|Undefined control sequence|Emergency stop|Fatal error occurred|Overfull \\hbox' "$log" >"$issues"; then
    printf '\nDocument quality issues:\n' >&2
    cat "$issues" >&2
    fail 'LaTeX errors, unresolved references/citations, or overfull boxes remain'
fi
rm -f "$issues"

pdfinfo "$BUILD_DIR/main.pdf" >/dev/null 2>&1 || fail 'build/main.pdf is invalid or unreadable'
say 'Check passed: PDF valid; no unresolved references, citations, errors, or overfull boxes found.'
