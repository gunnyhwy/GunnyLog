# Test program for ruby logfile class
require 'GunnyLog'

errno = 42
errno2 = 22

# Test for screen logging, one liners
GunnyLog.instance.message('Main:Runloop', 'Error loading preferences')
GunnyLog.instance.message('Another Error loading preferences')

GunnyLog.instance.message_formatted('TestClass:GetUrl', 'Error number = %d', errno)
GunnyLog.instance.message_formatted('Error number = %d', errno2)

# Test for screen logging
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


#Test for file logging
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


# Test for logging with logging level
g = GunnyLog.instance

g.set_logging_level(GunnyLog::ERROR)
g.log_fatal('init', 'error message 1')
g.log_error('pref', 'error message 2')
g.log_info('main', 'error message 3')

g.set_logging_level(GunnyLog::WARNING)
g.log_warning('getdb', 'error message 4')
g.log_unknown('main', 'error message 5')
g.log_debug('genreport', 'error message 6')