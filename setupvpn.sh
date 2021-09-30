#!/bin/bash
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add - 
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list 
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF 
deb https://repo.pritunl.com/stable/apt buster main 
EOF  
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A  
sudo apt-get update 
sudo apt-get install -y pritunl mongodb-org 
systemctl start pritunl mongod
systemctl enable pritunl mongod
