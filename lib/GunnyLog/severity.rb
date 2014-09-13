# GunnyLog logs messages to stdout, stderr, or a file. It defaults
# to stdout. GunnyLog is a singleton and uses the instance method.
# For example you can use GunnyLog.instance.msg('Error message')
# or you can use log = GunnyLog.instance
class GunnyLog

  public

  # Log level DEBUG
  DEBUG = 0
  # Log level INFO
  INFO = 1
  # Log level WARNING
  WARNING = 2
  # Log level ERROR
  ERROR = 3
  # Log level FATAL
  FATAL = 4
  # Log level UNKNOWN
  UNKNOWN = 5

  private

  # get string for level
  def level_string(level)
    case level
      when 0
        return 'DEBUG'
      when 1
        return 'INFO'
      when 2
        return 'WARNING'
      when 3
        return 'ERROR'
      when 4
        return 'FATAL'
    else
      return 'UNKNOWN'
    end
  end

end