#!/bin/bash

cd /opt/npm-codedeploy

# In this variable.json file should be variables like
# PROJECT   = Project name and environment being deployed, using the url, e.g:
#   pronto-dev.talosdigital.com
#   www.dealt-test.test4echo.app
#   viamericas-rc.tes4echo.co
# NODE_VERSION = Node version to be installed for the build process, e.g:
#   8.x                                           (default value)
#   10.x
#   6.x
# CMD_INSTALL  = Command used to install dependencies, e.g:
#   npm install                                   (default value)
#   npm install && bower install
# CMD_BUILD    = Command to be used to build the application, eg:
#   npm run build                                 (default value)
#   node_modules/gulp/bin/gulp.js build
# BUILD_DIR    = Directory where the project will be built, e.g:
#   build                                         (default value)
#   dist
for s in $(cat deployment/variables.json | jq --arg q "'" -r 'to_entries|map("\(.key)=\($q)\(.value|tostring)\($q)") | .[] | @base64' ); do
  eval $(echo $s | base64 --decode)
done

CODEDEPLOY_DIR=/opt/npm-codedeploy
PROJECT_WITHOUT_WWW=$(echo $PROJECT | sed 's/www\.//g')
