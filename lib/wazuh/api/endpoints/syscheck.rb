module Wazuh
  module Api
    module Endpoints
      module Syscheck
        #
        # Clears the syscheck database for the specified agent.
        #
        # @option options [agent_id] :agent_id
        #   ID to agent
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#clear-syscheck-database-of-an-agent
        def clear_syscheck_database(options = {})
          delete "/syscheck/#{options[:agent_id]}"
        end

        # Return the timestamp of the last syscheck scan.
        #
        # @option options [agent_id] :agent_id
        #   ID to agent
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-last-syscheck-scan
        def last_syscheck_scan(options = {})
          get "/syscheck/#{options[:agent_id]}/last_scan"
        end

        # Returns the syscheck files of an agent.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-syscheck-files
        def syscheck_files(options = {})
          get "/syscheck/#{options[:agent_id]}"
        end

        # Runs syscheck and rootcheck on all agents (Wazuh launches both processes simultaneously).
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#run-syscheck-scan-in-all-agents
        def run_syscheck_all_agents
          put '/syscheck'
        end

        # Runs syscheck and rootcheck on an agent (Wazuh launches both processes simultaneously).
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#run-syscheck-scan-in-an-agent
        def run_syscheck(options = {})
          put "/syscheck/#{options[:agent_id]}"
        end
      end
    end
  end
end
