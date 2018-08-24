#!/bin/bash

. /opt/angular-codedeploy/deployment/scripts/setenv.sh

sudo rm -rf /var/www/$PROJECT
sudo mkdir -p /var/www/$PROJECT
sudo cp -r dist/* /var/www/$PROJECT
sudo chown -R apache:apache /var/www/$PROJECT
