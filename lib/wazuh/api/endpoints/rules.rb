module Wazuh
  module Api
    module Endpoints
      module Rules
        #
        # Returns all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-all-rules
        def all_rules(options = {})
          get '/rules', options
        end

        # Returns the files of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-files-of-rules
        def rule_files(options = {})
          get '/rules/files', options
        end

        # Returns the GDPR requirements of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-gdpr-requirements
        def gdpr_rules(options = {})
          get '/rules/gdpr', options
        end

        # Returns the GPG13 requirements of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-gpg13-requirements
        def gpg13_rules(options = {})
          get '/rules/gpg13', options
        end

        # Returns the groups of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-groups
        def rules_groups(options = {})
          get '/rules/groups', options
        end

        # Returns the HIPAA requirements of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-hipaa-requirements
        def hipaa_rules(options = {})
          get '/rules/hipaa', options
        end

        # Returns the NIST-800-53 requirements of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-nist-800-53-requirements
        def nist_800_53_rules(options = {})
          get '/rules/nist-800-53', options
        end

        # Returns the PCI requirements of all rules
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-pci-requirements
        def pic_rules(options = {})
          get '/rules/pci', options
        end

        # Returns the rules with the specified id.
        #
        # @param [String] rule_id
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rules-by-id
        def rule_by_id(rule_id, options = {})
          get "/rules/#{rule_id}", options
        end
      end
    end
  end
end
