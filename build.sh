#!/bin/bash

# version 2021-08-07 15:20

cd ~/powercontainers;git pull;cd -

cp /home/pi/powercontainers/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/powercontainers/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh

#. ~/dockersolarrs485logger/build.sh true
. ~/dockerwatermeter/build.sh true
. ~/dockeropenweathermap/build.sh true
#. ~/dockerp1logger/build.sh true
. ~/dockergrafana/build.sh true
. ~/dockermqtt2slack/build.sh true
. ~/dockerp1mqtt/build.sh true
. ~/dockersolarrs485logger/build.sh true

cd /var/docker-compose

docker-compose up -d --force-recreate

cd -