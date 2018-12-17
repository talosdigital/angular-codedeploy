#!/bin/bash

. /opt/angular-codedeploy/deployment/scripts/setenv.sh

if [ "$TARGET" != ""] then
    sudo rm -rf /var/www/$PROJECT
    sudo mkdir -p /var/www/$PROJECT
    sudo cp -r $BUILDDIRECTORY/* /var/www/$PROJECT
    sudo chown -R apache:apache /var/www/$PROJECT
else 
    sudo rm -rf html/*
    sudo cp -r $BUILDDIRECTORY/* /var/www/html
    sudo chown -R apache:apache /var/www/html
fi