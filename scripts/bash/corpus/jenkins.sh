#!/usr/bin/env bash
#Jenkins installation

#If java is not install, install it first
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -y fontconfig openjdk-11-jre openjdk-11-jdk

#Now install maven
cd /tmp ; sudo wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
cd /tmp ; sudo tar -xzf apache-maven-3.9.4-bin.tar.gz -C  /opt/
mv /opt/apache-maven-3.9.4 /opt/maven
sudo echo "MAVEN_HOME=\"/opt/maven\"" >> /etc/profile
sudo echo "PATH=\$MAVEN_HOME/bin:\$PATH" >> /etc/profile
source /etc/profile

#Install Jenkins
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

#
