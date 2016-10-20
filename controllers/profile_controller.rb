require './app'
require './model/skill'
require './model/profile'
require './model/elements'
require './model/tag_user'
require './model/tag'
require 'json'
require 'sinatra/reloader'

class ProfileController < MyApp

  def self.update_profile(data)
    data['id'] = 1
    data.to_json
  end

  def self.profile_info(params)
    profile = Profile.mock_profile(params['email'])
    render_to_template('templates/profile.json.jbuilder', profile)
  end

  def self.profile_list
    profiles = []
    profiles.push(Profile.mock_profile('email1@email.com'))
    profiles.push(Profile.mock_profile('email2@email.com'))
    elements = Elements.new
    elements.elements = profiles
    render_to_template('templates/profile_list.json.jbuilder', elements)
  end

  def self.most_endorsed_skills
    skills = []
    (1..3).each { |_| skills.push(Skill.mock_skill) }
    elements = Elements.new
    elements.elements = skills
    render_to_template('templates/skill_list.json.jbuilder', elements)
  end

  def self.tag_some_profile
    tags = []
    (1..3).each { |_| tags.push(Tag.mock_tag) }
    elements = Elements.new
    elements.elements = tags
    render_to_template('templates/tag_list.json.jbuilder', elements)
  end

  def self.tag_created_by_me
    tags = []
    (1..4).each { |_| tags.push(Tag.mock_tag) }
    elements = Elements.new
    elements.elements = tags
    render_to_template('templates/tag_list.json.jbuilder', elements)
  end

  def self.save_tag(data)
    data['id'] = Faker::Number.between(1, 10)
    data.to_json
  end

  def self.people_tagged_in
    user_tag = []
    (1..4).each { |_| user_tag.push(TagUser.mock_tag_user) }
    elements = Elements.new
    elements.elements = user_tag
    render_to_template('templates/tag_user_list.json.jbuilder', elements)
  end

end