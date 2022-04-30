#!/bin/bash
cd ~    
    
cd ~/powercontainers
git pull
cd ~

cp /home/pi/powercontainers/alles.sh /home/pi/alles.sh;
chmod +x /home/pi/alles.sh;

cp /home/pi/powercontainers/build.sh /home/pi/build.sh;
chmod +x /home/pi/build.sh;

cp /home/pi/powercontainers/build.sh /home/pi/run.sh;
chmod +x /home/pi/run.sh;

cp /home/pi/powercontainers/update.sh /home/pi/update.sh;
chmod +x /home/pi/update.sh;

ansible-playbook  /home/pi/powercontainers/alles.yml --vault-password-file /home/pi/.pswrd -i /home/pi/ansible/hosts | tee /home/pi/alles.log

ret=$?
if [ $ret -ne 0 ]; then
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
else
    docker ps -a
fi
