Gem::Specification.new do |s|
  s.name          = 'silent_progress_bar'
  s.version       = '0.0.3'
  s.date          = '2021-02-01'
  s.summary       = 'Silenced Progress Bar'
  s.description   = 'A progress bar that suppresses ActiveRecord logging.'
  s.homepage      = 'http://rubygems.org/gems/silent_progress_bar'
  s.license       = 'GPL-3.0'
  s.authors       = ['Julian Fiander']
  s.email         = 'julian@fiander.one'
  s.require_paths = %w[lib spec doc]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")

  s.required_ruby_version = '~> 2.2'

  s.add_runtime_dependency 'rails'
  s.add_runtime_dependency 'ruby-progressbar'

  s.add_runtime_dependency 'nokogiri', '>= 1.11.1'

  s.add_development_dependency 'rake',      '~> 12.2', '>= 12.2.1'
  s.add_development_dependency 'rspec',     '~> 3.7',  '>= 3.7.0'
  s.add_development_dependency 'simplecov', '~> 0.15', '>= 0.15.1'
end
