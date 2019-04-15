#!/bin/bash

# Update and install dependencies
yum -y update
curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
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

# Codedeploy logs
ln -sfn /opt/codedeploy-agent/deployment-root/deployment-logs/codedeploy-agent-deployments.log /home/centos/codedeploy-agent-deployments.log

# Remove previous deploy
rm -rf /opt/npm-codedeploy
