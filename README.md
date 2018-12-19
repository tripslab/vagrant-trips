# Vagrant-diesel

Contained within is a base system configuration for using the diesel-python
library.  

## Vagrant

If you want to run it in a virtual machine, all you have to do is
ensure [vagrant](https://www.vagrantup.com) and [VirtualBox](https://www.virtualbox.org)
are installed and run `vagrant up`.  There are a variety of configuration options in `config.json`.
Most importantly, if you don't want to set up TRIPS completely, set `install_trips: false`.

The virtual machine will set itself up, and when it is ready, you can `ssh` in and
use the machine as you wish.  Any files in `./shared` will be shared between the
VM and your machine so you don't have to develop over `ssh`.

**Note** if the `vagrant up` command fails for any reason, make sure to reset `./shared` to a clean state
before trying again.  That means removing `./shared/flaming-tyrion` and `./shared/step`.  If you made changes
to `step` and need to reprovision the machine, comment out the line in `./provisioners/diesel.sh` which clones
the repo.  If this becomes a problem, I'll figure out a way to configure the machine without having to mess with
`step`.

## Jupyter

If you start `jupyter` from inside the vagrant machine, the page will be available at `0.0.0.0:1337/tree` in your browser.  However, you might have to copy paste the link from inside the vagrant machine for authentication.  It is a little cumbersome.

If you need to change the port for jupyter, `vagrant halt` to spin the machine down and edit `jupyter_port` and then bring it back online with `vagrant up`.

I will put a few sample notebooks in a subfolder demonstrating any functionality you might have questions about.
If you are not using vagrant, follow the instructions for local install and copy the notebooks.

**nb**: Vagrant machine takes at least 2 gigs of ram, which might make things
a little difficult if you don't have a powerful machine.

## Native

If you want to install everything natively, look in `./provisioners/diesel.sh`
for step by step instructions to install and configure 
[diesel](http://www.github.com/mrmechko/diesel-python) and [genesis](http://github.com/mrmechko/genesis).
I recommend using a virtual environment for python.  I use [pyenv](http://github.com/pyenv/pyenv).

genesis additionally depends on [spacy](http://spacy.io) which is really useful for quickly preparing free text
for various types of NLP processing.

## Points of interest

* `/home/vagrant/step/src/OntologyManager/Data/LFdata` contains the original lisp files for the ontology
* `/home/vagrant/step/src/LexiconManager/Data/new` contains the original lisp files for the lexicon
* `/home/vagrant/step/src/LexiconManager/Data/templates` contains the original lisp files for the templates

## TRIPS

TRIPS is now automagically installed.  Disable the full installation by setting `install_trips: false` in `config.json`
