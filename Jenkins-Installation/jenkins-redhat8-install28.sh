#!/bin/bash
# Author: Prof. Legah
# Date: October 10th 2023
# Installing Jenkins on RHEL 8/9, CentOS 8 or Amazon Linux OS
# You can execute this script as user-data when launching EC2 VM.
sudo timedatectl set-timezone Africa/Lagos
sudo hostnamectl set-hostname jenkins
sudo yum install wget -y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo yum install java-17-openjdk -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
# start jenkins
# You can enable the Jenkins service to start at boot with the command:
sudo systemctl enable jenkins
#You can start the Jenkins service with the command:=
sudo systemctl start jenkins
# You can check the status of the Jenkins service using the command:
sudo systemctl status jenkins
sudo su - ec2-user
echo "End of jenkins Installation"
