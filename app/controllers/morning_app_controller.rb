class MorningAppController < ApplicationController

	def welcome
		@wotd = Wordoftheday.new
	end
end