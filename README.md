# Common scripts

Common scripts and reusable workflows.

| Make option | Usage                  | Description                                                     |
|-------------|------------------------|:----------------------------------------------------------------|
| [adoc.mk]`    | make --help            | Show help message of the make command itself.                   |
| `-W file`   | make -W foo.txt TARGET | Pretend that the target file has just been modified.            |
| `-n`        | make -n TARGET         | Print the recipe that would be executed, but do not execute it. |
| `-p`        | make -p TARGET         | Print rules and variable that are read from makefiles.          |
| `-d`        | make -d TARGET         | Print debugging information in addition to normal processing.   |
| `--trace`   | make --trace TARGET    | Show tracing information. Short for --debug=print,why.          |

For a makefile named `<name>.mk`, `<name>-help` target is available to show help message.

## Make tips

Following make options can be helpful when debugging make.

See also the [9.8 Summary of Options](https://www.gnu.org/software/make/manual/html_node/Options-Summary.html).

| Make option | Usage                  | Description                                                     |
|-------------|------------------------|:----------------------------------------------------------------|
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

| Makefile    | Show help message      | Description                                                     |
|-------------|------------------------|:----------------------------------------------------------------|
| [adoc.mk](./makefiles/adoc.mk) | `make adoc-help` | Export documents from *.adoc |
| [cspell.mk](./makefiles/cspell.mk) | `make cspell-help` | xxxxx |
| [drawio.mk](./makefiles/drawio.mk) | `make drawio-help` | xxxxx |
| [go-build.mk](./makefiles/go-build.mk) | `make go-build-help` | xxxxx |
| [go-licenses.mk](./makefiles/go-licenses.mk) | `make go-licenses-help` | xxxxx |
| [go-test.mk](./makefiles/go-test.mk) | `make go-test-help` | xxxxx |
| [go.mk](./makefiles/go.mk) | `make go-help` | xxxxx |
| [goda.mk](./makefiles/goda.mk) | `make goda-help` | xxxxx |
| [golangci-lint.mk](./makefiles/golangci-lint.mk) | `make golangci-lint-help` | xxxxx |
| [govulncheck.mk](./makefiles/govulncheck.mk) | `make govulncheck-help` | xxxxx |
| [graphviz.mk](./makefiles/graphviz.mk) | `make graphviz-help` | xxxxx |
| [markdownlint.mk](./makefiles/markdownlint.mk) | `make markdownlint-help` | xxxxx |
| [mermaid.mk](./makefiles/mermaid.mk) | `make mermaid-help` | xxxxx |
| [nfpm.mk](./makefiles/nfpm.mk) | `make nfpm-help` | xxxxx |
| [prettier.mk](./makefiles/prettier.mk) | `make prettier-help` | xxxxx |
| [protolint.mk](./makefiles/protolint.mk) | `make protolint-help` | xxxxx |
| [scanoss.mk](./makefiles/scanoss.mk) | `make scanoss-help` | xxxxx |
| [shellcheck.mk](./makefiles/shellcheck.mk) | `make shellcheck-help` | xxxxx |
| [shfmt.mk](./makefiles/shfmt.mk) | `make shfmt-help` | xxxxx |
| [trivy.mk](./makefiles/trivy.mk) | `make trivy-help` | xxxxx |
| [util.mk](./makefiles/util.mk) | `make util-help` | xxxxx |
