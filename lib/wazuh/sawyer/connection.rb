module Wazuh
  module Sawyer
    module Connection
      private
      def connection
        options = {
          headers: {
            'Accept' => 'application/json; charset=utf-8',
            'Content-Type' => 'application/json'
          },
          ssl: {}
        }

        options[:headers]['User-Agent'] = user_agent if user_agent
        options[:ssl].merge!({ client_cert: client_cert, client_key: client_key }) if client_cert || client_key
        options[:ssl][:ca_file] = ca_file if ca_file

        options[:ssl].merge!({ verify: false }) unless verify_ssl

        opts = {
          :links_parser => ::Sawyer::LinkParsers::Simple.new
        }

        case api_version
        when 3
          if basic_user || basic_password
            options[:headers].merge!({'Authorization' => "Basic " + Base64.strict_encode64(basic_user + ':' + basic_password).strip})
          end
        when 4
          raise "user and password is required on v4 api" if !basic_user || !basic_password
          opts[:faraday] = ::Faraday.new(options) do |conn|
            conn.request :authorization, 'Bearer', Token.jwt(endpoint, options, basic_user, basic_password)
          end
        end

        opts[:faraday].proxy = nil if ignore_env_proxy

        conn = ::Sawyer::Agent.new(endpoint, opts)
      end
    end
  end
end
