## Introduction
> Turbolinks is a way to load more quickly just using markup. It is no longer under development and has been superseeded by the Turbo Framework, which is a part of the hotwire umbrella
[Turbolinks repo](https://github.com/turbolinks/turbolinks/blob/master/README.md)

>Rails is hackable and extensible, check out [Crafting Rails 4 Applications] for more info


## Chapter 1
Installing on linux
Vagran is a system that can manage a virtual computer, virtual box provides that virtual computer. Together they micmic a real computer so you can have a clean, predictable, and isolated env for your project

After installing both of those we can set up a vagrantfile.

```
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
  # Set up port forwarding from guest to host
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Mount the current directory to /from-host inside the VM
  config.vm.synced_folder ".", "/from-host"
end
```

you can then run `vagrant up`
and then `vagrant ssh`

inside vagrant box
`sudo apt-get update`

### installing system software
```
sudo apt-get install -y \
build-essential \
git \
libsqlite3-dev \
redis \
ruby-dev \
tzdata

```
### installing ruby and rails
```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:brightbox/ruby-ng

sudo apt-get upgrade
sudo apt install rbenv
rbenv init
# for me rbenv didnt come with ruby-build
git clone https://github.com/rbenv/ruby-build.git
$(rbenv root)/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc


curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
 rbenv install 3.1.3
 rbenv global 3.1.3
 ruby -v
 gem install rails -v 7.0.4 --no-document # version 7.2.2.1 worked for me , 7/0/4 wasnt able to create the new project

```
> this version of rails and all other gems will stay the same unless you update the Gemfile and then run `bundle install`

we will be using SQlite3 as the database
 (I may need to do something about this, i did no actions on this)

 ## Chapter 2

 We can run the server using:
 ``
 we can generate a controller and a view for the hello and goodbye controllers using
 ``
 we can use ERB inside of the path ()
 <%= @time %> is an example of using an instance variable to pass data from the controller to its corresponding route

 <%= link_to "Goodbye", say_goodbye_path%> is an example of using the link_to helper to help us render the template

 note:
 <% %> without the = causes the code to be run but doesnt insert the result in the page

 ## Chapter 3
