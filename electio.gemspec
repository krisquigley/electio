$LOAD_PATH.push File.expand_path("../lib", __FILE__)

require "electio/version"

Gem::Specification.new do |s|
  s.name        = 'electio'
  s.version     = Electio::VERSION
  s.date        = '2016-07-09'
  s.summary     = "Ruby gem for the Electio API."
  s.description = "Electio is the delivery management platform retailers have been crying out for. Created by delivery software pioneers, MPD Group, it is designed to meet the ever-increasing delivery expectations of the 21st Century shopper. And if you think multiple delivery options are just for really big retailers, think again."
  s.authors     = ["Kris Quigley"]
  s.email       = 'kris@krisquigley.co.uk'
  s.files       = ["lib/electio.rb"]
  s.homepage    =
    'http://github.org/krisquigley'
  s.license       = 'MIT'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.required_ruby_version = ">= 2.3"

  s.add_runtime_dependency 'plissken', '~> 0.2.0'
  s.add_runtime_dependency 'awrence', '~> 0.1.0'
  s.add_runtime_dependency 'hashie', '~> 3.4', '>= 3.4.4'
end