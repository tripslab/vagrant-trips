#!/bin/bash

if [ ! -e /home/vagrant/.jupyter_mode ] 
then
	echo "Jupyter mode is disabled.  Run \'echo enabled > /vagrant/home/.jupyter_mode\' to enable"
	echo "You may have to set a password using \'vagrant --jupyter-password=password up\'"
	exit
elif [[ -f /home/vagrant/.jupyter_mode && "$(cat /home/vagrant/.jupyter_mode)" == "enabled" ]]
then
	cd /home/vagrant/shared/notebooks
	jupyter notebook --ip=0.0.0.0
else
	echo "Jupyter mode is disabled.  Run \'echo enabled > /vagrant/home/.jupyter_mode\' to enable"
	echo "You may have to set a password using \'vagrant --jupyter-password=password up\'"
fi
