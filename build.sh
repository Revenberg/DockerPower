#!/bin/bash

# version 07-08-2021

cd ~
git clone https://github.com/Revenberg/dockerpower.git 
cd ~;cd dockerpower;git pull;cd ~

cd ~;git clone https://github.com/Revenberg/dockersolarrs485logger.git 
. ~/dockersolarrs485logger/build.sh

cd ~;git clone https://github.com/Revenberg/dockerwatermeter.git 
. ~/dockerwatermeter/build.sh

cd ~;git clone https://github.com/Revenberg/dockeropenweathermap.git 
. ~/dockeropenweathermap/build.sh

cd ~;git clone https://github.com/Revenberg/dockerp1logger.git 
. ~/dockerp1logger/build.sh

cd ~;git clone https://github.com/revenberg/dockergrafana.git 
. ~/dockergrafana/build.sh

cp /home/pi/dockerpower/p1meter.sh /home/pi/p1meter.sh
chmod +x /home/pi/p1meter.sh

cp /home/pi/dockerpower/build.sh /home/pi/build.sh
chmod +x /home/pi/build.sh
