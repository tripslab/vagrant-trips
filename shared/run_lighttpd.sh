#!/bin/bash

echo "RUNNING TRIPS"

mkdir -p /home/vagrant/shared/logs; 
rm -rf /home/vagrant/shared/logs-previous
mv /home/vagrant/shared/logs /home/vagrant/shared/logs-previous
mkdir -p /home/vagrant/shared/logs; 

# yeah you need to figure out how to kill this yourself, buddy
screen -S server -d -m bash -c "lighttpd -D -f /home/vagrant/shared/lighttpd.conf; exec sh"
screen -S step -d -m bash -c "/home/vagrant/shared/step/bin/trips-step -debug true -display None -logdir /home/vagrant/shared/logs; exec sh;"


