#!/bin/bash
cat /home/vagrant/.jupyter_mode

if [ ! -e /home/vagrant/.jupyter_mode ] 
then
	echo "Jupyter mode is disabled.  Run \'echo enabled > /vagrant/home/.jupyter_mode\' to enable"
	exit
elif [[ -f /home/vagrant/.jupyter_mode && "$(cat /home/vagrant/.jupyter_mode)" == "enabled" ]]
then
	cd /home/vagrant/shared/notebooks
	jupyter notebook --ip=0.0.0.0
else
	echo "Jupyter mode is disabled.  Run \'echo enabled > /vagrant/home/.jupyter_mode\' to enable"
fi
