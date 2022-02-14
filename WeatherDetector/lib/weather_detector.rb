# frozen_string_literal: true

require 'net/http'

class WeatherDetector
  def initialize(ip=nil)
    @ip = ip
  end
  
  def ip
    @ip ||= fetch_results
  end

  def fetch_results
    fetch_results ||= Net::HTTP.get(URI("https://ip-fast.com/api/ip/?format=json&location=True"))
    fetch_results
  end
end