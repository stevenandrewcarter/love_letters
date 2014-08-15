# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'
  config.vm.network :forwarded_port, guest: 3000, host: 3000 # forward the default rails port
  config.omnibus.chef_version = :latest

  # Use Chef Solo to provision our virtual machine
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "nodejs"
    chef.add_recipe "ruby_build"
    chef.add_recipe "rbenv::user"
    chef.add_recipe "rbenv::vagrant"

    # Install Ruby 2.1.2 and Bundler
    # Set an empty root password for MySQL to make things simple
    chef.json = {
        rbenv: {
            user_installs: [{
                                user: 'vagrant',
                                rubies: ["2.1.2"],
                                global: "2.1.2",
                                gems: {
                                    "2.1.2" => [
                                        { name: "bundler" }
                                    ]
                                }
                            }]
        }
    }
  end
end
