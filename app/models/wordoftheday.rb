class Wordoftheday
	def initialize
		@dictionary = Nokogiri::HTML(open('http://www.reference.com/')).css('div.word-section h2')
		@wotd_title = @dictionary.css('div.word-section h2')
		@wotd = @dictionary.css('div.word-section a.wotd')
		@wotd_txt = @dictionary.css('div.word-section a.wotd_txt')
	end
end