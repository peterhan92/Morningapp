class Textmessage <ActiveRecord::Base

	def initialize
		account_sid = ENV['ACCOUNT_SID']
		auth_torken = ENV['AUTH_TOKEN']
		@client = Twilio::REST::Client.new account_sid, auth_token
	end

	def send_msg(number, msg)
	    puts "Sending a message to #{number} : \'#{msg}\'"

	    @client.account.messages.create( 
	    :from => ,
	    :to => number,
	    :body => msg
	    )
	end

end
