# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clark/event_bus/version'

Gem::Specification.new do |spec|
  spec.name          = "event_bus"
  spec.version       = Clark::EventBus::VERSION
  spec.authors       = ["Rafael Jesus"]
  spec.email         = ["rafaelljesus86@gmail.com"]

  spec.summary       = %q{Exposes aditional methods (trigger and on) for messaging features}
  spec.description   = %q{Exposes aditional methods (trigger and on) for messaging features}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "bunny"
end
