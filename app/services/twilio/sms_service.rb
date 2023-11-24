module Twilio
	class SmsService
		TWILIO_ACCOUNT_SID = 'ACb681186f171c9da453b719c0bf1a544b' 
		TWILIO_AUTH_TOKEN = '0f42bed869776e5bf932907a8210a308'
		TWILIO_FROM_PHONE = '+14437433713'

		def initialize
		end
		def call
			@client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID , TWILIO_AUTH_TOKEN)
			message = @client.messages.create(body: 'Hellooo from my side',from: TWILIO_FROM_PHONE ,to: '+917089053724')

			puts message.sid
		end
	end
end

