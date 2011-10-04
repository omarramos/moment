Gem::Specification.new do |s|
  s.name        = 'moment'
  s.version     = '0.0.1'
  s.date        = '2011-10-4'
  s.summary     = "A simple wrapper for the moment api https://momentapp.com/"
  s.description = "A simple wrapper for the moment api https://momentapp.com/"
  s.authors     = ["Omar Ramos"]
  s.email       = 'omar@sugarcoded.net'
  s.files       = ["lib/moment.rb"]
  s.homepage    = 'https://github.com/sugarcoded/moment'
  s.add_dependency(%q<httparty>, ['~> 0.8.0'])
  s.add_dependency(%q<rspec>,     ["~> 2.5"])
  s.add_dependency(%q<vcr>,     ["~> 1.11.0"])
end
