current_dir = File.dirname(__FILE__)
user = ENV['CHEF_USER'] || ENV['OPSCODE_USER'] || ENV['USER']||`whoami`
org = ENV['CHEF_ORGNAME'] || 'Private'
email =  ENV['CHEF_EMAIL'] || "#{user}@google.com"

log_level                :info
log_location             $stdout
node_name                user
client_key               "#{ENV['HOME']}/.chef/#{user}.pem"
validation_client_name   "#{org}-validator"
validation_key           "#{ENV['HOME']}/.chef/#{org}-validator.pem"
chef_server_url          ENV['CHEF_URL']||"https://api.opscode.com/organizations/#{org}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks", "#{current_dir}/../site-cookbooks"]
cookbook_copyright org
cookbook_license "apachev2"
cookbook_email email

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
