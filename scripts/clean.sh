#!/bin/sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROJECT_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)

rm -rf "$PROJECT_ROOT/build"
mkdir -p "$PROJECT_ROOT/build"
printf 'Cleaned build/.\n'

if [ "${1:-}" = '--all' ]; then
    rm -rf "$PROJECT_ROOT/dist"
    mkdir -p "$PROJECT_ROOT/dist"
    printf 'Cleaned dist/.\n'
elif [ "$#" -ne 0 ]; then
    printf 'usage: %s [--all]\n' "$0" >&2
    exit 2
fi
