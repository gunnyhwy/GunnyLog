# GunnyLog class
require 'GunnyLog/exceptions'
require 'GunnyLog/severity'
require 'singleton'
require 'date'


# GunnyLog logs messages to stdout, stderr, or a file. It defaults
# to stdout. GunnyLog is a singleton and uses the instance method.
# For example you can use GunnyLog.instance.msg('Error message')
# or you can use log = GunnyLog.instance
class GunnyLog

    include Singleton

    private

    VERSION = '1.1.2'
    DEBUG_FLAG = false

    # public class attributes
    public

    # @return [bool] is logging enabled
    attr_reader :logging_enabled

    # @return [string] message location
    attr_reader :message_location

    # private class attributes
    private

    # Is file open flag
    attr_accessor :file_open

    # File used for the log file
    attr_accessor :logging_file

    # public instance methods
    public

    # Set logging on and off
    # @param flag [bool] switch for on or off
    def set_logging_enabled(flag)
      @logging_enabled = flag
    end

    # Set logging on and off
    # @deprecated Use {#set_logging_enabled} instead
    # @param flag [bool] switch for on or off
    def set_switch(flag)
      @logging_enabled = flag
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
      if @file_open
        self.close
      end
      @logging_file = STDOUT
    end

    # Set output to STDERR
    def set_output_stderr
      if @file_open
        self.close
      end
      @logging_file = STDERR
    end

    # Open the logfile
    # @param filename [string] name of the logfile
    def open(filename = 'gunnylog.log')
      begin
        @logging_file = File.open(filename, 'a+')
        @file_open = true
      rescue SystemCallError => exc
        handle_exception(exc)
      end
    end

    # Open the logfile with path, name, and extension
    # @param pathname [string] path of the logfile
    # @param filename [string] name of the logfile
    # @param extension [string] extension of the logfile
    def open_file(pathname = nil, filename = 'gunnylog', extension = 'log')
      if pathname == nil
        self.open(filename  + '.' + extension)
      else
        self.open(pathname + '/' + filename  + '.' + extension)
      end
    end

    # Open the logfile with path, name, and extension
    # @param pathname [string] path of the logfile
    # @param filename [string] name of the logfile
    # @param extension [string] extension of the logfile
    # @deprecated Use {#open_file} instead
    def open_with_info(pathname = nil, filename = 'gunnylog', extension = 'log')
      self.open_file(pathname, filename, extension)
    end

    # Close the logfile
    def close
      begin
        @logging_file.close
        @file_open = false
        @logging_file = STDOUT
      rescue SystemCallError => exc
        handle_exception(exc)
      end
    end

    # Write message to logfile
    # @param msg [string] message string
    def msg(msg)
      message(nil, msg)
    end

    # Write message to logfile
    # @param loc [string] message message_location, optional
    # @param msg [string] message string
    def message(loc = nil, msg)
        write_msg(@logging_file, loc, msg)
    end

    # Write formatted message with single arg or array of args
    # @param loc [string] message message_location, optional
    # @param msg [string] message format string
    # @param args [arg or array of args]
    def message_formatted(loc = nil, msg, args)
        formatted = sprintf(msg, *args)
        message(loc, formatted)
    end

    # Write formatted message with variable number of args
    # @param loc [string] message message_location
    # @param msg [string] message format string
    # @param args [variable number of args]
    def message_formatted_vars(loc, msg, *args)
        formatted = sprintf(msg, *args)
        message(loc, formatted)
    end

    # Write exception to logfile
    # @param exc [exception] exception to log
    def msg_exception(exc)
      write_msg(@logging_file, @message_location, exc.message)
    end

    # Write exception to logfile
    # @param exc [exception] exception to log
    def message_exception(loc = nil, exc)
      write_msg(@logging_file, loc, exc.message)
    end

    # Write formatted message with single arg or array of args
    # @param loc [string] message message_location, optional
    # @param msg [string] message format string
    # @param args [arg or array of args]
    # @deprecated Use {#message_formatted} instead
    def formatted_message(loc = nil, msg, args)
      formatted = sprintf(msg, *args)
      message(loc, formatted)
    end

    # Write formatted message with variable number of args
    # @param loc [string] message message_location
    # @param msg [string] message format string
    # @param args [variable number of args]
    # @deprecated Use {#message_formatted_vars} instead
    def formatted_message_vars(loc, msg, *args)
      formatted = sprintf(msg, *args)
      message(loc, formatted)
    end

    # private instance methods
    private

    # initialize
    def initialize
      local_debug('initialize')
      @logging_enabled = true
      @logging_severity = GunnyLogSeverity::DEBUG
      local_debug('initialize', sprintf('Log level = %d',@logging_severity) )
      @message_location = 'MainMethod'
      @file_open = false
      @logging_file = STDOUT
    end

    # write the msg
    def write_msg(output, loc, msg)
      if loc == nil
        loc = @message_location
      else
        @message_location = loc
      end
      if @logging_enabled
          output.puts "#{date_str}|#{$0}|#{loc}|#{msg}"
      end
    end

    # get the date time stamp
    def date_str
      d = DateTime.now
      d.strftime('%m/%d/%Y|%I:%M:%S%p')
    end

    # log exception and raise
    def handle_exception(exc)
      self.message_exception('***GunnyLog***', exc)
      raise GunnyLogException.new(exc.message)
    end

    # used for debugging GunnyLog
    def local_debug(loc, msg = nil)
      if DEBUG_FLAG
        if msg == nil
          puts 'GunnyLog::' + loc
        else
          puts 'GunnyLog::' + loc + '|' + msg
        end
      end
    end

end


# @deprecated Use {GunnyLog} instead
class GunnyLogFile < GunnyLog
end