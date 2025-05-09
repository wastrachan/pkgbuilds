# Maintainer:
# Contributor: Benjamin Hedrich <code [at] pagenotfound [dot] de>
# Contributor: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

## links
# https://www.beekeeperstudio.io
# https://github.com/beekeeper-studio/beekeeper-studio

: ${_install_path:=usr/lib}

_pkgname="beekeeper-studio"
pkgname="$_pkgname-bin"
pkgver=5.2.4
pkgrel=1
pkgdesc="Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more"
url="https://github.com/beekeeper-studio/beekeeper-studio"
license=('MIT')
arch=('x86_64' 'aarch64')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="Beekeeper-Studio-$pkgver"
_pkgext="rpm"

source=("$_pkgsrc-license.txt"::"$url/raw/v$pkgver/LICENSE.md")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgsrc.x86_64.$_pkgext")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgsrc.aarch64.$_pkgext")

sha256sums=('22b5a35031423ff3998ed524ff7464e071d25ad99fab5ce2ebb67158e62f7b17')
sha256sums_x86_64=('4db0e3f4ec95b2072fedb1e4fdb252739590e7bbbf8792fd03a72ca471d522d0')
sha256sums_aarch64=('d4ed62bf93f932a47b769044a7ee944f20837e6ef5599aba229d12c065ae926d')

prepare() {
  rm -rf usr/lib/.build-id
  sed -E -e 's&^Exec=.*$&Exec='"${_pkgname} %U&" \
    -e 's&^Comment=.*$&Comment='"${pkgdesc}&" \
    -i usr/share/applications/beekeeper-studio.desktop
}

package() {
  depends+=(
    'alsa-lib'
    'gtk3'
    'nspr'
    'nss'
  )

  # main files
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  mv "opt/Beekeeper Studio"/* "$pkgdir/$_install_path/$_pkgname/"

  # share
  install -dm755 "$pkgdir/usr/share"
  cp -a usr/share/* "$pkgdir/usr/share/"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec "/$_install_path/$_pkgname/$_pkgname" "\$@"
END

  # licenses
  install -Dm644 "$_pkgsrc-license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 \
    "$pkgdir/$_install_path/$_pkgname/LICENSE.electron.txt" \
    "$pkgdir/$_install_path/$_pkgname/LICENSES.chromium.html" \
    -t "${pkgdir}/usr/share/licenses/$pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
