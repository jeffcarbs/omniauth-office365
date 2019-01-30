$LOAD_PATH.unshift File.expand_path(__dir__)
$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'rspec'
require 'rack/test'
require 'omniauth-office365'

RSpec.configure do |config|
  config.extend OmniAuth::Test::StrategyMacros, :type => :strategy
  config.include Rack::Test::Methods
end
