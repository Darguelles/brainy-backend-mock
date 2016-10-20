require 'sinatra'
require 'sinatra/reloader'
require './controllers/skill_controller'

get '/skillApi/skill/:search' do
  SkillController.skill_by_name
end

get '/skillApi/skill/id/:search' do
  SkillController.skill_by_name
end
