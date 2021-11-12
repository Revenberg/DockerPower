#!/bin/bash

# version 2021-08-07 15:20

cd ~/powercontainers;git pull;cd -

cp /home/pi/powercontainers/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/powercontainers/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh

git clone https://github.com/Revenberg/dockergrafana.git 
git clone https://github.com/Revenberg/dockerp1mqtt.git 
git clone https://github.com/Revenberg/dockersolarrs485mqtt.git 
git clone https://github.com/Revenberg/dockeropenweathermapmqtt.git 
git clone https://github.com/Revenberg/dockermqttexporter.git 
git clone  https://github.com/Revenberg/dockerzigbeemqttexporter.git

#. ~/dockersolarrs485logger/build.sh true
#. ~/dockerwatermeter/build.sh true
#. ~/dockeropenweathermap/build.sh true
#. ~/dockerp1logger/build.sh true
. ~/dockergrafana/build.sh true
#. ~/dockermqtt2slack/build.sh true
. ~/dockerp1mqtt/build.sh true
. ~/dockersolarrs485mqtt/build.sh true
. ~/dockeropenweathermapmqtt/build.sh true
. ~/dockermqttexporter/build.sh true
. ~/dockerzigbeemqttexporter/build.sh true
cd /var/docker-compose

docker-compose up -d --force-recreate

cd -