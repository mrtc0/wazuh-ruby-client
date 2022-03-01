# frozen_string_literal: true
module Wazuh
  module Sawyer
    module Request
      MAX_ITEM_NUM = 500

      def get(path, options = {})
        request(:get, path, options).data
      end

      def post(path, options = {})
        request(:post, path, options).data
      end

      def put(path, options = {})
        request(:put, path, options).data
      end

      def delete(path, options = {})
        request(:delete, path, options).data
      end

      # The response format is different for v3 and v4.
      # In v3, it is a camel case like `totalItems` and `items`,
      # but in v4, it is snake case like total_affected_items.
      # offset_request will fill this gap.
      # This function is used if there are `affected_items` or `items` in the response.
      def offset_request(method, path, options = {})
        items = []
        data = send(method, path, options)
        total_items = api_version == 3 ? data.totalItems : data.total_affected_items
        0.step(total_items, MAX_ITEM_NUM) do |offset|
          options[:offset] = offset
          d = send(method, path, options)
          _items = api_version == 3 ? data.items : d.affected_items
          items.concat(_items)
        end

        items
      end

      private

      def request(method, path, options, query_options={})
        response = case method
                   when :get, :delete
                     connection.call(method, URI::Parser.new.escape(path), nil, {query: options})
                   when :post, :put
                     data = options unless options.empty?
                     connection.call(method, URI::Parser.new.escape(path), data, {query: query_options})
                   end

        return response.data if response.status == 200

        raise Wazuh::Api::Errors::WazuhError.new(response.body, response)
      end
    end
  end
end
