module Wazuh
  module Api
    module Endpoints
      module Experimental
        # These methods are experimental API wrapper and
        # requires `experimental_*` prefix.

        #
        # Clear syscheck database
        # Clears the syscheck database for all agents.
        #
        def experimental_clear_syscheck_database
          delete '/experimental/syscheck'
        end

        # Get hardware info of all agents
        # Returns the agent’s hardware info.
        #
        # @option options [agent_id] :agent_id
        #   Agent ID
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [ram_free] :ram_free
        #   Filters by ram_free.
        # @option options [ram_total] :ram_total
        #   Filters by ram_total.
        # @option options [cpu_cores] :cpu_cores
        #   Filters by cpu_cores.
        # @option options [cpu_mhz] :cpu_mhz
        #   Filters by cpu_mhz.
        # @option options [cpu_name] :cpu_name
        #   Filters by cpu_name.
        # @option options [board_serial] :board_serial
        #   Filters by board_serial.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-hardware-info-of-all-agents
        def experimental_hardware(options = {})
          offset_request('get', '/experimental/syscollector/hardware', options)
        end

        # Get network address info of all agents
        # Returns the agent’s network address info.
        #
        # @option options [agent_id] :agent_id
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [iface] :iface
        #   Filters by interface name.
        # @option options [proto] :proto
        #   Filters by proto.
        # @option options [address] :address
        #   Filters by address.
        # @option options [broadcast] :broadcast
        #   Filters by broadcast.
        # @option options [netmask] :netmask
        #   Filters by netmask.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-network-address-info-of-all-agents
        def experimental_netaddr(options = {})
          offset_request('get', '/experimental/syscollector/netaddr', options)
        end

        # Get network interface info of all agents
        # Returns the agent’s network interface info.
        #
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [name] :name
        #   Filters by name.
        # @option options [adapter] :adapter
        #   Filters by adapter.
        # @option options [type] :type
        #   Filters by type.
        # @option options [state] :state
        #   Filters by state.
        # @option options [mtu] :mtu
        #   Filters by mtu.
        # @option options [tx_packets] :tx_packets
        # @option options [rx_packets] :rx_packets
        # @option options [tx_bytes] :tx_bytes
        # @option options [rx_bytes] :rx_bytes
        # @option options [tx_errors] :tx_errors
        # @option options [rx_errors] :rx_errors
        # @option options [tx_dropped] :tx_dropped
        # @option options [rx_dropped] :rx_dropped
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-network-interface-info-of-all-agents
        def experimental_netiface(options = {})
          offset_request('get', '/experimental/syscollector/netiface', options)
        end

        # Get network protocol info of all agents
        # Returns the agent’s network protocol info.
        #
        # @option options [agent_id] :agent_id
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [iface] :iface
        #   Filters by interface name.
        # @option options [type] :type
        #   Filters by type.
        # @option options [gateway] :gateway
        #   Filters by gateway.
        # @option options [dhcp] :dhcp
        #   Filters by dhcp.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-network-protocol-info-of-all-agents
        def experimental_netproto(options = {})
          offset_request('get', '/experimental/syscollector/netproto', options)
        end

        # Get os info of all agents
        # Returns the agent’s os info.
        #
        # @option options [agent_id] :agent_id
        #   ID to agent
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [os_name] :os_name
        #   Filters by os_name.
        # @option options [architecture] :architecture
        #   Filters by architecture.
        # @option options [os_version] :os_version
        #   Filters by os_version.
        # @option options [version] :version
        #   Filters by version.
        # @option options [release] :release
        #   Filters by release.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-os-info-of-all-agents
        def experimental_os(options = {})
          offset_request('get', '/experimentalsyscollector/os', options)
        end

        # Get packages info of all agents
        # Returns the agent’s packages info.
        #
        # @option options [agent_id] :agent_id
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [vendor] :vendor
        #   Filters by vendor.
        # @option options [name] :name
        #   Filters by name.
        # @option options [architecture] :architecture
        #   Filters by architecture.
        # @option options [format] :format
        #   Filters by format.
        # @option options [version] :version
        #   Filters by format.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-packages-info-of-all-agents
        def experimental_packages(options = {})
          offset_request('get', '/experimental/syscollector/packages', options)
        end

        # Get ports info of all agents
        # Returns the agent’s ports info.
        #
        # @option options [agent_id] :agent_id
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [pid] :pid
        #   Filters by pid.
        # @option options [protocol] :protocol
        #   Filters by protocol.
        # @option options [local_ip] :local_ip
        #   Filters by local_ip.
        # @option options [local_port] :local_port
        #   Filters by local_port.
        # @option options [remote_ip] :remote_ip
        #   Filters by remote_ip.
        # @option options [tx_queue] :tx_queue
        #   Filters by tx_queue.
        # @option options [state] :state
        #   Filters by state.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-ports-info-of-all-agents
        def experimental_ports(options = {})
          offset_request('get', '/experimental/syscollector/ports', options)
        end

        # Get processes info of all agents
        # Returns the agent’s processes info.
        #
        # @option options [agent_id] :agent_id
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [pid] :pid
        #   Filters by pid.
        # @option options [state] :state
        #   Filters by process state.
        # @option options [ppid] :ppid
        #   Filters by process parent pid.
        # @option options [egroup] :egroup
        #   Filters by process egroup.
        # @option options [euser] :euser
        #   Filters by process euser.
        # @option options [fgroup] :fgroup
        #   Filters by process fgroup.
        # @option options [name] :name
        #   Filters by process name.
        # @option options [nlwp] :nlwp
        #   Filters by process nlwp.
        # @option options [pgrp] :pgrp
        #   Filters by process pgrp.
        # @option options [priority] :priority
        #   Filters by process priority.
        # @option options [rgroup] :rgroup
        #   Filters by process rgroup.
        # @option options [ruser] :ruser
        #   Filters by process ruser.
        # @option options [sgroup] :sgroup
        #   Filters by process sgroup.
        # @option options [suser] :suser
        #   Filters by process suser.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-processes-info-of-all-agents
        def experimental_processes(options = {})
          offset_request('get', '/experimental/syscollector/processes', options)
        end

        # Get CIS-CAT results
        # Returns the agent’s ciscat results info.
        #
        # @option options [agent_id] :agent_id
        #   ID to agent
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [benchmark] :benchmark
        # @option options [profile] :profile
        # @option options [pass] :pass
        # @option options [fail] :fail
        # @option options [error] :error
        # @option options [notchecked] :notchecked
        # @option options [unknown] :unkown
        # @option options [score] :score
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-cis-cat-results
        def experimental_ciscat_results(options = {})
          offset_request('get', '/experimental/ciscat/results', options)
        end
      end
    end
  end
end
