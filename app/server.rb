require 'sinatra'
require 'data_mapper'
require 'twilio-ruby'
require_relative './lib/phone'


env = ENV["RACK_ENV"] || "development"
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/smt2_#{env}")

require './app/models/message.rb' # this needs to be done after datamapper is initialised
require './app/models/exchange.rb' # this needs to be done after datamapper is initialised

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!


get '/' do
	erb :widget
end


post '/messages' do
  text = params["text-box"]
  number = params["phone-number"]
  exchange = Exchange.create(visitor_phone: number)
  Message.create(text: text, exchange: exchange)
  phone = Phone.new()
  phone.send_sms(number, text)
  redirect to('/sent')
end

get '/sent' do
	erb :sent
end
