require 'compare_linker'
require 'factory_bot'
require 'rspec'

Dir["#{__dir__}/support/**/*.rb"].each do |f|
  require f
end

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include LoadFixtureHelper

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
