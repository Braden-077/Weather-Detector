# frozen_string_literal: true

require 'weather_location'

describe WeatherLocation do
  it 'initializes without error' do
    expect { WeatherLocation.new }.not_to raise_error
  end

  it 'can be provided an ip address' do
    weather_location = WeatherLocation.new('67.187.116.73')
    expect(weather_location.ip).to eq '67.187.116.73'
  end

  it 'fetches user ip when not provided with one' do
    weather_location = WeatherLocation.new
    expect(weather_location).to receive(:fetch_results).and_return({ 'ip' => '67.187.116.73' })
    expect(weather_location.ip).to eq '67.187.116.73'
  end

  it 'should have a city' do
   weather_location = WeatherLocation.new
   expect(weather_location).to receive(:fetch_results).and_return({'city' => 'Knoxville'})
   expect(weather_location.city).to eq 'Knoxville'
  end

  it 'should have a country' do
    weather_location = WeatherLocation.new
    expect(weather_location).to receive(:fetch_results).and_return({'country' => 'United States'})
    expect(weather_location.country).to eq 'United States'
  end
end