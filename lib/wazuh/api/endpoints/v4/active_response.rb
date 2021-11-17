module Wazuh
  module Api
    module Endpoints
      module V4
        module ActiveResponse
          include ::Wazuh::Api::Endpoints::ActiveResponse
          def run_active_response_command(options = {})
            query_options = {}
            %w(agents_list pretty wait_for_complete).each do |c|
              query_options[c.to_sym] = options.delete(c.to_sym)
            end
            put "/active-response", options, query_options
          end

        end
      end
    end
  end
end
