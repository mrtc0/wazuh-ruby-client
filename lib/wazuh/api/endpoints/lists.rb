module Wazuh
  module Api
    module Endpoints
      module Lists
        #
        # Get all lists
        # Returns the content of all CDB lists.
        #
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [path] :path
        #   Filters by path.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-all-lists
        def cdb_lists(options = {})
          data = get '/lists', options
          data
        end

        # Get paths from all lists
        # Returns the path from all lists.
        #
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-paths-from-all-lists
        def cdb_files_path(options = {})
          data = get '/lists/files', options
          data
        end
      end
    end
  end
end
