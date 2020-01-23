module Wazuh
  module Api
    module Endpoints
      module Agents
        #
        # Returns a list with the available agents.
        # 
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [select] :select
        #   Select which fields to return (separated by comma).
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [status] :status
        #   Filters by agent status. Use commas to enter multiple statuses.
        #   Allowed values: active, pending, neverconnected, disconnected
        # @option options [q] :q
        #   Query to filter results by. For example q=”status=Active”
        # @option options [order_than] :order_than
        #   Filters out disconnected agents for longer than specified. Time in seconds, ‘[n_days]d’, ‘[n_hours]h’, ‘[n_minutes]m’ or ‘[n_seconds]s’. For never connected agents, uses the register date.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-all-agents
        def all_agents(options = {})
          get '/agents', options
        end

        # Returns various information from an agent.
        #
        # @option options [agent_id] :agent_id
        #   ID to agent
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-an-agent
        def agent(options = {})
          get "/agents/#{options[:agent_id]}", options
        end

        # Returns various information from an agent called :agent_name.
        #
        # @option options [agent_name] :agent_name
        #   Name to agent
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-an-agent-by-its-name
        def agent_by_name(options = {})
          get "/agents/name/#{options[:agent_name]}", options
        end

        # Returns the key of an agent.
        #
        # @option options [agent_id] :agent_id
        #   ID to agent
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-agent-key
        def agent_key(options = {})
          get "/agents/#{options[:agent_id]}/key"
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
        # @option options [agent_id] :agent_id
        #   Agent unique ID.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#restart-an-agent
        def restart_an_agents(options = {})
          put "/agents/#{options[:agent_id]}/restart"
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
        # @option options [agent_id] :agent_id
        #   ID to agent
        # @option options [timeout] :timeout
        #   Seconds to wait for the agent to respond.
        def upgrade_result_from_agent(options = {})
          get "/agents/#{options[:agent_id]}/upgrade_result", options
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

        # Adds a new agent with name :agent_name. This agent will use ANY as IP.
        #
        # @option options [name] :name
        #   Name to agent
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#add-agent-quick-method
        def add_agent_quick(options = {})
          put '/agents', options
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
      end
    end
  end
end
