#!/bin/sh

## Temporary directory

temp="$(mktemp -d)"
cleanup() { rm -rf "$temp"; }
# trap cleanup EXIT


## Pull DDLC from multimokia's Docker image

docker pull multimokia/ddlc-mod-base:latest
docker run -d --rm --name ddlc-mod-base multimokia/ddlc-mod-base:latest /bin/sh -c "sleep 99999999"

docker export -o "$temp/ddlc-mod-base.tar" ddlc-mod-base
docker container kill ddlc-mod-base

tar -xvf "$temp/ddlc-mod-base.tar" -C "$temp" ddlcbase
mv "$temp/ddlcbase" "$temp/mas"
mkdir "$temp/renpy"
tar -xvf "$temp/ddlc-mod-base.tar" -C "$temp" renpy


## Pull MAS stable

mas_release="$(curl -sL "https://api.github.com/repos/monika-after-story/monikamoddev/releases/latest" | \
        perl -lne 'print $1 if /"tag_name": "([^"]+)"/')"
curl -L "$(curl -sL "https://api.github.com/repos/monika-after-story/monikamoddev/releases/tags/$mas_release" | \
    perl -lne 'print $1 if /"browser_download_url": "(.+?-Mod\.zip)"/')" > "$temp/mas.zip"
unzip -o -d "$temp/mas/game" "$temp/mas.zip"

## Pull MAS unstable

git clone -b unstable --depth=1 https://github.com/monika-after-story/monikamoddev.git "$temp/monikamoddev"


## Install MAS on DDLC

touch "$temp/mas/trb"

(
    cd "$temp/renpy" || exit 1
    cp -rf "$temp/monikamoddev/Monika After Story/"* "$temp/mas"

    export SDL_AUDIODRIVER=dummy
    ./renpy.sh launcher distribute ../mas --package Mod

    unzip -o "$temp/Monika_After_Story-"*"/Monika_After_Story-"*"-Mod.zip" -d /game
)