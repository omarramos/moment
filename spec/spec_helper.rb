require 'vcr'
require 'moment'
require 'support/vcr.rb'

RSpec.configure do |config|
  config.mock_with :rspec
  config.extend VCR::RSpec::Macros
end

