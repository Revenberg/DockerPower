#!/bin/bash

# version 7-8-2021

cd ~
git clone https://github.com/Revenberg/DockerPower.git 
cd ~;cd DockerPower;git pull;cd ~

cd ~;git clone https://github.com/Revenberg/DockerSolarrs485logger.git 
. ~/DockerSolarrs485logger/build.sh

cd ~;git clone https://github.com/Revenberg/DockerWatermeter.git 
. ~/DockerWatermeter/build.sh

cd ~;git clone https://github.com/Revenberg/DockerOpenweathermap.git 
. ~/DockerOpenweathermap/build.sh

cd ~;git clone https://github.com/Revenberg/DockerP1logger.git 
. ~/DockerP1logger/build.sh

cd ~;git clone https://github.com/revenberg/DockerGrafana.git 
. ~/DockerGrafana/build.sh

cp /home/pi/DockerPower/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/DockerPower/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh
