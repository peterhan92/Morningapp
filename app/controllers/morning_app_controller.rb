class MorningAppController < ApplicationController
	def main
		@wotd = Wordoftheday.new
		@wotd_text = "#{@wotd.word} - #{@wotd.definition}"

		@mta = Mta.new

		@quote = Quote.new
		@quote_text = "\"#{@quote.content}\" - #{@quote.person}"

		@weather = Nycweather.new
		@weather_text = "#{@weather.location}: #{@weather.sky} #{@weather.temperature}"

		session['wotd'] = @wotd_text
		session['quote'] = @quote
		# session['weather'] = @weather
	end

	def text
		@phone_number = params["number"]
		valid = Validate.new(@phone_number.to_s).phone_number?
		if valid 
			Phonenumber.create(:number => params["number"])
			Textmessage.new(params["number"], session['wotd'])
			render('/morning_app/text')
		else
			flash[:success] = "<b>Please Enter Valid Phone Number</b>"
			redirect_to ("/")
		end
	end
end