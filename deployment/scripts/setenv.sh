#!/bin/bash

export CODEDEPLOY=/opt/npm-codedeploy

# Target
cd $CODEDEPLOY
export PROJECT=$(ls -1 target-* | sed -e 's/target-//g')
export PROJECT_WITHOUT_WWW=$(echo $PROJECT | sed 's/www\.//g')
export RUNSCRIPT=$(ls -1 script-* | sed -e 's/script-//g')
export BUILDDIRECTORY=$(ls -1 builddir-* | sed -e 's/builddir-//g')
