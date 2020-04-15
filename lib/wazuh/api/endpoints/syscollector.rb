module Wazuh
  module Api
    module Endpoints
      module Syscollector
        #
        # Returns the agent’s hardware info.
        #
        # @param [String] agent_id
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-hardware-info
        def hardware(agent_id, options = {})
          get "/syscollector/#{agent_id}/hardware", options
        end

        # Returns the agent’s network address info.
        #
        # @param [String] agent_id
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
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-network-address-info-of-an-agent
        def netaddr(agent_id, options = {})
          offset_request('get', "/syscollector/#{agent_id}/netaddr", options)
        end

        # Returns the agent’s network interface info
        #
        # @param [String] agent_id
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
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-network-interface-info-of-an-agent
        def netiface(agent_id, options = {})
          offset_request('get', "/syscollector/#{agent_id}/netiface", options)
        end

        # Returns the agent’s network protocol info.
        #
        # @param [String] agent_id
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
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-network-protocol-info-of-an-agent
        def netproto(agent_id, options = {})
          offset_request('get', "/syscollector/#{agent_id}/netproto", options)
        end

        # Returns the agent’s OS info.
        #
        # @param [String] agent_id
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-os-info
        def os(agent_id, options = {})
          get "/syscollector/#{agent_id}/os", options
        end

        # Returns the agent’s packages info.
        #
        # @param [String] agent_id
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
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-packages-info
        def packages(agent_id, options = {})
          offset_request('get', "/syscollector/#{agent_id}/packages", options)
        end

        # Get ports info of an agent
        # Returns the agent’s ports info.
        #
        # @param [String] agent_id
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
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-ports-info-of-an-agent
        def ports(agent_id, options = {})
          offset_request('get', "/syscollector/#{agent_id}/ports", options)
        end

        # Get processes info
        # Returns the agent's processes info.
        #
        # @param [String] agent_id
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
        # 
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-processes-info
        def processes(agent_id, options = {})
          offset_request('get', "/syscollector/#{agent_id}/processes", options)
        end
      end
    end
  end
end
