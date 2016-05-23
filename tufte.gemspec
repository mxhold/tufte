# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tufte/version'

Gem::Specification.new do |spec|
  spec.name          = "tufte"
  spec.version       = Tufte::VERSION
  spec.authors       = ["Max Holder"]
  spec.email         = ["mxhold@gmail.com"]

  spec.summary       = "Blog/static site generator based on tufte-css"
  spec.homepage      = "https://github.com/mxhold/tufte"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.4"

  # markdown rendering
  spec.add_runtime_dependency "redcarpet", "~> 3.3"
  # syntax highlighting
  spec.add_runtime_dependency "rouge", "~> 1.10"
  # development server
  spec.add_runtime_dependency "rack", "~> 1.6"
end
