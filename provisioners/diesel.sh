# install diesel and genesis via pip
# if you want to modify the code, clone the repos and install them into 
# your python environment using `pip install .`

pip install --upgrade git+git://github.com/mrmechko/diesel-python

echo "diesel-python installed"

# genesis automatically installs spacy and a language model among other things
pip install --upgrade git+git://github.com/mrmechko/genesis

echo "genesis installed"

python -m spacy download en_core_web_lg

echo "spacy installed"

# download the flaming-tyrion repo which houses the ontology XML files
# this repo is updated weekly

git -C /home/vagrant/shared/flaming-tyrion pull || git clone --depth=1 http://github.com/mrmechko/flaming-tyrion /home/vagrant/shared/flaming-tyrion

echo "flaming-tyrion pulled"

# if step exists we gonna have issues...
if [[ ! -d /home/vagrant/shared/step ]];
then
  	git clone http://github.com/wdebeaum/step /home/vagrant/shared/step;
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

# set the paths for genesis.  Parser isn't installed, so only use the remote one
exporttrips="export tripsParserRemote=trips.ihmc.us/parser"

# this path should point to whatever directory you cloned flaming-tyrion to
# in this case we clone it to the home directory for vagrant.
exporttyrion="export tripsXMLPath=/home/vagrant/shared/flaming-tyrion"
exportstep="export TRIPS_BASE_PATH=/home/vagrant/shared/step"
exportspacy="export SPACY_MODEL=en_core_web_lg"

check() {
	if grep -Fxq $1 ~/.bash_profile
	then
		echo "adding to ~/.bash_profile: $1"
		echo $exporttrips >> ~/.bash_profile
	else:
		echo "already in ~/.bash_profile: $1"
	fi
}

check $exporttyrion
check $exportstep
check $exportspacy

