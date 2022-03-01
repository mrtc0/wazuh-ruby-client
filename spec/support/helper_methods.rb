def sawyer_agent
  stubs = Faraday::Adapter::Test::Stubs.new
  Sawyer::Agent.new "https://api.wazuh.com/" do |conn|
    conn.builder.handlers.delete(Faraday::Adapter::NetHttp)
    conn.adapter :test, stubs
  end
end

def load_json(fixture)
  response_json = File.read(fixture_path(fixture))
  JSON.parse(response_json, symbolize_names: true)
end

def fixture_path(name)
  path = File.expand_path("../fixtures/", __dir__)
  Pathname.new(File.join(path, name))
end
