# Vagrant.configure("2") do |config|
#   config.vm.box = "ubuntu/jammy64"
#   config.vm.provider "virtualbox" do |vb|
#     vb.memory = "4096"
#   end
#   # Set up port forwarding from guest to host
#   config.vm.network "forwarded_port", guest: 3000, host: 3000

#   # Mount the current directory to /from-host inside the VM
#   config.vm.synced_folder ".", "/from-host"
# end

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end

  # Set up port forwarding from guest to host
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Mount the current directory to ~/from-host inside the VM
  config.vm.synced_folder ".", "/home/vagrant/from-host"

  # Provisioning section
  config.vm.provision "shell", inline: <<-SHELL
    # Update package list and install necessary packages
    sudo apt-get update
    sudo apt-get install -y build-essential libyaml-dev git curl

    # Install rbenv and ruby-build
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-installer | bash

    # Add rbenv to PATH
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    source ~/.bashrc

    # Install Ruby 3.1.3
    rbenv install 3.1.3
    rbenv global 3.1.3

    # Install Bundler
    gem install bundler

    # Install Rails 7.0.4
    gem install rails -v 7.0.4

    # Rehash rbenv to update shims
    rbenv rehash

    # Verify installations
    ruby -v
    rails -v

    # Any other commands you want to run
    cd /home/vagrant/from-host
    if [ ! -d "demo" ]; then
      rails new demo
    fi
  SHELL
end

