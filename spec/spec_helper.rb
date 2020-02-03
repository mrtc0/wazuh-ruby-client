$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

require 'rubygems'
require 'rspec'
require 'vcr'
require 'openssl'

require "wazuh_ruby_client"

Dir[File.join(File.dirname(__FILE__), 'support', '**/*.rb')].each do |file|
  require file
end

Wazuh.configure do |config|
  config.endpoint = "https://wazuh.local:55000/"
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.allow_http_connections_when_no_cassette = false
  c.debug_logger = File.open("log","w")
end
