# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributer: bwrsandman

pkgname=gestures
pkgver=0.3.1
pkgrel=2
pkgdesc='Modern, minimal GUI app for libinput-gestures'
arch=('any')
url='https://gitlab.com/nokun/gestures'
license=('GPL3')
depends=('dconf' 'hicolor-icon-theme' 'libinput-gestures' 'python' 'python-gobject')
makedepends=('meson' 'ninja' 'gettext')
optdepends=('xdotool: Simulate keyboard input or mouse activity')
source=("https://gitlab.com/nokun/gestures/-/archive/${pkgver}/gestures-${pkgver}.tar.gz")
sha256sums=('7483843e08508f6e31ebc36a2dfb3cf540a485b502736e23e40a70bfc4110890')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    arch-meson . build
    meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" meson install -C build --no-rebuild
}
