# Maintainer:
# Contributor: Benjamin Hedrich <code [at] pagenotfound [dot] de>
# Contributor: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

## links
# https://www.beekeeperstudio.io
# https://github.com/beekeeper-studio/beekeeper-studio

_pkgname="beekeeper-studio"
pkgname="$_pkgname-bin"
pkgver=4.6.2
pkgrel=2
pkgdesc="Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more"
url="https://github.com/beekeeper-studio/beekeeper-studio"
license=('MIT')
arch=('x86_64' 'aarch64')

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="Beekeeper-Studio-$pkgver"
_pkgext="AppImage"
source=("$_pkgsrc-license.txt"::"$url/raw/v$pkgver/LICENSE.md")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgsrc.$_pkgext")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgsrc-arm64.$_pkgext")
sha256sums=('1409fbbc5265c85da91684660c87f85d74c3fdc63a2d355169f40dac5cc7a078')
sha256sums_x86_64=('f2c18536802c5fe5f72090d7a7095846defc9e891ab8f633f3cc83118cba34ff')
sha256sums_aarch64=('52bacb443458f68b4e3f5846b0d04f0bffaf364415f659ddfb466e07c0eaa692')

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
    'dbus-glib'
    'gtk2'
    'gtk3'
    'libdbusmenu-glib'
    'nspr'
    'nss'
  )

  local _install_path="$pkgdir/opt/$_pkgname"

  # main files
  install -dm755 "$_install_path"
  mv squashfs-root/* "$_install_path/"

  # share
  install -dm755 "$pkgdir/usr/share"
  cp -a --reflink=auto "$_install_path/usr/share/icons" "$pkgdir/usr/share/"
  cp -a --reflink=auto "$_install_path/usr/share/mime" "$pkgdir/usr/share/"

  install -Dm755 "$_install_path/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec "/opt/$_pkgname/$_pkgname" "\$@"
END

  # licenses
  install -Dm644 "$_pkgsrc-license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 \
    "$pkgdir/opt/$_pkgname/LICENSE.electron.txt" \
    "$pkgdir/opt/$_pkgname/LICENSES.chromium.html" \
    -t "${pkgdir}/usr/share/licenses/$pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
