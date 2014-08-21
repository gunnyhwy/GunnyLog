# Test program for ruby logfile class
require_relative 'GunnyLog'


# Test for screen logging
logs = GunnyLog.instance

logs.message("Testing GunnyScreenLog 01")
logs.setSwitch(false)
logs.message("Testing GunnyScreenLog 02")
logs.setSwitch(true)
logs.message("Testing GunnyScreenLog 03")

logs.message("init","Testing GunnyScreenLog 04")
logs.message("read","Testing GunnyScreenLog 05")
logs.message("close","Testing GunnyScreenLog 06")


#Test for file logging
logf = GunnyLogFile.instance

logf.open("zlog")

logf.message("Testing GunnyFileLog 01")
logf.setSwitch(false)
logf.message("Testing GunnyFileLog 02")
logf.setSwitch(true)
logf.message("Testing GunnyFileLog 03")

logf.message("init","Testing GunnyFileLog 04")
logf.message("read","Testing GunnyFileLog 05")
logf.message("close","Testing GunnyFileLog 06")

logf.close

