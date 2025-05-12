# Common scripts

Common scripts and reusable GitHub actions and workflows.

This repository is intended to be used as git submodule.

## Basic project structure

Basic structure that uses this repository as a git submodule becomes

```text
/                   |-- Project root
├─ _scripts/        |-- Git submodule (This repository)
│  └─ makefiles/    |
├─ makefiles/       |-- Projects' makefiles
├─ docs/            |-- Documentation
├─ cmd/             |-- Go commands
├─ go.mod           |
├─ go.sum           |
└─ Makefile         |-- Include necessary *.mk
```

[./Makefile](./Makefile) is an example of project's makefile.

## Makefiles

Reusable makefiles are placed in [./makefiles/](./makefiles/).
Currently following tools available.

| Makefile                                         | Help commands             | Description                      |
| ------------------------------------------------ | ------------------------- | :------------------------------- |
| [adoc.mk](./makefiles/adoc.mk)                   | `make adoc-help`          | Export documents from `*.adoc`   |
| [cspell.mk](./makefiles/cspell.mk)               | `make cspell-help`        | Run spell check with cspell      |
| [drawio.mk](./makefiles/drawio.mk)               | `make drawio-help`        | Export images from `*.drawio`    |
| [go-build.mk](./makefiles/go-build.mk)           | `make go-build-help`      | Build go applications            |
| [go-licenses.mk](./makefiles/go-licenses.mk)     | `make go-licenses-help`   | Run license checks               |
| [go-test.mk](./makefiles/go-test.mk)             | `make go-test-help`       | Run go testing                   |
| [go.mk](./makefiles/go.mk)                       | `make go-help`            | Run plain `go` command           |
| [goda.mk](./makefiles/goda.mk)                   | `make goda-help`          | Generate dependency graph        |
| [golangci-lint.mk](./makefiles/golangci-lint.mk) | `make golangci-lint-help` | Lint with golangci-lint          |
| [govulncheck.mk](./makefiles/govulncheck.mk)     | `make govulncheck-help`   | Run vulnerability check          |
| [graphviz.mk](./makefiles/graphviz.mk)           | `make graphviz-help`      | Export images from `*.dot`       |
| [markdownlint.mk](./makefiles/markdownlint.mk)   | `make markdownlint-help`  | Lint with markdownlint           |
| [mermaid.mk](./makefiles/mermaid.mk)             | `make mermaid-help`       | Export images from mermaid       |
| [nfpm.mk](./makefiles/nfpm.mk)                   | `make nfpm-help`          | Generate linux package with nfpm |
| [prettier.mk](./makefiles/prettier.mk)           | `make prettier-help`      | Lint and format with prettier    |
| [scanoss.mk](./makefiles/scanoss.mk)             | `make scanoss-help`       | Check copyright health           |
| [shellcheck.mk](./makefiles/shellcheck.mk)       | `make shellcheck-help`    | Lint shells                      |
| [shfmt.mk](./makefiles/shfmt.mk)                 | `make shfmt-help`         | Format shells                    |
| [trivy.mk](./makefiles/trivy.mk)                 | `make trivy-help`         | Run trivy (Generate SBOM)        |
| [util.mk](./makefiles/util.mk)                   | `make util-help`          | Some utilities                   |

## GitHub Actions

Reusable actions in [./.github/actions/](./.github/actions/).

Reusable actions in [./.github/workflows/](./.github/workflows/).

## Make command tips

Following make options can be helpful when debugging make.

See also the [9.8 Summary of Options](https://www.gnu.org/software/make/manual/html_node/Options-Summary.html).

| Make option | Usage                  | Description                                                     |
| ----------- | ---------------------- | :-------------------------------------------------------------- |
| `--help`    | make --help            | Show help message of the make command itself.                   |
| `-W file`   | make -W foo.txt TARGET | Pretend that the target file has just been modified.            |
| `-n`        | make -n TARGET         | Print the recipe that would be executed, but do not execute it. |
| `-p`        | make -p TARGET         | Print rules and variable that are read from makefiles.          |
| `-d`        | make -d TARGET         | Print debugging information in addition to normal processing.   |
| `--trace`   | make --trace TARGET    | Show tracing information. Short for --debug=print,why.          |

Additionally, `MAKEFLAGS` can be used to persist the options.
For example,

```bash
$ export MAKEFLAGS="--trace"
$ make TARGET

# is identical to

$ make --trace TARGET
```
