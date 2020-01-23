module Wazuh
  module Api
    module Errors
      class WazuhError < ::Faraday::Error
        attr_reader :response

        def initialize(message, response = nil)
          @response = response
          super message
        end
      end
    end
  end
end
