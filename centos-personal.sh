#!/bin/bash

sudo yum update -y
sudo yum install -y open-vm-tools
sudo systemctl enable --now vmtoolsd
yum install wget unzip -y
sudo yum install -y epel-release


exit

sudo yum groupinstall -y 'development tools'

sudo yum install -y python-pip python-devel
sudo yum install -y python3 python3-pip python3-setuptools -y

curl -L https://bit.ly/glances | /bin/bash

pip3 install --upgrade pip --user
pip3 install bottle
pip3 install glances
pip3 install influxdb

cat <<EOF | sudo tee -a /etc/systemd/system/glances.service > /dev/null
[Unit]
Description=Glances
After=network.target

[Service]
ExecStart=/usr/local/bin/glances -w
Restart=on-failure
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl enable --now glances.service
