require 'sinatra'
require 'faker'
require 'json'

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
    p 'mock skill'
    skill = Skill.new :id => Faker::Number.between(1, 10),
                      :name => Faker::Hacker.adjective
    skill
  end

end