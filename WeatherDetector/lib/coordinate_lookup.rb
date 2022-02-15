# frozen_string_literal: true

require 'uri'
require 'net/http'

class CoordinateLookup
  def initialize(location)
    @location = location
  end

  def location
    @location ||= WeatherLocation.new.formatted_location
  end

  def fetch_results
    @fetch_results ||= begin
      uri = URI('https://geocode.xyz')
      uri.query = params
      JSON.parse(Net::HTTP.get(uri))
    end
  end

  def longitude
    @longitude ||= fetch_results['longt']
  end

  def latitude
    @latitude ||= fetch_results['latt']
  end

  def params 
    URI.encode_www_form({
      # 'auth' => 'your auth code',
      'locate' => location,
      'geoit' => 'json'
    })
  end
end