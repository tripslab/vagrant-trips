#!/bin/bash
cat /home/vagrant/.jupyter_mode

if [[ -f /home/vagrant/.jupyter_mode && "$(cat /home/vagrant/.jupyter_mode)" == "enabled" ]]
then
	cd /home/vagrant/shared/notebooks
	jupyter notebook --ip=0.0.0.0
else
	echo "Jupyter mode is disabled.  run \'echo enabled > /vagrant/home/.jupyter_mode\' to enable"
fi
