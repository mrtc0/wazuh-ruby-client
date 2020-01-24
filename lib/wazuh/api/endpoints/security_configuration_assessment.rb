module Wazuh
  module Api
    module Endpoints
      module SecurityConfigurationAssessment
        #
        # Get security configuration assessment (SCA) checks database
        # Returns the sca checks of an agent.
        # @param [String] agent_id
        #   ID to agent
        # @param [String] policy_id
        #   ID to policy
        # @option options [title] :title
        #   Filters by title
        # @option options [description] :description
        #   Filters by policy description
        # @option options [rationale] :rationale
        #   Filters by rationale
        # @option options [remediation] :remediation 
        #   Filters by remediation
        # @option options [file] :file
        #   Filters by file
        # @option options [process] :process
        #   Filters by process
        # @option options [directory] :directory
        #   Filters by directory
        # @option options [registry] :registry
        #   Filters by registry
        # @option options [references] :references
        #   Filters by references
        # @option options [result] :result
        #   Filters by result
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-security-configuration-assessment-sca-checks-database
        def checks_sca_database(agent_id, policy_id, options = {})
          get "/sca/#{agent_id}/checks/#{policy_id}", options
        end

        # Get security configuration assessment (SCA) database
        # Returns the sca database of an agent
        #
        # @param [String] agent_id
        #   ID to agent
        # @option options [name] :name
        #   Filters by policy name.
        # @option options [description] :description
        #   Filters by policy description
        # @option options [references] :references
        #   Filters by references
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [q] :q
        #   Query to filter results by. This is specially useful to filter by total checks passed, failed or total score (fields pass, fail, score).
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-security-configuration-assessment-sca-database
        def sca_database(agent_id, options = {})
          get "/sca/#{agent_id}", options
        end
      end
    end
  end
end
