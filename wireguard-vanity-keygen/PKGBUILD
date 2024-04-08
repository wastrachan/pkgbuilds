# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen
pkgver=0.0.8
pkgrel=1
pkgdesc='WireGuard vanity key generator'
arch=('any')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.11')
source=("${pkgname}-${pkgver}::https://github.com/axllent/wireguard-vanity-keygen/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('828e1cc9d023edbc0612c7e103d3833bf8f6efb46f06add388771d304b399529')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # this build process now mirrors the ci build process used by wireguard-vanity-keygen
    # after the project's makefile was deleted from wireguard-vanity-keygen in 0.0.7
    # https://github.com/axllent/wireguard-vanity-keygen/blob/0.0.7/.github/workflows/release-build.yml#L25-L37
    go build -ldflags "-w -X main.appVersion=${pkgver}" -o ${pkgname}
}

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
