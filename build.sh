#!/bin/bash

# version 2021-08-07 15:20

. ~/dockersolarrs485logger/build.sh
. ~/dockerwatermeter/build.sh
. ~/dockeropenweathermap/build.sh
. ~/dockerp1logger/build.sh
. ~/dockergrafana/build.sh

cp /home/pi/dockerpower/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/dockerpower/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh

. ~/p1meter.sh