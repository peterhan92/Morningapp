class Textmessage
	def initialize(number, msg)
		account_sid = ENV['ACCOUNT_SID']
		auth_token = ENV['AUTH_TOKEN']
		twilio_number = ENV['TWILIO_NUMBER']
		@client = Twilio::REST::Client.new account_sid, auth_token
	  puts "Sending a message to #{number} : \'#{msg}\'"

   	@client.account.messages.create( 
    :from => twilio_number,
    :to => number,
    :body => msg)
	end
end