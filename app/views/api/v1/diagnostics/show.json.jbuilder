json.questions @diagnostic.questions do |question|
  json.extract! question, :content
  json.options question.options do |option|
    json.extract! option, :id, :content
  end
end
