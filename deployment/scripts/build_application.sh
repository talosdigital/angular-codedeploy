#!/bin/bash

source /opt/npm-codedeploy/deployment/scripts/setenv.sh

cd $CODEDEPLOY_DIR
mv .netrc $HOME/.netrc

rm -rf node_modules ${BUILD_DIR:-build}/*
echo "Running $CMD_INSTALL"
eval ${CMD_INSTALL:-npm install}
echo "Running $CMD_BUILD"
eval ${CMD_BUILD:-npm run build}
