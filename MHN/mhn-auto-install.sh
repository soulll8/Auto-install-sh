#!/bin/sh

#======================= Install ===========================
#Install Git
#Select system version
cat << EOF
********Select system version:(1-2)****
1.on Debian or Ubuntu
2.on Centos or RHEL
EOF

read input
case $input in
1) sudo apt-get install git -y;;
2) sudo yum install -y git;;
esac
	
#Install MHN
cd /opt/
sudo git clone https://github.com/threatstream/mhn.git
cd mhn/
sudo ./install.sh

#================Configuration and checking=================
#MHN Configuration
#===========================================================
#Do you wish to run in Debug mode?: y/n n
#Superuser email: YOUR_EMAIL@YOURSITE.COM
#Superuser password: 
#Server base url ["http://1.2.3.4"]: 
#Honeymap url ["http://1.2.3.4:3000"]:
#Mail server address ["localhost"]: 
#Mail server port [25]: 
#Use TLS for email?: y/n n
#Use SSL for email?: y/n n
#Mail server username [""]: 
#Mail server password [""]: 
#Mail default sender [""]: 
#Path for log file ["mhn.log"]:
#===========================================================
#Running and checking
sudo /etc/init.d/nginx status
sudo /etc/init.d/supervisor
sudo supervisorctl status
