require 'sinatra'
require 'faker'
require 'sinatra/reloader'
require './model/profile'

class Tag
  attr_accessor :id, :userProfile, :name, :info, :contactState

  def self.mock_tag
    tag = Tag.new
    tag.id = Faker::Number.between(1, 10)
    tag.userProfile = Profile.mock_profile('email@email.com')
    tag.name = Faker::Hacker.adjective
    tag.info = Faker::Hacker.adjective
    tag.contactState = Faker::Hacker.adjective
    tag
  end

end