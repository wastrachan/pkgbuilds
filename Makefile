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
	@echo ""
	@echo "  publish-tableplus                    Commit and publish tableplus to AUR"
	@echo "  publish-xerox-workcentre-6515-6510   Commit and publish xerox-workcentre-6515-6510 to AUR"
	@echo "  publish-git-secret                   Commit and publish git-secret to AUR"

.PHONY: init
init:
	@aurpublish setup

.PHONY: update
update:
	@for pkg in tableplus xerox-workcentre-6515-6510 git-secret; do \
		echo ""; \
		echo "Pulling $$pkg changes from AUR..."; \
		aurpublish -p $$pkg; \
	done

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

.PHONY: publish-git-secret
publish-git-secret:
	@echo ""
	@echo "Publishing git-secret to AUR..."
	@aurpublish git-secret --speedup
