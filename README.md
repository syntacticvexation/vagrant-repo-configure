vagrant-repo-configure plugin
===============================

Currently limited to apt based systems, this plugin clears then adds repo lines to your repo file (/etc/apt/sources.list).

While this task can be completed via a shell, puppet or other provisioner, this plugin allows you to configure your repos on a per machine basis.

# How to install
1. run `vagrant plugin install vagrant-repo-configure`
2. Add a line such as config.repos.add 'deb http://host/debian distribution section1 section2 section3'
3. `vagrant up`
