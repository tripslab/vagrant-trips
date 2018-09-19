#!/bin/bash

# configuration

LISP="--with-lisp=sbcl"

# using NLTK's version of wordnet, which means we have to put glosstags in there too
WORDNET="--wordnet-path=/home/vagrant/nltk_data/corpora/wordnet/"

# geonames - why not put it in the nltk directory
GEONAMES="--with-geonames=$TRIPSDEP/geonames/2016-06-01"

WNDB="--with-wndb=$TRIPSDEP/dependencies/wn.db"

cd /home/vagrant/shared/step/src
./configure $LISP $WORDNET 
