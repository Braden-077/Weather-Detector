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
      'latitude' => coordinates.latitude,
      'longitude' => coordinates.longitude,
      'temperature_unit' => 'fahrenheit',
      'current_weather' => true,
      'daily' => ['temperature_2m_min', 'temperature_2m_max', 'weathercode'],
      'hourly' => 'weathercode',
      'timezone' => 'America/New_York'
    })
  end

  def high_temps
    @high_temps ||= fetch_results['daily']['temperature_2m_max']
  end

  def low_temps
    @low_temps ||= fetch_results['daily']['temperature_2m_min']
  end

  def formatted_highs
    high_temps.map {|high| high.to_s.center(9)}.join(' ')
  end

  def formatted_lows
    low_temps.map {|low| low.to_s.center(9)}.join(' ')
  end

  def formatted_weekdays
    days_of_week.map {|day| day.to_s.center(9)}.join(' ')
  end

  def days
    @days ||= fetch_results['daily']['time'].map{|date| DateTime.parse(date)}
  end

  def days_of_week
    days.map {|day| day.strftime("%A")} 
  end

  def formatted_date
    days.map {|date| date.strftime("%m/%d").to_s.center(10)}.join
  end

  def weather_currently
    @weather_currently ||= fetch_results['current_weather']['weathercode']
  end

  def daily_weather
    @daily_weather ||= fetch_results['daily']['weathercode']
  end

  def daily_weather_condition
    daily_weather.map{|condition| weather_code.key(condition).to_s}.join(', ')
  end

  def current_weather_condition
    weather_code.key(weather_currently)
  end

  def weather_code
    weather_code = {
      'clear skies' => 0,
      'mainly clear skies' => 1,
      'partly cloudy skies' => 2,
      'overcast' => 3,
      'fog' => 45,
      'depositing rime fog' => 48,
      'light drizzle' => 51,
      'moderate drizzle' => 53,
      'heavy drizzle' => 55,
      'light freezing drizzle' => 56,
      'heavy freezing drizzle' => 57,
      'light rain' => 61,
      'moderate rain' => 63,
      'heavy rain' => 65,
      'light freezing rain' => 66,
      'heavy freezing rain' => 67,
      'light snowfall' => 71,
      'moderate snowfall' => 73,
      'heavy snowfall' => 75,
      'snow flurries' => 77,
      'light rain showers' => 80,
      'moderate rain showers' => 81,
      'heavy rain showers' => 82,
      'light snow showers' => 85,
      'heavy snow showers' => 86
    }
  end

  def fetch_results
    @fetch_results ||= begin
      uri = URI('https://api.open-meteo.com/v1/forecast')
      uri.query = params
      JSON.parse(Net::HTTP.get(uri))
    end
  end
end