#!/bin/bash

. /opt/angular-codedeploy/deployment/scripts/setenv.sh

cd $CODEDEPLOY
mv .netrc $HOME/.netrc

rm -rf node_modules $BUILDDIRECTORY/*
npm install
npm run $RUNSCRIPT
