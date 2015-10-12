class MorningAppController < ApplicationController
	def main
		@wotd = Wordoftheday.new
		@wod_display = "#{@wotd.word} - #{@wotd.definition}"
		@mta = Mta.new.subway_status
		@quote = Quote.new
		session['wod_disp'] = @wod_display
	end

	def text
		@phone_number = params["number"]
		valid = Validate.new(@phone_number.to_s).phone_number?
		if valid 
			Phonenumber.create(:number => params["number"])
			Textmessage.new(params["number"], session['wod_disp'])
			render('/morning_app/text')
		else
			flash[:success] = "<b>Please Enter Valid Phone Number</b>"
			redirect_to ("/")
		end
	end
end