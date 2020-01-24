module Wazuh
  module APi
    module Endpoints
      module Syscollector
        #
        # Returns the agent’s hardware info.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-hardware-info
        def hardware(options = {})
          get "/syscollector/#{options[:agent_id]}/hardware", options
        end

        # Returns the agent’s network address info.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-network-address-info-of-an-agent
        def netaddr(options = {})
          get "/syscollector/#{options[:agent_id]}/netaddr", options
        end

        # Returns the agent’s network interface info
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-network-interface-info-of-an-agent
        def netiface(options = {})
          get "/syscollector/#{options[:agent_id]}/netiface", options
        end

        # Returns the agent’s network protocol info.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-network-protocol-info-of-an-agent
        def netproto(options = {})
          get "/syscollector/#{options[:agent_id]}/netproto", options
        end

        # Returns the agent’s OS info.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-os-info
        def os(options = {})
          get "/syscollector/#{options[:agent_id]}/os", options
        end

        # Returns the agent’s packages info.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-packages-info
        def packages(options = {})
          get "/syscollector/#{options[:agent_id]}/packages", options
        end

        # Returns the agent’s ports info.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-ports-info-of-an-agent
        def ports(options = {})
          get "/syscollector/#{options[:agent_id]}/ports", options
        end

        # Returns the agent's processes info.
        #
        # https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-processes-info
        def processes(options = {})
          get "/syscollector/#{options[:agent_id]}/processes", options
        end
      end
    end
  end
end
