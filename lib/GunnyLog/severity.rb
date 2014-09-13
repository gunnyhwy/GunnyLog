# GunnyLog logs messages to stdout, stderr, or a file. It defaults
# to stdout. GunnyLog is a singleton and uses the instance method.
# For example you can use GunnyLog.instance.msg('Error message')
# or you can use log = GunnyLog.instance
class GunnyLog

  public

  DEBUG = 0
  INFO = 1
  WARNING = 2
  ERROR = 3
  FATAL = 4
  UNKNOWN = 5

  private

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