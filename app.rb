require 'sinatra/base'
require "sinatra/reloader"
require 'sinatra/cross_origin'

class MyApp < Sinatra::Application

  configure :development do
    register Sinatra::Reloader
  end

  configure do
    enable :cross_origin
  end
  
  before do
    content_type 'application/json'
  end

end
