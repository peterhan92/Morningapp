require 'pry'
require 'json'
require 'rest-client'
class Nycweather
	def initialize
		#api call to wunderground
		api = ENV['WEATHER_API']
		@current_weather = JSON.parse(RestClient.get("http://api.wunderground.com/api/#{api}/conditions/q/NY/New_York.json"))
		@forcast = JSON.parse(RestClient.get("http://api.wunderground.com/api/#{api}/forecast/q/NY/New_York.json"))
		# Location "New York, NY"
	end

	def one
		@current_weather["current_observation"]["display_location"]["full"]
	end
	# "Last Updated on October 12, 12:09 AM EDT"
	def two
		@current_weather["current_observation"]["observation_time"]
	end
	#"clear"
	def three
		@current_weather["current_observation"]["weather"]
	end
	#temp "59.4 F (15.2 C)" 
	def four
		@current_weather["current_observation"]["temperature_string"]
	end
	#"59.4" 
	def five
		@current_weather["current_observation"]["feelslike_f"]
	end
	# *** FORECAST
	#NOTE the weather forcast is given as an array of hashes
	#it is a 3 day forecast for the day and night and the current day
	# array elements 0-7 or 8 elements
	#0 for current day in the day
	#odd for night even for day
	def six
		@forecast["forecast"]["txt_forecast"]["forecastday"][0]
	end
	#Title "Thurday" or "thursday Night" for example
	def seven
		@forecast["forecast"]["txt_forecast"]["forecastday"][0]["title"]
	end
	#forecast itself 
	def eight
		@forecast["forecast"]["txt_forecast"]["forecastday"][0]["fcttext"]
	end
end

x = Nycweather.new
binding.pry