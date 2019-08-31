## Install Jenkins
## Use link for more information
## https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-16-04 
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install jenkins

sudo apt-get install default-jre

systemctl start jenkins

## Setup Jenkins for first time use.
##https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-16-04 

## Test Jenkins URL with the credentials
##http://***.***.***.***:8080
##admin/****

## Setup Jenkins slave on K8Master node
## Setup ssh key between Jenkins Master node and K8Master node(jenkins slave)
## Install Java on Jenkins Slave
sudo apt-get install default-jre

## Add unix credentials for ssh connection to Jenkins Slave host will be using in Slave node setup
## Setup Node in Jenkins UI (see image jenkins_slave_node_config.png)

## Install "Deploy to Kubernetes" jenkin plugin and configre K8 Cluster connection. See image k8_credential_setup.png
