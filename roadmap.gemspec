# -*- encoding: utf-8 -*-
require File.expand_path('../lib/roadmap/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jack Polgar"]
  gem.email         = ["nrx@nirix.net"]
  gem.description   = %q{Roadmap is a muliple project issue tracker.}
  gem.summary       = %q{Multiple project issue tracker.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "roadmap"
  gem.require_paths = ["lib"]
  gem.version       = Roadmap::VERSION
end
