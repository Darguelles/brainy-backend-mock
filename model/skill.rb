require 'sinatra'
require 'faker'
require 'sinatra/reloader'

class Skill

  attr_accessor :id, :name

  def self.mock_skill
    skill = Skill.new
    skill.id =  Faker::Number.between(1, 10)
    skill.name = Faker::Hacker.adjective
    skill
  end

end