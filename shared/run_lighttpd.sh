#!/bin/bash

mkdir -p logs; 

# yeah you need to figure out how to kill this yourself, buddy
/home/vagrant/shared/step/bin/trips-step -display None -logdir logs &
lighttpd -D -f /home/vagrant/shared/lighttpd.conf &
