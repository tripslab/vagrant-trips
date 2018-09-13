# install pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# configure pyenv
echo export PATH=\"/home/vagrant/.pyenv/bin:\$PATH\" >> .bash_profile
echo eval \"\$\(pyenv init -\)\" >> .bash_profile
echo eval \"\$\(pyenv virtualenv-init -\)\" >> .bash_profile

# reload settings for pyenv
source .bash_profile

# install python 3.5.6 and set it as default
# if you're using pyenv locally, don't set the global version
pyenv install 3.5.6
pyenv global 3.5.6
