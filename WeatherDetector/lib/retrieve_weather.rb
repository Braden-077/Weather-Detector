# frozen_string_literal: true

require_relative 'weather_location'
require_relative 'coordinate_lookup'

locator = WeatherLocation.new
pp locator.ip, locator.city, locator.country

coordinates = CoordinateLookup.new('Knoxville')
pp coordinates.longitude, coordinates.latitude