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
	@echo "  update                               Update all packages from AUR (pull co-maintainer edits)"
	@echo ""
	@echo "  publish-tableplus                    Commit and publish tableplus to AUR"
	@echo "  publish-xerox-workcentre-6515-6510   Commit and publish publish-xerox-workcentre-6515-6510 to AUR"

.PHONY: update
update:
	@for pkg in tableplus xerox-workcentre-6515-6510; do \
		echo ""; \
		echo "Pulling $$pkg changes from AUR..."; \
		aurpublish -p $$pkg; \
	done

.PHONY: publish-tableplus
publish-tableplus: update
	@echo ""
	@echo "Publishing tableplus to AUR..."
	@aurpublish tableplus

.PHONY: publish-xerox-workcentre-6515-6510
publish-xerox-workcentre-6515-6510: update
	@echo ""
	@echo "Publishing xerox-workcentre-6515-6510 to AUR..."
	@aurpublish xerox-workcentre-6515-6510
