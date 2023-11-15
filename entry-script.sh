#!/bin/bash

sudo su

# update and install package
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
mkdir /var/www/html
echo “Hello World from $(hostname -f)” > /var/www/html/index.html
