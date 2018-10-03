#!/bin/bash

. /opt/angular-codedeploy/deployment/scripts/setenv.sh

cd /opt/angular-codedeploy/
mv .netrc $HOME/.netrc

rm -rf node_modules dist/*
npm install
npm run $RUNSCRIPT
