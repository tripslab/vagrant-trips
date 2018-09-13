#!/bin/bash

if [ -f .jupyter_mode && "$(cat /vagrant/home/.jupyter_mode)" == "enabled" ]
then
	cd /base/notebooks
	jupyter notebook --ip=0.0.0.0
else
	echo "Jupyter mode is disabled.  run \'echo enabled > /vagrant/home/.jupyter_mode\' to enable"
fi
