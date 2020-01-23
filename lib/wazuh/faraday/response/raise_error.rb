# frozen_string_literal: true
module Wazuh
  module Faraday
    module Response
      class RaiseError < ::Faraday::Response::Middleware
        def on_complete(env)
        end
      end
    end
  end
end
