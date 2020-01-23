require 'logger'

module Wazuh
  class Logger < ::Logger
    def self.default
      return @default if @default

      logger = new STDOUT
      logger.level = Logger::WARN
      @default = logger
    end
  end
end
