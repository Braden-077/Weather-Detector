# frozen_string_literal: true

require 'uri'
require 'net/http'

class CoordinateLookup
  def initialize(location)
    @location ||= location
  end
end