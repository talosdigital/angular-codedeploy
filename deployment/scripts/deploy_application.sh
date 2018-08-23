#!/bin/bash

sudo rm -rf /var/www/pronto-dev
sudo mkdir -p /var/www/pronto-dev
sudo cp -r dist/* /var/www/pronto-dev
sudo chown -R apache:apache /var/www/pronto-dev
