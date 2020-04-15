describe Wazuh::Api::Endpoints::Agents do
  let(:client) { Wazuh::Client.new }

  describe '#all_agents', vcr: { cassette_name: 'api/endpoints/all_agents' } do
    it 'Returns a list with the available agents' do
      agents = client.all_agents
      expect(agents.class).to eq Array
    end
  end

  describe "#agent", vcr: { cassette_name: 'api/endpoints/agent' } do
    it 'Returns various information from an agent' do
      agent = client.agent('000')
      expect(agent.class).to eq Sawyer::Resource
      expect(agent.id).to eq '000'
    end
  end

  describe "#agent_by_name", vcr: { cassette_name: 'api/endpoints/agent_by_name' } do
    it 'Returns various information from an agent called :agent_name' do
      agent = client.agent_by_name('NewHost')
      expect(agent.class).to eq Sawyer::Resource
      expect(agent.name).to eq 'NewHost'
    end
  end

  describe "#agent_key", vcr: { cassette_name: 'api/endpoints/agent_key' } do
    it 'Returns the key of an agent' do
      agent = client.agent_key('004')
      expect(agent.class).to eq String
    end
  end

  describe "#restart_agents", vcr: { cassette_name: 'api/endpoints/restart_agents' } do
    it 'Returns a list of restarted agents' do
      data = client.restart_agents({ids: ['002', '004']})
      expect(data.class).to eq Sawyer::Resource
      expect(data.affected_agents).to eq ['002', '004']
    end
  end

  describe "#restart_all_agents", vcr: { cassette_name: 'api/endpoints/restart_all_agents' } do
    it 'Returns a message "Restarting all agents"' do
      msg = client.restart_all_agents
      expect(msg.class).to eq String
      expect(msg).to eq "Restarting all agents"
    end
  end

  describe "#agent_upgrade_custom", vcr: { cassette_name: 'api/endpoints/agent_upgrade_custom' } do
    it 'Returns message' do
      msg = client.agent_upgrade_custom("1234")
      expect(msg).to eq "Installation started"
    end
  end

  describe "#agent_upgrade", vcr: { cassette_name: 'api/endpoints/agent_upgrade' } do
    it 'Returns message' do
      msg = client.agent_upgrade("1234")
      expect(msg).to eq "Upgrade procedure started"
    end
  end
end
