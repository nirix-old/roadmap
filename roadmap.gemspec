# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'roadmap/version'

Gem::Specification.new do |gem|
  gem.name          = "roadmap"
  gem.version       = Roadmap::VERSION
  gem.authors       = ["Jack Polgar"]
  gem.email         = ["nrx@nirix.net"]
  gem.summary       = "Multiple project issue tracker."
  gem.description   = "Roadmap is a multiple project issue tracker."
  gem.homepage      = "http://roadmaprb.com"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rack',             '~> 1.5.1'
  gem.add_dependency 'sinatra',          '~> 1.3.4'
  gem.add_dependency 'rocketeer',        '~> 0.6.1'
  gem.add_dependency 'sequel',           '~> 3.44.0'
  gem.add_dependency 'sequel_sluggable', '~> 0.0.6'
  gem.add_dependency 'mysql2',           '~> 0.3.11'
  gem.add_dependency 'bcrypt-ruby',      '~> 3.0.1'
  gem.add_dependency 'redcarpet',        '~> 2.2.2'
  gem.add_dependency 'rack-flash3',      '~> 1.0.3'

  gem.add_development_dependency 'sass',       '~> 3.2.5'
  gem.add_development_dependency 'bacon',      '~> 1.2.0'
  gem.add_development_dependency 'listen',     '~> 0.7.2'
  gem.add_development_dependency 'rb-fsevent', '~> 0.9.3'
end
