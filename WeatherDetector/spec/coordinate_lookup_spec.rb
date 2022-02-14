# frozen_string_literal: true

require 'coordinate_lookup'

describe CoordinateLookup do
  it 'initializes without error' do
    location = 'Knoxville'
    expect { CoordinateLookup.new(location) }.not_to raise_error
  end
end