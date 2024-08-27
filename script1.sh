#!/bin/bash

INSTALL="apache2 wget unzip"
URL="https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip"

#Installing Dependencies

echo "Installing packages"
sudo apt install $INSTALL -y > /dev/null
echo

#Start and enable Services

echo "Service is started"
sudo systemctl start apache2
sudo systemctl enable apache2
echo


#Creating temp directories

sudo mkdir /tmp/site
sudo cd /tmp/site


wget $URL > /dev/null
unzip 2136_kool_form_pack.zip > /dev/null
sudo mkdir /var/www
sudo mkdir /var/www/html
sudo cp -r 2136_kool_form_pack/* /var/www/html/

sudo systemctl restart apache2

sudo rm -rf /tmp/site