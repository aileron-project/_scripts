SHELL ?= /bin/bash -euo pipefail
define ADOC_HELP
REQUIREMENTS:
  - asciidoctor       : `asciidoctor` required for the `asciidoc-html` target.
  - asciidoctor-pdf   : `asciidoctor-pdf` required for the `asciidoc-pdf` target.
  - asciidoctor-epub3 : `asciidoctor-epub3` required for the `asciidoc-epub` target.

TARGETS:
  - <TARGET>-usage : Show the <TARGET> usage.
  - adoc-help      : Show help message.
  - adoc           : Run plain asciidoctor command with given args.
  - adoc-html      : Export *.html from *.adoc.
  - adoc-pdf       : Export *.pdf from *.adoc.
  - adoc-epub      : Export  *.epub from *.adoc.

VARIABLES [default value]:
  - ADOC_CMD          : asciidoctor binary path. [asciidoctor]
  - ADOC_CMD_PDF      : asciidoctor-pdf binary path. [asciidoctor-pdf]
  - ADOC_CMD_EPUB     : asciidoctor-epub3 binary path. [asciidoctor-epub3]
  - ADOC_TARGET       : target of asciidoc. [all "docs/adoc/*.adoc" files]
  - ADOC_OPTION       : asciidoctor command line options for all formats. []
  - ADOC_ATTRS_COMMON : "--attribute" common options. [See the adoc.mk]
  - ADOC_ATTRS_HTML   : "--attribute" for html. [source-highlighter=highlight.js diagram-format=svg]
  - ADOC_ATTRS_PDF    : "--attribute" for pdf. [source-highlighter=rouge mathematical-format=svg diagram-format=svg]
  - ADOC_ATTRS_EPUB   : "--attribute" for epub. [source-highlighter=coderay diagram-format=png]
  - ADOC_REQS_COMMON  : "--require" common options. [asciidoctor-diagram asciidoctor-lists]
  - ADOC_REQS_HTML    : "--require" for html. []
  - ADOC_REQS_PDF     : "--require" for pdf. [asciidoctor-mathematical]
  - ADOC_REQS_EPUB    :  "--require" for epub. [asciidoctor-mathematical]

REFERENCES:
  - https://asciidoc.org/
	- https://asciidoctor.org/
	- https://asciidoctor.org/docs/extensions/

IDE INTEGRATIONS:
  - VSCode    : https://marketplace.visualstudio.com/items?itemName=asciidoctor.asciidoctor-vscode
  - JetBrains : https://plugins.jetbrains.com/plugin/7391-asciidoc
  - Others?   : https://docs.asciidoctor.org/asciidoctor/latest/tooling/

PROJECT STRUCTURE:
  /                 |-- Project
  ├─ docs/          |-- Git submodule
  │  └─ adoc/       |
  │     └─ *.adoc   |-- default target to compile
  ├─ _scripts/      |-- Git submodule
  │  └─ makefiles/  |
  │     └─ adoc.mk  |
  └─ Makefile       |-- include _scripts/makefiles/adoc.mk
endef

.PHONY: adoc-help
adoc-help:
	$(info $(ADOC_HELP))
	@echo ""

#├─────────────────────────────────────────────────────────────────────────────┤

ADOC_CMD ?= asciidoctor
ADOC_CMD_PDF ?= asciidoctor-pdf
ADOC_CMD_EPUB ?= asciidoctor-epub3
ADOC_TARGET ?= 'docs/adoc/*.adoc'
ADOC_OPTION ?=

ADOC_ATTRS_COMMON ?= \
	doctype=book \
	compress \
	optimize \
	experimental \
	reproducible \
	data-uri \
	toc=left \
	toclevels=4 \
	sectnums \
	sectlinks \
	sectanchors \
	stem \
	diagram-nocache-option \
	imagesoutdir=.asciidoctor/

ADOC_REQS_COMMON ?= \
	asciidoctor-diagram \
	asciidoctor-lists

ADOC_ATTRS_HTML ?= source-highlighter=highlight.js diagram-format=svg
ADOC_REQS_HTML ?=
ADOC_ATTRS_PDF ?= source-highlighter=rouge mathematical-format=svg diagram-format=svg
ADOC_REQS_PDF ?= asciidoctor-mathematical
ADOC_ATTRS_EPUB ?= source-highlighter=coderay diagram-format=png 
ADOC_REQS_EPUB ?= asciidoctor-mathematical

ADOC_ATTRS_HTML := $(addprefix --attribute=,$(ADOC_ATTRS_COMMON) $(ADOC_ATTRS_HTML))
ADOC_REQS_HTML := $(addprefix --require=,$(ADOC_REQS_COMMON) $(ADOC_REQS_HTML))
ADOC_ATTRS_PDF := $(addprefix --attribute=,$(ADOC_ATTRS_COMMON) $(ADOC_ATTRS_PDF))
ADOC_REQS_PDF := $(addprefix --require=,$(ADOC_REQS_COMMON) $(ADOC_REQS_PDF))
ADOC_ATTRS_EPUB := $(addprefix --attribute=,$(ADOC_ATTRS_COMMON) $(ADOC_ATTRS_EPUB))
ADOC_REQS_EPUB := $(addprefix --require=,$(ADOC_REQS_COMMON) $(ADOC_REQS_EPUB))

#├─────────────────────────────────────────────────────────────────────────────┤

.PHONY: adoc-html-usage
adoc-html-usage:
	# Usage : make adoc-html ARGS=""
	# Exec  : $$(ADOC_CMD) $$(ADOC_OPTION) $$(ADOC_ATTRS_HTML) $$(ADOC_REQS_HTML) $$(ARGS) $$(ADOC_TARGET)
	# Desc  : Install buf using `go install`.
	# Examples:
	#   - make adoc-html
	#   - make adoc-html ADOC_TARGET="./foo/*.adoc"

.PHONY: adoc-html
adoc-html:
	$(ADOC_CMD) $(ADOC_OPTION) $(ADOC_ATTRS_HTML) $(ADOC_REQS_HTML) $(ARGS) $(ADOC_TARGET)

#├─────────────────────────────────────────────────────────────────────────────┤

.PHONY: adoc-pdf-usage
adoc-pdf-usage:
	# Usage : make adoc-html ARGS=""
	# Exec  : $$(ADOC_CMD_PDF) $$(ADOC_OPTION) $$(ADOC_ATTRS_PDF) $$(ADOC_REQS_PDF) $$(ARGS) $$(ADOC_TARGET)
	# Desc  : Install buf using `go install`.
	# Examples:
	#   - make adoc-html
	#   - make adoc-html ADOC_TARGET="./foo/*.adoc"

.PHONY: adoc-pdf
adoc-pdf:
	$(ADOC_CMD_PDF) $(ADOC_OPTION) $(ADOC_ATTRS_PDF) $(ADOC_REQS_PDF) $(ARGS) $(ADOC_TARGET)

#├─────────────────────────────────────────────────────────────────────────────┤

.PHONY: adoc-epub-usage
adoc-epub-usage:
	# Usage : make adoc-epub ARGS=""
	# Exec  : $$(ADOC_CMD_EPUB) $$(ADOC_OPTION) $$(ADOC_ATTRS_EPUB) $$(ADOC_REQS_EPUB) $$(ARGS) $$(ADOC_TARGET)
	# Desc  : Install buf using `go install`.
	# Examples:
	#   - make adoc-epub
	#   - make adoc-epub ADOC_TARGET="./foo/*.adoc"

.PHONY: adoc-epub
adoc-epub:
	$(ADOC_CMD_EPUB) $(ADOC_OPTION) $(ADOC_ATTRS_EPUB) $(ADOC_REQS_EPUB) $(ARGS) $(ADOC_TARGET)
