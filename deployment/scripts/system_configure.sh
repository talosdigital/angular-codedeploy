#!/bin/bash
# Configure Apache
source /opt/npm-codedeploy/deployment/scripts/setenv.sh

systemctl stop httpd

mkdir -p /etc/httpd/sites-available
mkdir -p /etc/httpd/sites-enabled

#copy configuration
cp $CODEDEPLOY_DIR/deployment/conf/talos.conf /etc/httpd/conf.d/
envsubst < $CODEDEPLOY_DIR/deployment/conf/template.conf > /etc/httpd/sites-available/$PROJECT.conf
ln -sfn /etc/httpd/sites-available/$PROJECT.conf /etc/httpd/sites-enabled/$PROJECT.conf

#Add Firewall Rule for External Access
setenforce 0
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload

# Change ownership of folder
sudo chown -R centos:centos $CODEDEPLOY_DIR
sudo chmod -R 755 $CODEDEPLOY_DIR

# Give apache ownership of www
sudo chown -R apache:apache /var/www/html
