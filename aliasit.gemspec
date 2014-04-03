# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aliasit/version'

Gem::Specification.new do |spec|
  spec.name          = "aliasit"
  spec.version       = Aliasit::VERSION
  spec.authors       = ["Samuel McTaggart"]
  spec.email         = ["sam.mctaggart@gmail.com"]
  spec.summary       = %q{Quickly make aliases}
  spec.description   = %q{Make aliases from the command line}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['aliasit']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fakefs"
  spec.add_development_dependency "pry"
end
