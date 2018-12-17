#!/bin/bash

. /opt/angular-codedeploy/deployment/scripts/setenv.sh

if [ "$TARGET" != "" ] 
then
    rm -rf /var/www/$PROJECT
    mkdir -p /var/www/$PROJECT
    cp -r $BUILDDIRECTORY/* /var/www/$PROJECT
    chown -R apache:apache /var/www/$PROJECT
else 
    rm -rf html/*
    cp -r $BUILDDIRECTORY/* /var/www/html
    chown -R apache:apache /var/www/html
fi