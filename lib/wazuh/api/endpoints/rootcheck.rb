module Wazuh
  module Api
    module Endpoints
      module Rootcheck
        #
        # Clear rootcheck database
        # Clears the rootcheck database for all agents.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#clear-rootcheck-database
        def clear_rootcheck_database
          delete '/rootcheck'
        end

        # Clear rootcheck database of an agent
        # Clears the rootcheck database for a specific agent.
        #
        # @param [String] agent_id
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#clear-rootcheck-database-of-an-agent
        def cleak_rootcheck_database_for_agent(agent_id)
          delete "/rootcheck/#{agent_id}"
        end

        # Get last rootcheck scan
        # Returns the timestamp of the last rootcheck scan. 
        #
        # @param [String] agent_id
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-last-rootcheck-scan
        def rootcheck_last_scan(agent_id)
          get "/rootcheck/#{agent_id}/last_scan"
        end

        # Get rootcheck CIS requirements
        # Returns the CIS requirements of all rootchecks of the specified agent.
        #
        # @param [String] agent_id
        # @option options [offset] :offset
        # @option options [limit] :limit
        # @option options [sort] :sort
        # @option options [search] :search
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rootcheck-cis-requirements
        def rootcheck_cis_requirements(agent_id, options = {})
          data = get "/rootcheck/#{agent_id}/cis", options
          data
        end

        # Get rootcheck database
        # Returns the rootcheck database of an agent.
        #
        # @param [String] agent_id
        # @option options [pci] :pci
        # @option options [cis] :cis
        # @option options [offset] :offset
        # @option options [limit] :limit
        # @option options [sort] :sort
        # @option options [search] :search
        # @option options [status] :status
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rootcheck-database
        def rootcheck_database(agent_id, options = {})
          data = get "/rootcheck/#{agent_id}", options
          data
        end

        # Get rootcheck pci requirements
        # Returns the PCI requirements of all rootchecks of the agent.
        #
        # @param [String] agent_id
        # @option options [offset] :offset
        # @option options [limit] :limit
        # @option options [sort] :sort
        # @option options [search] :search
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rootcheck-pci-requirements
        def rootcheck_pic_requirements(agent_id, options = {})
          data = get "/rootcheck/#{agent_id}/pci", options
          data
        end

        # Run rootcheck scan in all agents
        # Runs syscheck and rootcheck on all agents (Wazuh launches both processes simultaneously).
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#run-rootcheck-scan-in-all-agents
        def run_rootcheck_all_agents
          put '/rootcheck'
        end

        # Run rootcheck scan in an agent
        # Runs syscheck and rootcheck on a specified agent (Wazuh launches both processes simultaneously)
        #
        # @param [String] agent_id
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#run-rootcheck-scan-in-an-agent
        def run_rootcheck(agent_id)
          put "/rootcheck/#{agent_id}"
        end
      end
    end
  end
end
