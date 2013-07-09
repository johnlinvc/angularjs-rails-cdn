# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'angularjs/rails/cdn/version'

Gem::Specification.new do |spec|
  spec.name          = "angularjs-rails-cdn"
  spec.version       = Angularjs::Rails::Cdn::VERSION
  spec.authors       = ["Johnlinvc"]
  spec.email         = ["johnlinvc@gmail.com"]
  spec.description   = %q{Add CDN support to angularjs-rails}
  spec.summary       = %q{Add CDN support to angularjs-rails}
  spec.homepage      = "https://github.com/johnlinvc/angularjs-rails-cdn"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
