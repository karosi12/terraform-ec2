#!/bin/bash

sudo su

# update and install package
apt update -y
apt install -y apache2
ufw allow 'Apache'
systemctl start apache2
systemctl enable apache2
mkdir /var/www/html
chown -R $USER:$USER /var/www/html
chmod -R 755 /var/www/html
echo “Hello World from $(hostname -f)” > /var/www/html/index.html
