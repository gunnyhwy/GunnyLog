# GunnyLog logs messages to stdout
# GunnyLogFile logs messages to a file
require 'singleton'
require 'date'


# GunnyLog logs messages to stdout
class GunnyLog
    
    include Singleton

    class << self;
      attr_accessor :onoffswitch
    end
    @onoffswitch = true

    class << self;
      attr_accessor :location
    end
    @location = 'MainMethod'


    # @param [bool] switch
    def set_switch(switch) # switch logging on and off
        @onoffswitch = switch
    end

    # @param [string] name
    def set_location(name) # set message location
        @location = name
    end

    # @param [string] loc
    # @param [string] msg
    def message(loc = nil, msg) # write message
        write_msg(STDOUT, loc, msg)
    end

    def formatted_message(loc = nil, msg, args)  # write formatted message
        formatted = sprintf(msg, *args) # single arg or array of args
        message(loc, formatted)
    end

    def formatted_message_vars(loc, msg, *args)  # write formatted message
        formatted = sprintf(msg, *args) # variable number of args
        message(loc, formatted)
    end

    private

    def write_msg(output, loc, msg)
        if loc == nil
          loc = @location
        end
        if @onoffswitch
            output.puts "#{date_str}|#{loc}|#{msg}"
        end
    end

    def date_str
        d = DateTime.now
        d.strftime('%m/%d/%Y|%I:%M:%S%p')
    end
    
end    
    

# GunnyLogFile logs messages to a file
class GunnyLogFile < GunnyLog

    class << self;
      attr_accessor :_is_file_open
    end
    @_is_file_open = false

    def open(filename = 'gunnylog') # open the file
        @outfile = File.open(filename  + '.log', 'a+')
        @_is_file_open = true
    end
        
    def close # close the file
    	@outfile.close
      @_is_file_open = false
    end         

    def message(loc = nil, msg) # write message to file
      if @_is_file_open
        write_msg(@outfile, loc, msg)
      end
    end
 
end