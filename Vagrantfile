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
  config.vm.network :forwarded_port, guest: 3000, host: 3000  # forward the default rails port
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = %w(chef/cookbooks chef/site-cookbooks)
    chef.roles_path     = [[:host, 'chef/roles']]

    chef.add_role 'rails-dev'
    chef.json = {
        "rbenv" => {
            "global" => "2.0.0-p247",
            "rubies" => ["2.0.0-p247"],
            "gems" => {
                "2.0.0-p247" => [
                    { "name" => "bundler" }
                ]
            }
        }
    }
  end
end
