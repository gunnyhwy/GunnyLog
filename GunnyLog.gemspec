#require 'GunnyLog'


Gem::Specification.new do |s|
  s.name          = 'GunnyLog'
  s.version       = '1.1.5'
  s.date          = '2014-09-13'
  s.summary       = 'Ruby log file class'
  s.description   = 'Ruby class for logging to stdout, stderr, or a file'
  s.authors       = ['GunnyHwy']
  s.email         = 'gunnyhwy21@yahoo.com'
  s.files         = ['lib/GunnyLog.rb',
                     'lib/GunnyLog/exceptions.rb',
                     'lib/GunnyLog/severity.rb',
                     'README.md']
  s.homepage      = 'http://rubygems.org/gems/GunnyLog'
  s.license       = 'GPL v3'
end