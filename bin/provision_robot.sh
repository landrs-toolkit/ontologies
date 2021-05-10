#!/bin/sh
# Shell script to provision OBOFoundry Robot tool into Github Actions Container
# The tool is placed in the $GITHUB_WORKSPACE/bin path
# For more info on paths see:
# https://github.community/t/adding-a-binary-to-the-path-from-a-docker-github-action-for-use-by-later-workflow-steps/16922
# https://docs.github.com/en/free-pro-team@latest/actions/reference/specifications-for-github-hosted-runners#docker-container-filesystem

robot_version=v1.7.2

echo 'Provisioning Robot...'
mkdir -p $GITHUB_WORKSPACE/bin
curl -LJ0 https://github.com/ontodev/robot/releases/download/${robot_version}/robot.jar --output $GITHUB_WORKSPACE/bin/robot.jar
curl https://raw.githubusercontent.com/ontodev/robot/master/bin/robot  > $GITHUB_WORKSPACE/bin/robot
chmod +x $GITHUB_WORKSPACE/bin/robot