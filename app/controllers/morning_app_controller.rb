class MorningAppController < ApplicationController

	def welcome
		@wotd = Wordoftheday.new
		# @text = Textmessage.new(number, msg)
	end


end