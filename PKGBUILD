# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen-bin
_shortname=wireguard-vanity-keygen
pkgver=0.0.9
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
sha256sums_x86_64=('11175b1af6bee0f0d3d466029738f6d16a52b0c5c0d032b5dda2d6f7ce199bba')
sha256sums_aarch64=('9eb9c2fcaff1da6b7020b98f7997e5e5c7a3d147574f117b1a9dbe211c182401')
sha256sums_i686=('86ab7fca789ce0f0ab1e6d5e3f5c8b1f7e5af07b45784fbfef6b69242498cb99')
sha256sums_arm=('0944463a733d6294b13071fe0d50efb4d8a6148fd06b1a38a41b7ca634c078cb')

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
