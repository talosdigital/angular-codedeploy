#!/bin/bash

sudo chown -R centos:centos /opt/angular-codedeploy
sudo chmod -R 755 /opt/angular-codedeploy/
cd /opt/angular-codedeploy/

sudo rm -rf /var/www/pronto-dev
sudo mkdir -p /var/www/pronto-dev
sudo cp -r dist/* /var/www/pronto-dev
sudo chown -R apache:apache /var/www/pronto-dev

sudo chown -R apache:apache /var/www/html
