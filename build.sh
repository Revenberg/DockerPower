#!/bin/bash

cd ~
    git clone https://github.com/Revenberg/DockerPower.git 

git clone https://github.com/Revenberg/DockerSolarrs485logger.git 
cd ~;cd DockerSolarrs485logger;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerWatermeter.git 
cd ~;cd DockerWatermeter;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerOpenweathermap.git 
cd ~;cd DockerOpenweathermap;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerP1logger.git 
cd ~;cd DockerP1logger;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerGrafana.git 
cd ~;cd DockerGrafana;. ./build.sh;cd ~

cd ~

cp /home/pi/ansible_zigbee/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/ansible_zigbee/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh
