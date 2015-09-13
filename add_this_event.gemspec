# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'add_this_event/version'

Gem::Specification.new do |spec|
  spec.name          = 'add_this_event'
  spec.version       = AddThisEvent::VERSION
  spec.authors       = ['Mike Coutermarsh']
  spec.email         = ['coutermarsh.mike@gmail.com']

  spec.summary       = 'Ruby client for using the AddThisEvent API (https://addthisevent.com/api)'
  spec.description   = 'Ruby client for using the AddThisEvent API (https://addthisevent.com/api)'
  spec.homepage      = 'https://github.com/mscoutermarsh/AddThisEvent-Ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|bin)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'addressable', '~> 2.3'
  spec.add_dependency 'tzinfo', '~> 1.2'
  spec.add_dependency 'tzinfo-data', '~> 1'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'rubocop', '~> 0.34'
end
