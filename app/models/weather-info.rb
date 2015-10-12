class weather
	def nyweather
		#api call to wunderground
		current_weather = JSON.parse(RestClient.get('http://api.wunderground.com/api/"my key"/conditions/q/NY/New_York.json'))
		# Location "New York, NY"
		current_weather["current_observation"]["display_location"]["full"]
		# "Last Updated on October 12, 12:09 AM EDT"
		current_weather["current_observation"]["observation_time"]
		#"clear"
		current_weather["current_observation"]["weather"]
		#temp "59.4 F (15.2 C)" 
		current_weather["current_observation"]["temperature_string"]
		#"59.4" 
		current_weather["current_observation"]["feelslike_f"]
		# *** FORECAST
		forcast = JSON.parse(RestClient.get('http://api.wunderground.com/api/"my key"/forecast/q/NY/New_York.json'))
		#NOTE the weather forcast is given as an array of hashes
		#it is a 3 day forecast for the day and night and the current day
		# array elements 0-7 or 8 elements
		#0 for current day in the day
		#odd for night even for day
		forecast["forecast"]["txt_forecast"]["forecastday"][0]
		#Title "Thurday" or "thursday Night" for example
		forecast["forecast"]["txt_forecast"]["forecastday"][0]["title"]
		#forecast itself 
		forecast["forecast"]["txt_forecast"]["forecastday"][0]["fcttext"]
	end
end