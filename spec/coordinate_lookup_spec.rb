# frozen_string_literal: true

require 'coordinate_lookup'

describe CoordinateLookup do
  it 'initializes without error' do
    location = 'Knoxville'
    expect { CoordinateLookup.new(location) }.not_to raise_error
  end

  it 'should have a location' do
    location = 'Knoxville'
    coordinates = CoordinateLookup.new(location)
    expect(coordinates.location).to eq 'Knoxville'
  end

  it 'returns longitude' do
    location = 'Knoxville'
    coordinates = CoordinateLookup.new(location)
    expect(coordinates).to receive(:fetch_results).and_return({'longt' => '-83.97748'})
    expect(coordinates.longitude).to eq -83.97748
  end

  it 'returns latitude' do
    location = 'Knoxville'
    coordinates = CoordinateLookup.new(location)
    expect(coordinates).to receive(:fetch_results).and_return({'latt' => '35.96464'})
    expect(coordinates.latitude).to eq 35.96464
  end
end