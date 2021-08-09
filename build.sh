#!/bin/bash

# version 2021-08-07 15:20

if [ -n "$1" ]; then
  ex=$1
else
  ex=false
fi

cd ~/powercontainers;git pull;cd -

cp /home/pi/powercontainers/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/powercontainers/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh

. ~/dockersolarrs485logger/build.sh $ex
. ~/dockerwatermeter/build.sh $ex
. ~/dockeropenweathermap/build.sh $ex
. ~/dockerp1logger/build.sh $ex
. ~/dockergrafana/build.sh $ex

cd /var/docker-compose

docker-compose up -d --force-recreate

cd -