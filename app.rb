require 'sinatra/base'
require "sinatra/reloader"

class MyApp < Sinatra::Application

  configure :development do
    register Sinatra::Reloader
  end
  
  before do
    content_type 'application/json'
  end

end
