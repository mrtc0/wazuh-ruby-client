module Wazuh
  module Sawyer
    module Connection
      class Token
        def self.jwt(endpoint, options, basic_user, basic_password)
          if !@token || (@_esp && @_esp -3 <= Time.now.to_i)
            options[:url] = endpoint
            options[:headers].merge!({'Authorization' => "Basic " + Base64.encode64(basic_user + ':' + basic_password).strip})

            token = ::Faraday.new(options).get('/security/user/authenticate')['data']['token']

            @_esp = JWT.decode(token, nil, false)['esp'].to_i
            @_token = token
          end
          @token
        end
      end
    end
  end
end
