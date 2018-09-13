# install diesel and genesis via pip
# if you want to modify the code, clone the repos and install them into 
# your python environment using `pip install .`
pip install git+git://github.com/mrmechko/diesel-python

# genesis automatically installs spacy and a language model among other things
pip install git+git://github.com/mrmechko/genesis

python -m spacy download en

# download the flaming-tyrion repo which houses the ontology XML files
# this repo is updated weekly

git clone http://github.com/mrmechko/flaming-tyrion

git clone http://github.com/wdebeaum/step

# set the paths for genesis.  Parser isn't installed, so only use the remote one
echo export tripsParserRemote=trips.ihmc.us/parser >> .bash_profile

# this path should point to whatever directory you cloned flaming-tyrion to
# in this case we clone it to the home directory for vagrant.
echo export tripsXMLPath=/home/vagrant/flaming-tyrion >> .bash_profile
echo export TRIPS_BASE_PATH=/home/vagrant/step >> .bash_profile



