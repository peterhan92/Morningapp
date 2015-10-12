class Quoteoftheday
	def qotd
		# Quote of the Day QOTD
		@qotd =  Nokogiri::HTML(open('http://www.brainyquote.com/quotes_of_the_day.html'))
		#title "Quote of the Day"
		@doc.css('div.boxyPaddingBig h2')[0].text
		#quote 
		@qotd.css('div.boxyPaddingBig a')[0].text
		#author
		@qotd.css('div.boxyPaddingBig div.bq-aut a')[0].text
	end
end