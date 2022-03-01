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

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_cluster_nodes
          def nodes_info(options = {})
            offset_request('get', '/cluster/nodes', options)
          end

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

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_status_node
          def node_status(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/status", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_info_node
          def node_info(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/info", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_configuration_node
          def node_config(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/configuration", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_node
          def node_stats(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_hourly_node
          def node_stats_hour(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats/hourly", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_weekly_node
          def node_stats_week(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats/weekly", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_analysisd_node
          def node_stats_analysisd(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats/analysisd", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_stats_remoted_node
          def node_stats_remoted(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/stats/remoted", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_log_node
          def node_logs(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/logs", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_log_summary_node
          def node_logs_summary(node_id, options = {})
            offset_request('get', "/cluster/#{node_id}/logs/summary", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.put_restart
          def restart_nodes(options = {})
            offset_request('put', "/cluster/restart", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_conf_validation
          def check_nodes_config(options = {})
            offset_request('get', "/cluster/configuration/validationj", options)
          end

          # https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.cluster_controller.get_node_config
          def node_active_configuration(node_id, component, configuration, options = {})
            offset_request('get', "/cluster/#{node_id}/configuration/#{component}/#{configuration}", options)
          end
        end
      end
    end
  end
end
