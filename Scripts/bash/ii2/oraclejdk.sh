#!/usr/bin/env bash
#Title          : oraclejdk.sh
#Description    : To install oracle JDK to the server
#Author         : Mr.Nix
#Date           : 2019-02-12 18:46:24
#Version        : 0.01 V
#Usage          : . ./oraclejdk.sh
#Notes          : Please make sure the tar.gz package is present in the same dir
#Bash_version   : 4.4.12(1)-release
#============================================================================

function JDK_VERSION_SEVEN
{
	echo "Install version jdk-7u80-linux-x64"
	cd ~/Download

	sudo mkdir -p /usr/local/java
        sudo cp -r jdk-7u80-linux-x64.tar.gz /usr/local/java/
        cd /usr/local/java
        sudo tar xvzf jdk-7u80-linux-x64.tar.gz
        sudo rm jdk-7u80-linux-x64.tar.gz

        export JAVA_HOME=/usr/local/java/jdk1.7.0_80
        export JRE_HOME=/usr/local/java/jdk1.7.0_80
        export PATH=$PATH:$JRE_HOME/bin:$JAVA_HOME/bin

        echo 'export JAVA_HOME=/usr/local/java/jdk1.7.0_80' >> ~/.bash_profile
        echo 'export JRE_HOME=/usr/local/java/jdk1.7.0_80' >> ~/.bash_profile
        echo 'export PATH=$PATH:$JRE_HOME/bin:$JAVA_HOME/bin' >> ~/.bash_profile

        sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.7.0_80/bin/java" 1
    	sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.7.0_80/bin/javac" 1
    	sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.7.0_80/bin/javaws" 1

	sudo update-alternatives --set java /usr/local/java/jdk1.7.0_80/bin/java
    	sudo update-alternatives --set javac /usr/local/java/jdk1.7.0_80/bin/javac
    	sudo update-alternatives --set javaws /usr/local/java/jdk1.7.0_80/bin/javaws
    	source /etc/profile

        #Check JAVA Paths
        echo $JAVA_HOME
        echo $JRE_HOME
        echo $PATH
}

echo "Instal JDK 7 "
echo "~~~~~~~~~~~~~"

if [ -f "/usr/java/jdk" ]; then
	echo "JAVA Already Installed in Your System"
else
	JDK_VERSION_SEVEN

echo " Check java version "
java -version
