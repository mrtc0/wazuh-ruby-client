# frozen_string_literal: true
module Wazuh
  module Config
    extend self

    ATTRIBUTES = %i[
      user_agent
      ca_file
      client_cert
      client_key
      basic_user
      basic_password
      verify_ssl
      logger
      endpoint
      ignore_env_proxy
      api_version
    ].freeze

    attr_accessor(*Config::ATTRIBUTES)

    def reset
      self.endpoint = nil
      self.user_agent = "Wazuh Ruby Client/#{Wazuh::VERSION}"
      self.ca_file = nil
      self.client_cert = nil
      self.client_key = nil
      self.basic_user = nil
      self.basic_password = nil
      self.verify_ssl = true
      self.logger = nil
      self.ignore_env_proxy = false
      self.api_version = 3
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
