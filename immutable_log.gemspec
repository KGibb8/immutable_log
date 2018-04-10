# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "immutable_log/version"

Gem::Specification.new do |s|
  s.name          = "immutable_log"
  s.version       = ImmutableLog::VERSION.dup
  s.authors       = ["Kieran"]
  s.email         = ["kieran@tenthousandthings.org.uk"]
  s.homepage      = "https://github.com/kgibb8/immutable_log"
  s.summary       = %q{An immutable transaction log for accounting systems in multiple currencies}
  s.description   = <<-EOF
    An immutable transaction log for accounting systems in multiple currencies
  EOF
 

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  s.bindir        = "exe"
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Dependency is active record rather than pg, could work with mySQL or sqlLite
  # Could also be setup with mongo?
  s.add_runtime_dependency 'pg'

  s.add_development_dependency "bundler", "~> 1.15"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
