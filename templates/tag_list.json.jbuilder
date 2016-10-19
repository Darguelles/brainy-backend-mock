json.elements(@elements) do |tag|
  json.id tag.id
  json.name tag.name
  json.userProfile tag.userProfile, :id, :names, :email, :englishLevel, :location, :position, :skype, :summary
  json.info tag.info
  json.contactState tag.contactState
end