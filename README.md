# GunnyLog

Ruby logfile class

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'GunnyLog'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install GunnyLog

## Usage

### Require GunnyLog
require 'GunnyLog'

### Example of screen logging, one liners

#### Sample code
GunnyLog.instance.message('Main:Runloop', 'Error loading preferences')<br> 
GunnyLog.instance.message_formatted('TestClass:GetUrl', 'Error number = %d', 40)<br>

#### Sample output
09/11/2014|03:33:58PM|testapp01.rb|Main:Runloop|Error loading preferences<br>
09/11/2014|03:33:58PM|testapp01.rb|TestClass:GetUrl|Error number = 40<br>

### Example of screen logging

#### Sample code
logs = GunnyLog.instance<br>

logs.message('Testing GunnyScreenLog 01')<br>
logs.set_logging_enabled(false)<br>
logs.message('Testing GunnyScreenLog 02 OFF')<br>
logs.set_logging_enabled(true)<br>

logs.set_message_location('init')<br>
logs.message('Testing GunnyScreenLog 01')<br>
logs.set_message_location('destroy')<br>
logs.message('Testing GunnyScreenLog 02')<br>

logs.message('read','Testing GunnyScreenLog 02')<br>
logs.message('sort','Testing GunnyScreenLog 03')<br>

logs.message_formatted('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])<br>
logs.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')<br>

#### Sample output
09/11/2014|03:33:58PM|testapp01.rb|TestClass:GetUrl|Testing GunnyScreenLog 01<br>
09/11/2014|03:33:58PM|testapp01.rb|init|Testing GunnyScreenLog 01<br>
09/11/2014|03:33:58PM|testapp01.rb|destroy|Testing GunnyScreenLog 02<br>
09/11/2014|03:33:58PM|testapp01.rb|read|Testing GunnyScreenLog 02<br>
09/11/2014|03:33:58PM|testapp01.rb|sort|Testing GunnyScreenLog 03<br>
09/11/2014|03:33:58PM|testapp01.rb|sort|name: Gunny, age: 42, job: Developer<br>
09/11/2014|03:33:58PM|testapp01.rb|sort|name: Gunny, age: 42, job: Developer<br>


### Example of file logging

#### Sample code
logf = GunnyLogFile.instance<br>
logf.open('testapp.log')<br>

logf.message('Testing GunnyFileLog 01')<br>
logf.set_logging_enabled(false)<br>
logf.message('Testing GunnyFileLog 02 OFF')<br>
logf.set_logging_enabled(true)<br>

logf.set_message_location('init')<br>
logf.message('Testing GunnyFileLog 01')<br>
logf.set_message_location('destroy')<br>
logf.message('Testing GunnyFileLog 02')<br>

logf.message('read','Testing GunnyFileLog 02')<br>
logf.message('sort','Testing GunnyFileLog 03')<br>

logf.message_formatted('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])<br>
logf.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')<br>

logf.close<br>

#### Sample output
09/11/2014|03:33:58PM|testapp01.rb|TestClass:GetUrl|Testing GunnyScreenLog 01<br>
09/11/2014|03:33:58PM|testapp01.rb|init|Testing GunnyScreenLog 01<br>
09/11/2014|03:33:58PM|testapp01.rb|destroy|Testing GunnyScreenLog 02<br>
09/11/2014|03:33:58PM|testapp01.rb|read|Testing GunnyScreenLog 02<br>
09/11/2014|03:33:58PM|testapp01.rb|sort|Testing GunnyScreenLog 03<br>
09/11/2014|03:33:58PM|testapp01.rb|sort|name: Gunny, age: 42, job: Developer<br>
09/11/2014|03:33:58PM|testapp01.rb|sort|name: Gunny, age: 42, job: Developer<br>


### Example of logging with logging level

#### Sample code
logl = GunnyLog.instance<br>

logl.set_logging_level(GunnyLog::ERROR)<br>
logl.log_fatal('main', 'error message')<br>
logl.log_error('main', 'error message')<br>
logl.log_info('main', 'error message')<br>

logl.set_logging_level(GunnyLog::WARNING)<br>
logl.log_warning('main', 'error message')<br>
logl.log_unknown('main', 'error message')<br>
logl.log_debug('main', 'error message')<br>

#### Sample output
09/13/2014|06:55:56AM|testapp01.rb|FATAL|main|error message<br>
09/13/2014|06:55:56AM|testapp01.rb|ERROR|main|error message<br>
09/13/2014|06:55:56AM|testapp01.rb|WARNING|main|error message<br>
09/13/2014|06:55:56AM|testapp01.rb|UNKNOWN|main|error message<br>

## Documentation

http://rubydoc.info/gems/GunnyLog/frames/index

## Contributing

1. Fork it ( https://github.com/gunnyhwy/GunnyLog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Thanks! Gunny