json.elements(@elements) do |skill|
  json.id skill.id
  json.name skill.name
  json.myLevel skill.myLevel
  json.averageLevel skill.averageLevel
end