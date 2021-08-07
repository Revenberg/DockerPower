#!/bin/bash

# version 2021-08-07 15:20

cd powercontainers;git pull;cd -

cp /home/pi/powercontainers/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/powercontainers/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh

. ~/dockersolarrs485logger/build.sh
. ~/dockerwatermeter/build.sh
. ~/dockeropenweathermap/build.sh
. ~/dockerp1logger/build.sh
. ~/dockergrafana/build.sh

. ~/p1meter.sh