require './app'
require './model/skill'
require './model/elements'
require 'sinatra/reloader'

class SkillController < MyApp

  def self.skill_by_name
    skill_array = []
    (1..4).each { |_| skill_array.push(Skill.mock_skill) }
    elements = Elements.new
    elements.elements = skill_array
    self.render_to_template('templates/skill_array.json.jbuilder', elements)
  end

end