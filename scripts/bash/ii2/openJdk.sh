#!/usr/bin/env bash

sudo mkdir -p /usr/local/java
sudo cp -r java-se-7u75-ri /usr/local/java/
cd /usr/local/java

export JAVA_HOME=/usr/local/java/java-se-7u75-ri
export JRE_HOME=/usr/local/java/java-se-7u75-ri
export PATH=$PATH:$JRE_HOME/bin:$JAVA_HOME/bin

echo 'export JAVA_HOME=/usr/local/java/java-se-7u75-ri' >> ~/.bash_profile
echo 'export JRE_HOME=/usr/local/java/java-se-7u75-ri' >> ~/.bash_profile
echo 'export PATH=$PATH:$JRE_HOME/bin:$JAVA_HOME/bin' >> ~/.bash_profile

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/java-se-7u75-ri/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/java-se-7u75-ri/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/java-se-7u75-ri/bin/javaws" 1
sudo update-alternatives --set java /usr/local/java/java-se-7u75-ri/bin/java
sudo update-alternatives --set javac /usr/local/java/java-se-7u75-ri/bin/javac
sudo update-alternatives --set javaws /usr/local/java/java-se-7u75-ri/bin/javaws
source /etc/profile

#Check JAVA Paths
echo $JAVA_HOME
echo $JRE_HOME
echo $PATH
