SHELL ?= /bin/bash -euo pipefail
define UTIL_HELP
REQUIREMENTS:
  - none

TARGETS:
  - util-help      : show help message.
  - list-makefiles : list loaded makefiles.
  - list-helps     : list help command for loaded makefiles.
  - helps          : alias to the list-helps.
  - help           : alias to the list-helps.

VARIABLES [default value]:
  - none

REFERENCES:
  - none

IDE INTEGRATIONS:
  - none

PROJECT STRUCTURE:
  /                 |-- Project
  ├─ _scripts/      |-- Git submodule
  │  └─ makefiles/  |
  │     └─ util.mk  |
  └─ Makefile       |-- include _scripts/makefiles/util.mk
endef

.PHONY: util-help
util-help:
	$(info $(UTIL_HELP))
	@echo ""

#├─────────────────────────────────────────────────────────────────────────────┤

.PHONY: list list-makefiles
list list-makefiles:
	@for target in $(MAKEFILE_LIST); do \
	echo "$$target"; \
	done

#├─────────────────────────────────────────────────────────────────────────────┤

.PHONY: help helps list-helps
help helps list-helps:
	$(info Help commands)
	$(info -------------)
	@for target in $(basename $(notdir $(MAKEFILE_LIST))); do \
	test "$$target" != "Makefile" && echo "make $$target-help"; \
	done
