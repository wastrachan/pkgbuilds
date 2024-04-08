# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen-bin
_shortname=wireguard-vanity-keygen
pkgver=0.0.8
pkgrel=1
pkgdesc='WireGuard vanity key generator'
arch=('x86_64' 'aarch64' 'i686' 'arm')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('MIT')
depends=('glibc')
provides=('wireguard-vanity-keygen')
conflicts=('wireguard-vanity-keygen')
source_x86_64=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-arm64.tar.gz")
source_i686=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-386.tar.gz")
source_arm=("https://github.com/axllent/wireguard-vanity-keygen/releases/download/${pkgver}/${_shortname}-linux-arm.tar.gz")
sha256sums_x86_64=('571d2d0142a0a52079c3637961f0d24465e019f5927a1e284ea9d2a2905fdf50')
sha256sums_aarch64=('e0a5c1806740d0a179556ab66dff9454e00b4b1d40ff2adb5118c82bf6a9bc41')
sha256sums_i686=('85a9455410d71f9a84886b3c90e7bb59de0782adbdf57ef6f5409bc7c65b1285')
sha256sums_arm=('f0638ee14518a15ae650644f2d44970b2b0b00cc1b0585e9c35ca466390e8a9e')

package() {
    # Upstream uses different format for architechture notation
    case $CARCH in
        'x86_64')   subarch='amd64' ;;
        'aarch64')  subarch='arm64' ;;
        'i686')     subarch='386'   ;;
        *)          subarch=$CARCH  ;;
    esac

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
}
