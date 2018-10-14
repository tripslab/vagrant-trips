# code dependencies

# install java8
sudo apt-get install -y openjdk-8-jdk


# sbcl cvs ruby sqlite graphviz
sudo apt-get install -y sbcl cvs ruby libdbd-sqlite3-perl graphviz unzip

# data dependencies
TRIPSDEP=/home/vagrant/tripsdep

mkdir -p $TRIPSDEP


DEPURL="http://github.com/mrmechko/vagrant-trips/releases/download/0.0.1/tripsDependencies.zip"

if [ ! -f $TRIPSDEP/dependencies.zip ]; then
	curl -L $DEPURL > $TRIPSDEP/dependencies.zip
fi

echo "export TRIPSDEP=$TRIPSDEP" >> /home/vagrant/.bash_profile

cd $TRIPSDEP
unzip dependencies.zip

# symlink things to the right place

cd tripsDependencies
sudo chmod +x install.sh

./install.sh

## if we need glosstags, they should go in ...nltk_data/corpora/glosstags/
#function getgloss {
#  # go to the destination
#  pushd /home/vagrant/nltk_data/corpora/
#  # get the data
#  wget "http://wordnetcode.princeton.edu/glosstag-files/WordNet-3.0-glosstag.tar.bz2"
#  # untar
#  tar xvf WordNet-3.0-glosstag.tar.bz2
#  # put it in the right relative position
#  mv WordNet-3.0/glosstag glosstag
#  # cleanup
#  rm -r WordNet-3.0
#  # go back to calling location
#  popd
#}
#
## geonames
#function getgeonames {
#  GEONAMES=$TRIPSDEP/geonames/2016-06-01
#  mkdir -p $GEONAMES
#  wget "http://geonames.usgs/gov/docs/stategaz/NationalFile_20160601.zip" -O $GEONAMES/NationalFile.zip
#}
