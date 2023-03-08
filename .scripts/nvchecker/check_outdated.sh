#!/usr/bin/env bash

docker run -v "$(pwd)/.scripts/nvchecker/config:/config" \
           --name nvchecker \
           --rm \
           -e PUID=1000 \
           -e PGID=1000 \
           wastrachan/nvchecker:latest
