#!/bin/bash

. /opt/angular-codedeploy/deployment/scripts/setenv.sh

cd /opt/angular-codedeploy/

rm -rf node_modules dist/*
eval `ssh-agent -s`
ssh-add /home/centos/.ssh/id_rsa
npm install
npm run $RUNSCRIPT
