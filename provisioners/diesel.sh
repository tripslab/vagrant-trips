#!/bin/bash

# install diesel and genesis via pip
# if you want to modify the code, clone the repos and install them into 
# your python environment using `pip install .`

pip install --upgrade nltk
python -m nltk.downloader wordnet
python -m nltk.downloader stopwords

#pip install --upgrade git+git://github.com/mrmechko/diesel-python

echo "diesel-python installed"

# genesis automatically installs spacy and a language model among other things
#pip install --upgrade git+git://github.com/mrmechko/genesis

echo "genesis installed"

#python -m spacy download en

echo "spacy installed"

# download the flaming-tyrion repo which houses the ontology XML files
# this repo is updated weekly

#git -C /home/vagrant/shared/flaming-tyrion pull || git clone --depth=1 http://github.com/mrmechko/flaming-tyrion /home/vagrant/shared/flaming-tyrion

echo "flaming-tyrion pulled"

# if step exists we gonna have issues...
if [[ ! -d /home/vagrant/shared/step ]];
then
  	git clone http://github.com/${1-wdebeaum}/step /home/vagrant/shared/step;
else
	pushd /home/vagrant/shared/step
	rm src
	mv TRIPS src
	git pull
	mv src TRIPS
	ln -s TRIPS src
	echo "TRIPS was updated.  Make sure to recompile before you use it again"
fi

echo "step pulled"
