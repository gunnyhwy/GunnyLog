# GunnyLog logs messages to stdout
# GunnyLogFile logs messages to a file
require 'singleton'
require 'date'

# GunnyLog logs messages to stdout
class GunnyLog
    
    include Singleton
    @@onoffswitch = true
    @@location = "MainMethod"
        
    def setSwitch(switch)
        @@onoffswitch = switch
    end

    def setLocation(name)
        @@location = name
    end
    
    def message(loc = nil, msg)
            write_msg(STDOUT, loc, msg)
    end  
    
    private
    
    def date_str
        d = DateTime.now
        d.strftime("%m/%d/%Y|%I:%M:%S%p")
    end
    
    def write_msg(output, loc, msg)
        if loc == nil then loc = @@location end
        if @@onoffswitch
            output.puts "#{date_str}|#{loc}|#{msg}"
        end        
    end
        
end    

# GunnyLogFile logs messages to a file
class GunnyLogFile < GunnyLog
    
    def open(filename = "gunnylog")
        @outfile = File.open("#{filename}.log", "a+")
    end
        
    def close
    	@outfile.close
    end         

    def message(loc = nil, msg)
        write_msg(@outfile, loc, msg)
    end
 
end