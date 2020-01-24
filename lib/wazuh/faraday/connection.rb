module Wazuh
  module Faraday
    module Connection
      private

      def connection
        options = {
          headers: { 'Accept' => 'application/json; charset=utf-8' },
          ssl: {}
        }

        options[:headers]['User-Agent'] = user_agent if user_agent
        # options[:certificate] = certificate if cartificate
        # options[:private_key] = private_key if private_key
        options[:ssl].merge!({ client_cert: client_cert, client_key: client_key }) if client_cert || client_key

        if basic_user || basic_password
          authorization_header = "Basic " + Base64.encode64(basic_user + ':' + basic_password).strip
          options[:headers].merge!({'Authorization' => authorization_header})
        end

        options[:ssl].merge!({ verify: false }) unless verify_ssl

        # request_options = {}

        ::Faraday::Connection.new(endpoint, options) do |connection|
          connection.use ::Faraday::Request::Multipart
          connection.use ::Faraday::Request::UrlEncoded
          connection.use ::Faraday::Response::RaiseError
          connection.use ::Wazuh::Faraday::Response::RaiseError
          connection.use ::FaradayMiddleware::ParseJson
          connection.response :logger, logger if logger
          connection.adapter ::Faraday.default_adapter
        end
      end
    end
  end
end
