# GunnyLog class
require 'GunnyLog/version'
require 'GunnyLog/exceptions'
require 'singleton'
require 'date'


# GunnyLog logs messages to stdout(default), stderr, or a file
class GunnyLog

    # Singleton instance method
    #def self.instance
    #  @@instance ||= new
    #end

    # Set logging on and off
    # @param flag [bool] switch for on or off
    def set_logging_enabled(flag)
      @onoffswitch = flag
    end

    # Set logging on and off
    # @deprecated Use {#set_logging_enabled} instead
    # @param flag [bool] switch for on or off
    def set_switch(flag)
        @onoffswitch = flag
    end

    # Set message was logged from location
    # @param loc [string] location name
    def set_message_location(loc)
      @location = loc
    end

    # Set message was logged from location
    # @deprecated Use {#set_message_location} instead
    # @param loc [string] location name
    def set_location(loc)
        @location = loc
    end

    # Set output to STDOUT, default
    def set_output_stdout
      if @_is_file_open
        self.close
      end
      @outfile = STDOUT
    end

    # Set output to STDERR
    def set_output_stderr
      if @_is_file_open
        self.close
      end
      @outfile = STDERR
    end

    # Open the logfile
    # @param filename [string] name of the logfile
    def open(filename = 'gunnylog.log')
      begin
        @outfile = File.open(filename, 'a+')
        @_is_file_open = true
      rescue SystemCallError
        raise GunnyLogException.new('Error opening file: ' + filename)
        #STDERR.puts 'GunnyLog: Error opening file: ' + filename + ' using stdout'
        #@_is_file_open = false
        #@outfile = STDOUT
      end
    end

    # Open the logfile with path, name, and extention
    # @param pathname [string] path of the logfile
    # @param filename [string] name of the logfile
    # @param extension [string] extension of the logfile
    def open_with_info(pathname = nil,
                       filename = 'gunnylog',
                       extension = 'log')

      #if pathname == nil
      #  puts 'pathname  = nil'
      #else
      #  puts 'pathname  = ' + pathname
      #end
      #puts 'filename  = ' + filename
      #puts 'extension = ' + extension

      if pathname == nil
        self.open(filename  + '.' + extension)
      else
        self.open(pathname + '/' + filename  + '.' + extension)
      end
    end

    # Close the logfile
    def close
      begin
        @outfile.close
      rescue SystemCallError
        raise GunnyLogException.new('Error closing file')
        #STDERR.puts 'GunnyLog: Error closing file'
      end
      @_is_file_open = false
      @outfile = STDOUT
    end

    # Write message to file
    # @param msg [string] message string
    def msg(msg)
      message(nil, msg)
    end

    # Write message to file
    # @param loc [string] message location, optional
    # @param msg [string] message string
    def message(loc = nil, msg)
      #if @_is_file_open
        write_msg(@outfile, loc, msg)
      #else
      #  write_msg(STDOUT, loc, msg)
      #end
    end

    # Write formatted message with single arg or array of args
    # @param loc [string] message location, optional
    # @param msg [string] message format string
    # @param args [arg or array of args]
    def formatted_message(loc = nil, msg, args)
        formatted = sprintf(msg, *args)
        message(loc, formatted)
    end

    # Write formatted message with variable number of args
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