module Wazuh
  module Api
    module Endpoints
      module Summary
        #
        # Returns a dictionary with a full summary of agents.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-a-full-summary-of-agents
        def summary
          get '/summary/agents'
        end
      end
    end
  end
end
