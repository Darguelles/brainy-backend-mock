require 'profile'
require 'sinatra'
require 'json'
require 'faker'

# helpers BrainyMockModel

#save or update profile
post '/profile' do
  request.body.rewind
  data = JSON.parse request.body.read
  content_type :json
  data['id'] = 1
  data.to_json
end

get '/profile/:email' do
  p "1"
  Profile.mock_profile(params['email'])
end
