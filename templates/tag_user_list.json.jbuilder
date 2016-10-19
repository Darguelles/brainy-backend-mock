json.elements(@elements) do |tag_user|
  json.id tag_user.id
  json.userProfile tag_user.userProfile, :id, :names, :email, :englishLevel, :location, :position, :skype, :summary
  json.tag tag_user.tag, :id, :userProfile, :name, :info, :contactState
end