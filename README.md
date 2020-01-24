# Wazuh Ruby Client

A Ruby client for the wazuh APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wazuh-ruby-client'
```

## Usage

```ruby
Wazuh.configure do |config|
  config.endpoint = "https://wazuh.local:55000"
  config.basic_user = "foo"
  config.basic_password = "bar"
  config.verify_ssl = false
end

client = Wazuh::Client.new
client.all_agents
# => {"error"=>0, "data"=>{"items"=>[{"os"=>{"arch"=>"x86_64", "codename"=>"Xenial Xerus", "major"=>"16", "minor"=>"04", "name"=>"Ubuntu", "platform"=>"ubuntu", "uname"=>"Linux |wazuh-manager-master-0 |4.14.138+ |#1 SMP Tue Sep 3 02:58:08 PDT 2019 |x86_64", "version"=>"16.04.6 LTS"}, "status"=>"Active", "name"=>"wazuh-manager-master-0", "registerIP"=>"127.0.0.1", "manager"=>"wazuh-manager-master-0", "dateAdd"=>"2020-01-07 16:13:05", "ip"=>"127.0.0.1", "node_name"=>"wazuh-manager-master", "version"=>"Wazuh v3.11.1", "lastKeepAlive"=>"9999-12-31 23:59:59", "id"=>"000"}], "totalItems"=>1}}
```

### Authorization

Set `basic_user` and `basic_password` for basic authentication.  
If you using self-signed certificate, `verify_ssl` must be set to `false` .

```ruby
Wazuh.configure do |config|
  config.endpoint = "https://wazuh.local:55000"
  config.basic_user = "foo"
  config.basic_password = "bar"
  config.verify_ssl = false
end
```

If you are using client certificate authentication, set `client_key` and `client_cert` .

```ruby
require 'openssl'

Wazuh.configure do |config|
  config.endpoint = "https://wazuh.local:55000"
  config.client_key = OpenSSL::PKey::RSA.new(File.read("./wazuh.key"))
  config.client_cert = OpenSSL::X509::Certificate.new(File.read("./wazuh.crt"))
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrtc0/wazuh-ruby-client.
