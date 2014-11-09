require 'rubygems'
require File.join(File.dirname(__FILE__), 'app/server.rb')

run Sinatra::Application

configure do
    set :protection, except: [:frame_options]
end
