root = File.absolute_path(File.dirname(__FILE__))
file_cache_path  "/root/chef-solo/chef-repo/temp/chef-cache"
file_backup_path  "/root/chef-solo/chef-repo/temp/chef-backup"
cookbook_path     [ "/root/chef-solo/chef-repo/cookbooks" ]
data_bag__path     "/root/chef-solo/chef-repo/data_bags/"
node_name         "ec2-35-153-179-5.compute-1.amazonaws.com"
log_level         :info
verbose_logging   true

