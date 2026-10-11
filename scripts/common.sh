#!/bin/sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PROJECT_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)
BUILD_DIR=$PROJECT_ROOT/build
DIST_DIR=$PROJECT_ROOT/dist

export PROJECT_ROOT BUILD_DIR DIST_DIR

say() {
    printf '%s\n' "$*"
}

fail() {
    printf 'error: %s\n' "$*" >&2
    exit 1
}

ensure_output_dirs() {
    mkdir -p "$BUILD_DIR" "$DIST_DIR"
}

run_latexmk() {
    (cd "$PROJECT_ROOT" && latexmk -pdf "$@")
}
