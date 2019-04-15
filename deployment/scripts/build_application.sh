#!/bin/bash

. /opt/npm-codedeploy/deployment/scripts/setenv.sh

cd $CODEDEPLOY
mv .netrc $HOME/.netrc

rm -rf node_modules ${BUILDDIRECTORY:-dist}/*
npm install
npm run ${RUNSCRIPT:-build}
