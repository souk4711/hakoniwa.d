.PHONY: help
help:										## Print help
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: binwrapper
binwrapper:							## Generate a specified binary wrapper in /usr/local/bin/
	@./scripts/make-binwrappers.sh --bin "$(bin)"

.PHONY: binwrappers
binwrappers:						## Generate a set of default binary wrappers in /usr/local/bin/
ifeq ($(extra), 1)
	@./scripts/make-binwrappers.sh --defaults-extra
else
	@./scripts/make-binwrappers.sh --defaults
endif

.PHONY: install_hakoniwa
install_hakoniwa:				## Install hakoniwa to /usr/bin/hakoniwa
	@./scripts/make-install-hakoniwa.sh

.PHONY: install_hakoniwa_d
install_hakoniwa_d:			## Install hakoniwa profiles to /etc/hakoniwa.d/
	@./scripts/make-install-hakoniwa-d.sh

.PHONY: uninstall
uninstall:							## Uninstall hakoniwa stuff
	@./scripts/make-uninstall.sh

.PHONY: lint
lint:										## Run lints
	shellcheck ./stdlib.sh
	shellcheck ./scripts/*.sh

.PHONY: test
test:										## Run test suites
	bats -r ./tests
