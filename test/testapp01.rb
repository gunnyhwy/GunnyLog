# Test program for ruby logfile class
require 'GunnyLog'


# Test for screen logging, one liners
GunnyLog.instance.message('Error Catcher', 'Testing again') 
GunnyLog.instance.formatted_message('Error Catcher', 'Testing again = %s', 'Gunny')
GunnyLog.instance.formatted_message('Error Catcher', 'Testing number = %d', 42)
GunnyLog.instance.formatted_message('name: %s, age: %d, job: %s', ['Gunny', 42, 'Developer'])
GunnyLog.instance.formatted_message('name: %s', 'Gunny')
GunnyLog.instance.formatted_message_vars(nil, 'name: %s, age: %d, job: %s', 'Gunny', 42, 'Developer')
GunnyLog.instance.formatted_message_vars('Main', 'name: %s', 'Gunny')


# Test for screen logging
logs = GunnyLog.instance

logs.message('Testing GunnyScreenLog 01')
logs.set_switch(false)
logs.message('Testing GunnyScreenLog 02')
logs.set_switch(true)
logs.message('Testing GunnyScreenLog 03')

logs.set_location('init')
logs.message('Testing GunnyScreenLog 04')
logs.set_location('something')
logs.message('Testing GunnyScreenLog 05')
logs.set_location('destroy')
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

logf.open('zlog1')

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

logf.close

logf.message('Error Time!')

#Test for file logging
logf = GunnyLog.instance

logf.open('zlog2')

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

logf.close