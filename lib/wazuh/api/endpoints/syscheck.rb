module Wazuh
  module Api
    module Endpoints
      module Syscheck
        #
        # Get syscheck files
        # Returns the syscheck files of an agent.
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
        # @option options [file] :file
        #   Filters file by filename.
        # @option options [type] :type
        #   Selects type of file. Allowed values: file, registry
        # @option options [summary] :summary
        #   Returns a summary grouping by filename. Allowed values: yes, no
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [md5] :md5
        #   Returns the files with the specified md5 hash.
        # @option options [sha1] :sha1
        #   Returns the files with the specified sha1 hash.
        # @option options [sha256] :sha256
        #   Returns the files with the specified sha256 hash.
        # @option options [hash] :hash
        #   Returns the files with the specified hash (md5, sha1 or sha256).
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-syscheck-files
        def syscheck_files(agent_id, options = {})
          offset_request('get', "/syscheck/#{agent_id}", options)
        end

        # Clears the syscheck database for the specified agent.
        #
        # @param [String] agent_id
        #   ID to agent
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#clear-syscheck-database-of-an-agent
        def clear_syscheck_database(agent_id)
          delete "/syscheck/#{agent_id}"
        end

        # Return the timestamp of the last syscheck scan.
        #
        # @param [String] agent_id
        #   ID to agent
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-last-syscheck-scan
        def last_syscheck_scan(agent_id)
          get "/syscheck/#{agent_id}/last_scan"
        end

        # Runs syscheck and rootcheck on all agents (Wazuh launches both processes simultaneously).
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#run-syscheck-scan-in-all-agents
        def run_syscheck_all_agents
          put '/syscheck'
        end

        # Runs syscheck and rootcheck on an agent (Wazuh launches both processes simultaneously).
        #
        # @param [String] agent_id
        #   ID to agent
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#run-syscheck-scan-in-an-agent
        def run_syscheck(agent_id)
          put "/syscheck/#{agent_id}"
        end
      end
    end
  end
end
