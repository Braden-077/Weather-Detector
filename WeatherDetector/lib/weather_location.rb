# frozen_string_literal: true

require 'net/http'
require 'json'

class WeatherLocation
  def initialize(ip=nil)
    @ip = ip
  end
  
  def ip
    @ip ||= fetch_results['ip']
  end

  def country
    @country ||= fetch_results['country']
  end

  def city
    @city ||= fetch_results['city']
  end

  def fetch_results
    @fetch_results ||= JSON.parse(Net::HTTP.get(URI("https://ip-fast.com/api/ip/?format=json&location=True")))
  end

  def formatted_location
    "#{city}, #{country}"
  end
end