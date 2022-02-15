# frozen_string_literal: true

require 'weather_checker'

describe WeatherChecker do
  it 'initializes without error' do
    weather_checker = WeatherChecker.new
    expect{ weather_checker}.not_to raise_error
  end

  it 'uses coordinate lookup to fetch results' do
    location = 'Knoxville'
    weather_checker = WeatherChecker.new
    expect(weather_checker.coordinates).to receive(:latitude).and_return('35.96464')
    expect(weather_checker.coordinates).to receive(:longitude).and_return('-83.97748')

    weather_checker.params 
  end
end