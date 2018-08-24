#!/bin/bash

cd /opt/angular-codedeploy/

rm -rf node_modules dist/*
eval `ssh-agent -s`
npm install
npm run build
