require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

class Weather
	def initialize
		url = "http://www.weather.com/weather/today/l/USNY0996:1:US"
		@weather = Nokogiri::HTML(open(url))
	end

	def temp
		@degrees = @weather.css('div.temperature')
		puts @degrees
	end
end

x = Weather.new
y = x.temp
binding.pry