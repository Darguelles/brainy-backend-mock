require 'sinatra'
require 'faker'
require 'sinatra/reloader'
require './model/profile'
require './model/tag'

class TagUser
  attr_accessor :id, :userProfile, :tag

  def self.mock_tag_user
    tag_user = TagUser.new
    tag_user.id = Faker::Number.between(1, 10)
    tag_user.userProfile = Profile.mock_profile('email@email.com')
    tag_user.tag = Tag.mock_tag
    tag_user
  end

end
