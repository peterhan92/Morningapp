require 'nokogiri'
require 'open-uri'

class	Mta
	def initialize
		mta = "http://web.mta.info/status/serviceStatus.txt"
		@doc = Nokogiri::HTML(open(mta)) 
	end

	def name
    @doc.xpath("//name").collect do |name|
      name.children.text
    end
  end

  def status
    @doc.xpath("//status").collect do |s|
      s.children.text
    end
  end

  def output
    name.zip(status)
  end

  def subway
    output[0..10]
  end

end