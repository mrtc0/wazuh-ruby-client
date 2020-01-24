module Wazuh
  module Api
    module Endpoints
      module SecurityConfigurationAssessment
        #
        # Returns the sca checks of an agent.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-security-configuration-assessment-sca-checks-database
        def checks_sca_database(options = {})
          get "/sca/#{options[:agent_id]}/checks/#{options[:policy_id]}", options
        end

        # Returns the sca database of an agent
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-security-configuration-assessment-sca-database
        def sca_database(options = {})
          get "/sca/#{options[:agent_id]}", options
        end
      end
    end
  end
end
