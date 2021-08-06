#!/bin/bash
    
git clone https://github.com/Revenberg/DockerPower.git 

git clone https://github.com/Revenberg/DockerDockerSolarrs485logger.git 
cd ~;cd DockerDockerSolarrs485logger;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerWatermeter.git 
cd ~;cd DockerWatermeter;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerDockerOpenweathermap.git 
cd ~;cd DockerDockerOpenweathermap;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerDockerP1logger.git 
cd ~;cd DockerDockerP1logger;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerGrafana.git 
cd ~;cd DockerGrafana;. ./build.sh;cd ~

cd ~

cp /home/pi/ansible_zigbee/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/ansible_zigbee/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh
