#!/bin/bash

set -e -u

VERSION="$(date +%Y%m%d_%H%M%S).$(git log -n 1 --pretty=format:'%h')"

git clone version updated-version
pushd updated-version
    git config --local user.email "${GIT_EMAIL}"
    git config --local user.name "${GIT_NAME}"

    echo "Bump to ${VERSION}"
    echo "${VERSION}" > version

    git add version
    git commit -m "[Concourse CI] Bump to Next Version ($VERSION)"
popd