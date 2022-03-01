module Wazuh
  module Api
    module Endpoints
      module V4
        module Cluster
          include ::Wazuh::Api::Endpoints::Cluster

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_cluster_node
          def local_node_info(options = {})
            offset_request('get', '/cluster/local/info', options)
          end

          alias_method :get_cluster_node, :local_node_info

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_cluster_nodes
          def nodes_info(options = {})
            offset_request('get', '/cluster/nodes', options)
          end

          alias_method :get_cluster_nodes, :nodes_info

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_healthcheck
          def nodes_healthcheck(options = {})
            offset_request('get', '/cluster/healthcheck', options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_status
          def cluster_status(options = {})
            get '/cluster/status', options
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_config
          def local_node_config(options = {})
            offset_request('get', '/cluster/local/config', options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_api_config
          def nodes_api_config(options = {})
            offset_request('get', '/cluster/api/config', options)
          end

          alias_method :get_api_config, :nodes_api_config

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_status_node
          def node_status(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/status", options)
          end

          alias_method :get_status_node, :node_status

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_info_node
          def node_info(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/info", options)
          end

          alias_method :get_info_node, :node_info

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_configuration_node
          def node_config(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/configuration", options)
          end

          alias_method :get_configuration_node, :node_config

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_node
          def node_stats(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats", options)
          end

          alias_method :get_stats_node, :node_stats

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_hourly_node
          def node_stats_hour(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats/hourly", options)
          end

          alias_method :get_stats_hourly_node, :node_stats_hour

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_weekly_node
          def node_stats_week(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats/weekly", options)
          end

          alias_method :get_stats_weekly_node, :node_stats_week

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_analysisd_node
          def node_stats_analysisd(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats/analysisd", options)
          end

          alias_method :get_stats_analysisd_node, :node_stats_analysisd

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_remoted_node
          def node_stats_remoted(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats/remoted", options)
          end

          alias_method :get_stats_remoted_node, :node_stats_remoted

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_log_node
          def node_logs(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/logs", options)
          end

          alias_method :get_log_node, :node_logs

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_log_summary_node
          def node_logs_summary(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/logs/summary", options)
          end

          alias_method :get_log_summary_node, :node_logs_summary

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.put_restart
          def restart_nodes(options = {})
            offset_request('put', "/cluster/restart", options)
          end

          alias_method :put_restart, :restart_nodes

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_conf_validation
          def check_nodes_config(options = {})
            offset_request('get', "/cluster/configuration/validationj", options)
          end

          alias_method :get_conf_validation, :check_nodes_config

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_node_config
          def node_active_configuration(node_id, component, configuration, options = {})
            offset_request('get', "/cluster/#{node_id}/configuration/#{component}/#{configuration}", options)
          end

          alias_method :get_node_config, :node_active_configuration
        end
      end
    end
  end
end
