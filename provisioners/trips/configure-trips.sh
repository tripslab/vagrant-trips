#!/bin/bash

DEPPATH="$TRIPSDEP/tripsDependencies"

echo $DEPPATH

CONFIGS="--with-corenlp=$DEPPATH/stanford-corenlp/stanford-corenlp/ --with-ner=$DEPPATH/stanford-ner/stanford-ner/ --with-postagger=$DEPPATH/stanford-postagger/stanford-postagger/ --with-parser=$DEPPATH/stanford-parser/stanford-parser/ --with-geonames=$DEPPATH/geonames/2014-12-02/NationalFile.zip --with-wndb=$DEPPATH/wn.db --with-perl-lib=/home/vagrant/perl5/lib/perl5"

LISP="--with-lisp=sbcl"

# using NLTK's version of wordnet, which means we have to put glosstags in there too
WORDNET="--with-wordnet=/home/vagrant/nltk_data/corpora/wordnet/"


cd /home/vagrant/shared/$SYSTEM_NAME/src

rm -rf config/scala

echo "CLEANING"

# clear out previous compilations
make clean
find . -name '*.fasl' -delete

echo "./configure $LISP $WORDNET $CONFIG"

sleep 5

./configure $LISP $WORDNET $CONFIGS


make && make install

#cd ~/shared/$SYSTEM_NAME/src/WebParser && make && make install
