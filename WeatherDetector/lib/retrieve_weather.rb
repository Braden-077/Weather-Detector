# frozen_string_literal: true

require_relative 'weather_location'
require_relative 'coordinate_lookup'

pp WeatherLocation.new.ip, WeatherLocation.new.country, WeatherLocation.new.city
# pp CoordinateLookup.new('Knoxville').fetch_results['longt'], CoordinateLookup.new('Knoxville').fetch_results['latt']
pp CoordinateLookup.new('Knoxville').longitude, CoordinateLookup.new('Knoxville').latitude