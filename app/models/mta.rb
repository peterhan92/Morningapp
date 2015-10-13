require 'pry'
require 'nokogiri'
require 'open-uri'
class	Mta
	def initialize
		mta = "http://web.mta.info/status/serviceStatus.txt"
		@mta = Nokogiri::HTML(open(mta)) 
	end

	def subway
    @mta.css('line name').map {|name| name.text}[0...10]
  end

  def status
    @mta.css('line status').map {|name| name.text}[0...10]
  end

  def subway_status
    Hash[subway.zip(status)] 
    # subway.zip(status)
  end

end
