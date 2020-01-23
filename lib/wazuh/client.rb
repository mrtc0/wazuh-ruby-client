module Wazuh
  class Client
    include Faraday::Connection
    include Faraday::Request
    include Api::Endpoints

    attr_accessor(*Config::ATTRIBUTES)

    def initialize(options = {})
      Wazuh::Config::ATTRIBUTES.each do |key|
        send("#{key}=", options[key] || Wazuh.config.send(key))
      end
      @logger ||= Wazuh::Config.logger || Wazuh::Logger.default
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

