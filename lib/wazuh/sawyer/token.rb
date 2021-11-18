module Wazuh
  module Sawyer
    module Connection
      class Token
        def self.jwt(endpoint, options, basic_user, basic_password)
          if !@_token || (@_exp && @_exp -3 <= Time.now.to_i)
            options[:url] = endpoint
            options[:headers].merge!({'Authorization' => "Basic " + Base64.strict_encode64(basic_user + ':' + basic_password).strip})

            token = ::Faraday.new(options) {|f| f.response :json }.get('/security/user/authenticate').body['data']['token']
            @_exp = ::JWT.decode(token, nil, false).first['exp'].to_i
            ::JWT.decode(token, nil, false).first
            @_token = token
          end
          @_token
        end
      end
    end
  end
end
