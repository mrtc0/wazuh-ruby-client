module Wazuh
  module Api
    module Errors
      class WazuhError < ::Faraday::Error
        attr_reader :response, :message

        def initialize(message, response = nil)
          @message = message
          @response = response
        end
      end
    end
  end
end
