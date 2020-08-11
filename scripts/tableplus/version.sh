#!/bin/sh

srcinfo="$(curl -s https://deb.tableplus.com/debian/dists/tableplus/main/binary-amd64/Packages)"
echo "$srcinfo" | grep "Package:"
echo "$srcinfo" | grep "Version:"
echo "$srcinfo" | grep "Depends:"
echo "$srcinfo" | grep "SHA256:"
echo "$srcinfo" | grep "Filename:"
