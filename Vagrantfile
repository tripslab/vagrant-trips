require 'json'

if File.file? "config.json"
  params = JSON.parse(File.read("config.json"))
end


# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/bionic64"
  config.vm.define params["name"] || "diesel"
  config.vm.hostname = params["name"] || "diesel"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  j_port = params["jupyter_port"] || 1337
  t_port = params["trips_port"] || 6200
  d_port = params["webparser_port"] || 8081

  config.vm.network "forwarded_port", guest: 8888, host: j_port
  config.vm.network "forwarded_port", guest: 6200, host: t_port
  config.vm.network "forwarded_port", guest: 11235, host: d_port

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "shared", "/home/vagrant/shared"
  config.ssh.forward_agent = true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = params["memory"] || "2048"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELLo

  config.vm.provision "clean", type: "shell", path: "provisioners/clean.sh", run: "never"

  config.vm.provision "base", type: "shell", path: "provisioners/base.sh"
  config.vm.provision "python", type: "shell", path: "provisioners/python.sh", privileged: false
  # install sbcl from binary instead of apt-get
  config.vm.provision "diesel", type: "shell", path: "provisioners/diesel.sh", privileged: false, run: "once", args: params["step_repo"]
  config.vm.provision "jupyter", type: "shell", path: "provisioners/jupyter.sh", privileged: false, run: "never"

  # restore from a failed trips installation
  config.vm.provision "restore", type: "shell", path: "provisioners/restore.sh", privileged: false, run: "never"

  # install trips if that's the default
  if params["install_trips"] == true
    config.vm.provision "sbcl-auto", type: "shell", path: "provisioners/trips/sbcl.sh", privileged: false, run: "once", args: params["sbcl"] || ""
    config.vm.provision "trips-dependencies-auto", type: "shell", path: "provisioners/trips/dependencies-trips.sh", privileged: false, run: "once"
    config.vm.provision "trips-configure-auto", type: "shell", path: "provisioners/trips/configure-trips.sh", privileged: false, run: "once"
  end

  # leave provisioners to install trips otherwise
  config.vm.provision "sbcl", type: "shell", path: "provisioners/trips/sbcl.sh", privileged: false, run: "never", args: params["sbcl"] || ""
  config.vm.provision "trips-dependencies", type: "shell", path: "provisioners/trips/dependencies-trips.sh", privileged: false, run: "never", args: "nolink"
  config.vm.provision "trips-dependencies-link", type: "shell", path: "provisioners/trips/dependencies-trips.sh", privileged: false, run: "never"
  config.vm.provision "trips-configure", type: "shell", path: "provisioners/trips/configure-trips.sh", privileged: false, run: "never"

  # run WebParser
  config.vm.provision "server", type: "shell", run: "never", privileged: false,  inline: '/home/vagrant/shared/run_lighttpd.sh'
  config.vm.provision "recompile", type: "shell", run: "never", privileged: false,  inline: 'cd /home/vagrant/shared/step/src && make && make install && sleep 10'

  if params["start_by_default"] == "jupyter"
    config.vm.provision "jupyter-default", type: "shell", path: "provisioners/jupyter.sh", privileged: false, run: "always"
  end

end
