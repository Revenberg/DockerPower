#!/bin/bash
cd ~

sudo apt update -y
#sudo apt full-upgrade -y

if [ ! -f "/home/pi/.pswrd" ]; then
    if [ $# -ne 1 ]; then
        echo $0: usage: $0  password
        sleep 30
        exit 255
    fi

    sudo apt-get remove --purge minecraft-pi -y
    sudo apt-get clean -y
    sudo apt-get update -y
    sudo apt-get autoremove -y

    sudo apt-get install git ansible sshpass -y
    sudo apt-get install docker-compose -y

#    git clone https://github.com/Revenberg/powercontainers.git
#
#    if [ "$(whoami)" == "pirate" ]; then
#        cd /home/pirate/powercontainers
#        git pull
#        cd ~
#        echo $1 > /home/pirate/.pswrd
#        ansible-playbook  /home/pirate/powercontainers/changepassword.yml --connection=local --extra-vars "passwordfile=/home/pirate/.pswrd" | tee /home/pi/alles.log
#        echo "Reconnect as pi and your password"
#        sudo cp $0 /home/pi/
#        sudo chown pi:pi /home/pi/$0
#        sudo mv /home/pirate/.pswrd /home/pi/.pswrd
#        sudo chown pi:pi /home/pi/.pswrd
#        sudo chsh -s /bin/bash pi
#        sleep 30
#        exit 255
#    fi
    git clone https://github.com/Revenberg/powercontainers.git
    cd ~/powercontainers
    git config --global pull.rebase false
    cd -

    mkdir /home/pi/ansible
    echo $1 > /home/pi/.pswrd
    ansible-playbook  /home/pi/powercontainers/changepassword.yml --connection=local --extra-vars "passwordfile=/home/pi/.pswrd" | tee /home/pi/alles.log

else
    cd ~/powercontainers
    git pull
    cd -
fi

mkdir /home/pi/ansible 2>/dev/null
mkdir /home/pi/.ssh 2>/dev/null

sudo ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key
sudo ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key
ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | while read line;
do
    ssh-keyscan -H $line >> /home/pi/.ssh/known_hosts
done
sudo ssh-keygen -l -f /etc/ssh/ssh_host_rsa_key

pswrd=$(cat /home/pi/.pswrd)

echo "all:" > /home/pi/ansible/hosts
echo "  vars:" >> /home/pi/ansible/hosts
echo "    ansible_connection: ssh" >> /home/pi/ansible/hosts
echo "    ansible_ssh_user: pi" >> /home/pi/ansible/hosts
ansible-vault encrypt_string --vault-password-file /home/pi/.pswrd $pswrd --name '    ansible_ssh_pass'  >> /home/pi/ansible/hosts
echo "rpi:" >> /home/pi/ansible/hosts
echo "  hosts:" >> /home/pi/ansible/hosts

ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | while read line;
do
  echo "    $line:" >> /home/pi/ansible/hosts
  echo "      ansible_user: pi" >> /home/pi/ansible/hosts

  echo "$line" > /home/pi/ip
done

/sbin/ip route | awk '/default/ { print $3 }' | head -n 1 > /home/pi/gateway
curl ifconfig.me > /home/pi/ext_ip

#echo /home/pi/ansible/hosts
#ansible-vault encrypt_string --vault-password-file /home/pi/.pswrd '$pswrd' --name ' ansible_ssh_pass'  >> /home/pi/ansible/hosts

cd /home/pi/powercontainers
git pull
cd /home/pi

cp /home/pi/powercontainers/alles.sh /home/pi/alles.sh;
chmod +x /home/pi/alles.sh;

cp /home/pi/powercontainers/build.sh /home/pi/build.sh;
chmod +x /home/pi/build.sh;

cp /home/pi/powercontainers/build.sh /home/pi/run.sh;
chmod +x /home/pi/run.sh;

#ansible-playbook  /home/pi/powercontainers/docker-install.yml --vault-password-file /home/pi/.pswrd -i /home/pi/ansible/hosts | tee /home/pi/ansible.log
ansible-playbook  /home/pi/powercontainers/alles.yml --vault-password-file /home/pi/.pswrd -i /home/pi/ansible/hosts | tee /home/pi/alles.log

ret=$?
if [ $ret -ne 0 ]; then
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ERROR !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
else
    docker ps -a
fi
