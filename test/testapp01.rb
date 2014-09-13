# Test program for ruby logfile class
require 'GunnyLog'


# Test for screen logging, one liners
GunnyLog.instance.message('Main:Runloop', 'Error loading preferences')
GunnyLog.instance.message_formatted('TestClass:GetUrl', 'Error number = %d', 40)


# Test for screen logging
logs = GunnyLog.instance

logs.message('Testing GunnyScreenLog 01')
logs.set_logging_enabled(false)
logs.message('Testing GunnyScreenLog 02 OFF')
logs.set_logging_enabled(true)

logs.set_message_location('init')
logs.message('Testing GunnyScreenLog 01')
logs.set_message_location('destroy')
logs.message('Testing GunnyScreenLog 02')

logs.message('read','Testing GunnyScreenLog 02')
logs.message('sort','Testing GunnyScreenLog 03')

logs.message_formatted('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])
logs.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')


#Test for file logging
logf = GunnyLog.instance
logf.open('testapp.log')

logf.message('Testing GunnyFileLog 01')
logf.set_logging_enabled(false)
logf.message('Testing GunnyFileLog 02 OFF')
logf.set_logging_enabled(true)

logf.set_message_location('init')
logf.message('Testing GunnyFileLog 01')
logf.set_message_location('destroy')
logf.message('Testing GunnyFileLog 02')

logf.message('read','Testing GunnyFileLog 02')
logf.message('sort','Testing GunnyFileLog 03')

logf.message_formatted('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])
logf.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')

logf.close

# Test for logging with logging level
g = GunnyLog.instance
g.set_logging_level(GunnyLog::FATAL)
g.log_fatal('main', 'error message')
g.log_error('main', 'error message')
g.log_info('main', 'error message')
g.log_warning('main', 'error message')
g.log_unknown('main', 'error message')
g.log_debug('main', 'error message')
