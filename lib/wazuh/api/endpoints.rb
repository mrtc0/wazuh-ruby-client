require_relative 'endpoints/active-response'
require_relative 'endpoints/agents'
require_relative 'endpoints/cache'
require_relative 'endpoints/ciscat'
require_relative 'endpoints/cluster'
require_relative 'endpoints/decoders'
require_relative 'endpoints/experimental'
require_relative 'endpoints/lists'
require_relative 'endpoints/manager'
require_relative 'endpoints/rootcheck'
require_relative 'endpoints/rules'
require_relative 'endpoints/security_configuration_assessment'
require_relative 'endpoints/summary'
require_relative 'endpoints/syscheck'
require_relative 'endpoints/syscollector'

module Wazuh
  module Api
    module Endpoints
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
