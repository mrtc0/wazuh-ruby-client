module Wazuh
  module Api
    module Endpoints
      module Decoders
        #
        # Get all decoders
        # Returns all decoders included in ossec.conf.
        #
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [file] :file
        #   Filters by filename.
        # @option options [path] :path
        #   Filters by path.
        # @option options [status] :status
        #   Filters the decoders by status.
        #   Allowed values: enabled, disabled, all
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-all-decoders
        def all_decoders(options = {})
          data = get '/decoders', options
          data
        end

        # Get all decoders files
        # Returns all decoders files included in ossec.conf.
        #
        #
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @option options [file] :file
        #   Filters by filename.
        # @option options [path] :path
        #   Filters by path.
        # @option options [status] :status
        #   Filters the decoders by status.
        #   Allowed values: enabled, disabled, all
        # @option options [download] :download
        #   Name of the decoder file to download.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-all-decoders-files
        def all_decoders_files(options = {})
          data = get '/decoders/files', options
          data
        end

        # Get all parent decoders
        # Returns all parent decoders included in ossec.conf.
        #
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-all-parent-decoders
        def all_parent_decoders(options = {})
          data = get '/decoders/parents', options
          data
        end

        # Get decoders by name
        # Returns the decoders with the specified name.
        #
        # @param [String] decoder_name
        #   Decoder name
        # @option options [offset] :offset
        #   First element to return in the collection.
        # @option options [limit] :limit
        #   Maximum number of elements to return.
        # @option options [sort] :sort
        #   Sorts the collection by a field or fields (separated by comma). Use +/- at the beginning to list in ascending or descending order.
        # @option options [search] :search
        #   Looks for elements with the specified string.
        # @see https://documentation.wazuh.com/3.10/user-manual/api/reference.html#get-decoders-by-name
        def decoders_by_name(decoder_name, options = {})
          data = get "/decoders/#{decoder_name}", options
          data
        end
      end
    end
  end
end
