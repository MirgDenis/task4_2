#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get -y install ntp
sudo sed -i '/[1-9].ubuntu.pool.ntp.org/d' /etc/ntp.conf
sudo sed -i 's/[0].ubuntu.pool.ntp.org/ua.pool.ntp.org/' /etc/ntp.conf
cp /etc/ntp.conf /etc/ntp.conf.bak 
sudo service ntp restart
echo "*/1 * * * * $dir/ntp_verify.sh MAILTO=root@localhost" | crontab -

