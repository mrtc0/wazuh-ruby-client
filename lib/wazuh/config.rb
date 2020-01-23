# frozen_string_literal: true
module Wazuh
  module Config
    extend self

    ATTRIBUTES = %i[
      user_agent
      client_cert
      client_key
      logger
      endpoint
    ].freeze

    attr_accessor(*Config::ATTRIBUTES)

    def reset
      self.endpoint = nil
      self.user_agent = "Wazuh Ruby Client/#{Wazuh::VERSION}"
      self.client_cert = nil
      self.client_key = nil
      self.logger = nil
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

Wazuh::Config.reset
