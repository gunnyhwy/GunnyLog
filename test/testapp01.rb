# Test program for ruby logfile class
require 'GunnyLog'

puts GunnyLog::VERSION
puts GunnyLog::DESC_VERSION


# Test for screen logging, one liners
GunnyLog.instance.message('Error Catcher', 'Testing again') 
GunnyLog.instance.formatted_message('Error Catcher', 'Testing again = %s', 'Gunny')
GunnyLog.instance.formatted_message('Error Catcher', 'Testing number = %d', 42)
GunnyLog.instance.formatted_message('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])

GunnyLog.instance.set_output_stderr
GunnyLog.instance.formatted_message('name: %s', 'Gunny')
GunnyLog.instance.formatted_message_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')
GunnyLog.instance.formatted_message_vars('Main', 'name: %s', 'Gunny')
GunnyLog.instance.set_output_stdout
GunnyLog.instance.msg('Testing new method')


# Test for screen logging
logs = GunnyLog.instance

logs.msg('Testing new method')
logs.message('Testing GunnyScreenLog 01')
#logs.set_switch(false)
logs.set_logging_enabled(false)
logs.message('Testing GunnyScreenLog 02 XXXXXXXXXXXX')
logs.set_logging_enabled(true)
#logs.set_switch(true)
logs.message('Testing GunnyScreenLog 03')

logs.set_location('init')
logs.message('Testing GunnyScreenLog 04')
logs.set_location('something')
logs.message('Testing GunnyScreenLog 05')
logs.set_message_location('destroy XXXXXXXXX')
logs.message('Testing GunnyScreenLog 06')

logs.message('init','Testing GunnyScreenLog 07')
logs.message('read','Testing GunnyScreenLog 08')
logs.message('close','Testing GunnyScreenLog 09')

logs.formatted_message('Error Catcher', 'Testing again = %s', 'Gunny')
logs.formatted_message('Error Catcher', 'Testing number = %d', 42)
logs.formatted_message('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])

logs.formatted_message_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')
logs.formatted_message_vars('Main', 'name: %s', 'Gunny')


#Test for file logging
logf = GunnyLogFile.instance

logf.open('zlog1.log')

logf.message('Testing GunnyFileLog 01')
logf.set_switch(false)
logf.message('Testing GunnyFileLog 02')
logf.set_switch(true)
logf.message('Testing GunnyFileLog 03')

logf.set_location('init')
logf.message('Testing GunnyFileLog 04')
logf.set_location('something')
logf.message('Testing GunnyFileLog 05')
logf.set_location('destroy')
logf.message('Testing GunnyFileLog 06')

logf.message('init','Testing GunnyFileLog 07')
logf.message('read','Testing GunnyFileLog 08')
logf.message('close','Testing GunnyFileLog 09')

logf.formatted_message('Error Catcher', 'Testing again = %s', 'Gunny')
logf.formatted_message('Error Catcher', 'Testing number = %d', 42)
logf.formatted_message('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])

logf.formatted_message_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')
logf.formatted_message_vars('Main', 'name: %s', 'Gunny')

logf.msg('Testing new method')
logf.close

logf.message('Error Time!')


#Test for file logging
logf = GunnyLog.instance
#logf.open('zlog2.log')
#logf.open_with_info(nil, 'zlog2', 'log')
#logf.open_with_info('testing', 'zlog2', 'log')
logf.open_with_info('logs', 'zlog2', 'log')

logf.message('Testing GunnyFileLog 01')
logf.set_switch(false)
logf.message('Testing GunnyFileLog 02')
logf.set_switch(true)
logf.message('Testing GunnyFileLog 03')

logf.set_location('init')
logf.message('Testing GunnyFileLog 04')
logf.set_location('something')
logf.message('Testing GunnyFileLog 05')
logf.set_location('destroy')
logf.message('Testing GunnyFileLog 06')

logf.message('init','Testing GunnyFileLog 07')
logf.message('read','Testing GunnyFileLog 08')
logf.message('close','Testing GunnyFileLog 09')

logf.formatted_message('Error Catcher', 'Testing again = %s', 'Gunny')
logf.formatted_message('Error Catcher', 'Testing number = %d', 42)
logf.formatted_message('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])

logf.formatted_message_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')
logf.formatted_message_vars('Main', 'name: %s', 'Gunny')

logf.msg('Testing new method')
logf.close