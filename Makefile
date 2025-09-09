PACKAGE :=

.PHONY: help
help:
	@echo ""
	@echo "Usage: make COMMAND"
	@echo "PKGBUILD Repository Makefile"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo "  init                                            Perform first-time setup (creates aurpublish githooks)"
	@echo "  update                                          Update all packages from AUR (pull co-maintainer edits)"
	@echo "  outdated                                        Print out-of-date status of all packages"
	@echo "  clean                                           Delete build (git ignored) files"
	@echo "  docker-build                                    Build test image"
	@echo "  docker-clean                                    Delete test image"
	@echo ""
	@echo "  test-deej                                       Test deej's pkgbuild in docker"
	@echo "  test-gestures                                   Test gestures's pkgbuild in docker"
	@echo "  test-git-secret                                 Test git-secret's pkgbuild in docker"
	@echo "  test-google-cloud-cli-gke-gcloud-auth-plugin    Test google-cloud-cli-gke-gcloud-auth-plugin's pkgbuild in docker"
	@echo "  test-kiibohd-configurator-bin                   Test kiibohd-configurator-bin's pkgbuild in docker"
	@echo "  test-pcloud-drive                               Test pcloud-drive's pkgbuild in docker"
	@echo "  test-ttf-adobe-source-fonts                     Test -ttf-adobe-source-fonts's pkgbuild in docker"
	@echo "  test-wireguard-vanity-keygen                    Test wireguard-vanity-keygen's pkgbuild in docker"
	@echo "  test-wireguard-vanity-keygen-bin                Test wireguard-vanity-keygen-bin's pkgbuild in docker"
	@echo "  test-xerox-workcentre-6515-6510                 Test xerox-workcentre-6515-6510's pkgbuild in docker"
	@echo "  test-brother-mfc-l3780cdw                       Test brother-mfc-l3780cdw's pkgbuild in docker"
	@echo "  test-beekeeper-studio-bin                       Test beekeeper-studio-bin's pkgbuild in docker"
	@echo ""
	@echo "  publish-deej                                    Commit and publish deej to AUR"
	@echo "  publish-gestures                                Commit and publish gestures to AUR"
	@echo "  publish-git-secret                              Commit and publish git-secret to AUR"
	@echo "  publish-google-cloud-cli-gke-gcloud-auth-plugin Commit and publish google-cloud-cli-gke-gcloud-auth-plugin to AUR"
	@echo "  publish-kiibohd-configurator-bin                Commit and publish kiibohd-configurator-bin to AUR"
	@echo "  publish-pcloud-drive                            Commit and publish pcloud-drive to AUR"
	@echo "  publish-ttf-adobe-source-fonts                  Commit and publish -ttf-adobe-source-fonts to AUR"
	@echo "  publish-wireguard-vanity-keygen                 Commit and publish wireguard-vanity-keygen to AUR"
	@echo "  publish-wireguard-vanity-keygen-bin             Commit and publish wireguard-vanity-keygen-bin to AUR"
	@echo "  publish-xerox-workcentre-6515-6510              Commit and publish xerox-workcentre-6515-6510 to AUR"
	@echo "  publish-brother-mfc-l3780cdw                    Commit and publish brother-mfc-l3780cdw to AUR"
	@echo "  publish-beekeeper-studio-bin                    Commit and publish beekeeper-studio-bin to AUR"

.PHONY: init
init:
	@aurpublish setup

.PHONY: update
update:
	@for pkg in pcloud-drive; do \
		echo ""; \
		echo "Pulling $$pkg changes from AUR..."; \
		aurpublish -p $$pkg; \
	done

.PHONY: outdated
outdated:
	@./.scripts/nvchecker/check_outdated.sh

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

.PHONY: test-google-cloud-cli-gke-gcloud-auth-plugin
test-google-cloud-cli-gke-gcloud-auth-plugin: PACKAGE=google-cloud-cli-gke-gcloud-auth-plugin
test-google-cloud-cli-gke-gcloud-auth-plugin: .test

.PHONY: test-kiibohd-configurator-bin
test-kiibohd-configurator-bin: PACKAGE=kiibohd-configurator-bin
test-kiibohd-configurator-bin: .test

.PHONY: test-pcloud-drive
test-pcloud-drive: PACKAGE=pcloud-drive
test-pcloud-drive: .test

.PHONY: test-ttf-adobe-source-fonts
test-ttf-adobe-source-fonts: PACKAGE=ttf-adobe-source-fonts
test-ttf-adobe-source-fonts: .test

.PHONY: test-wireguard-vanity-keygen
test-wireguard-vanity-keygen: PACKAGE=wireguard-vanity-keygen
test-wireguard-vanity-keygen: .test

.PHONY: test-wireguard-vanity-keygen-bin
test-wireguard-vanity-keygen-bin: PACKAGE=wireguard-vanity-keygen-bin
test-wireguard-vanity-keygen-bin: .test

.PHONY: test-xerox-workcentre-6515-6510
test-xerox-workcentre-6515-6510: PACKAGE=xerox-workcentre-6515-6510
test-xerox-workcentre-6515-6510: .test

.PHONY: test-brother-mfc-l3780cdw
test-brother-mfc-l3780cdw: PACKAGE=brother-mfc-l3780cdw
test-brother-mfc-l3780cdw: .test

.PHONY: test-beekeeper-studio-bin
test-beekeeper-studio-bin: PACKAGE=beekeeper-studio-bin
test-beekeeper-studio-bin: .test

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

.PHONY: publish-google-cloud-cli-gke-gcloud-auth-plugin
publish-google-cloud-cli-gke-gcloud-auth-plugin: PACKAGE=google-cloud-cli-gke-gcloud-auth-plugin
publish-google-cloud-cli-gke-gcloud-auth-plugin: .publish

.PHONY: publish-kiibohd-configurator-bin
publish-kiibohd-configurator-bin: PACKAGE=kiibohd-configurator-bin
publish-kiibohd-configurator-bin: .publish

.PHONY: publish-pcloud-drive
publish-pcloud-drive: PACKAGE=pcloud-drive
publish-pcloud-drive: .publish

.PHONY: publish-ttf-adobe-source-fonts
publish-ttf-adobe-source-fonts: PACKAGE=ttf-adobe-source-fonts
publish-ttf-adobe-source-fonts: .publish

.PHONY: publish-wireguard-vanity-keygen
publish-wireguard-vanity-keygen: PACKAGE=wireguard-vanity-keygen
publish-wireguard-vanity-keygen: .publish

.PHONY: publish-wireguard-vanity-keygen-bin
publish-wireguard-vanity-keygen-bin: PACKAGE=wireguard-vanity-keygen-bin
publish-wireguard-vanity-keygen-bin: .publish

.PHONY: publish-xerox-workcentre-6515-6510
publish-xerox-workcentre-6515-6510: PACKAGE=xerox-workcentre-6515-6510
publish-xerox-workcentre-6515-6510: .publish

.PHONY: publish-brother-mfc-l3780cdw
publish-brother-mfc-l3780cdw: PACKAGE=brother-mfc-l3780cdw
publish-brother-mfc-l3780cdw: .publish

.PHONY: publish-beekeeper-studio-bin
publish-beekeeper-studio-bin: PACKAGE=beekeeper-studio-bin
publish-beekeeper-studio-bin: .publish

.PHONY: .publish
.publish:
	@echo ""
	@echo "Publishing ${PACKAGE} to AUR..."
	@aurpublish ${PACKAGE} --speedup
