#!/bin/sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
. "$SCRIPT_DIR/common.sh"

release_date=${RELEASE_DATE:-$(date +%Y-%m-%d)}
project_slug=${PROJECT_SLUG:-pens-paper}

case "$release_date" in
    ????-??-??) ;;
    *) fail 'RELEASE_DATE must use YYYY-MM-DD (example: 2026-10-04)' ;;
esac
case "$project_slug" in
    ''|*[!abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789._-]*)
        fail 'PROJECT_SLUG may contain only letters, digits, dot, underscore, and hyphen'
        ;;
esac

"$SCRIPT_DIR/check.sh"
"$SCRIPT_DIR/evaluation.sh"

normal_release=$DIST_DIR/$project_slug-$release_date.pdf
evaluation_release=$DIST_DIR/$project_slug-evaluation-$release_date.pdf
cp "$DIST_DIR/main.pdf" "$normal_release"
cp "$DIST_DIR/evaluation.pdf" "$evaluation_release"

checksums=$DIST_DIR/SHA256SUMS-$release_date.txt
if command -v sha256sum >/dev/null 2>&1; then
    (cd "$DIST_DIR" && sha256sum "$(basename -- "$normal_release")" "$(basename -- "$evaluation_release")") >"$checksums"
elif command -v shasum >/dev/null 2>&1; then
    (cd "$DIST_DIR" && shasum -a 256 "$(basename -- "$normal_release")" "$(basename -- "$evaluation_release")") >"$checksums"
else
    fail 'sha256sum or shasum is required to create release checksums'
fi

say "Release ready:"
say "  $normal_release"
say "  $evaluation_release"
say "  $checksums"
