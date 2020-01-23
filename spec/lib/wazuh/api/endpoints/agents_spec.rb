describe Wazuh::Api::Endpoints::Agents do
  describe '#all_agents', vcr: { cassette_name: 'api/endpoints/all_agents', allow_playback_repeats: true } do
    it 'get all agents' do
      client = Wazuh::Client.new
      resp = client.all_agents
      expect(resp['error']).to eq 0
    end
  end
end
