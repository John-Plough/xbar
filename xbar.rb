#!/usr/bin/env /Users/plough/.rbenv/shims/ruby
require "http"

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV["OPEN_WEATHER_API_KEY"]}&units=imperial")
data = response.parse

temp = data["main"]["temp"].round
high = data["main"]["temp_max"].round
low = data["main"]["temp_min"].round

puts temp
puts "---"
puts high
puts low