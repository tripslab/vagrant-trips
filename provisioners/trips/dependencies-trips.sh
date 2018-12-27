#!/bin/bash
# code dependencies

# install java8
sudo apt-get install -y openjdk-8-jdk


# sbcl cvs ruby sqlite graphviz
sudo apt-get install -y sbcl cvs ruby libdbd-sqlite3-perl graphviz unzip lighttpd

# data dependencies
TRIPSDEP=/home/vagrant/tripsdep

mkdir -p $TRIPSDEP


DEPURL="http://github.com/mrmechko/vagrant-trips/releases/download/0.0.1/tripsDependencies.zip"

if [ ! -f $TRIPSDEP/dependencies.zip ]; then
	curl -L $DEPURL > $TRIPSDEP/dependencies.zip
fi

echo "export TRIPSDEP=$TRIPSDEP" >> /home/vagrant/.bash_profile



# symlink things to the right place
cd $TRIPSDEP
unzip dependencies.zip

cd tripsDependencies

SOURCE=`pwd`

#cj-parser   mesh      stanford-ner    stanford-postagger
#geonames    stanford-corenlp  stanford-parser

#ln -s $SOURCE/tripsDependencies/$f $f

ln -sv $SOURCE/stanford-ner/stanford-ner-2007-11-05 $SOURCE/stanford-ner/stanford-ner
ln -sv $SOURCE/stanford-postagger/stanford-postagger-2008-06-06/ $SOURCE/stanford-postagger/stanford-postagger

ln -sv $SOURCE/stanford-parser/stanford-parser-2007-08-19/ $SOURCE/stanford-parser/stanford-parser
ln -sv $SOURCE/stanford-corenlp/stanford-corenlp-full-2014-06-16/ $SOURCE/stanford-corenlp/stanford-corenlp

cd ~/shared/step/src/config
curl -L "https://github.com/tripslab/vagrant-trips/releases/download/0.0.2/ruby.tar" > ruby.tar
tar xf ruby.tar
rm ruby.tar

cd ~/shared/step/src && git -C /home/vagrant/shared/step/src/SimpleOntology pull || git clone https://github.com/mrmechko/SimpleOntology
cd ~/shared/step/src && git -C /home/vagrant/shared/step/src/SimpleOntology pull || git clone https://github.com/tripslab/WebParser
