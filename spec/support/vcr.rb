RSpec.configure do |config|
  VCR.config do |c|
    c.default_cassette_options = {
      :match_requests_on => [:method, :uri, :body],
      :record => :none,
      :erb => true }
      c.cassette_library_dir = 'spec/fixtures/vcr'
      c.stub_with :webmock
  end
end
