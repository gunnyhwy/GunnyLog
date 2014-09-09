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


    # @param [bool] switch - logging on and off
    def set_switch(switch)
        @onoffswitch = switch
    end

    # @param [string] name - set message location
    def set_location(name)
        @location = name
    end

    # write message
    # @param [string] loc - message location, optional
    # @param [string] msg - message string
    def message(loc = nil, msg)
        write_msg(STDOUT, loc, msg)
    end

    # write formatted message - single arg or array of args
    # @param [string] loc - message location, optional
    # @param [string] msg - message format string
    # @param [arg or array of args]
    def formatted_message(loc = nil, msg, args)
        formatted = sprintf(msg, *args)
        message(loc, formatted)
    end

    # write formatted message - variable number of args
    # @param [string] loc - message location
    # @param [string] msg - message format string
    # @param [variable number of args]
    def formatted_message_vars(loc, msg, *args)
        formatted = sprintf(msg, *args)
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

    # open the logfile
    # @param [string] filename
    def open(filename = 'gunnylog')
        @outfile = File.open(filename  + '.log', 'a+')
        @_is_file_open = true
    end

    # close the logfile
    def close
    	@outfile.close
      @_is_file_open = false
    end

    # write message to file
    # @param [string] loc - message location, optional
    # @param [string] msg - message string
    def message(loc = nil, msg)
      if @_is_file_open
        write_msg(@outfile, loc, msg)
      end
    end
 
end