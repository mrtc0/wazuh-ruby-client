# Wazuh Ruby Client

A Ruby client for the wazuh APIs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wazuh-ruby-client'
```

## Usage

```
require 'openssl'

Wazuh.configure do |config|
  config.endpoint = "https://wazuh.local:55000"
  config.client_key = OpenSSL::PKey::RSA.new(File.read("./wazuh.key"))
  config.client_cert = OpenSSL::X509::Certificate.new(File.read("./wazuh.crt"))
end

client = Wazuh::Client.new
client.all_agents
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrtc0/wazuh-ruby-client.
