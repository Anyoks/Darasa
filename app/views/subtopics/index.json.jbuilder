json.array!(@subtopics) do |subtopic|
  json.extract! subtopic, :id
  json.url subtopic_url(subtopic, format: :json)
end
