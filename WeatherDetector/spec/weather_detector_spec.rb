# frozen_string_literal: true

require 'weather_detector'

describe WeatherDetector do
  it 'initializes without error' do
    expect { WeatherDetector.new }.not_to raise_error
  end

  it 'can be provided an ip address' do
    weather_detector = WeatherDetector.new('67.187.116.73')
    expect(weather_detector.ip).to eq '67.187.116.73'
  end

  it 'fetches user ip when not provided with one' do
    weather_detector = WeatherDetector.new
    expect(weather_detector).to receive(:fetch_ip).and_return '67.187.116.73'
    expect(weather_detector.ip).to eq '67.187.116.73'
  end
end