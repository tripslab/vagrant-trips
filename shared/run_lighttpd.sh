#!/bin/bash

echo "RUNNING TRIPS"

mkdir -p /home/vagrant/shared/logs; 
rm -rf /home/vagrant/shared/logs-previous
mv /home/vagrant/shared/logs /home/vagrant/shared/logs-previous
mkdir -p /home/vagrant/shared/logs; 

# yeah you need to figure out how to kill this yourself, buddy
screen -S server -L -d -m lighttpd -D -f /home/vagrant/shared/lighttpd.conf
screen -S step -L -d -m /home/vagrant/shared/step/bin/trips-step -debug true -display None -logdir /home/vagrant/shared/logs


