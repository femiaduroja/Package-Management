## Jenkins Installation And Setup In AWS EC2 Redhat Instnace.
### Prerequisite
+ AWS Acccount.
+ Create Redhat EC2 t2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 8080 got Jenkins, ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for SonarQube version 7.8

### Install Java JDK 1.8+ as Jenkins Pre-requisite
### Install other Softwares - git, unzip and wget

``` sh
sudo hostnamectl set-hostname ci
sudo yum -y install unzip wget tree git
sudo yum install java-11-openjdk -y
```
### Add Jenkins Repository and Key
```sh
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
cd /etc/yum.repos.d/
sudo curl -O https://pkg.jenkins.io/redhat-stable/jenkins.repo
```

## Install Jenkins
```sh
sudo yum -y install jenkins  --nobest
```
## Start Jenkins Service and Verify Jenkins is Running
```sh
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
```
## Access Jenkins from the Browser
```sh
public-ip:8080
curl ifconfig.co 
```
## Get Jenkins Initial Admin Password
```sh
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

