class MorningAppController < ApplicationController
	def main
		@wotd = Wordoftheday.new
		@wotd_text = "Word of the day: #{@wotd.word} - #{@wotd.definition}"

		@mta = Mta.new
		@mta_text = @mta.subway_status

		@quote = Quote.new
		@quote_text = "Quote: \"#{@quote.content}\" - #{@quote.person}"

		@weather = Nycweather.new
		@weather_text = "Weather in #{@weather.location}: #{@weather.sky} #{@weather.temperature}"

		session['wotd'] = @wotd_text
		session['quote'] = @quote_text
		session['weather'] = @weather_text

		session['mta'] = @mta.subway_status
	end

	def text
		@phone_number = params["number"]
		valid = Validate.new(@phone_number.to_s).phone_number?
		if valid 
			Phonenumber.create(:number => params["number"])
			Textmessage.new(params["number"], "*** #{session['wotd']} *** #{session['quote']} *** #{session['weather']} *** #{session['mta']}")
			# Textmessage.new(params["number"], session['quote'])
			# Textmessage.new(params["number"], session['weather'])
			render('/morning_app/text')
		else
			flash[:success] = "<b>Please Enter Valid Phone Number</b>"
			redirect_to ("/")
		end
	end
end