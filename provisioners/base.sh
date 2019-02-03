#!/bin/bash

# ensure shared is in a clean state
rm -rf /home/vagrant/shared/step
rm -rf /home/vagrant/shared/flaming-tyrion

# update apt-get
apt-get update

# install the dependencies for pyenv
apt-get install -y git make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python3-dev expect


