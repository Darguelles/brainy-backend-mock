require 'sinatra/base'
require "sinatra/reloader"
require 'tilt/jbuilder'
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

  before do
    content_type 'application/json'
  end

  def self.render_to_template(template_name, item)
    template = Tilt::JbuilderTemplate.new(template_name)
    template.render(item)
  end

end
