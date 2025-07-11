
# Rails 7 with Sam Ruby Vagrant Project

This project sets up a development environment for a Ruby on Rails application using Vagrant. It automates the installation of necessary packages, Ruby, and Rails, allowing you to quickly get started with development.

## Prerequisites

Before you begin, ensure you have the following installed on your host machine:

- [Vagrant](https://www.vagrantup.com/downloads)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Getting Started

To set up the development environment, follow these steps:

1. **Clone the Repository**

   Clone this repository to your local machine:

   ```bash
   git clone <repository-url>
   cd rails-7-with-sam-ruby
   ```

2. Start the Vagrant Environment
run `vagrant up`

```
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

# Create a new Rails application if it doesn't exist
cd /home/vagrant/from-host
if [ ! -d "demo" ]; then
  rails new demo
fi

```

3. Stopping the Vagrant Environment

When you are done working, you can stop the Vagrant environment by running: `vagrant halt` you will be able to resume work next time with `vagrant up` again

