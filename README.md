# vagrant-trips

Contained within is a base system configuration for using the TRIPS-STEP parser.

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


## WebParser

To run the webparser:

```
> vagrant up --configure-with=server
```

The web parser should now be available at http://0.0.0.0:8081/cgi/step.  You can change the port in `config.json`

## Reinstalling/updating STEP

```
> cd vagrant-trips
> scripts/reset.sh
```
