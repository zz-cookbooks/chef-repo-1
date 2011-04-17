Overview
========

This directory is typically mounted to `~/chef` in a VM.
This gives you local access to the VM's contents.
Typically this used during development and QA phases, rather than in
production.

Example:
========
In Vagrantfile you might have

    @root_path = File.dirname(File.absolute_path(__FILE__))
    config..vm.share_folder( "chef-client", "~/chef", @root_path + /mnt/chef )


References
==========
For Vagrant see:

http://vagrantup.com/docs/vagrantfile.html


