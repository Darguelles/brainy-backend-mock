require 'sinatra'
require 'faker'
require 'sinatra/reloader'

class Skill

  attr_accessor :id, :name, :myLevel, :averageLevel

  def self.mock_skill
    skill = Skill.new
    skill.id =  Faker::Number.between(1, 10)
    skill.name = Faker::Hacker.adjective
    skill.myLevel = Faker::Number.between(1, 10)
    skill.averageLevel = Faker::Number.between(1, 10)
    skill
  end

end