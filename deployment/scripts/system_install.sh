#!/bin/bash

# Update and install basic dependencies
yum -y update
yum -y install git httpd firewalld jq

# Enable apache and firewall
systemctl enable httpd
systemctl enable firewalld

# Start apache and firewall
systemctl stop firewalld
systemctl stop httpd
systemctl restart dbus
usermod -d /var/www apache
systemctl start firewalld
systemctl start httpd

# Timezone
mv /etc/localtime /etc/localtime.bak
ln -s /usr/share/zoneinfo/America/Bogota /etc/localtime

# Codedeploy logs
ln -sfn /opt/codedeploy-agent/deployment-root/deployment-logs/codedeploy-agent-deployments.log /home/centos/codedeploy-agent-deployments.log

# Remove previous deploy
rm -rf /opt/angular-codedeploy
