.PHONY: help
help:										## Print help
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: binwrappers
binwrappers:						## Generate binary wrappers in /usr/local/bin/
ifneq ($(bin), )
	@./scripts/make-binwrappers.sh --bin "$(bin)"
else ifneq ($(group), )
	@./scripts/make-binwrappers.sh --group "$(group)"
else
	@echo "Usage:"
	@echo ""
	@echo "  $$ make binwrappers bin=firefox    # Generate a specified binary wrapper in /usr/local/bin/"
	@echo "  $$ make binwrappers group=browser  # Generate a set of binary wrappers in /usr/local/bin/"
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
	shellcheck ./tests/**/*.bats

.PHONY: test
test:										## Run test suites
	bats -r ./tests
