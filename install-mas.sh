#!/bin/sh

set -x

temp="$(mktemp -d)"
curl -L "$(curl -sL "https://api.github.com/repos/monika-after-story/monikamoddev/releases/tags/$MAS_RELEASE" | \
    perl -lne 'print $1 if /"browser_download_url": "(.+?-Mod\.zip)"/')" > "$temp/mas.zip"
unzip -o "$temp/mas.zip" -d "/mdk/mas/game"