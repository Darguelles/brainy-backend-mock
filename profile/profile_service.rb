require 'sinatra'
require 'faker'
require 'json'
require 'tilt/jbuilder'

get '/ping' do
  'Pong'
end

# save or update profile
post '/profile' do
  request.body.rewind
  data = JSON.parse request.body.read
  content_type :json
  data['id'] = 1
  data.to_json
end

# Get profile information
get '/profile/:email' do
  content_type :json
  template = Tilt::JbuilderTemplate.new('templates/profile.json.jbuilder')
  profile = Profile.mock_profile(params['email'])
  profile.skillList.push(Skill.mock_skill)
  template.render(profile)

end

#Get profile list
get '/profiles' do
  find = params[:find]
  content_type :json
  profiles = []
  profiles.push(Profile.mock_profile('email1@email.com').to_json)
  profiles.push(Profile.mock_profile('email2@email.com').to_json)
  profiles
end

class Profile

  attr_accessor :id, :names, :email, :englishLevel, :location, :position, :skillList, :skype, :summary

  def initialize(init)
    init.each_pair do |key, val|
      instance_variable_set('@' + key.to_s, val)
    end
  end

  def self.mock_profile(email)

    profile = Profile.new :id => Faker::Number.between(1, 10),
                          :names => Faker::StarWars.character,
                          :email => email,
                          :summary => Faker::Lorem.sentence,
                          :position => 'SE III',
                          :skype => Faker::StarWars.specie,
                          :location => '4th floor - Prod 1',
                          :englishLevel => 'C3',
                          :skillList => []

    profile
  end
end

class Skill

  attr_accessor :id, :name

  def initialize(init)
    init.each_pair do |key, val|
      instance_variable_set('@' + key.to_s, val)
    end
  end

  def self.mock_skill
    skill = Skill.new :id => Faker::Number.between(1, 10),
                      :name => Faker::Hacker.adjective
    skill
  end

end
