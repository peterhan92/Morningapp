class MorningAppController < ApplicationController
	def main
			@wotd = Wordoftheday.new
			@mta = Mta.new.subway
	end

	def text
		@phone_number = params["number"]
<<<<<<< HEAD
		Phonenumber.create(:number => params["number"])
		# Textmessage.new(params["number"], "hey")
=======
		valid = Validate.new(@phone_number.to_s).phone_number?
		if valid 
			Phonenumber.create(:number => params["number"])
		else
			flash[:success] = "<b>Please Enter Valid Phone Number</b>" 
		end
>>>>>>> mta
		render('/morning_app/text')
	end
end