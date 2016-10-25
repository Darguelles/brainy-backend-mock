require 'sinatra'
require 'faker'
require 'sinatra/reloader'

class Skill

  attr_accessor :id, :name, :myLevel, :averageLevel, :guestLevel, :validated

  def self.mock_skill
    skill = Skill.new
    skill.id =  Faker::Number.between(1, 10)
    skill.name = Faker::Hacker.adjective
    skill.myLevel = Faker::Number.between(1, 5)
    skill.averageLevel = Faker::Number.between(1.0, 5.0).round(1)
    skill.validated = Faker::Boolean.boolean
    skill.guestLevel = skill.validated ? Faker::Number.between(1, 5) : nil
    skill
  end

end