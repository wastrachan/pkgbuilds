#! /bin/sh

sudo chown -R $(id -u):$(id -g) /pkg
exec "$@"
