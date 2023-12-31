## Apache Tomcat Installation And Setup In AWS EC2 Redhat Instance.
### Prerequisite
+ AWS Acccount.
+ Create Redhat EC2 T2.micro Instance.
+ Create Security Group and open Tomcat ports or Required ports.
   + 8080 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+

### Install Java JDK 1.8+ 

``` sh
# Change Hostname to Tomcat
sudo hostnamectl set-hostname tomcat
sudo su - ec2-user
cd /opt
# Install wget and unzip Packages
sudo yum install git wget unzip -y
# Install Java JDK as a Pre-requisite for Tomcat to Run
# sudo yum install java-1.8.0-openjdk-devel -y
sudo yum install java-11-openjdk -y
```
### Install Tomcat version 9+
### Download and extract the tomcat server
``` sh
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.82/bin/apache-tomcat-9.0.82.zip
sudo unzip apache-tomcat-9.0.82.zip
sudo rm -rf apache-tomcat-9.0.82.zip
### Rename tomcat for good naming convention
sudo mv apache-tomcat-9.0.82 tomcat9  
### Assign executable permissions to the tomcat home directory
sudo chmod 777 -R /opt/tomcat9
sudo chown ec2-user -R /opt/tomcat9
### Start tomcat
sh /opt/tomcat9/bin/startup.sh
# Create a soft link to start and stop tomcat
# This will enable us to manage tomcat as a service
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/starttomcat
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stoptomcat
starttomcat
sudo su - ec2-user
```

