#!/bin/bash
# Configure Apache
systemctl stop httpd

mkdir -p /etc/httpd/sites-available
mkdir -p /etc/httpd/sites-enabled

#copy configuration
cp /opt/angular-codedeploy/config/redirect.conf /etc/httpd/sites-available
cp /opt/angular-codedeploy/config/pronto.conf /etc/httpd/conf.d/
cp /opt/angular-codedeploy/config/pronto-dev.conf /etc/httpd/sites-available/pronto-dev.conf
ln -sfn /etc/httpd/sites-available/redirect.conf /etc/httpd/sites-enabled/redirect.conf
ln -sfn /etc/httpd/sites-available/pronto-dev.conf /etc/httpd/sites-enabled/pronto-dev.conf

#Add Firewall Rule for External Access
setenforce 0
systemctl restart dbus
systemctl start firewalld
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --zone=public --add-port=8082/tcp --permanent
firewall-cmd --zone=public --add-port=8090/tcp --permanent
firewall-cmd --reload
