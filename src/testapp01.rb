# Test program for ruby logfile class
require_relative 'GunnyLog'

# Test for screen logging, one liner
GunnyLog.instance.message("Error Catcher", "Testing again") 

# Test for screen logging
logs = GunnyLog.instance

logs.message("Testing GunnyScreenLog 01")
logs.setSwitch(false)
logs.message("Testing GunnyScreenLog 02")
logs.setSwitch(true)
logs.message("Testing GunnyScreenLog 03")

logs.setLocation("init")
logs.message("Testing GunnyScreenLog 04")
logs.setLocation("something")
logs.message("Testing GunnyScreenLog 05")
logs.setLocation("destroy")
logs.message("Testing GunnyScreenLog 06")

logs.message("init","Testing GunnyScreenLog 07")
logs.message("read","Testing GunnyScreenLog 08")
logs.message("close","Testing GunnyScreenLog 09")


#Test for file logging
logf = GunnyLogFile.instance

logf.open("zlog")

logf.message("Testing GunnyFileLog 01")
logf.setSwitch(false)
logf.message("Testing GunnyFileLog 02")
logf.setSwitch(true)
logf.message("Testing GunnyFileLog 03")

logf.setLocation("init")
logf.message("Testing GunnyFileLog 04")
logf.setLocation("something")
logf.message("Testing GunnyFileLog 05")
logf.setLocation("destroy")
logf.message("Testing GunnyFileLog 06")

logf.message("init","Testing GunnyFileLog 07")
logf.message("read","Testing GunnyFileLog 08")
logf.message("close","Testing GunnyFileLog 09")

logf.close