require_relative 'wazuh/version'
require_relative 'wazuh/logger'

require 'json'
require 'logger'
require 'base64'
require 'faraday'
require 'sawyer'
require 'jwt'
require 'faraday_middleware'

require_relative 'wazuh/config'
require_relative 'wazuh/sawyer/token'
require_relative 'wazuh/sawyer/connection'
require_relative 'wazuh/sawyer/request'
require_relative 'wazuh/api/endpoints'
require_relative 'wazuh/api/errors/wazuh_error'
require_relative 'wazuh/api/error'
require_relative 'wazuh/client'
