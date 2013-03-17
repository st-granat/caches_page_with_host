# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'caches_page_with_host/version'

Gem::Specification.new do |gem|
  gem.name          = "caches_page_with_host"
  gem.version       = CachesPageWithHost::VERSION
  gem.authors       = ["Andrey"]
  gem.email         = ["railscode@gmail.com"]
  gem.description   = "Caches Page with current host to public/kesh folder. Include nginx for example config"
  gem.summary       = "Caches Page with current host to public/kesh folder. Include nginx for example config"
  gem.homepage      = "https://github.com/vav/caches_page_with_host"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rails", ">= 3.2.12"
end
