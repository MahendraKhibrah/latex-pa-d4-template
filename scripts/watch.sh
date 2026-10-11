#!/bin/sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
. "$SCRIPT_DIR/common.sh"

ensure_output_dirs
say 'Watching LaTeX sources; press Ctrl-C to stop.'
(cd "$PROJECT_ROOT" && exec latexmk -e '$success_cmd = "sh scripts/publish-pdf.sh %D";' -pdf -pvc -view=none main.tex)
