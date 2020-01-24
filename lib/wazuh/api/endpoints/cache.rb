module Wazuh
  module Api
    module Endpoints
      module Cache
        #
        # Clears cache of the specified group.
        #
        # @params [String] group
        #   cache group
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#clear-group-cache
        def clear_group_cache(group)
          delete "/cache/#{group}"
        end

        # Clears entire cache.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#delete-cache-index
        def clear_cache
          delete '/cache'
        end

        # Returns current cache index.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-cache-index
        def cache_index
          get "/cache"
        end

        # Returns cache configuration
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#return-cache-configuration
        def cache_config
          get "/cache/config"
        end
      end
    end
  end
end
