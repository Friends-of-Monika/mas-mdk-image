#!/bin/sh

temp="$(mktemp -d)"
curl -L "$(curl -sL "https://api.github.com/repos/monika-after-story/monikamoddev/releases/tags/$MAS_RELEASE" | \
    perl -lne 'print $1 if /"browser_download_url": "(.+?-Mod\.zip)"/')" > "$temp/mas.zip"
mkdir /game
unzip -o "$temp/mas.zip" -d /game