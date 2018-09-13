# Vagrant-diesel

Contained within is a base system configuration for using the diesel-python
library.  

## Vagrant

If you want to run it in a virtual machine, all you have to do is
ensure [vagrant](https://www.vagrantup.com) and [VirtualBox](https://www.virtualbox.org)
are installed and run `vagrant up`.

The virtual machine will set itself up, and when it is ready, you can `ssh` in and
use the machine as you wish.  Any files in `./base` will be shared between the
VM and your machine so you don't have to develop over `ssh`.

**nb**: Vagrant machine takes at least 2 gigs of ram, which might make things
a little difficult if you don't have a powerful machine.

## Native

If you want to install everything natively, look in `./provisioners/diesel.sh`
for step by step instructions to install and configure 
[diesel](http://www.github.com/mrmechko/diesel-python) and [genesis](http://github.com/mrmechko/genesis)
I recommend using a virtual environment for python.  I use [pyenv](http://github.com/pyenv/pyenv)
