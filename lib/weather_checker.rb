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
    @daily_weather ||= fetch_results['daily']['weathercode'].map{|condition| condition.to_s.center(9)}.join(' ')
  end

  def fetch_results
    @fetch_results ||= begin
      uri = URI('https://api.open-meteo.com/v1/forecast')
      uri.query = params
      JSON.parse(Net::HTTP.get(uri))
    end
  end
end