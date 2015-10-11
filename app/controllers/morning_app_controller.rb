class MorningAppController < ApplicationController

	def main
		@wotd = Wordoftheday.new
	end

	def text
		@phone_number = params["number"]
		Phonenumber.create(:number => params["number"])
		render('/morning_app/text')
	end

end