#!/bin/bash
# install pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

cp ~/shared/dotfiles/bash_profile ~/.bash_profile

# reload settings for pyenv
source .bash_profile

# install python 3.5.6 and set it as default
# if you're using pyenv locally, don't set the global version
pyenv install 3.5.6
pyenv global 3.5.6

# Install the jupyter notebook for easier exploration
pip install jupyter
pip install -e git+https://github.com/mrmechko/tripsmodule.git

jupyter notebook --generate-config

mkdir -p /home/vagrant/shared/notebooks/
cp -r ~/shared/dotfiles/jupyter ~/.jupyter

echo "Python configuration success"
