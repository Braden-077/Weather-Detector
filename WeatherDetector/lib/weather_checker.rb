# frozen_string_literal: true

require 'net/http'
require 'json'
require 'date'

class WeatherChecker
  def coordinates
    @coordinates ||= CoordinateLookup.new
  end

  def params 
    URI.encode_www_form({
      # 'auth' => 'your auth code',
      'latitude' => coordinates.latitude,
      'longitude' => coordinates.longitude,
      'temperature_unit' => 'fahrenheit',
      'current_weather' => true,
      'daily' => ['temperature_2m_min', 'temperature_2m_max'],
      'timezone' => 'America/New_York'
    })
  end

  def high_temps
    @high_temps ||= fetch_results['daily']['temperature_2m_max']
  end

  def low_temps
    @low_temps ||= fetch_results['daily']['temperature_2m_min']
  end

  def day
    @day ||= fetch_results['daily']['time'].map{|day_of_week| DateTime.parse(day_of_week).to_date.strftime("%A")}
  end

  def fetch_results
    @fetch_results ||= begin
      uri = URI('https://api.open-meteo.com/v1/forecast')
      uri.query = params
      JSON.parse(Net::HTTP.get(uri))
    end
  end
end