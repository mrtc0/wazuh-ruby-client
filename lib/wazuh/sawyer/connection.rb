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

        if basic_user || basic_password
          authorization_header = "Basic " + Base64.encode64(basic_user + ':' + basic_password).strip
          options[:headers].merge!({'Authorization' => authorization_header})
        end

        options[:ssl].merge!({ verify: false }) unless verify_ssl

        opts = {
          :links_parser => ::Sawyer::LinkParsers::Simple.new
        }

        opts[:faraday] = ::Faraday.new(options)

        ::Sawyer::Agent.new(endpoint, opts)
      end
    end
  end
end
