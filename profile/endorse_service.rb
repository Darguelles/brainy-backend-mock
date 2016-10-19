require 'sinatra'
require 'faker'
require 'json'
require 'tilt/jbuilder'
require "sinatra/reloader"

#give support
post '/profileApi/profile/:email/skill/:idSkill/endorsements' do
  {:value => Faker::Number.between(1, 10)}.to_json
end

#quit support
delete '/profileApi/profile/:email/skill/:idSkill/endorsements' do
  {:value => Faker::Number.between(1, 10)}.to_json
end
