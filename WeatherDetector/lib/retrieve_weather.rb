# frozen_string_literal: true

require_relative 'weather_location'
require_relative 'coordinate_lookup'
require_relative 'weather_checker'

locator = WeatherLocation.new
pp locator.ip, locator.city, locator.country

weather = WeatherChecker.new
pp weather.fetch_results
pp weather.high_temps
pp weather.low_temps
pp weather.day