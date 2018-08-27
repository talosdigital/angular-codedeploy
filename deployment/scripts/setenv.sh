#!/bin/bash

export CODEDEPLOY=/opt/angular-codedeploy

# Target
cd $CODEDEPLOY
export PROJECT=$(ls -1 target-* | sed -e 's/target-//g')
export RUNSCRIPT=$(ls -1 script-* | sed -e 's/script-//g')
