Welcome to my build project
===============================

This project sets up and configures a server/machine via puppet (its mainly built for private and includes packages and services for me, but may be useful to others).

Running the puppet scripts for a server is split in two
 * Setting up the platform, is the server.pp script
 * Optional, installing Ruby 1.9.3 and Rails 3.1, using the installruby.pp (thanks to Brandon Turner, https://github.com/blt04/puppet-rvm)

    $ ./run_puppet.sh server
    $ ./run_puppet.sh installruby

## Development of this project & Getting Started
 * Install Ubuntu (12.04)
 * Install git using, sudo apt-get install git-core
 * Add your SSH key to the OS and test it using, ssh -T git@github.com
 * Clone this build project, git clone git@github.com:libster/build.git
 * Edit and make changes as normal to the scripts (see below on how to best test them)

## Testing this project
 * Assuming you have done the above
 * Download and install VirtualBox from https://www.virtualbox.org/wiki/Downloads and use version 4.1.14 (or more)
 * Download and install Vagrant from http://vagrantup.com/
 * Download and add a Vagrant Ubuntu box and call it 'ubuntu-test-server'
 * Vagrant setup steps:

    $ cd /path/to/project
    $ vagrant up
    $ vagrant ssh
    $ cd /vagrant

 * (Make sure you update/upgrade the packages, sudo apt-get update and sudo apt-get upgrade)
 * Install puppet (a fresh Vagrant box won't have puppet) using, sudo apt-get install puppet
 * Execute your puppet build that you want to test, (where file is your puupet script) ./run_puppet [file]
 * You can exit from the VM by typing, exit
 * To stop the vagrant VM type, vagrant halt

* you don't have to exit or halt each time you do a script change, the VM works in tandem with your project folder as a shared folder between your Vagrant VM and your host PC/system.

## Vagrant tips
vagrant up
  Starts the VM

vagrant ssh
  Starts an ssh session with the VM, use cd /vagrant to get to your project folder

vagrant status
  Shows the current status of the VM, eg running
 
vagrant box list
  Shows the list of boxes (VM's) available for use with vagrant
 
vagrant destroy
  Destroys the VM, deletes it from VirtualBox's list. Useful if you want to restart with a fresh environment, simply use the vagrant up command to create a new environment (there will be a small wait while VirutalBox recreates the VM)

