#Steps to install openmrs for qsh from scratch on a linux box e.g an ec2 instance

#install git
yum install git

#install docker
yum install docker

#install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#git clone 

