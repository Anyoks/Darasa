if @subtopics
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load subtopics"
end

json.status @status
json.error  @error

json.data  @subtopics.each do |subtopic|
	json.id subtopic.id
	json.text subtopic.title
end
