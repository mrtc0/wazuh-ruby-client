describe Wazuh::Sawyer::Request do
  let(:client) { Wazuh::Client.new(api_version: 3, basic_user: "wazuh", basic_password: "wazuh") }

  describe 'interface test' do
    it { expect(client).to respond_to(:get) }
    it { expect(client).to respond_to(:put) }
    it { expect(client).to respond_to(:post) }
    it { expect(client).to respond_to(:delete) }
    it { expect(client).to respond_to(:offset_request) }
    # Private Methods
    it { expect(client).not_to respond_to(:request) }
  end

  describe '#offset_request' do
    context 'Wazuh API v3' do
      describe 'method call' do
        before {
          allow(client).to receive(:get).and_return(Sawyer::Resource.new(sawyer_agent, data))
        }

        context 'If the number of items is equal to the requested number of offsets' do
          let(:data) {
            {:totalItems => 3, :items => 3.times.map { {:dummy => 'dummy'} } }
          }

          it 'get method must be called only once' do
            client.offset_request('get', '/test')
            expect(client).to have_received(:get).once
          end

          it 'The number of items must match' do
            expect(client.offset_request('get', '/test').size).to eq(3)
          end
        end

        context 'If there are more items than the requested number of offsets' do
          let(:data) {
            {:totalItems => 700, :items => 500.times.map { {:dummy => 'dummy'} } }
          }

          it 'get method must be called 3 times' do
            client.offset_request('get', '/test')
            expect(client).to have_received(:get).exactly(3).times
          end
        end
      end

      describe 'number of response items', vcr: { cassette_name: 'requests/offset_request_more_than_500_items_v3' } do
        it 'The number of items must match' do
          expect(client.offset_request('get', '/test').size).to eq(700)
        end
      end
    end

    context 'Wazuh API v4' do
      let(:client) { Wazuh::Client.new(api_version: 4, basic_user: "wazuh", basic_password: "wazuh") }

      describe 'method call' do
        before {
          allow(client).to receive(:get).and_return(Sawyer::Resource.new(sawyer_agent, data))
        }

        context 'If the number of affected_items is equal to the requested number of offsets' do
          let(:data) {
            {:total_affected_items => 3, :affected_items => 3.times.map { {:dummy => 'dummy'} } }
          }

          it 'get method must be called only once' do
            client.offset_request('get', '/test')
            expect(client).to have_received(:get).once
          end

          it 'The number of items must match' do
            expect(client.offset_request('get', '/test').size).to eq(3)
          end
        end

        context 'If there are more affected_items than the requested number of offsets' do
          let(:data) {
            {:total_affected_items => 700, :affected_items => 500.times.map { {:dummy => 'dummy'} } }
          }

          it 'get method must be called 3 times' do
            client.offset_request('get', '/test')
            expect(client).to have_received(:get).exactly(3).times
          end
        end
      end

      describe 'number of response items', vcr: { cassette_name: 'requests/offset_request_more_than_500_items_v4' } do
        before {
          Wazuh::Sawyer::Connection::Token.instance_variable_set('@_token', 'eyj')
          client.instance_variable_set('@_exp', Time.now.to_i)
        }

        it 'The number of items must match' do
          expect(client.offset_request('get', '/test').size).to eq(700)
        end
      end
    end
  end
end
