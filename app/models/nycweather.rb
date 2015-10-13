class Nycweather
	def initialize
		api = ENV['WEATHER_API']
		@current_weather = JSON.parse(RestClient.get("http://api.wunderground.com/api/#{api}/conditions/q/NY/New_York.json"))
		@forcast = JSON.parse(RestClient.get("http://api.wunderground.com/api/#{api}/forecast/q/NY/New_York.json"))
	end

	def time
		@current_weather["current_observation"]["observation_time"]
	end

	def location
		@current_weather["current_observation"]["display_location"]["full"]
	end

	def sky
		@current_weather["current_observation"]["weather"]
	end
	
	def temperature
		@current_weather["current_observation"]["temperature_string"]
	end
	# *** FORECAST
	# NOTE the weather forcast is given as an array of hashes
	# it is a 3 day forecast for the day and night and the current day
	# array elements 0-7 or 8 elements
	# 0 for current day in the day
	# odd for night even for day
	# def six
	# 	@forecast["forecast"]["txt_forecast"]["forecastday"][0]
	# end
	# #Title "Thurday" or "thursday Night" for example
	# def seven
	# 	@forecast["forecast"]["txt_forecast"]["forecastday"][0]["title"]
	# end
	# #forecast itself 
	# def eight
	# 	@forecast["forecast"]["txt_forecast"]["forecastday"][0]["fcttext"]
	# end
end