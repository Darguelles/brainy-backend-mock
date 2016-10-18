require 'faker'
require './skill'

module BrainyMockModel

  class Profile

    attr_accessor :id, :names, :email, :englishLevel,:location, :position, :skillList, :skype, :summary

    def self.mock_profile(email)
      p "2"
      profile = Profile.new
      profile.id= Faker::Number.between(1, 10),
          profile.names= Faker::StarWars.character,
          profile.email= email,
          profile.summary= Faker::Lorem.sentence,
          profile.position= 'SE III',
          profile.skype= Faker::StarWars.specie,
          profile.location= '4th floor - Prod 1',
          profile.englishLevel= 'C3',
          profile.skillList= []

      for i in 1..7
        profile.skillList.push(Skill::mock_skill)
      end

      profile
    end

  end

end
