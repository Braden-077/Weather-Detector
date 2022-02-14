# frozen_string_literal: true

require 'uri'
require 'net/http'

class LocationDetector
  def location
    @location || ip
  end
  def initialize(location=ip)
    @location = location
  end
end