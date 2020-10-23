# PKGBUILD Repository Makefile
#
# Copyright (c) Winston Astrachan 2020
PACKAGE :=

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
	@echo "  clean                                Delete build (git ignored) files"
	@echo ""
	@echo "  docker-build                         Build test image"
	@echo "  docker-clean                         Delete test image"
	@echo ""
	@echo "  test-deej                            Test deej's pkgbuild in docker"
	@echo "  test-gestures                        Test gestures's pkgbuild in docker"
	@echo "  test-git-secret                      Test git-secret's pkgbuild in docker"
	@echo "  test-pcloud-drive                    Test pcloud-drive's pkgbuild in docker"
	@echo "  test-tableplus                       Test tableplus's pkgbuild in docker"
	@echo "  test-xerox-workcentre-6515-6510      Test xerox-workcentre-6515-6510's pkgbuild in docker"
	@echo ""
	@echo "  publish-deej                         Commit and publish deej to AUR"
	@echo "  publish-gestures                     Commit and publish gestures to AUR"
	@echo "  publish-git-secret                   Commit and publish git-secret to AUR"
	@echo "  publish-pcloud-drive                 Commit and publish pcloud-drive to AUR"
	@echo "  publish-tableplus                    Commit and publish tableplus to AUR"
	@echo "  publish-xerox-workcentre-6515-6510   Commit and publish xerox-workcentre-6515-6510 to AUR"

.PHONY: init
init:
	@aurpublish setup

.PHONY: update
update:
	@for pkg in pcloud-drive tableplus; do \
		echo ""; \
		echo "Pulling $$pkg changes from AUR..."; \
		aurpublish -p $$pkg; \
	done

.PHONY: outdated
outdated:
	@./scripts/check_outdated.sh

.PHONY: clean
clean:
	git clean -Xdi

.PHONY: docker-build
docker-build:
	docker build --tag=pkgbuild .

.PHONY: docker-clean
docker-clean:
	docker rmi --force pkgbuild || true

.PHONY: test-deej
test-deej: PACKAGE=deej
test-deej: .test

.PHONY: test-gestures
test-gestures: PACKAGE=gestures
test-gestures: .test

.PHONY: test-git-secret
test-git-secret: PACKAGE=git-secret
test-git-secret: .test

.PHONY: test-pcloud-drive
test-pcloud-drive: PACKAGE=pcloud-drive
test-pcloud-drive: .test

.PHONY: test-tableplus
test-tableplus: PACKAGE=tableplus
test-tableplus: .test

.PHONY: test-xerox-workcentre-6515-6510
test-xerox-workcentre-6515-6510: PACKAGE=xerox-workcentre-6515-6510
test-xerox-workcentre-6515-6510: .test

.PHONY: .test
.test: docker-build
	docker run --rm \
               --volume=$(shell pwd):/pkg \
               -w /pkg/${PACKAGE} \
               --user $(shell id -u):$(shell id -g) \
               pkgbuild

.PHONY: publish-deej
publish-deej: PACKAGE=deej
publish-deej: .publish

.PHONY: publish-gestures
publish-gestures: PACKAGE=gestures
publish-gestures: .publish

.PHONY: publish-git-secret
publish-git-secret: PACKAGE=git-secret
publish-git-secret: .publish

.PHONY: publish-pcloud-drive
publish-pcloud-drive: PACKAGE=pcloud-drive
publish-pcloud-drive: .publish

.PHONY: publish-tableplus
publish-tableplus: PACKAGE=tableplus
publish-tableplus: .publish

.PHONY: publish-xerox-workcentre-6515-6510
publish-xerox-workcentre-6515-6510: PACKAGE=xerox-workcentre-6515-6510
publish-xerox-workcentre-6515-6510: .publish

.PHONY: .publish
.publish:
	@echo ""
	@echo "Publishing ${PACKAGE} to AUR..."
	@aurpublish ${PACKAGE} --speedup
