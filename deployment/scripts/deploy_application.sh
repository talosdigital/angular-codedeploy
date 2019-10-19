#!/bin/bash

source /opt/npm-codedeploy/deployment/scripts/setenv.sh

# If a project was specified in variables.json, deploy using the project's name
# Otherwise, deploy to the default apache folder
if [ "$PROJECT" != "" ]; then
    rm -rf /var/www/$PROJECT
    mkdir -p /var/www/$PROJECT
    cp -r $BUILD_DIR/* /var/www/$PROJECT
    cp $CODEDEPLOY_DIR/.htaccess /var/www/$PROJECT
    chown -R apache:apache /var/www/$PROJECT
else
    rm -rf html/*
    cp -r $BUILD_DIR/* /var/www/html
    cp $CODEDEPLOY_DIR/.htaccess /var/www/$PROJECT
    chown -R apache:apache /var/www/html
fi
