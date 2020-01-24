require_relative 'endpoints/agents'
require_relative 'endpoints/rules'
require_relative 'endpoints/security_configuration_assessment'
require_relative 'endpoints/summary'
require_relative 'endpoints/syscheck'
require_relative 'endpoints/syscollector'

module Wazuh
  module Api
    module Endpoints
      include Agents
      include Rules
      include Summary
      include Syscheck
      include Syscollector
      include SecurityConfigurationAssessment
    end
  end
end
