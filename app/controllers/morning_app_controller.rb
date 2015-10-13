class MorningAppController < ApplicationController
	def main
		@wotd = Wordoftheday.new
		@wotd_text = "Word of the day: #{@wotd.word} - #{@wotd.definition}"

		@mta = Mta.new

		@quote = Quote.new
		@quote_text = "Quote: \"#{@quote.content}\" - #{@quote.person}"

		@weather = Nycweather.new
		@weather_text = "Weather in #{@weather.location}: #{@weather.sky} #{@weather.temperature}"
	end

	def text
		@phone_number = params["number"]
		valid = Validate.new(@phone_number.to_s).phone_number?

		if valid 
			Phonenumber.create(:number => params["number"])
			Textmessage.new(params["number"], 
				" #{params['wotd']}
				#{params['quote']}
				#{params['weather']}
				#{params['123']}
				#{params['456']}
				#{params['7']}
				#{params['ACE']}
				#{params['BDFM']}
				#{params['G']}
				#{params['JZ']}
				#{params['L']}
				#{params['NQR']}
				#{params['S']}")
			render('/morning_app/text')
		else
			flash[:success] = "<b>Please Enter Valid Phone Number</b>"
			redirect_to ("/")
		end
	end
end