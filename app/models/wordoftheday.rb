class Wordoftheday
	def initialize
		@url = "http://dictionary.reference.com/"
		@dictionary = Nokogiri::HTML(open(@url))
	end

	def word
		@word = @dictionary.css('div.word-section a.wotd').text
	end

	def definition
		@definition = @dictionary.css('div.word-section a.wotd_txt').text
	end
end