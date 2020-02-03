# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

### Adds

- `Wazuh::Client#delete_agent`
- `Wazuh::Client#syscheck_files`

### Changed

- `Wazuh::Client#cdb_files` rename to `Wazuh::Client#cdb_files_path`
- Using sawyer instead of faraday for http client.
  - This can the return vaule to be handle like an object.

```ruby
> agents = client.all_agents
> agents.class
=> Array
> agent = agents.first
> agent.id
=> "000"
> agent.os.arch
=> "x86_64"
```

