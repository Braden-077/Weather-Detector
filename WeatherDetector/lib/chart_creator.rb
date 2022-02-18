# frozen_string_literal: true

require 'base64'
require 'uri'
require 'net/http'
require_relative 'weather_checker'

class ChartCreator
  def initialize(weather_info=nil)
    @weather_info = weather_info
  end

  def weather_info
    @weather_info ||= WeatherChecker.new
  end

  def chart_url
    @chart_url ||= begin
      uri = URI('https://image-charts.com/chart')
      uri.query = params
      uri
    end
  end

  def params 
    URI.encode_www_form({
      'chg' => '10,10',
      'chdl' => 'High|Low',
      'chco' => 'ff0000,3072F3',
      'chma' => '10,15,10,15',
      'chs' => '700x300',
      'cht' => 'lc',
      'chtt' => 'Local+Temperature+in+degrees+(°F)',
      'chxt' => 'x,y',
      'chd' => "t:#{weather_info.high_temps.join(',')}|#{weather_info.low_temps.join(',')}",
      'chxl' => "0:|#{weather_info.days_of_week.join('|')}",
      'chxr' => "1,#{weather_info.low_temps.min-10},#{weather_info.high_temps.max+10}"
    })
  end

  def fetch_image
    Net::HTTP.get(chart_url)
  end

  # https://github.com/rails/rails/blob/main/actionpack/lib/action_dispatch/system_testing/test_helpers/screenshot_helper.rb#L112
  def render_image
    name = Base64.strict_encode64('Chart.png')
    image = Base64.strict_encode64(fetch_image)
    "\e]1337;File=name=Asdf;height=400px;inline=1:#{image}\a\n"
  end
end