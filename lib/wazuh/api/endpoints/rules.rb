module Wazuh
  module Api
    module Endpoints
      module Rules
        #
        # Returns all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-all-rules
        def all_rules(options = {})
          data = get '/rules', options
          data
        end

        # Returns the files of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-files-of-rules
        def rule_files(options = {})
          data = get '/rules/files', options
          data
        end

        # Returns the GDPR requirements of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-gdpr-requirements
        def gdpr_rules(options = {})
          data = get '/rules/gdpr', options
          data
        end

        # Returns the GPG13 requirements of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-gpg13-requirements
        def gpg13_rules(options = {})
          data = get '/rules/gpg13', options
          data
        end

        # Returns the groups of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-groups
        def rules_groups(options = {})
          data = get '/rules/groups', options
          data
        end

        # Returns the HIPAA requirements of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-hipaa-requirements
        def hipaa_rules(options = {})
          data = get '/rules/hipaa', options
          data
        end

        # Returns the NIST-800-53 requirements of all rules.
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-nist-800-53-requirements
        def nist_800_53_rules(options = {})
          data = get '/rules/nist-800-53', options
          data
        end

        # Returns the PCI requirements of all rules
        #
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-rule-pci-requirements
        def pic_rules(options = {})
          data = get '/rules/pci', options
          data
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
          data = get "/rules/#{rule_id}", options
          data
        end
      end
    end
  end
end
