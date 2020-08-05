#!/bin/sh

changelog="$(curl -s https://onepassword.s3.amazonaws.com/linux/CHANGELOG)"
echo ""
echo "$changelog"
echo "$changelog" > 1password/CHANGELOG
