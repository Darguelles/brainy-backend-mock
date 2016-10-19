require 'sinatra'
require 'faker'
require 'json'
require 'tilt/jbuilder'
require "sinatra/reloader"

get '/ping' do
  'Pong'
end

# save or update profile
post '/profile' do
  request.body.rewind
  data = JSON.parse request.body.read
  data['id'] = 1
  data.to_json
end

# Get profile information
get '/profile/:email' do
  profile = Profile.mock_profile(params['email'])
  render_to_template('templates/profile.json.jbuilder', profile)
end

#Get profile list
get '/profiles' do
  profiles = []
  profiles.push(Profile.mock_profile('email1@email.com'))
  profiles.push(Profile.mock_profile('email2@email.com'))
  elements = Elements.new
  elements.elements = profiles
  render_to_template('templates/profile_list.json.jbuilder', elements)
end

# Get most endorsed skills
get '/profile/:email/mostEndorsedSkills' do
  skills = []
  for _ in 1..3
    skills.push(Skill.mock_skill)
  end
  elements = Elements.new
  elements.elements = skills
  render_to_template('templates/skill_list.json.jbuilder', elements)
end

#Get my tags on some profile
get '/profile/my-tags-on/:email' do
  tags = []
  for _ in 1..3
    tags.push(Tag.mock_tag)
  end
  elements = Elements.new
  elements.elements = tags
  render_to_template('templates/tag_list.json.jbuilder', elements)
end

# Tag user
get '/profile/:email/tag-in/:idTag' do
  # always is chevere
  'OK'
end

delete '/profile/:email/tag-in/:idTag' do
  # always is chevere
  'OK'
end

# Get tags created by me
get '/my-tags' do
  tags = []
  for _ in 1..4
    tags.push(Tag.mock_tag)
  end
  elements = Elements.new
  elements.elements = tags
  render_to_template('templates/tag_list.json.jbuilder', elements)
end

# Save tag
post '/my-tags' do
  request.body.rewind
  data = JSON.parse request.body.read
  data['id'] = Faker::Number.between(1, 10)
  data.to_json
end

# Delete tag
delete '/my-tags/:tag' do
  # always is chevere
  'OK'
end

# Get people tagged in
post '/my-tags/:name/people' do
  user_tag = []
  for _ in 1..4
    user_tag.push(TagUser.mock_tag_user)
  end
  elements = Elements.new
  elements.elements = user_tag
  render_to_template('templates/tag_user_list.json.jbuilder', elements)
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
    Skill.new :id => Faker::Number.between(1, 10),
              :name => Faker::Hacker.adjective
  end

end

class Elements
  attr_accessor :elements
end

class Tag
  attr_accessor :id, :userProfile, :name, :info, :contactState

  def initialize(init)
    init.each_pair do |key, val|
      instance_variable_set('@' + key.to_s, val)
    end
  end

  def self.mock_tag
    Tag.new :id => Faker::Number.between(1, 10),
                  :userProfile => Profile.mock_profile('email@email.com'),
                  :name => Faker::Hacker.adjective,
                  :info => Faker::Hacker.adjective,
                  :contactState => Faker::Hacker.adjective

  end

end

class TagUser
  attr_accessor :id, :userProfile, :tag

  def initialize(init)
    init.each_pair do |key, val|
      instance_variable_set('@' + key.to_s, val)
    end
  end

  def self.mock_tag_user
    TagUser.new :id => Faker::Number.between(1, 10),
                :userProfile => Profile.mock_profile('email@email.com'),
                :tag => Tag.mock_tag
  end

end
