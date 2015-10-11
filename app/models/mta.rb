class Mta
	def initialize
		url = "http://www.mta.info/"
		@mta = Nokogiri::HTML(open(url))
	end

	def subway
		@subway = @mta.css('div.span-11 img.subwayIcon_7')
	end

	def status
		@status = @mta.css('div.subwayCategory#123 a')
		# puts @status
	end

	def time
		@time = @mta.css('span.statusDateTime').text
		puts @time
	end
end