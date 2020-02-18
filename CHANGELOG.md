# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

## [0.2.3] - 2019-02-18

- Added some methods for agents and groups
  - `delete_agent()`
  - `agent_config()`
  - `delete_agent_by_group()`
  - `agent_sync_status()`
  - `add_agents_to_group()`
  - `add_agent_to_group()`
  - `create_group()`
  - `get_file_in_group()`
  - `agents_by_group()`
  - `agents_by_no_group()`
  - `group_configuration()`
  - `group_files()`
  - `groups()`
  - `update_group_ossec_configuration()`
  - `remove_agent_of_group()`
  - `remvoe_agents_of_group()`
  - `remove_all_agent_of_group()`
  - `remove_group()`
  - `agent_os_summary()`
  - `agent_summary()`

## [0.2.2] - 2019-02-18

- Added options to `syscheck_files()`

## [0.2.1] - 2019-02-10

- Fix `syscheck_files()` duplicated and confused

## [0.2.0] - 2019-02-03

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

