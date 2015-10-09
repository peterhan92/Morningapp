class Textmessage
	
	@keys = YAML.load_file('/twilio-sid-token.yml')
	account_sid = @keys['ACCOUNT_SID']
	auth_token = @keys['AUTH_TOKEN']
	@client = Twilio::REST::Client.new account_sid, auth_token

	def send_msg(number, msg)
	    puts "Sending a message to #{number} : \'#{msg}\'"

	    @client.account.messages.create( 
	    :from => '8455354138',
	    :to => number,
	    :body => msg
	    )
	end

end

test = Textmessage.new
binding.pry
test.send_msg(334,"hu")