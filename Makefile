$(shell mkdir -p bin/)
export GOBIN := $(CURDIR)/bin/

ifneq (,$(wildcard .env.mk))
  include .env.mk
endif
ifneq (,$(wildcard .env))
  include .env
endif

include makefiles/adoc.mk
include makefiles/buf.mk
include makefiles/cspell.mk
include makefiles/go-build.mk
include makefiles/go-licenses.mk
include makefiles/go-test.mk
include makefiles/go.mk
include makefiles/goda.mk
include makefiles/golangci-lint.mk
include makefiles/govulncheck.mk
include makefiles/markdownlint.mk
include makefiles/nfpm.mk
include makefiles/prettier.mk
include makefiles/protolint.mk
include makefiles/scanoss.mk
include makefiles/shellcheck.mk
include makefiles/shfmt.mk
include makefiles/trivy.mk
include makefiles/util.mk
include makefiles_util/drawio.mk
include makefiles_util/diagrams.mk
include makefiles_util/graphviz.mk
include makefiles_util/mermaid.mk
include makefiles_util/pkgsite.mk

LOCAL_CHECKS += buf-lint
LOCAL_CHECKS += cspell-run
LOCAL_CHECKS += go-licenses-run
LOCAL_CHECKS += golangci-lint-run
LOCAL_CHECKS += markdownlint-run
LOCAL_CHECKS += prettier-run
LOCAL_CHECKS += protolint-run
LOCAL_CHECKS += shellcheck-run
LOCAL_CHECKS += shfmt-run

.PHONY: local-check
local-check: $(LOCAL_CHECKS)

.PHONY: local-format
local-format:
	$(MAKE) buf-format ARGS="--write"
	$(MAKE) go-fmt ARGS="-w"
	$(MAKE) prettier-run ARGS="--write"
