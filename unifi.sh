#! /bin/bash

# Install Ubiquiti Unifi Controller on Ubuntu 20.04.
# As tested on a fresh install of ubuntu-20.04.1-live-server, August 22nd 2020.
# Thanks to https://gist.github.com/tmuncks for posting the updated install steps.

sudo apt update
sudo apt install --yes apt-transport-https

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
sudo add-apt-repository 'deb https://www.ui.com/downloads/unifi/debian stable ubiquiti'

wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - 
sudo add-apt-repository 'deb https://apt.corretto.aws stable main'

echo "JAVA_HOME=/usr/lib/jvm/java-1.8.0-amazon-corretto" | sudo tee -a /etc/default/unifi

sudo apt update
sudo apt install -y java-1.8.0-amazon-corretto-jdk unifi
sudo apt clean

sudo systemctl status --no-pager --full mongodb.service unifi.service