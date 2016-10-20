require 'sinatra'
require 'sinatra/reloader'
require './controllers/profile_controller'

get '/ping' do
  'Pong'
end

# save or update profile
post '/profileApi/profile' do
  request.body.rewind
  data = JSON.parse request.body.read
  ProfileController.update_profile(data)
end

# Get profile information
get '/profileApi/profile/:email' do
  ProfileController.profile_info(params)
end

#Get profile list
get '/profileApi/profiles' do
  ProfileController.profile_list
end

# Get most endorsed skills
get '/profileApi/profile/:email/mostEndorsedSkills' do
  ProfileController.most_endorsed_skills
end

#Get my tags on some profile
get '/profileApi/profile/my-tags-on/:email' do
  ProfileController.tag_some_profile
end

# Tag user
post '/profileApi/profile/:email/tag-in/:idTag' do
  # always is chevere
  'OK'
end

delete '/profileApi/profile/:email/tag-in/:idTag' do
  # always is chevere
  'OK'
end

# Get tags created by me
get '/profileApi/my-tags' do
  ProfileController.tag_created_by_me
end

# Save tag
post '/profileApi/my-tags' do
  request.body.rewind
  data = JSON.parse request.body.read
  ProfileController.save_tag(data)
end

# Delete tag
delete '/profileApi/my-tags/:tag' do
  # always is chevere
  'OK'
end

# Get people tagged in
get '/profileApi/my-tags/:name/people' do
  ProfileController.people_tagged_in
end
