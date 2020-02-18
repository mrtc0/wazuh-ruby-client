module Wazuh
  module Api
    module Endpoints
      module Agents
        #
        # Returns a list with the available agents.
        # 
        # @option options [String] :offset
        #   First element to return in the collection.
        # @option options [String] :limit
        #   Maximum number of elements to return.
        # @option options [String] :select
        #   Select which fields to return (separated by comma).
        # @option options [String] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [String] :search
        #   Looks for elements with the specified string.
        # @option options [String] :status
        #   Filters by agent status. Use commas to enter multiple statuses.
        #   Allowed values: active, pending, neverconnected, disconnected
        # @option options [String] :order_than
        #   Filters out disconnected agents for longer than specified. Time in seconds, ‘[n_days]d’, ‘[n_hours]h’, ‘[n_minutes]m’ or ‘[n_seconds]s’. For never connected agents, uses the register date.
        # @return [Array] Returns Array containing agents
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-all-agents
        def all_agents(options = {})
          data = get '/agents', options
          data.items
        end

        # Returns various information from an agent.
        #
        # @param [String] agent_id
        #   ID to agent
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @return [Sawyer::Resource] Returns Sawyer::Resource
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-an-agent
        def agent(agent_id, options = {})
          get "/agents/#{agent_id}", options
        end

        # Returns various information from an agent called :agent_name.
        #
        # @param [String] agent_name
        #   Name to agent
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @return [Sawyer::Resource] Returns Sawyer::Resource
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-an-agent-by-its-name
        def agent_by_name(agent_name, options = {})
          get "/agents/name/#{agent_name}", options
        end

        # Get agent key
        # Returns the key of an agent.
        #
        # @param [String] agent_id
        #   ID to agent
        # @return [String] Returns the key of an agent
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-agent-key
        def agent_key(agent_id, options = {})
          get "/agents/#{agent_id}/key"
        end

        # Restarts a list of agents.
        #
        # @option options [ids] :ids
        #   Array of agent ID’s.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#restart-a-list-of-agents
        def restart_agents(options = {})
          post '/agents/restart', options
        end

        # Restarts all agents.
        #
        def restart_all_agents()
          put '/agents/restart'
        end

        # Restart an agent.
        #
        # @param [String] agent_id
        #   Agent unique ID.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#restart-an-agent
        def restart_an_agents(agent_id, options = {})
          put "/agents/#{agent_id}/restart"
        end

        # Returns all the different combinations that agents have for the selected fields. It also indicates the total number of agents that have each combination.
        #
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [fileds] :fileds
        #   List of fields affecting the operation.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [q] :q
        #   Query to filter result. For example q=”status=Active”
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-distinct-fields-in-agents
        def distinct_fields_in_agents(options = {})
          get '/agents/stats/distinct', options
        end

        # Returns the list of outdated agents.
        #
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [q] :q
        #   Query to filter result. For example q=”status=Active”
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-outdated-agents
        def outdated_agents(options = {})
          get '/agents/outdated', options
        end

        # Returns the upgrade result from an agent.
        #
        # @param [String] agent_id
        #   ID to agent
        # @option options [timeout] :timeout
        #   Seconds to wait for the agent to respond.
        def upgrade_result_from_agent(agent_id, options = {})
          get "/agents/#{agent_id}/upgrade_result", options
        end

        # Add a new agent
        #
        # @option options [name] :name
        #   Name to agent
        # @option options [ip] :ip
        #   IP to agent
        #   If this is not included, the API will get the IP automatically.
        #   If you are behind a proxy, you must set the option config.BehindProxyServer to yes at config.js.
        #   Allowed values: IP, IP/NET, ANY
        # @option options [force] :force
        #   Remove the old agent with the same IP if disconnected since <force> seconds.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#add-agent
        def add_agent(options = {})
          post '/agents', options
        end

        # Delete an agent
        # Removes an agent.
        #
        # @param [String] agent_id
        # @option options [Bool] purge
        #   Delete an agent from the key store. This parameter is only valid if purge is set to no in the manager’s ossec.conf.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#delete-an-agent
        def delete_agent(agent_id, options = {})
          delete "/agents/#{agent_id}", options
        end

        # Delete agents
        # Removes agents, using a list of them or a criterion based on the status or time of the last connection.
        # @option options [String] ids
        #   Agent IDs separated by commas.
        # @option options [Bool] purge
        #   Delete an agent from the key store. This parameter is only valid if purge is set to no in the manager’s ossec.conf.
        # @option options [String] status
        #   Filters by agent status. Use commas to enter multiple statuses. Allowed values: active, pending, neverconnected, disconnected
        # @option options [String] older_than
        #   Filters out disconnected agents for longer than specified. Time in seconds, ‘[n_days]d’, ‘[n_hours]h’, ‘[n_minutes]m’ or ‘[n_seconds]s’. For never connected agents, uses the register date. Default value: 7d.
        def delete_agents(options = {})
          delete '/agents', options
        end

        # Adds a new agent with name :agent_name. This agent will use ANY as IP.
        #
        # @param [String] agent_name
        #   Name to agent
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#add-agent-quick-method
        def add_agent_quick(agent_name)
          put "/agents/#{agent_name}"
        end

        # Insert an agent with an existing id and key.
        #
        # @option options [name] :name
        #   Name to agent
        # @option options [ip] :ip
        #   If this is not included, the API will get the IP automatically. If you are behind a proxy, you must set the option config.BehindProxyServer to yes at config.js.
        #   Allowed values: IP, IP/NET, ANY
        # @option options [id] :id
        #   ID to agent
        # @option options [key] :key
        #   Agent key. Minimum length: 64 characters. Allowed values: ^[a-zA-Z0-9]+$
        # @option options [force] :force
        #   Remove the old agent the with same IP if disconnected since <force> seconds.
        def insert_agent(options = {})
          post '/agents/insert', options
        end

        # Get active configuration
        # @param [String] agent_id
        # @param [String] component
        #   Selected component. Alowed values see document
        # @param [String] configuration
        #   Selected component. Alowed values see document
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#get-active-configuration
        def agent_config(agent_id, component, configuration)
          get "/agents/#{agent_id}/config/#{component}/#{configuration}"
        end

        # Delete a list of groups
        # @param [String] ids
        # @see http://documentation.wazuh.com/3.11/user-manual/api/reference.html#delete-a-list-of-groups
        def delete_agent_by_group(ids)
          delete '/agents/groups', {ids: ids}
        end

        # Get sync status of agent
        # Returns the sync status in JSON format
        #
        # @param [String] agent_id
        #   Agent ID
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#get-sync-status-of-agent
        def agent_sync_status(agent_id)
          get "/agent/#{agent_id}/group/is_sync"
        end

        # Add a list of agents to a group
        # Adds a list of agents to the specified group
        #
        # @param [Array[String]] ids
        #   List of agent ID
        # @param [String] group_id
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#add-a-list-of-agents-to-a-group
        def add_agents_to_group(ids, group_id)
          post "/agents/group/#{group_id}", {ids: ids}
        end

        # Add agent group
        # Adds an agent to the specified group.
        #
        # @param [String] agent_id
        #   Agent unique ID
        # @param [String] group_id
        #   Group ID
        # @option options [Bool] force_single_group
        #   Whether to append new group to current agent’s group or replace it.
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#add-agent-group
        def add_agent_to_group(agent_id, group_id, options = {})
          put "/agents/#{agent_id}/group/#{group_id}", options
        end

        # Create a group
        # Creates a new group.
        #
        # @param [String] group_id
        #   Group ID
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#create-a-group
        def create_group(group_id)
          put "/agents/groups/#{group_id}"
        end

        # Get a file in group
        # Returns the specified file belonging to the group parsed to JSON.
        #
        # @param [String] group_id
        #   Group ID
        # @param [String] filename
        #   Filename
        # @option options [String] type
        # @option options [String] format
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#add-agent-group
        def get_file_in_group(group_id, filename, options = {})
          get "agents/groups/#{group_id}/files/#{filename}", options
        end

        # Get agents in a group
        # Returns the list of agents in a group.
        #
        # @param [String] group_id
        #   Group ID
        # @option options [Number] offset
        # @option options [Number] limit
        # @option options [String] select
        # @option options [String] sort
        # @option options [String] search
        # @option options [String] status
        # @option options [String] q
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#get-agents-in-a-group
        def agents_by_group(group_id, options = {})
          get "/agents/groups/#{group_id}", options
        end

        # Get agents without group
        # Returns a list with the available agents without group.
        #
        # @option options [Number] offset
        # @option options [Number] limit
        # @option options [String] select
        # @option options [String] sort
        # @option options [String] search
        # @option options [String] status
        # @option options [String] q
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#get-agents-without-group
        def agents_by_no_group(options = {})
          get 'agents/no_group', options
        end

        # Get group configuration
        #
        # @param [String] group_id
        # @option options [Number] offset
        # @option options [Number] limit
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#get-group-configuration
        def group_configuration(group_id, options = {})
          get "/agents/groups/#{group_id}/configuration", options
        end

        # Get group files
        # Returns the files belonging to the group.
        #
        # @param [String] group_id
        # @option options [Number] offset
        # @option options [Number] limit
        # @option options [String] sort
        # @option options [String] search
        # @option options [String] hash
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#get-group-files
        def group_files(group_id, options = {})
          get "/agents/groups/#{group_id}/files", options
        end

        # Get groups
        # Returns the list of existing agent groups.
        #
        # @option options [Number] offset
        # @option options [Number] limit
        # @option options [String] sort
        # @option options [String] search
        # @option options [String] hash
        # @option options [String] q
        def groups(options = {})
          get '/agents/groups', options
        end

        # Put configuration file (agent.conf) into a group
        # Upload the group configuration (agent.conf).
        #
        # @param [String] group_id
        # @param [String] config
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#put-configuration-file-agent-conf-into-a-group
        def update_group_ossec_configuration(group_id, config)
          # post "/agents/groups/#{group_id}/configuration"
          # TODO : use Content-type: application/xml
          raise "This method not yet implement"
        end

        # Remove a single group of an agent
        # Remove the group of the agent but will leave the rest of its group if it belongs to a multigroup.
        #
        # @param [String] agent_id
        # @param [String] group_id
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#remove-a-single-group-of-an-agent
        def remove_agent_of_group(agent_id, group_id)
          delete "/agents/#{agent_id}/group/#{group_id}"
        end

        # Remove a single group of multiple agents
        # Remove a list of agents of a group.
        #
        # @param [String] ids
        # @param [String] group_id
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#remove-a-single-group-of-multiple-agents
        def remove_agents_of_group(ids, groups)
          delete "/agents/group/#{group_id}", {ids: ids}
        end

        # Remove all agent groups.
        # Removes the group of the agent. The agent will automatically revert to the ‘default’ group.
        #
        # @param [String] agent_id
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#remove-all-agent-groups
        def remove_all_agent_of_group(agent_id)
          delete "/agents/#{agent_id}/group"
        end

        # Remove group
        # Removes the group. Agents that were assigned to the removed group will automatically revert to the ‘default’ group.
        #
        # @param [String] group_id
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#remove-group
        def remove_group(group_id)
          delete "/agents/groups/#{group_id}"
        end

        # Get OS summary
        # Returns a summary of the OS.
        #
        # @option options [Number] offset
        # @option options [Number] limit
        # @option options [String] sort
        # @option options [String] search
        # @option options [String] q
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#get-os-summary
        def agent_os_summary(options = {})
          get "/agents/summary/os"
        end

        # Get agents summary
        # Returns a summary of the available agents.
        #
        # @see https://documentation.wazuh.com/3.11/user-manual/api/reference.html#get-agents-summary
        def agent_summary
          get "/agents/summary"
        end
      end
    end
  end
end
