#!/bin/bash

cd ~
git clone https://github.com/Revenberg/DockerPower.git 

git clone https://github.com/Revenberg/DockerSolarrs485logger.git 
cd ~;cd DockerSolarrs485logger;git pull;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerWatermeter.git 
cd ~;cd DockerWatermeter;git pull;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerOpenweathermap.git 
cd ~;cd DockerOpenweathermap;git pull;. ./build.sh;cd ~

git clone https://github.com/Revenberg/DockerP1logger.git 
cd ~;cd DockerP1logger;git pull;. ./build.sh;cd ~

git clone https://github.com/revenberg/DockerGrafana.git 
cd ~;cd DockerGrafana;git pull;. ./build.sh;cd ~

cd ~

cp /home/pi/DockerPower/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/DockerPower/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh
