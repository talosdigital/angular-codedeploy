#!/bin/bash

source /opt/npm-codedeploy/deployment/scripts/setenv.sh

cd $CODEDEPLOY_DIR
mv .netrc $HOME/.netrc

rm -rf node_modules ${BUILD_DIR:-build}/*
eval ${CMD_INSTALL:-npm install}
eval ${CMD_BUILD:-npm run build}
