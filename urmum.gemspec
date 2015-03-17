# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'urmum/version'

Gem::Specification.new do |spec|
  spec.name          = "urmum"
  spec.version       = Urmum::VERSION
  spec.authors       = ["Duncan Stuart"]
  spec.email         = ["dgmstuart@gmail.com"]
  spec.description   = %q{Taking natural language and throwing it back at you as "you're a"/"your mum's a" jokes}
  spec.summary       = %q{Mostly to annoy my colleauge A}
  spec.homepage      = "https://github.com/dgmstuart/urmum/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "engtagger"
  spec.add_runtime_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "simplecov"
end
