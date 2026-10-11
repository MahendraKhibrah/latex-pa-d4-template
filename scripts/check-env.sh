#!/bin/sh

set -eu

missing=0

check_command() {
    if command -v "$1" >/dev/null 2>&1; then
        printf 'ok      %-12s %s\n' "$1" "$(command -v "$1")"
    else
        printf 'missing %-12s required\n' "$1" >&2
        missing=1
    fi
}

check_command sh
check_command make
check_command latexmk
check_command pdflatex
check_command bibtex
check_command pdfinfo

if command -v sha256sum >/dev/null 2>&1; then
    printf 'ok      %-12s %s\n' sha256sum "$(command -v sha256sum)"
elif command -v shasum >/dev/null 2>&1; then
    printf 'ok      %-12s %s\n' shasum "$(command -v shasum)"
else
    printf 'warning: sha256sum/shasum not found; make release cannot write checksums\n' >&2
fi

if [ "$missing" -ne 0 ]; then
    printf '\nInstall the missing commands and run make check-env again.\n' >&2
    exit 1
fi

printf '\nEnvironment is ready.\n'
