# frozen_string_literal: true

$LOAD_PATH.push(File.expand_path('lib', __dir__))

# Maintain your gem's version:
require 'rails_lti2_provider/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails_lti2_provider'
  s.summary     = 'An aidee for implementing an LTI Tool provider'
  s.version     = RailsLti2Provider::VERSION
  s.required_ruby_version = '>= 2.6'
  s.authors     = ['Nathan Mills']
  s.homepage    = 'http://github.com/rivernate/rails_lti2_provider'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency('ims-lti', '~> 2.3.2.1')
  s.add_dependency('rails', '~> 6.1')

  s.add_development_dependency('rspec-rails', '~> 4.0')
  s.add_development_dependency('sqlite3', '~> 1.3')

  s.add_development_dependency('rubocop', '~> 1.33.0')
  s.add_development_dependency('rubocop-rails', '~> 2.15.0')
end
