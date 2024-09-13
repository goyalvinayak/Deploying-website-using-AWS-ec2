# Deploying Website using AWS ec2
## Creating Security Group
A security group acts as a virtual firewall for your instance to control inbound and outbound traffic. 

Inbound rules- (Allowing SSH access)
![1](https://github.com/user-attachments/assets/a6bcd84a-d160-4fc4-8fdd-a0f0e9907207)
No changes in outbound rules

## Launching an Instance
### Configurations
* Name: my-web-server
* Tag: aws-project
* OS Image: Ubuntu(Free tier)
* Creating new key pair with .pem private key format.
* Choosing Security Group that we made.

Instance is created.
![1](https://github.com/user-attachments/assets/4b2884fb-e6f3-4ace-97ac-b0504b4a81bc)


## Connecting to the ec2 Instace
```
ssh -i /d/Users/Vinayak/Downloads/my-web-server-aws.pem ubuntu@ec2-52-87-205-193.compute-1.amazonaws.com
```
## Writing script for setting up website.
I used free HTML template from https://www.tooplate.com

Commands-
```
sudo -i
cd /opt
mkdir Scripts
cd Scripts
nano script.sh
```
script.sh(For ubuntu)-
```
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
```
Giving executable permision to our file and running it-
```
chmod +x script.sh
./script.sh
```
## Adding inbound rule in Security group to access website at port 80
![2](https://github.com/user-attachments/assets/56aed787-4f55-430a-a7dc-5e3da4816905)
## Accessing website using public address and port no. 
![3](https://github.com/user-attachments/assets/afb6f2e9-872a-4a06-93c3-04e71a9c5ef1)
## Website
![4](https://github.com/user-attachments/assets/4773595c-dfee-41f5-a87c-8c797e01ee40)




