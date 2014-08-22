# GunnyLog logs messages to stdout
# GunnyLogFile logs messages to a file
require 'singleton'
require 'date'


# GunnyLog logs messages to stdout
class GunnyLog
    
    include Singleton
    @@onoffswitch = true
    @@location = "MainMethod"
        
    def setSwitch(switch) # switch logging on and off
        @@onoffswitch = switch
    end

    def setLocation(name) # set message location
        @@location = name
    end
        
    def message(loc = nil, msg) # write message
        write_msg(STDOUT, loc, msg)
    end  
    
    def fmessage(loc = nil, msg, args)  # write formatted message
        formatted = sprintf(msg, *args) # single arg or array of args 
        message(loc, formatted) 
    end
    
    def fmessage_vars(loc, msg, *fargs)  # write formatted message
        formatted = sprintf(msg, *fargs) # variable number of args 
        message(loc, formatted) 
    end
    
    private

    def write_msg(output, loc, msg)  
        if loc == nil then loc = @@location end
        if @@onoffswitch
            output.puts "#{date_str}|#{loc}|#{msg}"
        end        
    end
        
    def date_str
        d = DateTime.now
        d.strftime("%m/%d/%Y|%I:%M:%S%p")
    end
    
end    
    

# GunnyLogFile logs messages to a file
class GunnyLogFile < GunnyLog
    
    def open(filename = "gunnylog") # open the file
        @outfile = File.open("#{filename}.log", "a+")
    end
        
    def close # close the file
    	@outfile.close
    end         

    def message(loc = nil, msg) # write message to file
        write_msg(@outfile, loc, msg)
    end
 
end