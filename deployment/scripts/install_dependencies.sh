#!/bin/bash

source /opt/npm-codedeploy/deployment/scripts/setenv.sh

curl -sL "https://rpm.nodesource.com/setup_${NODE_VERSION:-8.x}" | sudo bash -
yum -y install nodejs
