require 'sinatra'
require 'faker'
require 'json'

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