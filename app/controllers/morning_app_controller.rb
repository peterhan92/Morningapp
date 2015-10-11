class MorningAppController < ApplicationController

	def main
		@wotd = Wordoftheday.new
	end

	def text
		@phone_number = params["number"]
	end

end