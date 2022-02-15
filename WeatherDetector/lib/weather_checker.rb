# frozen_string_literal: true

require 'net/http'
require 'json'

class WeatherChecker
  def coordinates
    @coordinates ||= CoordinateLookup.new
  end

  def params 
    URI.encode_www_form({
      # 'auth' => 'your auth code',
      'latitude' => coordinates.latitude,
      'longitude' => coordinates.longitude
    })
  end

  def fetch_results
    @fetch_results ||= begin
      uri = URI('https://api.open-meteo.com/v1/forecast')
      uri.query = params
      JSON.parse(Net::HTTP.get(uri))
    end
  end
end