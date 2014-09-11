require 'GunnyLog/version'
#require 'GunnyLog'


Gem::Specification.new do |s|
  s.name          = 'GunnyLog'
  s.version       = GunnyLog::VERSION
  s.date          = '2014-09-11'
  s.summary       = 'Ruby log file class'
  s.description   = 'Ruby class for logging to screen or file'
  s.authors       = ['GunnyHwy']
  s.email         = 'gunnyhwy21@yahoo.com'
  s.files         = ['lib/GunnyLog.rb',
                     'lib/GunnyLog/version.rb',
                     'lib/GunnyLog/exceptions.rb']
  s.homepage      = 'http://rubygems.org/gems/GunnyLog'
  s.license       = 'GPL v3'
end