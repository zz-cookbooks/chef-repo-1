require 'pathname'
current = Pathname(__FILE__)
current_dir = current.dirname
user = ENV['CHEF_USER'] || ENV['OPSCODE_USER'] || ENV['USER'] || `whoami`
ckey = ENV['CHEF_USER'] ? "#{current_dir}/#{user}.pem" : "#{ENV['HOME']}/.chef/#{user}.pem"
org = ENV['CHEF_ORG'] || ENV['OPSCODE_ORG'] || 'chef'
vkey = ENV['CHEF_USER'] ? "#{current_dir}/#{org}-validator.pem" : "#{ENV['HOME']}/.chef/#{org}-validator.pem"
org_url = ENV['CHEF_USER'] ? "http://localhost:4000" : "https://api.opscode.com/organizations/#{org}"
email =  ENV['CHEF_EMAIL'] || ENV['OPSCODE_EMAIL'] || "#{user}@mailinator.com"
log_path = current_dir + '..' + 'log'
log_file = log_path + "client_#{node}.log"

node_name                user
log_level                :debug
log_location             log_file.to_s
verbose_logging          true
client_key               ckey
validation_client_name   "#{org}-validator"
validation_key           vkey
chef_server_url          org_url
cache_type               'BasicFile'
cache_options            :path => (log_path + 'checksums').to_s
cookbook_path            ["#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"]
cookbook_copyright       user
cookbook_license         "apachev2"
cookbook_email           email

# Amazon Web Services:
knife[:aws_access_key_id]     = ENV['AWS_ACCESS_KEY']  if ENV['AWS_ACCESS_KEY']
knife[:aws_secret_access_key] =  ENV['AWS_SECRET_KEY'] if ENV['AWS_SECRET_KEY']

# Rackspace:
knife[:rackspace_api_key]      = ENV['RS_API_KEY']      if ENV['RS_API_KEY']
knife[:rackspace_api_username] = ENV['RS_API_USERNAME'] if ENV['RS_API_USERNAME']

# Slicehost
knife[:slicehost_password] = ENV['SH_PASSWORD'] if ENV['SH_PASSWORD']

# Terremark
knife[:terremark_password] = ENV['TM_PASSWORD'] if ENV['TM_PASSWORD']
knife[:terremark_username] = ENV['TM_USERNAME'] if ENV['TM_USERNAME']
knife[:terremark_service]  = ENV['TM_SERVICE']  if ENV['TM_SERVICE']
