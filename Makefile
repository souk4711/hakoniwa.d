.PHONY: help
help:										## Print help
	@grep -E '^[a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: binwrappers
binwrappers:						## Generate binary wrappers in /usr/local/bin/
	./scripts/make-binwrappers.sh

.PHONY: install_hakoniwa
install_hakoniwa:				## Install hakoniwa to /usr/bin/hakoniwa
	./scripts/make-install-hakoniwa.sh

.PHONY: install_hakoniwa_d
install_hakoniwa_d:			## Install hakoniwa profiles to /etc/hakoniwa.d/
	./scripts/make-install-hakoniwa-d.sh
