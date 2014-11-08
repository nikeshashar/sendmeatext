require 'sinatra'
require 'data_mapper'
require 'twilio-ruby'

env = ENV["RACK_ENV"] || "development"
# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/smt_#{env}")

require './app/models/message.rb' # this needs to be done after datamapper is initialised
require './app/models/thread.rb' # this needs to be done after datamapper is initialised

# After declaring your models, you should finalise them
DataMapper.finalize

# However, the database tables don't exist yet. Let's tell datamapper to create them
DataMapper.auto_upgrade!


get '/' do
	erb :index
end


post '/messages' do
  text = params["text-box"]
  number = params["phone-number"]
  thread = Thread.create(visitor_phone: number)
  Message.create(text: text, thread: thread)
  redirect to('/')
end
