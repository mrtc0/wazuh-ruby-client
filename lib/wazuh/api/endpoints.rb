require_relative 'endpoints/agents'

module Wazuh
  module Api
    module Endpoints
      include Agents
    end
  end
end
