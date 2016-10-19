require 'sinatra'
require 'faker'
require 'json'

get '/hello' do
  'Hello from profile!'
end

post '/profile' do
  request.body.rewind
  data = JSON.parse request.body.read
  content_type :json
  data['id'] = 1
  data.to_json
end

get '/profile/:email' do
  content_type :json
  p = Profile.mock_profile(params['email'])
  p.skillList.push(Skill.mock_skill.to_json)
  p.to_json
end

class Profile

  attr_accessor :id, :names, :email, :englishLevel, :location, :position, :skillList, :skype, :summary

  #skills = Array.new([Skill.mock_skill, Skill.mock_skill])

  def initialize(init)
    init.each_pair do |key, val|
      instance_variable_set('@' + key.to_s, val)
    end
  end

  def to_json
    {:id => id, :names => names, :email => email, :englishLevel => englishLevel, :location => location, :position => position, :skillList => skillList, :skype => skype, :summary => summary}.to_json
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

  def to_json
    {:id => id, :name => name}.to_json
  end

  def self.mock_skill
    skill = Skill.new :id => Faker::Number.between(1, 10),
                      :name => Faker::Hacker.adjective
    skill
  end

end
