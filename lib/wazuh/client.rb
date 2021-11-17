module Wazuh
  class Client
    include Sawyer::Connection
    include Sawyer::Request

    attr_accessor(*Config::ATTRIBUTES)

    def initialize(options = {})
      Wazuh::Config::ATTRIBUTES.each do |key|
        send("#{key}=", options[key] || Wazuh.config.send(key))
      end
      @logger ||= Wazuh::Config.logger || Wazuh::Logger.default
      case api_version
      when 3
        extend Api::Endpoints
      when 4
        extend Api::Endpoints::V4
      else
        raise "unsupported api version #{api_version}"
      end
    end

    class << self
      def configure
        block_given? ? yield(Config) : Config
      end

      def config
        Config
      end
    end
  end
end

