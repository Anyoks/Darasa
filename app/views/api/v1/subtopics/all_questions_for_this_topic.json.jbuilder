questions_for_this_topic = []


@topic.subtopics.each do |subtopic|
	subtopic.questions.each do |question|
		questions_for_this_topic << questions
	end
end



if questions_for_this_topic.empty?
	@status = "OK"
	@error = "none"
	@message = "No questions"
end

if questions_for_this_subtopic
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load questions"
end

json.status @status
json.error  @error
	
json.data  questions_for_this_topic do |questions|
	json.subtopic questions.subtopic.title
	json.id questions.id
	json.text questions.title

	
end


