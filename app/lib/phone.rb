require 'twilio-ruby'
require_relative './secrets.rb'

class Phone

	attr_accessor :number

	def initialize(number = DEFAULT_NUMBER)
		@number = number
	end

	def send_sms(number, dialog)
		initialize_twilio_client
		create_new_twilio_msg(number, dialog)
	end

	def initialize_twilio_client
		@client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
	end

	def create_new_twilio_msg(number, dialog)
		@client.account.messages.create({
			:from => DEFAULT_NUMBER,
			:to => number,
			:body => dialog
		})
	end

end
