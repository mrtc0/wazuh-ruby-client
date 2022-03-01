# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]

Supports v4 Cluster API.

- [Supports v4 Cluster API by mrtc0 · Pull Request #36 · mrtc0/wazuh-ruby-client](https://github.com/mrtc0/wazuh-ruby-client/pull/36)

## [0.3.4]

Support Vulnerability API.

- [Support Vulnerability API by mrtc0 · Pull Request #33 · mrtc0/wazuh-ruby-client](https://github.com/mrtc0/wazuh-ruby-client/pull/33)

## [0.3.3]


## [0.3.2]

Bug fix.

- [Couldn't support proc object in old faraday · mrtc0/wazuh-ruby-client@d601b09](https://github.com/mrtc0/wazuh-ruby-client/commit/d601b090bfa9a74d3fb24d0534ce9f4ac5f454f6)

## [0.3.1]

Bug fix.

- [Base64.encode is included return code #30](https://github.com/mrtc0/wazuh-ruby-client/pull/30)

## [0.3.0]

- Support some v4 API (Thanks @pyama86)

## [0.2.9]

- Adds availability to ignore env proxy settings [#25](https://github.com/mrtc0/wazuh-ruby-client/pull/25). Thanks @falegk
- Add the `ca_file` option to Wazuh.Config to specify a CA file [#26](https://github.com/mrtc0/wazuh-ruby-client/pull/26). Thanks @k1LoW

## [0.2.8]

- fix bug. return with response body.

## [0.2.7]

- Returns `Wazuh::Api::Errors` when an error is returned from a non wazuh api

## [0.2.6]

- Support agent upgrade endpoint
  - `/agents/:agent_id/upgrade_custom`
  - `/agents/:agent_id/upgrade`

## [0.2.5]

- Get all items with `offset_request`
  - So far only 500 items(Wazuh API default) have been retrieved that contain a `totalItems` field such as `#all_agents` .
  - For such an endpoint, implemented `offset_request` to fetch all items.
  - This change does not change the type of the return value. However, it may take some time because it sends repeated requests to get all the items.

## [0.2.4] - 2020-03-31

- `agents_by_group` also returns the `item` field.

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

