require 'sinatra/base'

class MyApp < Sinatra::Application

  before do
    content_type 'application/json'
  end

end