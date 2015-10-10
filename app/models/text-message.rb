class Textmessage
	
	@keys = YAML.load_file('')
	account_sid = @keys['ACCOUNT_SID']
	auth_token = @keys['AUTH_TOKEN']
	@client = Twilio::REST::Client.new account_sid, auth_token

	def send_msg(number, msg)
	    puts "Sending a message to #{number} : \'#{msg}\'"

	    @client.account.messages.create( 
	    :from => ,
	    :to => number,
	    :body => msg
	    )
	end

end
