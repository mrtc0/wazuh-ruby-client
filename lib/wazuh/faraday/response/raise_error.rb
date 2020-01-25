# frozen_string_literal: true
module Wazuh
  module Faraday
    module Response
      class RaiseError < ::Faraday::Response::Middleware
        def on_complete(env)
          return if env.status == 200 || env.body['error'] == 0
          error_message = env.body['message']
          raise Wazuh::Api::Errors::WazuhError.new(error_message, env.response)
        end
      end
    end
  end
end
