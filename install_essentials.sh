#!/bin/bash -x
    sudo apt-get update -y && sleep 40
    sudo apt-get upgrade -y && sleep 180
#To resolve unable to initialize frontend: Dialog error
    echo 'debconf debconf/frontend select Noninteractive' | sudo debconf-set-selections
    sudo apt-get install -y -q
    sudo chmod 777 /var/cache/debconf/
    sudo chmod 777 /var/cache/debconf/passwords.dat
    apt-get install -y gnupg2 && sleep 20
#Added command from article - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2rl_verify.html
    curl -O https://s3.amazonaws.com/ec2rescuelinux/ec2rl.key
    gpg2 --import ec2rl.key
    curl -O https://s3.amazonaws.com/ec2rescuelinux/ec2rl.tgz.sig
    gpg2 --verify ./ec2rl.tgz.sig
#Install open jdk
    sudo apt-get install openjdk-11-jdk -y && sleep 90
    echo "---------------------------------------------------------"
    echo "JDK installation completed."
    echo "---------------------------------------------------------"
#Install python pip3, python and nfs modules
    sudo apt-get -y install python3-pip && sleep 30
    sudo apt-get install -y build-essential libffi-dev python-dev && sleep 20
    sudo apt-get install -y nfs-common && sleep 20
    sudo systemctl restart systemd-logind
    pip3 install python-bcrypt && sleep 20
    echo "---------------------------------------------------------"
    echo "Python3 bycrypt module install completed.."
    echo "---------------------------------------------------------"
#Install Maven:
    sudo apt-get install maven -y && sleep 60
#Step-8: Install Docker:
    sudo apt-get install ca-certificates curl gnupg lsb-release -y &&  sleep 30
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y && sleep 30
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&  sleep 60    
#Step-9: Install NodeJS:
    sudo apt install nodejs npm -y && sleep 30
#Step-10: Intall Git:
    sudo apt install git-all -y && sleep 20
#Step-11: Install Zip:
    sudo apt install zip unzip -y && sleep 20
