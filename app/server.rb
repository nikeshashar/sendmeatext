require 'sinatra'
require 'data_mapper'
# require 'twilio-ruby'
require_relative './lib/phone'


env = ENV["RACK_ENV"] || "development"
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/smt4_#{env}")

require './app/models/message.rb'
require './app/models/exchange.rb'
require './app/models/instance.rb'
# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!

set :public_folder, Proc.new { File.join(root, "..", "public") }

get '/' do
	erb :widget
end

get '/test_homepage' do
	erb :index
end


post '/messages' do
  dialog = params["dialog"]
  sender = params["sender"]
  instance = Instance.create(twilio_id: 123)
  exchange = Exchange.create(sender: sender, instance_id: instance.id)
  Message.create(dialog: dialog, exchange_id: exchange.id)
  phone = Phone.new()
  phone.send_sms(sender, dialog)
  redirect to('/sent')
end

get '/sent' do
	erb :sent
end
