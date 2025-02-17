#!/usr/bin/env /Users/plough/.rbenv/shims/ruby
# <xbar.var>string(WEATHER_API_KEY=""): OpenWeather api key</xbar.var>
require "http"

city = "Traverse City"

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=imperial")
data = response.parse

temp = data["main"]["temp"].round
high = data["main"]["temp_max"].round
low = data["main"]["temp_min"].round

puts "It's #{temp}°F in #{city}."
puts "---"
puts "Today's high: #{high}°F"
puts "Today's low: #{low}°F"