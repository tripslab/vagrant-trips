#!/bin/bash

mkdir -p logs; 

# yeah you need to figure out how to kill this yourself, buddy
screen -S server -d -m lighttpd -D -f /home/vagrant/shared/lighttpd.conf
screen -S step -d -m /home/vagrant/shared/step/bin/trips-step -display None -logdir logs 
