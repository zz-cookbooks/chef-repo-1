Overview
========

Folders under this directory are typically mounted by Virtual Machines.
This gives you local access to directory content on the virtual machine.
Typically this used during development and QA phases, rather than in
production.

Example:
========
In Vagrantfile you might have

    @root_path = File.dirname(File.absolute_path(__FILE__))
    config..vm.share_folder( "chef-client-etc", "/etc/chef", @root_path + /mnt/etc )


References
==========
For Vagrant see:

http://vagrantup.com/docs/vagrantfile.html


