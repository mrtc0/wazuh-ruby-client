describe Wazuh::Api::Endpoints::V4::Cluster do
  let(:client) { Wazuh::Client.new(api_version: 4, basic_user: "wazuh", basic_password: "wazuh") }

  describe 'interface test' do
    it { expect(client).to respond_to(:local_node_info) }
    it { expect(client).to respond_to(:nodes_info) }
    it { expect(client).to respond_to(:nodes_healthcheck) }
    it { expect(client).to respond_to(:cluster_status) }
    it { expect(client).to respond_to(:local_node_config) }
    it { expect(client).to respond_to(:nodes_api_config) }
    it { expect(client).to respond_to(:node_status) }
    it { expect(client).to respond_to(:node_info) }
    it { expect(client).to respond_to(:node_config) }
    xit { expect(client).to respond_to(:update_node_configuration) }
    it { expect(client).to respond_to(:node_stats) }
    it { expect(client).to respond_to(:node_stats_hour) }
    it { expect(client).to respond_to(:node_stats_week) }
    it { expect(client).to respond_to(:node_stats_analysisd) }
    it { expect(client).to respond_to(:node_stats_remoted) }
    xit { expect(client).to respond_to(:node_logs) }
    xit { expect(client).to respond_to(:node_logs_summary) }
    xit { expect(client).to respond_to(:restart_nodes) }
    xit { expect(client).to respond_to(:check_nodes_config) }
    xit { expect(client).to respond_to(:node_active_configuration) }
  end

  let(:fixture) { 'api/v4/cluster/local_node_info.json' }

  let(:response) {
    response_json = load_json(fixture)
    Sawyer::Resource.new(sawyer_agent, response_json)
  }

  let(:node_id) { 'node-1' }

  before {
    allow(client).to receive(:request).and_return(response)
  }

  describe '#local_node_info' do
    let(:fixture) { 'api/v4/cluster/local_node_info.json' }

    it 'Type match' do
      expect(client.local_node_info).to be_a(Array)
      expect(client.local_node_info.first).to be_a(Sawyer::Resource)
    end

    describe 'interface test' do
      let(:info) {
        client.local_node_info.first
      }

      it { expect(info).to respond_to(:name) }
      it { expect(info).to respond_to(:type) }
      it { expect(info).to respond_to(:version) }
      it { expect(info).to respond_to(:ip) }
    end
  end

  describe '#cluster_status' do
    let(:fixture) { 'api/v4/cluster/cluster_status.json' }

    it 'Type match' do
      expect(client.cluster_status).to be_a(Sawyer::Resource)
    end

    describe 'interface test' do
      let(:status) {
        client.cluster_status
      }

      it { expect(status).to respond_to(:enabled) }
      it { expect(status).to respond_to(:running) }
    end
  end

  describe '#nodes_api_config' do
    let(:fixture) { 'api/v4/cluster/nodes_api_config.json' }

    it 'Type match' do
      expect(client.nodes_api_config).to be_a(Array)
      expect(client.nodes_api_config.first).to be_a(Sawyer::Resource)
    end

    describe 'interface test' do
      let(:config) {
        client.nodes_api_config.first
      }

      it { expect(config).to respond_to(:node_name) }
      it { expect(config).to respond_to(:node_api_config) }
    end
  end


  describe '#local_node_config' do
    let(:fixture) { 'api/v4/cluster/local_node_config.json' }

    it 'Type match' do
      expect(client.local_node_config).to be_a(Array)
      expect(client.local_node_config.first).to be_a(Sawyer::Resource)
    end

    describe 'interface test' do
      let(:config) {
        client.local_node_config.first
      }

      it { expect(config).to respond_to(:name) }
      it { expect(config).to respond_to(:node_name) }
      it { expect(config).to respond_to(:node_type) }
      it { expect(config).to respond_to(:key) }
      it { expect(config).to respond_to(:port) }
      it { expect(config).to respond_to(:bind_addr) }
      it { expect(config).to respond_to(:nodes) }
      it { expect(config).to respond_to(:hidden) }
      it { expect(config).to respond_to(:disabled) }
    end
  end
  
  describe '#node_status' do
    let(:fixture) { 'api/v4/cluster/node_status.json' }
  
    it 'Type match' do
      expect(client.node_status(node_id)).to be_a(Array)
      expect(client.node_status(node_id).first).to be_a(Sawyer::Resource)
    end
  
    describe 'interface test' do
      let(:status) {
        client.node_status(node_id).first
      }
      
      it { expect(status).to respond_to("wazuh-agentlessd".to_sym) }
      it { expect(status).to respond_to("wazuh-analysisd".to_sym) }
    end
  end

  describe '#node_info' do
    let(:fixture) { 'api/v4/cluster/node_info.json' }
  
    it 'Type match' do
      expect(client.node_info(node_id)).to be_a(Array)
      expect(client.node_info(node_id).first).to be_a(Sawyer::Resource)
    end
  
    describe 'interface test' do
      let(:info) {
        client.node_info(node_id).first
      }
      
      it { expect(info).to respond_to(:path) }
      it { expect(info).to respond_to(:version) }
      it { expect(info).to respond_to(:compilation_date) }
      it { expect(info).to respond_to(:type) }
      it { expect(info).to respond_to(:max_agents) }
    end
  end

  describe '#node_config' do
    let(:fixture) { 'api/v4/cluster/node_config.json' }
  
    it 'Type match' do
      expect(client.node_config(node_id)).to be_a(Array)
      expect(client.node_config(node_id).first).to be_a(Sawyer::Resource)
    end
  
    describe 'interface test' do
      let(:config) {
        client.node_config(node_id).first
      }
  
      it { expect(config).to respond_to(:global) }
      it { expect(config).to respond_to(:alerts) }
      it { expect(config).to respond_to(:command) }
    end
  end

  describe '#node_stats' do
    let(:fixture) { 'api/v4/cluster/node_stats.json' }
  
    it 'Type match' do
      expect(client.node_stats(node_id)).to be_a(Array)
      expect(client.node_stats(node_id).first).to be_a(Sawyer::Resource)
    end
  
    describe 'interface test' do
      let(:config) {
        client.node_stats(node_id).first
      }
  
      it { expect(config).to respond_to(:hour) }
      it { expect(config).to respond_to(:alerts) }
      it { expect(config).to respond_to(:totalAlerts) }
      it { expect(config).to respond_to(:events) }
      it { expect(config).to respond_to(:firewall) }
    end
  end

  describe '#node_stats_hour' do
    let(:fixture) { 'api/v4/cluster/node_stats_hour.json' }
  
    it 'Type match' do
      expect(client.node_stats_hour(node_id)).to be_a(Array)
      expect(client.node_stats_hour(node_id).first).to be_a(Sawyer::Resource)
    end
  
    describe 'interface test' do
      let(:config) {
        client.node_stats_hour(node_id).first
      }
  
      it { expect(config).to respond_to(:averages) }
      it { expect(config).to respond_to(:interactions) }
    end
  end

  describe '#node_stats_week' do
    let(:fixture) { 'api/v4/cluster/node_stats_week.json' }
  
    it 'Type match' do
      expect(client.node_stats_week(node_id)).to be_a(Array)
      expect(client.node_stats_week(node_id).first).to be_a(Sawyer::Resource)
    end
  
    describe 'interface test' do
      let(:config) {
        client.node_stats_week(node_id).first
      }
  
      it { expect(config).to respond_to(:Sun) }
    end
  end

  describe '#node_stats_analysisd' do
    let(:fixture) { 'api/v4/cluster/node_stats_analysisd.json' }
  
    it 'Type match' do
      expect(client.node_stats_analysisd(node_id)).to be_a(Array)
      expect(client.node_stats_analysisd(node_id).first).to be_a(Sawyer::Resource)
    end
  
    describe 'interface test' do
      let(:config) {
        client.node_stats_analysisd(node_id).first
      }
  
      it { expect(config).to respond_to(:total_events_decoded) }
      it { expect(config).to respond_to(:syscheck_events_decoded) }
    end
  end

  describe '#node_stats_remoted' do
    let(:fixture) { 'api/v4/cluster/node_stats_remoted.json' }
  
    it 'Type match' do
      expect(client.node_stats_remoted(node_id)).to be_a(Array)
      expect(client.node_stats_remoted(node_id).first).to be_a(Sawyer::Resource)
    end
  
    describe 'interface test' do
      let(:config) {
        client.node_stats_remoted(node_id).first
      }
  
      it { expect(config).to respond_to(:queue_size) }
      it { expect(config).to respond_to(:total_queue_size) }
    end
  end
end
