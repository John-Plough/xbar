#!/usr/bin/env /Users/plough/.rbenv/shims/ruby
# <xbar.var>string(CITY="Traverse City"): Enter your city name</xbar.var>
# <xbar.var>string(COLD=32): You are no longer comfortable when the temperature drops below this number</xbar.var>
# <xbar.var>string(HOT=72): You are no longer comfortable when the temperature rises above this number</xbar.var>
# <xbar.var>string(OPEN_WEATHER_API_KEY=""): OpenWeather api key</xbar.var>

require 'http'

city = ENV['CITY'] || 'Traverse City'
too_low = (ENV['COLD'] || 32).to_i
too_high = (ENV['HOT'] || 72).to_i

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=imperial")
data = response.parse

temp = data['main']['temp'].round
high = data['main']['temp_max'].round
low = data['main']['temp_min'].round

font_color, emo = if temp < too_low
  ['blue', '🥶']
elsif temp < too_high
  ['green', '😀']
else
  ['red', '🥵']
end

FONT = "color=#{font_color}"

puts "It's #{temp}°F in #{city} #{emo} | #{FONT}"
puts '---'
puts "Today's high: #{high}°F"
puts "Today's low: #{low}°F"
