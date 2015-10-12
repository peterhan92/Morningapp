require 'phonelib'
class Validate
	def initialize(input)
		@input = input
	end

	def phone_number?
		if Phonelib.valid?(@input)
			return true
		end
		false
	end
end

x = Validate.new('6463061588')
binding.pry