require_relative 'v4/active_response'
require_relative 'v4/agents'
require_relative 'v4/cache'
require_relative 'v4/ciscat'
require_relative 'v4/cluster'
require_relative 'v4/decoders'
require_relative 'v4/experimental'
require_relative 'v4/lists'
require_relative 'v4/manager'
require_relative 'v4/rootcheck'
require_relative 'v4/rules'
require_relative 'v4/security_configuration_assessment'
require_relative 'v4/summary'
require_relative 'v4/syscheck'
require_relative 'v4/syscollector'


module Wazuh
  module Api
    module Endpoints
      module V4
        include ActiveResponse
        include Agents
        include Cache
        include Ciscat
        include Cluster
        include Decoders
        include Experimental
        include Lists
        include Manager
        include Rootcheck
        include Rules
        include Summary
        include Syscheck
        include Syscollector
        include SecurityConfigurationAssessment
      end
    end
  end
end
