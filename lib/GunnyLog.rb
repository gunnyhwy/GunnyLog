# GunnyLog class
require 'singleton'
require 'date'


# GunnyLog logs messages to stdout or a file
class GunnyLog

    # Singleton instance method
    #def self.instance
    #  @@instance ||= new
    #end

    # Set logging on and off
    #
    # @param switch [bool] switch for on or off
    def set_switch(switch)
        @onoffswitch = switch
    end

    # Set message was logged from location
    #
    # @param name [string] location name
    def set_location(name)
        @location = name
    end

    # Open the logfile
    #
    # @param filename [string] name of the .log file
    def open(filename = 'gunnylog')
      @outfile = File.open(filename  + '.log', 'a+')
      @_is_file_open = true
    end

    # Close the logfile
    def close
      @outfile.close
      @_is_file_open = false
    end

    # Write message to file
    #
    # @param msg [string] message string
    def msg(msg)
      message(nil,msg)
    end

    # Write message to file
    #
    # @param loc [string] message location, optional
    # @param msg [string] message string
    def message(loc = nil, msg)
      if @_is_file_open
        write_msg(@outfile, loc, msg)
      else
        write_msg(STDOUT, loc, msg)
      end
    end

    # Write formatted message with single arg or array of args
    #
    # @param loc [string] message location, optional
    # @param msg [string] message format string
    # @param args [arg or array of args]
    def formatted_message(loc = nil, msg, args)
        formatted = sprintf(msg, *args)
        message(loc, formatted)
    end

    # Write formatted message with variable number of args
    #
    # @param loc [string] message location
    # @param msg [string] message format string
    # @param args [variable number of args]
    def formatted_message_vars(loc, msg, *args)
        formatted = sprintf(msg, *args)
        message(loc, formatted)
    end

    private

    include Singleton

    # logging off and on flag
    class << self;
      attr_accessor :onoffswitch
    end

    # location message was logged from
    class << self;
      attr_accessor :location
    end

    # is file open flag
    class << self;
      attr_accessor :_is_file_open
    end

    # log file
    class << self;
      attr_accessor :outfile
    end

    # initailize
    def initialize
      @onoffswitch = true
      @location = 'MainMethod'
      @_is_file_open = false
      @outfile = STDOUT
    end

    # write the msg
    def write_msg(output, loc, msg)
        if loc == nil
          loc = @location
        else
          # new, not sure
          @location = loc
        end
        if @onoffswitch
            output.puts "#{date_str}|#{$0}|#{loc}|#{msg}"
        end
    end

    # get the date time stamp
    def date_str
        d = DateTime.now
        d.strftime('%m/%d/%Y|%I:%M:%S%p')
    end
    
end


# @deprecated Use {#GunnyLog} instead
class GunnyLogFile < GunnyLog
end