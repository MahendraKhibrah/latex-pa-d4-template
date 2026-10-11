SHELL := /bin/sh
.DEFAULT_GOAL := help

.PHONY: help check-env build watch check evaluation release clean clean-all

help:
	@sh scripts/help.sh

check-env:
	@sh scripts/check-env.sh

build:
	@sh scripts/build.sh

watch:
	@sh scripts/watch.sh

check:
	@sh scripts/check.sh

evaluation:
	@sh scripts/evaluation.sh

release:
	@sh scripts/release.sh

clean:
	@sh scripts/clean.sh

clean-all:
	@sh scripts/clean.sh --all
