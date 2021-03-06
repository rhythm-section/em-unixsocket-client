# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'em-unixsocket-client/version'

Gem::Specification.new do |spec|
  spec.name          = "em-unixsocket-client"
  spec.version       = EventMachine::UnixSocketClient::VERSION
  spec.authors       = ["Christoph Edthofer", "Thomas Esterer"]
  spec.email         = ["christoph.edthofer@hiveyourhome.org", "thomas.esterer@hiveyourhome.org"]
  spec.summary       = %q{Write a short summary. Required.}
  spec.description   = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency("eventmachine", ">= 0.12.9")
  
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "em-spec"
end
