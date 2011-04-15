This directory is for Chef Knife and personal-private key files (.pem).

In the default knife file, values are set from environment variables:

    ENV['CHEF_USER'] || ENV['OPSCODE_USER'] || ENV['USER'] || `whoami`
    ENV['CHEF_ORGNAME'] || 'Private'
    ENV['CHEF_EMAIL'] || "#{user}@google.com"

##Amazon Web Services

    ENV['AWS_ACCESS_KEY']
    ENV['AWS_SECRET_KEY']

##Rackspace

    ENV['RS_API_KEY']
    ENV['RS_API_USERNAME']

##Slicehost

    ENV['SH_PASSWORD']

##Terremark

    ENV['TM_PASSWORD']
    ENV['TM_USERNAME']
    ENV['TM_SERVICE']

##References:

For more information see:

http://wiki.opscode.com/display/chef/Knife
http://help.opscode.com/kb/chefbasics/knife
http://help.opscode.com/kb/start/2-setting-up-your-user-environment
http://help.opscode.com/discussions/questions/246-best-practices-for-multiple-developers-kniferb-in-chef-repo-or-not
