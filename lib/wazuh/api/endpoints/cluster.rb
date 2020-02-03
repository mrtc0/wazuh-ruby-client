module Wazuh
  module Api
    module Endpoints
      module Cluster
        #
        # Returns the requested configuration in JSON format.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-active-configuration-in-node-node-id
        def component_configuration_by_node(node_id, component, configuration, options = {})
          get "/cluster/#{node_id}/config/#{component}/#{configuration}", options
        end

        # Returns ossec.conf in JSON format.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-node-node-id-s-configuration
        def configuration_by_node(node_id, options = {})
          get "/cluster/#{node_id}/configuration", options
        end

        # Returns the cluster configuration.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-the-cluster-configuration
        def cluster_configuration(options = {})
          get "/cluster/config", options
        end

        # Check Wazuh configuration in a cluster node
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#check-wazuh-configuration-in-a-cluster-node
        def check_configuration_by_node(node_id)
          get "/cluster/#{node_id}/configuration/validation"
        end

        # Check Wazuh configuration in all cluster nodes
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#check-wazuh-configuration-in-all-cluster-nodes
        def check_configuration
          get "/cluster/configuration/validation"
        end

        # Delete a remote file in a cluster node
        #
        # @param node_id
        # @option options [path] :path
        #   Relative path of file. This parameter is mandatory.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#delete-a-remote-file-in-a-cluster-node
        def delete_remote_file(node_id, options)
          delete "/cluster/#{node_id}/files", options
        end

        # Get local file from any cluster node
        #
        # @param node_id
        # @option options [path] :path
        #   Relative path of file. This parameter is mandatory.
        # @option options [validation] :validation
        #   Validates the content of the file. An error will be returned if file content is not strictly correct. False by default.
        def get_remote_file(node_id, options)
          get "/cluster/#{node_id}/files", options
        end

        # Update local file at any cluster node
        #
        # @param node_id
        # @option options [file] :file
        #   Input file.
        # @option options [path] :path
        #   Relative path were input file will be placed. This parameter is mandatory.
        # @option options [overwrite] :overwrite
        #   Replaces the existing file. False by default.
        def update_remote_file(node_id, options)
          post "/cluster/#{node_id}/files", options
        end

        # Get info about cluster status
        #
        def cluster_status
          get '/cluster/status'
        end

        # Get node node_id’s status
        #
        # @param node_id
        def node_status(node_id)
          get "/cluster/#{node_id}/status"
        end

        # Get node_id’s information
        #
        # @param node_id
        def node_info(node_id)
          get "/cluster/#{node_id}/info"
        end

        # Show cluster health
        #
        # @option options [node] :node
        def cluster_healthcheck(options = {})
          get '/cluster/healthcheck', options
        end

        # Get ossec.log from a specific node in cluster
        #
        # @param node_id
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [type_log] :type_log
        #   Filters by type of log.
        #   Allowed values: all, error, warning, info
        # @option options [category] :category
        #   Filters by category of log
        def cluster_logs_by_node(node_id, options)
          data = get "/cluster/#{node_id}/logs", options
          data.items
        end

        # Get summary of ossec.log from a specific node in cluster
        #
        # @param node_id
        def cluster_logs_summary_by_node(node_id)
          get "/cluster/#{node_id}/logs/summary"
        end

        # Get local node info
        #
        def local_node
          get '/cluster/node'
        end

        # Get node info
        #
        def node(node_name)
          get "/cluster/nodes/#{node_name}"
        end

        # Get nodes info
        #
        def nodes(options = {})
          data = get '/cluster/nodes', options
          data.items
        end

        # Restart a specific node in cluster
        #
        # @param node_id
        def restart_node(node_id)
          put "/cluster/#{node_id}/restart"
        end

        # Restart all nodes in cluster
        #
        def restart_all_node
          put '/cluster/restart'
        end

        # Get node node_id’s analysisd stats
        #
        # @param node_id
        def analysisd_stats(node_id)
          get "/cluster/#{node_id}/stats/analysisd"
        end

        # Get node node_id’s remoted stats
        #
        # @param node_id
        def remoted_stats(node_id)
          get "/cluster/#{node_id}/stats/remoted"
        end

        # Get node node_id’s stats
        #
        # @param node_id
        # @option options [data] :data
        #   Selects the date for getting the statistical information. Format: YYYYMMDD
        def nodes_stats(node_id, options)
          get "/cluster/#{node_id}/stats", options
        end

        # Get node node_id’s stats by hour
        #
        # @param node_id
        def nodes_stats_by_hourly(node_id)
          get "/cluster/#{node_id}/stats/hourly"
        end

        # Get node node_id’s stats by weekly
        #
        # @param node_id
        def nodes_stats_by_weekly(node_id)
          get "/cluster/#{node_id}/stats/weekly"
        end
      end
    end
  end
end
