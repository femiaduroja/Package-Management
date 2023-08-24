## SonarQube Installation And Setup In AWS EC2 Redhat Instance.
### Prerequisite
+ AWS Acccount.
+ Create Redhat EC2 T2.medium Instance with 4GB RAM.
+ Create Security Group and open Required ports.
   + 9000 ..etc
+ Attach Security Group to EC2 Instance.
+ Install java openJDK 1.8+ for SonarQube version 710.1

### 1a. Create Sonar User to Manage the SonarQube server
```sh
#As a good security practice, SonarQuber Server is not advised to run sonar service as a root user, 
# create a new user called sonar and grant sudo access to manage sonar services as follows

sudo useradd sonar
# Grand sudo access to sonar user
sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
# set hostname for the sonarqube server
sudo hostnamectl set-hostname sonar 
sudo su - sonar
```
### 1b. Assign Password to Sonar User
```sh
sudo passwd sonar
```
### 2. Enable Password Authentication in the Server
```sh
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
```
### 3. Install Java JDK 1.8+ Required for Sonarqube to Start

``` sh
cd /opt
sudo yum -y install unzip wget git
sudo yum install  java-11-openjdk-devel
```
### 4. Download and Extract the SonarqQube Server Software.
```sh
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.1.0.73491.zip
sudo unzip sonarqube-10.1.0.73491.zip
sudo rm -rf sonarqube-10.1.0.73491.zip
sudo mv sonarqube-10.1 sonarqube
```

### 5. Grant File Permissions for Sonar User to Start and Manage SonarQube
```sh
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/
```
### 6. Start SonarQube Server
```sh
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start 
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status
```

### 7. Ensure that SonarQube is Running and Access SonarQube on the Browser
#### SonarQube Default Port is = 9000
#### Get the SonarQube public IP Address 
#### Public IP: 9000
```sh
curl -v localhost:9000
54.236.232.85:9000
default USERNAME: admin
default password: admin
```
