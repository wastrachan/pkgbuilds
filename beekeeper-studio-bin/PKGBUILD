# Maintainer: Winston Astrachan <rew1red [at] rew1 [dot] red>
# Contributor: xiota
# Contributor: Benjamin Hedrich <code [at] pagenotfound [dot] de>
# Contributor: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

_pkgname="beekeeper-studio"
pkgname="$_pkgname-bin"
pkgver=5.4.1
pkgrel=1
pkgdesc="Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more"
arch=('x86_64' 'aarch64')
url="https://github.com/beekeeper-studio/beekeeper-studio"
license=(
  'GPL-3.0-or-later'
  'LicenseRef-BeekeeperStudioCommercialEULA'
)
depends=(
    'alsa-lib'
    'gtk3'
    'nspr'
    'nss'
)
provides=("$_pkgname")
source=("LICENSE-COMMERCIAL")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}.pacman")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::$url/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64.pacman")
noextract=(
    "${_pkgname}-${pkgver}-x86_64.tar.xz"
    "${_pkgname}-${pkgver}-aarch64.tar.xz"
)
sha256sums=('9e83b98f1773a830db2b30043051d4e179fea73cdb0168feb7b2965ee6075ebf')
sha256sums_x86_64=('56b34651df007582632c6d356e9c7caf9995d43ec92109e87a5f04fd1be1b902')
sha256sums_aarch64=('948db976f44657c1d0143331ba0f9f34e9c5c576c9c7b6390705529d1eb3c8a1')

package() {
    # Install commercial license
    install -Dm644 LICENSE-COMMERCIAL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-COMMERCIAL"

    # Extract prebuilt package into pkgdir
    cd "$srcdir"
    bsdtar -xf "${_pkgname}-${pkgver}-${CARCH}.tar.xz" -C "$pkgdir"

    # Remove prebuilt package metadata files (if they exist)
    cd "$pkgdir"
    rm -f .PKGINFO .MTREE .INSTALL
}
