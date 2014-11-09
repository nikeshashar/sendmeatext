require 'twilio-ruby'
require_relative './secrets.rb'

class Phone

	attr_accessor :number

	def initialize(number = DEFAULT_NUMBER)
		@number = number
	end

	def send_sms(number, message_body)
		initialize_twilio_client
		create_new_twilio_msg(number, message_body)
	end

	def initialize_twilio_client
		@client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
	end

	def create_new_twilio_msg(number, message_body)
		@client.account.messages.create({
			:from => DEFAULT_NUMBER,
			:to => number,
			:body => message_body
		})
	end

end


