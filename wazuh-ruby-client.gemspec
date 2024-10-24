lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wazuh-ruby-client/version"

Gem::Specification.new do |spec|
  spec.name          = "wazuh-ruby-client"
  spec.version       = WazuhRubyClient::VERSION
  spec.authors       = ["mrtc0"]
  spec.email         = ["mrtc0@ssrf.in"]

  spec.summary       = %q{Wazuh API client for Ruby}
  spec.description   = %q{Wazuh API client for Ruby}
  spec.homepage      = "https://github.com/mrtc0/wazuh-ruby-client"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "https://github.com/mrtc0/wazuh-ruby-client"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/mrtc0/wazuh-ruby-client"
    spec.metadata["changelog_uri"] = "https://github.com/mrtc0/wazuh-ruby-client/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "timecop"

  spec.add_dependency 'faraday'
  spec.add_dependency 'sawyer'
  spec.add_dependency 'jwt'
end
