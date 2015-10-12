class Mtasubwaystatus
	def mta_status
		#Mta status updates
		@mta = Nokogiri::HTML(open('http://web.mta.info/status/serviceStatus.txt'))
		#Group Train Names
		#Group Train status
		i = 0
		mta_hash = {}
			while i < 10 do 
				# train name = @mta.css('line name')[i].text 
				# train_status = @mta.css('line status')[i].text	
				#***********************************************
				#string format = "#{@mta.css('line name')[i].text}" +": " + "#{@mta.css('line status')[i].text}" + "." 
				#***********************************************
				#hash format
				mta_hash[:"#{@mta.css('line name')[i].text}"] = "#{@mta.css('line status')[i].text}"
				i+=1 
			end
		puts mta_hash
	end
end