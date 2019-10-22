#!/bin/sh

if [[ "$VERSION" = "" ]]; then
    BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
    TAG_BRANCH=${BRANCH_NAME//\//-}
    TAG_DATE=$(date '+%Y%m%d-%H%M%S')
    VERSION="${TAG_BRANCH}-${TAG_DATE}"
fi

go build -ldflags "-X github.com/zephiransas/go-simple-server/version.version=$VERSION" -o server
ret=$?
[[ $ret -eq 0 ]] && echo $VERSION