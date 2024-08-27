#!/bin/bash

INSTALL="httpd wget unzip"
URL="https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip"

#Installing Dependencies

echo "Installing packages"
sudo yum install $INSTALL -y > /dev/null
echo

#Start and enable Services

echo "Service is started"
sudo systemctl start httpd
sudo systemctl enable httpd
echo


#Creating temp directories

sudo mkdir /tmp/site
sudo cd /tmp/site


wget $URL > /dev/null
unzip 2136_kool_form_pack.zip > /dev/null
sudo mkdir /var/www
sudo mkdir /var/www/html
sudo cp -r 2136_kool_form_pack/* /var/www/html/

sudo systemctl restart httpd

sudo rm -rf /tmp/site
