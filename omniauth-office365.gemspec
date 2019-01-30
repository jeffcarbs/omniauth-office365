require File.expand_path('lib/omniauth-office365/version', __dir__)

Gem::Specification.new do |gem|
  gem.authors       = 'Jeff Carbonella'
  gem.email         = 'jeff@contactually.com'
  gem.description   = 'OmniAuth OAuth2 strategy for the Office365 v2.0 REST API.'
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/jcarbo/omniauth-office365'
  gem.licenses      = %w[MIT]

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-office365'
  gem.require_paths = %w[lib]
  gem.version       = OmniAuth::Office365::VERSION

  gem.add_dependency 'omniauth-oauth2', '~> 1.6.0'

  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rubocop'
end
