# -*- encoding: utf-8 -*-
require File.expand_path('../lib/roadmap/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jack Polgar"]
  gem.email         = ["nrx@nirix.net"]
  gem.description   = %q{Roadmap is a muliple project issue tracker.}
  gem.summary       = %q{Multiple project issue tracker.}
  gem.homepage      = "http://roadmaprb.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "roadmap"
  gem.require_paths = ["lib"]
  gem.version       = Roadmap::VERSION

  gem.add_dependency 'rack', '~> 1.4.1'
  gem.add_dependency 'sinatra', '~> 1.3.2'
  gem.add_dependency 'rocketeer', '~> 0.5.0'
  gem.add_dependency 'sequel', '~> 3.36.1'
  gem.add_dependency 'sequel_sluggable', '~> 0.0.6'
  gem.add_dependency 'mysql2', '~> 0.3.11'
  gem.add_dependency 'bcrypt-ruby', '~> 3.0.1'
  gem.add_dependency 'redcarpet', '~> 2.1.1'

  gem.add_development_dependency 'sass', '~> 3.1.20'
  gem.add_development_dependency 'bacon', '~> 1.1.0'
end
