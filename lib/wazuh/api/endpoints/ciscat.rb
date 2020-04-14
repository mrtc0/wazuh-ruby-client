module Wazuh
  module Api
    module Endpoints
      module Ciscat
        #
        # Returns the agent’s ciscat results info
        #
        # @param [String] agent_id
        #   ID to agent
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [select] :select
        #   List of selected fields separated by commas.
        # @option options [benchmark] :benchmark
        #   Filters by benchmark.
        # @option options [profile] :profile
        #   Filters by evaluated profile.
        # @option options [pass] :pass
        #   Filters by passed checks.
        # @option options [fail] :fail
        #   Filters by failed checks.
        # @option options [error] :error
        #   Filters by encountered errors.
        # @option options [notchecked] :notchecked
        #   Filters by not checked.
        # @option options [unknown] :unknown
        #   Filters by unknown results.
        # @option options [score] :score
        #   Filters by final score.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-cis-cat-results-from-an-agent
        def ciscat_result(agent_id, options = {})
          data = get "/ciscat/#{agent_id}/results", options
          data
        end
      end
    end
  end
end
