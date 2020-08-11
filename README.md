PKGBUILD Files
==============

Repository of packages maintained by `rew1red` on the AUR, intended for use with the [`aurpublish`](https://github.com/eli-schwartz/aurpublish) helper.


## Packages

* [1password](https://aur.archlinux.org/packages/1password/) : The world's most-loved password manager - read-only development preview
* [deej-git](https://aur.archlinux.org/packages/deej-git/) : Open-source hardware volume mixer
* [git-secret](https://aur.archlinux.org/packages/git-secret/) : A bash-tool to store your private data inside a git repository
* [pcloud-drive](https://aur.archlinux.org/packages/pcloud-drive/) : pCloud drive. Electron edition
* [tableplus](https://aur.archlinux.org/packages/tableplus/) : Modern, native, and friendly GUI tool for relational databases (Alpha)
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
