# GunnyLog

Ruby logfile class

## Installation

Add this line to your application's Gemfile:

```
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
```
GunnyLog.instance.message('Main:Runloop', 'Error loading preferences')
GunnyLog.instance.message('Another Error loading preferences')

GunnyLog.instance.message_formatted('TestClass:GetUrl', 'Error number = %d', errno)
GunnyLog.instance.message_formatted('Error number = %d', errno2)
```

#### Sample output
```
09/16/2014|01:27:30PM|testapp01.rb|Main:Runloop|Error loading preferences
09/16/2014|01:27:30PM|testapp01.rb|Main:Runloop|Another Error loading preferences
09/16/2014|01:27:30PM|testapp01.rb|TestClass:GetUrl|Error number = 44
09/16/2014|01:27:30PM|testapp01.rb|TestClass:GetUrl|Error number = 22
```

### Example of screen logging

#### Sample code
```
logs = GunnyLog.instance

logs.message('SomeMethod','Testing GunnyScreenLog 01')
logs.set_logging_enabled(false)
logs.message('Testing GunnyScreenLog 02 OFF')
logs.set_logging_enabled(true)

logs.set_message_location('init')
logs.message('Testing GunnyScreenLog 01')
logs.set_message_location('destroy')
logs.message('Testing GunnyScreenLog 02')

logs.message('read','Testing GunnyScreenLog 02')
logs.message('Testing GunnyScreenLog 03')

logs.message_formatted('sort','name: %s, age: %d, job: %s', ['Gunny', errno, 'Developer'])
logs.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', errno2, 'Developer')
```

#### Sample output
```
09/16/2014|01:43:35PM|testapp01.rb|SomeMethod|Testing GunnyScreenLog 01
09/16/2014|01:43:35PM|testapp01.rb|init|Testing GunnyScreenLog 01
09/16/2014|01:43:35PM|testapp01.rb|destroy|Testing GunnyScreenLog 02
09/16/2014|01:43:35PM|testapp01.rb|read|Testing GunnyScreenLog 02
09/16/2014|01:43:35PM|testapp01.rb|read|Testing GunnyScreenLog 03
09/16/2014|01:43:35PM|testapp01.rb|sort|name: Gunny, age: 42, job: Developer
09/16/2014|01:43:35PM|testapp01.rb|sort|name: Gunny, age: 22, job: Developer
```

### Example of file logging

#### Sample code
```
logf = GunnyLog.instance
logf.open('testapp.log')

logf.message('init', 'Testing GunnyFileLog 01')
logf.set_logging_enabled(false)
logf.message('Testing GunnyFileLog 02 OFF')
logf.set_logging_enabled(true)

logf.set_message_location('setup')
logf.message('Testing GunnyFileLog 01')
logf.set_message_location('destroy')
logf.message('Testing GunnyFileLog 02')

logf.message('read','Testing GunnyFileLog 02')
logf.message('Testing GunnyFileLog 03')

logf.message_formatted('sort', 'name: %s, age: %d, job: %s', ['Gunny', errno, 'Developer'])
logf.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', errno2, 'Developer')

logf.close
```

#### Sample output
```
09/16/2014|01:45:59PM|testapp01.rb|init|Testing GunnyFileLog 01
09/16/2014|01:45:59PM|testapp01.rb|setup|Testing GunnyFileLog 01
09/16/2014|01:45:59PM|testapp01.rb|destroy|Testing GunnyFileLog 02
09/16/2014|01:45:59PM|testapp01.rb|read|Testing GunnyFileLog 02
09/16/2014|01:45:59PM|testapp01.rb|read|Testing GunnyFileLog 03
09/16/2014|01:45:59PM|testapp01.rb|sort|name: Gunny, age: 42, job: Developer
09/16/2014|01:45:59PM|testapp01.rb|sort|name: Gunny, age: 22, job: Developer
```

### Example of logging with logging level

#### Sample code
```
g = GunnyLog.instance

g.set_logging_level(GunnyLog::ERROR)
g.log_fatal('init', 'error message 1')
g.log_error('pref', 'error message 2')
g.log_info('main', 'error message 3')

g.set_logging_level(GunnyLog::WARNING)
g.log_warning('getdb', 'error message 4')
g.log_unknown('main', 'error message 5')
g.log_debug('genreport', 'error message 6')
```

#### Sample output
```
09/16/2014|01:48:16PM|testapp01.rb|FATAL|init|error message 1
09/16/2014|01:48:16PM|testapp01.rb|ERROR|pref|error message 2
09/16/2014|01:48:16PM|testapp01.rb|WARNING|getdb|error message 4
09/16/2014|01:48:16PM|testapp01.rb|UNKNOWN|main|error message 5
```

## Documentation

http://rubydoc.info/gems/GunnyLog/frames/index

## Contributing

1. Fork it ( https://github.com/gunnyhwy/GunnyLog/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Thanks! Gunny