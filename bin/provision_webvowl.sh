#!/bin/sh
# Shell script to provision OWL2VOWL
# The tool is placed in the $GITHUB_WORKSPACE/bin path
# For more info on paths see:
# https://github.community/t/adding-a-binary-to-the-path-from-a-docker-github-action-for-use-by-later-workflow-steps/16922
# https://docs.github.com/en/free-pro-team@latest/actions/reference/specifications-for-github-hosted-runners#docker-container-filesystem

OWL2VOWL_VERSION=0.3.7

echo 'Provisioning OWL2VOWL...'
mkdir -p $GITHUB_WORKSPACE/src
curl -LJ0 https://github.com/VisualDataWeb/OWL2VOWL/archive/${OWL2VOWL_VERSION}.tar.gz --output $GITHUB_WORKSPACE/src/${OWL2VOWL_VERSION}.tar.gz
cd ${GITHUB_WORKSPACE}/src
tar -zxvf ${OWL2VOWL_VERSION}.tar.gz
cd $GITHUB_WORKSPACE/src/OWL2VOWL-${OWL2VOWL_VERSION}
mvn package -Dskiptests -P standalone-release
ls -l ./target
cp ./target/OWL2VOWL-${OWL2VOWL_VERSION}-shaded.jar $GITHUB_WORKSPACE/bin/owl2vowl.jar