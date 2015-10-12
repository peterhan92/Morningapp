class Quote
	def initialize
		@qotd =  Nokogiri::HTML(open('http://www.brainyquote.com/quotes_of_the_day.html'))
	end

	def person	
		@qotd.css('div.boxyPaddingBig div.bq-aut a')[0].text
	end

	def content
		@qotd.css('div.boxyPaddingBig a')[0].text
	end
end
