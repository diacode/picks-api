# See: http://stackoverflow.com/a/16381788
class NonBlockingRedis < Redis
  def blpop(key, timeout)
    if timeout == -1
      result = lpop(key)
      return result if result.nil?
      return [key, result]
    else
      super(key, timeout)
    end
  end
end