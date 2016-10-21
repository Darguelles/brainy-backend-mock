json.elements(@elements) do |profile|
  json.id profile.id
  json.names profile.names
  json.email profile.email
  json.englishLevel profile.englishLevel
  json.location profile.location
  json.position profile.position
  json.skype profile.skype
  json.summary profile.summary
  json.skillList profile.skillList, :id, :name, :myLevel, :averageLevel
end