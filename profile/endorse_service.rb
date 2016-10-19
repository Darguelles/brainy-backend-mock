require 'sinatra'
require 'faker'
require 'json'
require 'tilt/jbuilder'

#give support
post '/profile/:email/skill/:idSkill/endorsements' do
  {:averageLevel => Faker::Number.between(1, 10)}.to_json
end

#quit support
delete '/profile/:email/skill/:idSkill/endorsements' do
  {:averageLevel => Faker::Number.between(1, 10)}.to_json
end