module Wazuh
  module Api
    module Endpoints
      module V4
        module Vulnerabilities
          # Get vulnerabilities
          # Returns the vulnerabilities of an agent
          #
          # @param [String] agent_id
          # @option options [wait_for_complete] :wait_for_complete
          #   Disable timeout response
          # @option options [offset] :offset
          #   First element to return in the collection
          # @option options [limit] :limit
          #   Maximum number of elements to return. Although up to 100.000 can be specified,
          #   it is recommended not to exceed 500 elements. Responses may be slower the more this number is exceeded.
          # @option options [sort] :sort
          #   Sort the collection by a field or fields (separated by comma).
          #   Use +/- at the beggining to list in ascending or descending order. Use '.' for nested fields.
          #   For example, '{field1: field2}' may be selected with 'field1.field2'
          # @option options [search] :search
          #   Look for elements containing the specified string.
          #   To obtain a complementary search, use '-' at the beggining
          # @option options [select] :select
          #   Select which fields to return (separated by comma).
          #   Use '.' for nested fields. For example, '{field1: field2}' may be selected with 'field1.field2'
          # @option options [q] :q
          #   Query to filter results by. For example q="status=active"
          # @option options [distinct] :distinct
          #   Look for distinct values.
          # @option options [architecture] :architecture
          #   Filter by architecture
          # @option options [cve] :cve
          #   Filter by CVE
          # @option options [name] :name
          #   Filter by name
          # @option options [version] :version
          #   Filter by CVE version
          # @see https://documentation.wazuh.com/current/user-manual/api/reference.html#operation/api.controllers.vulnerability_controller.get_vulnerability_agent
          def vulnerabilities(agent_id, options = {})
            offset_request('get', "/vulnerability/#{agent_id}", options)
          end
        end
      end
    end
  end
end
