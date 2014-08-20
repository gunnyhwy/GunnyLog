# Ruby logfile class
require "date"

class GunnyLog
    
    def initialize(appname, classname = appname, onoffswitch = true)
        @appname = appname
        @classname = classname
        @onoffswitch = onoffswitch
        @outfile = File.open("#{@appname}.log", "a+")
    end
        
    def message(msg)
        if @onoffswitch
            @outfile.puts "#{date_str}|#{@classname}|#{msg}"
        end
    end

    def close
        @outfile.close
    end

    private
    def date_str
        d = DateTime.now
        d.strftime("%m/%d/%Y|%I:%M%p")
    end

end


