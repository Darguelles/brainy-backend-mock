require 'sinatra/base'
require "sinatra/reloader"
require 'rack/cors'

use Rack::Cors do |config|
  config.allow do |allow|
    allow.origins '*'
    allow.resource '/profileApi/*',
                   :methods => [:get, :post, :put, :delete],
                   :headers => :any
  end
end


class MyApp < Sinatra::Application

  configure :development do
    register Sinatra::Reloader
  end

  # configure do
  #   enable :cross_origin
  # end
  
  before do
    content_type 'application/json'
  end

end
