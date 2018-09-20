# install diesel and genesis via pip
# if you want to modify the code, clone the repos and install them into 
# your python environment using `pip install .`
pip install git+git://github.com/mrmechko/diesel-python

echo "diesel-python installed"

# genesis automatically installs spacy and a language model among other things
pip install git+git://github.com/mrmechko/genesis

echo "genesis installed"

python -m spacy download en

echo "spacy installed"

# download the flaming-tyrion repo which houses the ontology XML files
# this repo is updated weekly

git -C /home/vagrant/shared/flaming-tyrion pull || git clone --depth=1 http://github.com/mrmechko/flaming-tyrion /home/vagrant/shared/flaming-tyrion

echo "flaming-tyrion pulled"

git -C /home/vagrant/shared/step pull || git clone http://github.com/wdebeaum/step /home/vagrant/shared/step

echo "step pulled"

# set the paths for genesis.  Parser isn't installed, so only use the remote one
echo export tripsParserRemote=trips.ihmc.us/parser >> .bash_profile

# this path should point to whatever directory you cloned flaming-tyrion to
# in this case we clone it to the home directory for vagrant.
echo export tripsXMLPath=/home/vagrant/shared/flaming-tyrion >> .bash_profile
echo export TRIPS_BASE_PATH=/home/vagrant/shared/step >> .bash_profile

