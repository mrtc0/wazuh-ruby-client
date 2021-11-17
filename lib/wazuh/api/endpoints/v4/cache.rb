module Wazuh
  module Api
    module Endpoints
      module V4
        module Cache
          include ::Wazuh::Api::Endpoints::Cache
          def cache_config
            get "/cluster/api/config"
          end
        end
      end
    end
  end
end
