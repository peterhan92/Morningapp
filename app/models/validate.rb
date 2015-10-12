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
