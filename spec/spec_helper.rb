require 'bundler/setup'
Bundler.setup
require 'simplecov'
SimpleCov.start
SimpleCov.minimum_coverage(100)

require 'silent_progress_bar'

RSpec.configure do |config|
  #
end
