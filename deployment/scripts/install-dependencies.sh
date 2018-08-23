#!/bin/bash
yum -y update
yum -y install git

# Install Apache
yum -y install httpd firewalld
systemctl enable httpd
systemctl enable firewalld
chkconfig httpd on
chkconfig firewalld 

#Install NodeJS
yum -y install nodejs
