describe Wazuh::Api::Endpoints::V4::Vulnerabilities do
  let(:client) { Wazuh::Client.new(api_version: 4, basic_user: "wazuh", basic_password: "wazuh") }

  describe "#vulnerabilities", vcr: { cassette_name: 'api/endpoints/v4/vulnerabilities' } do
    let(:vulnerabilities) { client.vulnerabilities("1234") }
    describe 'interface' do
      it { expect(vulnerabilities.class).to eq Array }
      it { expect(vulnerabilities.first).to respond_to(:cve) }
      it { expect(vulnerabilities.first).to respond_to(:architecture) }
      it { expect(vulnerabilities.first).to respond_to(:version) }
      it { expect(vulnerabilities.first).to respond_to(:name) }
    end
  end
end
