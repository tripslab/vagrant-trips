# install diesel and genesis via pip
# if you want to modify the code, clone the repos and install them into 
# your python environment using `pip install .`
pip install git+git://github.com/mrmechko/diesel

# genesis automatically installs spacy and a language model among other things
pip install git+git://github.com/mrmechko/genesis

# download the flaming-tyrion repo which houses the ontology XML files
# this repo is updated weekly

git clone http://github.com/mrmechko/flaming-tyrion

# set the paths for genesis.  Parser isn't installed
echo export tripsParserRemote=trips.ihmc.us/parser >> .bash_profile
echo export tripsXMLPath=/home/vagrant/flaming-tyrion >> .bash_profile
