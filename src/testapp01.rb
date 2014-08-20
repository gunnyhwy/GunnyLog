# Test program for ruby logfile class
require_relative 'GunnyLog'

#log = ABCLog.new('testapp01','main_method', true)
#log = ABCLog.new('testapp01','main_method')
log = GunnyLog.new('testapp01')

log.message("Log message 1")
log.message("Log message 2")
log.message("Log message 3")

log.close
