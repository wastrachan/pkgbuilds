#!/bin/sh

echo "$(curl -s https://api.github.com/repos/sobolevn/git-secret/releases/latest | grep tarball_url | cut -d '"' -f 4)"
