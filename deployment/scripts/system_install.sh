#!/bin/bash

# Update and install dependencies
yum -y update
yum -y install git httpd firewalld nodejs

# Enable apache and firewall
systemctl enable httpd
systemctl enable firewalld

# Start apache and firewall
systemctl stop firewalld
systemctl restart dbus
systemctl stop httpd.service
usermod -d /var/www apache
systemctl start firewalld
systemctl start httpd

# Timezone
mv /etc/localtime /etc/localtime.bak
ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime

rm -rf /opt/angular-codedeploy
