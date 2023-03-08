PKGBUILD Files
==============

Repository of packages maintained by `rew1red` on the AUR, intended for use with the [`aurpublish`](https://github.com/eli-schwartz/aurpublish) helper.


## Packages

* [deej](https://aur.archlinux.org/packages/deej/) : Open-source hardware volume mixer
* [gestures](https://aur.archlinux.org/packages/gestures/) : Modern, minimal GUI app for libinput-gestures
* [git-secret](https://aur.archlinux.org/packages/git-secret/) : A bash-tool to store your private data inside a git repository
* [google-cloud-cli-gke-gcloud-auth-plugin](https://aur.archlinux.org/packages/google-cloud-cli-gke-gcloud-auth-plugin): A google-cloud-cli component that provides a kubectl authentication plugin for GKE.
* [kiibohd-configurator-bin](https://aur.archlinux.org/packages/kiibohd-configurator-bin/) : Configuration utility for Input Club keyboards
* [pcloud-drive](https://aur.archlinux.org/packages/pcloud-drive/) : pCloud drive. Electron edition
* [ttf-adobe-source-fonts](https://aur.archlinux.org/packages/ttf-adobe-source-fonts) : TTF versions of Adobe's Source fonts
* [wireguard-vanity-keygen](https://aur.archlinux.org/packages/wireguard-vanity-keygen/) : WireGuard vanity key generator
* [wireguard-vanity-keygen-bin](https://aur.archlinux.org/packages/wireguard-vanity-keygen-bin/) : WireGuard vanity key generator
* [xerox-workcentre-6515-6510](https://aur.archlinux.org/packages/xerox-workcentre-6515-6510/) : Xerox WorkCentre 6515 / Phaser 6510 printer driver for CUPS


## Usage

#### Updating PKGBUILD Files
The following is a normal workflow for updating a package in this repository:

1. Pull changes from aur (for co-maintained projects) with `make update`
2. Modify pkgbuild as neccesary
3. [Test new pkgbuild file](#test-pkgbuild-files)
4. Commit changes
5. Publish to aur with `make publish-<pkgname>`
6. Push changes to `origin`

#### Test PKGBUILD Files
The following is a normal workflow for testing a change to a pkgbuild:

1. `cd <pkgname>`
2. `namcap PKGBUILD`
3. `makepkg -Ccsfr`
4. `namcap <pkgname>-<pkgver>-<arch>.pkg.tar.xz`
5. Delete built package and any downloaded sources
6. Test in a clean arch build: `make test-<pkgname>`
