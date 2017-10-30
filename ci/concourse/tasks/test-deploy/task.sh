#!/bin/bash

export ROOT_FOLDER=$(pwd)
export REPO_RESOURCE=repo
export VERSION_RESOURCE=version
export OUTPUT_RESOURCE=out

echo "Root folder is [${ROOT_FOLDER}]"
echo "Repo resource folder is [${REPO_RESOURCE}]"
echo "Version resource folder is [${VERSION_RESOURCE}]"

export ENVIRONMENT="TEST"

source ${ROOT_FOLDER}/${REPO_RESOURCE}/ci/common/cf-utils.sh

testDeploy