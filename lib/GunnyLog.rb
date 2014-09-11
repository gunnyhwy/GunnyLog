# GunnyLog class
require 'GunnyLog/version'
require 'GunnyLog/exceptions'
require 'singleton'
require 'date'


# GunnyLog logs messages to stdout(default), stderr, or a file
# GunnyLog is a singleton and uses the instance method. Examples:
# log = GunnyLog.instance or GunnyLog.instance.msg('Error message')
class GunnyLog

    # Set logging on and off
    # @param flag [bool] switch for on or off
    def set_logging_enabled(flag)
      @_is_logging_enabled = flag
    end

    # Set logging on and off
    # @deprecated Use {#set_logging_enabled} instead
    # @param flag [bool] switch for on or off
    def set_switch(flag)
        @_is_logging_enabled = flag
    end

    # Set message was logged from message_location
    # @param loc [string] message_location name
    def set_message_location(loc)
      @message_location = loc
    end

    # Set message was logged from message_location
    # @deprecated Use {#set_message_location} instead
    # @param loc [string] message_location name
    def set_location(loc)
        @message_location = loc
    end

    # Set output to STDOUT, default
    def set_output_stdout
      if @_is_file_open
        self.close
      end
      @logging_file = STDOUT
    end

    # Set output to STDERR
    def set_output_stderr
      if @_is_file_open
        self.close
      end
      @logging_file = STDERR
    end

    # Open the logfile
    # @param filename [string] name of the logfile
    def open(filename = 'gunnylog.log')
      begin
        @logging_file = File.open(filename, 'a+')
        @_is_file_open = true
      rescue SystemCallError
        raise GunnyLogException.new('Error opening file: ' + filename)
      end
    end

    # Open the logfile with path, name, and extention
    # @param pathname [string] path of the logfile
    # @param filename [string] name of the logfile
    # @param extension [string] extension of the logfile
    def open_with_info(pathname = nil,
                       filename = 'gunnylog',
                       extension = 'log')
      if pathname == nil
        self.open(filename  + '.' + extension)
      else
        self.open(pathname + '/' + filename  + '.' + extension)
      end
    end

    # Close the logfile
    def close
      begin
        @logging_file.close
        @_is_file_open = false
        @logging_file = STDOUT
      rescue SystemCallError
        raise GunnyLogException.new('Error closing file')
      end
    end

    # Write message to file
    # @param msg [string] message string
    def msg(msg)
      message(nil, msg)
    end

    # Write message to file
    # @param loc [string] message message_location, optional
    # @param msg [string] message string
    def message(loc = nil, msg)
        write_msg(@logging_file, loc, msg)
    end

    # Write formatted message with single arg or array of args
    # @param loc [string] message message_location, optional
    # @param msg [string] message format string
    # @param args [arg or array of args]
    def formatted_message(loc = nil, msg, args)
        formatted = sprintf(msg, *args)
        message(loc, formatted)
    end

    # Write formatted message with variable number of args
    # @param loc [string] message message_location
    # @param msg [string] message format string
    # @param args [variable number of args]
    def formatted_message_vars(loc, msg, *args)
        formatted = sprintf(msg, *args)
        message(loc, formatted)
    end

    private

    include Singleton

    class << self;
      # Logging off and on flag
      attr_accessor :_is_logging_enabled
    end

    class << self;
      # Location message was logged from
      attr_accessor :message_location
    end

    class << self;
      # Is file open flag
      attr_accessor :_is_file_open
    end

    class << self;
      # File used for the log file
      attr_accessor :logging_file
    end

    # initailize
    def initialize
      @_is_logging_enabled = true
      @message_location = 'MainMethod'
      @_is_file_open = false
      @logging_file = STDOUT
    end

    # write the msg
    def write_msg(output, loc, msg)
        if loc == nil
          loc = @message_location
        else
          @message_location = loc
        end
        if @_is_logging_enabled
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