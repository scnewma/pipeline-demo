#!/bin/bash

set -e

export ROOT_FOLDER=$(pwd)
export REPO_RESOURCE=repo
export VERSION_RESOURCE=version
export OUTPUT_RESOURCE=out

echo "Retrieving version"
export PIPELINE_VERSION=$(cat ${VERSION_RESOURCE}/version)
echo "Retrieved version is [${PIPELINE_VERSION}]"

pushd ${ROOT_FOLDER}/${REPO_RESOURCE}
    ./mvnw org.codehaus.mojo:versions-maven-plugin:2.3:set -DnewVersion="${PIPELINE_VERSION}" || (echo "Build failed!!!" && return 1)
    ./mvnw clean verify

    echo "Tagging the project with dev tag"
    echo "dev/${PIPELINE_VERSION}" > ${ROOT_FOLDER}/${REPO_RESOURCE}/tag
    cp -r ${ROOT_FOLDER}/${REPO_RESOURCE}/. ${ROOT_FOLDER}/${OUTPUT_RESOURCE}/
popd