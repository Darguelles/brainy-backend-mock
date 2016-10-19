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
  profile = Profile.mock_profile(params['email'])
  render_to_template('templates/profile.json.jbuilder', profile)
end

#Get profile list
get '/profiles' do
  content_type :json
  profiles = []
  profiles.push(Profile.mock_profile('email1@email.com'))
  profiles.push(Profile.mock_profile('email2@email.com'))
  elements = Elements.new
  elements.elements = profiles
  render_to_template('templates/profile_list.json.jbuilder', elements)
end

# Get most endorsed skills
get '/profile/:email/mostEndorsedSkills' do
  content_type :json
  skills = []
  for _ in 1..3
    skills.push(Skill.mock_skill)
  end
  elements = Elements.new
  elements.elements = skills
  render_to_template('templates/skill_list.json.jbuilder', elements)
end



def render_to_template(template_name, item)
  template = Tilt::JbuilderTemplate.new(template_name)
  template.render(item)
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

    for _ in 1..7
      profile.skillList.push(Skill.mock_skill)
    end

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

class Elements
  attr_accessor :elements
end
