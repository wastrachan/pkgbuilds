#!/bin/sh
#
# Check for outdated packages by comparing parsed release info with
# the current .SRCINFO information.


echo ""
echo "-------------------------------------------------------------------- deej"
echo ""
current="$(curl -s https://api.github.com/repos/omriharel/deej/releases/latest | grep tag_name | cut -d '"' -f 4 |  cut -d 'v' -f 2)"
pkgbuild="$(grep pkgver 'deej/.SRCINFO' | cut -d '=' -f 2 | tr -d ' ')"
if [[ $current != $pkgbuild ]]; then
    echo "!!! DEEJ IS OUTDATED !!!"
    echo "Current version: ${current}"
    echo "PKGBUILD version: ${pkgbuild}"
else
    echo "deej is current at version ${current}"
fi


echo ""
echo "-------------------------------------------------------------- git-secret"
echo ""
current="$(curl -s https://api.github.com/repos/sobolevn/git-secret/releases/latest | grep tag_name | cut -d '"' -f 4 |  cut -d 'v' -f 2)"
pkgbuild="$(grep pkgver 'git-secret/.SRCINFO' | cut -d '=' -f 2 | tr -d ' ')"
if [[ $current != $pkgbuild ]]; then
    echo "!!! GIT-SECRET IS OUTDATED !!!"
    echo "Current version: ${current}"
    echo "PKGBUILD version: ${pkgbuild}"
else
    echo "git-secret is current at version ${current}"
fi


echo ""
echo "--------------------------------------------------------------- tableplus"
echo ""
current="$(curl -s https://deb.tableplus.com/debian/dists/tableplus/main/binary-amd64/Packages | grep 'Version:' |  cut -d ':' -f 2 | tr -d ' ')"
pkgbuild="$(grep pkgver 'tableplus/.SRCINFO' | cut -d '=' -f 2 | tr -d ' ')"
if [[ $current != $pkgbuild ]]; then
    echo "!!! TABLEPLUS IS OUTDATED !!!"
    echo "Current version: ${current}"
    echo "PKGBUILD version: ${pkgbuild}"
else
    echo "tableplus is current at version ${current}"
fi


echo ""
echo "------------------------------------------------------------ pcloud-drive"
echo ""
current="$(curl -s https://api.pcloud.com/getlastversion?os=ELECTRON | grep 'version' | cut -d '"' -f 4)"
pkgbuild="$(grep pkgver 'pcloud-drive/.SRCINFO' | cut -d '=' -f 2 | tr -d ' ')"
if [[ $current != $pkgbuild ]]; then
    echo "!!! PCLOUD-DRIVE IS OUTDATED !!!"
    echo "Current version: ${current}"
    echo "PKGBUILD version: ${pkgbuild}"
else
    echo "pcloud-drive is current at version ${current}"
fi


echo ""
echo "--------------------------------------------------------------- 1password"
echo ""
current="$(curl -s https://onepassword.s3.amazonaws.com/linux/debian/dists/edge/main/binary-amd64/Packages | grep "Version:" | head -n 1 | cut -d ':' -f 2 | tr -d ' ' | sed -e 's/-/./')"
pkgbuild="$(grep pkgver '1password/.SRCINFO' | cut -d '=' -f 2 | tr -d ' ')"
if [[ $current != $pkgbuild ]]; then
    echo "!!! 1PASSWORD IS OUTDATED !!!"
    echo "Current version: ${current}"
    echo "PKGBUILD version: ${pkgbuild}"
else
    echo "1password is current at version ${current}"
fi
