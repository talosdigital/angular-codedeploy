#!/bin/bash

cd /opt/angular-codedeploy/

rm -rf node_modules dist/*
npm install
npm run build
