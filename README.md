# Wazuh Ruby Client

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/mrtc0/wazuh-ruby-client/blob/master/LICENSE.txt)
![](https://github.com/mrtc0/wazuh-ruby-client/workflows/GitHub%20Workflow/badge.svg)
[![Yard Docs](http://img.shields.io/badge/yard-docs-blue.svg)](https://mrtc0.github.io/wazuh-ruby-client)


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

### Global Settings

The following global settings are supported via `Wazuh.configure` .

| setting | description |
|:--------|:------------|
| user_agent | User-Agent |
| ca_file | CA file (if use Client Certificate Authentication and specify CA file) |
| client_cert | Client certificate (if use Client Certificate Authentication) |
| client_key | Client Key (if use Client Certificate Authentication) |
| basic_user | Basic Authentication user name |
| basic_password | Basic Authentication password |
| verify_ssl | Skip the SSL/TLS verify |
| logger | loggeer object |
| endpoint | Wazuh API endpoint URL |


### Agents

Get all agents list.

```ruby
> client.all_agents
=> [
      {
        :os=>{
          :arch=>"x86_64",
          :codename=>"Xenial Xerus",
          :major=>"16",
          :minor=>"04",
          :name=>"Ubuntu",
          :platform=>"ubuntu",
          :uname=>"Linux |wazuh-manager |4.15.0-60-generic |#67-Ubuntu SMP Thu Aug 22 16:55:30 UTC 2019 |x86_64",
          :version=>"16.04.6 LTS"
        },
        :manager=>"wazuh-manager",
        :id=>"000",
        :registerIP=>"127.0.0.1",
        :name=>"wazuh-manager",
        :version=>"Wazuh v3.11.0",
        :ip=>"127.0.0.1",
        :dateAdd=>"2020-01-27 17:02:18",
        :status=>"Active",
        :lastKeepAlive=>"9999-12-31 23:59:59",
        :node_name=>"wazuh-master-1"
      },
      ...
  ]

> agents.first.os.name
=> "Ubuntu"

> agents.first.id
=> "000"
```

filter by options. (see https://mrtc0.github.io/wazuh-ruby-client/Wazuh/Api/Endpoints/Agents.html#all_agents-instance_method )

```ruby
# Filter by status is active
> client.all_agents({ status: 'active' })
# Filter by agent os.name is ubuntu
> client.all_agents({ 'os.name' => 'ubuntu' })
```

### Syscollector

List agent's packages.

```ruby
> client.packages('000').map { |package| package.name }
=> ["python-apt-common",
 "python-idna",
 "libedit2",
 "libncurses5",
 "libpam-runtime",
 "python3.5",
 "libgsasl7",
 "vim-tiny",
 ...
```

List agents' processes.

```ruby
> client.packages('000').map { |package| package.name }
=> ["entrypoint.sh",
 "my_init",
 "syslog-ng",
 "runsvdir",
 "runsv",
 ...
```

### Other

wazuh-ruby-client is support to all Wazuh API.  

- [x] Active Response
- [x] Agents
- [x] Cache
- [x] Ciscat
- [x] Cluster
- [x] Decoders
- [x] Experimental
- [x] Lists
- [x] Manager
- [x] Rootcheck
- [x] Rules
- [x] Security Configuration Assessment
- [x] Summary
- [x] Syscheck
- [x] Syscollector

Refer to the document of wazuh-ruby-client and Wazuh API Reference for the list of all available methods.

- https://mrtc0.github.io/wazuh-ruby-client/Wazuh/Api/Endpoints.html
- https://documentation.wazuh.com/3.10/user-manual/api/reference.html

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrtc0/wazuh-ruby-client.

## Copyright and License

Copyright (c) 2015-2019, [Kohei Morita](https://blog.ssrf.in)

This project is licensed under the [MIT License](https://github.com/mrtc0/wazuh-ruby-client/blob/master/LICENSE) .

