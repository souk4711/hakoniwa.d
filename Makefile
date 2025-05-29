.PHONY: help
help:										## Print help
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: binwrappers
binwrappers:						## Generate binary wrappers in /usr/local/bin/
ifneq ($(bin), )
	@./hakoniwa.d/utils/install-binwrappers.sh --bin "$(bin)"
else ifneq ($(group), )
	@./hakoniwa.d/utils/install-binwrappers.sh --group "$(group)"
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
	@while read -r filename; do						\
		echo "shellcheck $$filename";				\
		shellcheck "$$filename" || exit 1;	\
	done < <(find . \( -name "*.sh" -o -name "*.bats" \))

.PHONY: test
test:										## Run test suites
	bats -r ./tests
