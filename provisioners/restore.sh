#!/bin/bash

# clear $SYSTEM_NAME
rm -rf /home/vagrant/shared/$SYSTEM_NAME

git clone http://github.com/wdebeaum/$SYSTEM_NAME /home/vagrant/shared/$SYSTEM_NAME
