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
pkgver=5.0.9
pkgrel=1
pkgdesc="Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more"
url="https://github.com/beekeeper-studio/beekeeper-studio"
license=('MIT')
arch=('x86_64' 'aarch64')

optdepends=(
  'dbus-glib: used by libgconf'
  'gtk2: used by libappindicator'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="Beekeeper-Studio-$pkgver"
_pkgext="AppImage"

source=("$_pkgsrc-license.txt"::"$url/raw/v$pkgver/LICENSE.md")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgsrc.$_pkgext")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgsrc-arm64.$_pkgext")

sha256sums=('22b5a35031423ff3998ed524ff7464e071d25ad99fab5ce2ebb67158e62f7b17')
sha256sums_x86_64=('0c0c58d9be96025f659600ebe52365be9f199f042e54a56b0b84fefb51728991')
sha256sums_aarch64=('2b2ee7a30722ecf369f4801b9a7af55bcfac37c03d7f605a901454407c75e076')

prepare() {
  if [[ "$CARCH" == "aarch64" ]]; then
    ln -sf "$_pkgsrc-arm64.$_pkgext" "$_pkgsrc.$_pkgext"
  fi

  chmod ugo+x "$_pkgsrc.$_pkgext"
  "./$_pkgsrc.$_pkgext" --appimage-extract

  sed -E -e "s&^Exec=.*\$&Exec=$_pkgname %F&" -i "squashfs-root/$_pkgname.desktop"
}

package() {
  depends+=(
    'alsa-lib'
    'gtk3'
    'libdbusmenu-glib'
    'nspr'
    'nss'
  )

  # main files
  install -dm755 "$pkgdir/$_install_path/$_pkgname"
  mv squashfs-root/* "$pkgdir/$_install_path/$_pkgname/"

  # share
  install -dm755 "$pkgdir/usr/share"
  cp -a --reflink=auto "$pkgdir/$_install_path/$_pkgname/usr/share/icons" "$pkgdir/usr/share/"
  cp -a --reflink=auto "$pkgdir/$_install_path/$_pkgname/usr/share/mime" "$pkgdir/usr/share/"

  install -Dm755 "$pkgdir/$_install_path/$_pkgname/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"

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
