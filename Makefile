# PKGBUILD Repository Makefile
#
# Copyright (c) Winston Astrachan 2020

.PHONY: help
help:
	@echo ""
	@echo "Usage: make COMMAND"
	@echo "PKGBUILD Repository Makefile"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo "  init                                 Perform first-time setup (creates aurpublish githooks)"
	@echo "  update                               Update all packages from AUR (pull co-maintainer edits)"
	@echo "  outdated                             Print out-of-date status of all packages"
	@echo ""
	@echo "  publish-1password                    Commit and publish 1password to AUR"
	@echo "  publish-deej                         Commit and publish deej to AUR"
	@echo "  publish-git-secret                   Commit and publish git-secret to AUR"
	@echo "  publish-pcloud-drive                 Commit and publish pcloud-drive to AUR"
	@echo "  publish-tableplus                    Commit and publish tableplus to AUR"
	@echo "  publish-xerox-workcentre-6515-6510   Commit and publish xerox-workcentre-6515-6510 to AUR"

.PHONY: init
init:
	@aurpublish setup

.PHONY: update
update:
	@for pkg in 1password deej git-secret pcloud-drive tableplus xerox-workcentre-6515-6510; do \
		echo ""; \
		echo "Pulling $$pkg changes from AUR..."; \
		aurpublish -p $$pkg; \
	done

.PHONY: outdated
outdated:
	@./scripts/check_outdated.sh

.PHONY: publish-1password
publish-1password:
	@echo ""
	@echo "Publishing 1password to AUR..."
	@aurpublish 1password --speedup

.PHONY: publish-deej
publish-deej:
	@echo ""
	@echo "Publishing deej to AUR..."
	@aurpublish deej --speedup

.PHONY: publish-git-secret
publish-git-secret:
	@echo ""
	@echo "Publishing git-secret to AUR..."
	@aurpublish git-secret --speedup

.PHONY: publish-pcloud-drive
publish-pcloud-drive:
	@echo ""
	@echo "Publishing pcloud-drive to AUR..."
	@aurpublish pcloud-drive --speedup

.PHONY: publish-tableplus
publish-tableplus:
	@echo ""
	@echo "Publishing tableplus to AUR..."
	@aurpublish tableplus --speedup

.PHONY: publish-xerox-workcentre-6515-6510
publish-xerox-workcentre-6515-6510:
	@echo ""
	@echo "Publishing xerox-workcentre-6515-6510 to AUR..."
	@aurpublish xerox-workcentre-6515-6510 --speedup
