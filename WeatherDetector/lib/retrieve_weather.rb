# frozen_string_literal: true

require_relative 'weather_location'
require_relative 'coordinate_lookup'
require_relative 'weather_checker'
require_relative 'chart_creator'

locator = WeatherLocation.new
puts "#{locator.ip}" 
puts "You are currently in the city of #{locator.city}."
puts "Your current country is #{locator.country}."

weather = WeatherChecker.new
puts
puts "                    Weather forecast for #{locator.city}"
puts
puts "Day:   #{weather.formatted_weekdays}"
puts "Date: #{weather.formatted_date}"
puts "Highs: #{weather.formatted_highs}"
puts "Lows:  #{weather.formatted_lows}"
puts

chart = ChartCreator.new
puts "To see your weather as chart, copy the link below into your browser!"
puts "#{chart.chart_url}"
puts
puts chart.render_image
puts