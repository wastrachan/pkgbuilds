# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen
pkgver=0.1.1
pkgrel=2
pkgdesc='WireGuard vanity key generator'
arch=('any')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.11')
_source_url="https://github.com/axllent/wireguard-vanity-keygen"
source=("${pkgname}-${pkgver}::${_source_url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('efd915c549e6cc312ef472dbf854aaf7b6b0129157948c0c9a4fc8e6739c6094')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # this build process now mirrors the ci build process used by wireguard-vanity-keygen
    # after the project's makefile was deleted from wireguard-vanity-keygen in 0.0.7
    # https://github.com/axllent/wireguard-vanity-keygen/blob/0.0.7/.github/workflows/release-build.yml#L25-L37
    go build -ldflags "-w -X main.appVersion=${pkgver}" -o "${pkgname}"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install license file
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install executable
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
