# Maintainer:
# Contributor: Benjamin Hedrich <code [at] pagenotfound [dot] de>
# Contributor: Sitansh Rajput <me [at] lostpolaris [dot] com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Michael Lutonsky <m@luto.at>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

: ${_install_path:=usr/lib}

_pkgname="beekeeper-studio"
pkgname="$_pkgname-bin"
pkgver=5.3.6
pkgrel=1
pkgdesc="Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more"
url="https://github.com/beekeeper-studio/beekeeper-studio"
license=(
  'GPL-3.0-or-later'
  'LicenseRef-BeekeeperCommercialEULA'
)
arch=('x86_64' 'aarch64')

makedepends=(
  'html-xml-utils'
  'w3m'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="Beekeeper-Studio-$pkgver"
_pkgext="rpm"

source_x86_64=("$url/releases/download/v$pkgver/$_pkgsrc.x86_64.$_pkgext")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgsrc.aarch64.$_pkgext")

sha256sums_x86_64=('3aea535e5e19fd4f8f4f902d0ed839ec38f9019de0c9b4e446e497decde182af')
sha256sums_aarch64=('d737a6a1f272603100f9192ac562ff473b4e08d6e7340ae0f0a3e07351444667')

_eula="commercial-eula"
_eula_url="https://www.beekeeperstudio.io/legal/commercial-eula/"

prepare() {
  # commercial eula
  curl -L --max-redirs 3 --no-progress-meter \
    -o "$_eula-1.html" \
    "$_eula_url"

  hxnormalize -x "$_eula-1.html" \
    | hxremove header,footer,script \
      1> "$_eula-2.html" \
      2> /dev/null

  sed -e '/back to legal/,+1d' -i "$_eula-2.html"

  w3m -O UTF-8 -cols 80 -dump "$_eula-2.html" > "$_eula.txt"

  # fix launcher
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
  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  mv "opt/Beekeeper Studio"/* "$pkgdir/$_install_path/$_pkgname/"

  # share
  mkdir -pm755 "$pkgdir/usr/share"
  cp -a usr/share/* "$pkgdir/usr/share/"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
exec "/$_install_path/$_pkgname/$_pkgname" "\$@"
END

  # commercial eula
  install -Dm644 "$_eula.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
