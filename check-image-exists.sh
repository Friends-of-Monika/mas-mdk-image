#!/bin/sh

token="$(curl -sL https://ghcr.io/token?scope="repository:friends-of-monika/mas-mdk:pull" | perl -pe 's/{"token":"([^"]+)"}/\1/p')"
tags="$(curl -sL -H "Authorization: Bearer $token" https://ghcr.io/v2/friends-of-monika/mas-mdk/tags/list)"

case "$tags" in
    *"$MAS_RELEASE"*) echo "::set-output name=exists::true";;
    *) echo "::set-output name=exists::false";;
esac