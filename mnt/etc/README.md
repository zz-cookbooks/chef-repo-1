Overview
========

This directory is typically mounted to `/etc/chef/ in a VM.
This gives you local access to the client private key.
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


