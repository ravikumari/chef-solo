#
# Cookbook Name:: fmw_wls
# Resource:: wls
#
# Copyright 2015 Oracle. All Rights Reserved
#
provides :fmw_wls_wls, os: 'windows'

# Installs WebLogic 11g,12c on a Linux host
actions :install

# Make create the default action
default_action :install

# WebLogic Version
attribute :version, kind_of: String, required: true
# Middleware home folder
attribute :middleware_home_dir, kind_of: String, required: true, name_attribute: true
# Java home folder
attribute :java_home_dir, kind_of: String, required: true
# Linux WebLogic source file, it should be a file with .jar as extension.
attribute :source_file,   kind_of: String, required: true, callbacks:
          {
            'source should have a valid WebLogic extension' => ->(extensions) { Chef::ResourceResolver.resolve('fmw_wls_wls_windows').validate_source_file(extensions) }
          }
# Full path of OraInventory directory
attribute :ora_inventory_dir, kind_of: String, required: true
# tmp folder
attribute :tmp_dir, kind_of: String, required: true
# infra|wls WebLogic or WebLogic Infra installation
attribute :install_type, kind_of: String, required: true

state_attrs :java_home_dir, :middleware_home_dir, :version, :ora_inventory_dir, :tmp_dir

attr_accessor :exists

VALID_WLS_EXTENSIONS =
  ['.jar']

private

def self.validate_source_file(extensions)
  VALID_WLS_EXTENSIONS.any? { |word| extensions.end_with?(word) }
end
