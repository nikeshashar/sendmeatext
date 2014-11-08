require 'twilio-ruby'

class Phone

	DEFAULT_NUMBER = '+441454300062'
	ACCOUNT_SID = 'ACfdbf6a26b5fef552e2b52f60658bc1ff'
	AUTH_TOKEN = 'c0356ef4a2eb93427b48a16e14601c01'

	attr_accessor :number

	def initialize(number = DEFAULT_NUMBER)
		@number = number
	end

	def send_sms(customer_number, message_body)
		initialize_twilio_client
		create_new_twilio_msg(customer_number, message_body)
	end

	def initialize_twilio_client
		@client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
	end

	def create_new_twilio_msg(customer_number, message_body)
		@client.account.messages.create({
			:from => DEFAULT_NUMBER,
			:to => customer_number,
			:body => message_body
		})
	end

end
