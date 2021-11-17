module Wazuh
  module Api
    module Endpoints
      module V4
        module Agents
          include ::Wazuh::Api::Endpoints::Agents
          def delete_agent(agent_ids, options = {})
            delete "/agents", options.merge({ agents_list: agent_ids })
          end

          def remove_agents_of_group(ids, group)
            delete "/agents/group", {group_id: group, agents_list: ids }
          end

          def delete_agent_by_group(ids)
            delete '/agents/groups', {groups_list: ids}
          end

          def remove_group(group_id)
            delete "/agents/groups", { groups_list: group_id }
          end

          def agent(agent_id, options = {})
            get "/agents", options.merge({ agents_list: agent_id})
          end

          def upgrade_result_from_agent(agent_id, options = {})
            get "/agents/upgrade_result", options.merge({ agents_list: agent_id})
          end

          def groups(options = {})
            get '/groups', options
          end

          def agents_by_group(group_id, options = {})
            offset_request('get', "/groups", options.merge({groups_list: group_id}))
          end

          def group_configuration(group_id, options = {})
            get "/groups/#{group_id}/configuration", options
          end

          def group_files(group_id, options = {})
            get "/groups/#{group_id}/files", options
          end

          def get_file_in_group(group_id, filename, options = {})
            get "groups/#{group_id}/files/#{filename}", options
          end

          def agent_by_name(agent_name, options = {})
            get "/agents", options.merge({name: agent_name})
          end

          def agent_summary
            get "/agents/summary/status"
          end

          def add_agents_to_group(ids, group_id)
            put "/agents/group", {group_id: group_id, agents_list: ids}
          end

          def agent_upgrade(agent_id, options = {})
            put "/agents/upgrade", options.merge({agents_list: agent_id})
          end

          def agent_upgrade_custom(agent_id, options = {})
            put "/agents/upgrade_custom", options.merge({agents_list: agent_id})
          end

          def add_agent_quick(agent_name)
            post "/agents/insert/quick/", {}, {agent_name: agent_name}
          end

          def create_group(group_id)
            post "/agents/groups", {group_id: group_id}
          end
        end
      end
    end
  end
end
