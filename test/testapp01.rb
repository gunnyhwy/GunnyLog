# Test program for ruby logfile class
require 'GunnyLog'

puts GunnyLog::VERSION
#log = GunnyLog.new()


# Test for screen logging, one liners
GunnyLog.instance.message('Error Catcher', 'Testing again') 
GunnyLog.instance.message_formatted('Error Catcher', 'Testing again = %s', 'Gunny')
GunnyLog.instance.message_formatted('Error Catcher', 'Testing number = %d', 42)
GunnyLog.instance.message_formatted('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])

GunnyLog.instance.set_output_stderr
GunnyLog.instance.message_formatted('name: %s', 'Gunny')
GunnyLog.instance.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')
GunnyLog.instance.message_formatted_vars('Main', 'name: %s', 'Gunny')
GunnyLog.instance.set_output_stdout
GunnyLog.instance.msg('Testing new method')

#puts 'Logging check: ' + GunnyLog.instance.logging_enabled
puts 'Message location: ' + GunnyLog.instance.message_location


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

logs.message_formatted('Error Catcher', 'Testing again = %s', 'Gunny')
logs.message_formatted('Error Catcher', 'Testing number = %d', 42)
logs.message_formatted('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])

logs.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')
logs.message_formatted_vars('Main', 'name: %s', 'Gunny')

#puts 'Logging check: ' + logs.logging_enabled
puts 'Message location: ' + logs.message_location


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

logf.message_formatted('Error Catcher', 'Testing again = %s', 'Gunny')
logf.message_formatted('Error Catcher', 'Testing number = %d', 42)
logf.message_formatted('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])

logf.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')
logf.message_formatted_vars('Main', 'name: %s', 'Gunny')

logf.msg('Testing new method')
logf.close

logf.message('Error Time!')


#Test for file logging
logf = GunnyLog.instance
#logf.open('zlog2.log')
#logf.open_with_info(nil, 'zlog2', 'log')
#logf.open_with_info('testing', 'zlog2', 'log')
logf.open_file('logs', 'zlog2', 'log')

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

logf.message_formatted('Error Catcher', 'Testing again = %s', 'Gunny')
logf.message_formatted('Error Catcher', 'Testing number = %d', 42)
logf.message_formatted('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])

logf.message_formatted_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')
logf.message_formatted_vars('Main', 'name: %s', 'Gunny')

logf.msg('Testing new method')
logf.close