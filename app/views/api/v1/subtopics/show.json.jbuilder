questions_for_this_subtopic = []
@subtopic.questions.each do |questions|
	if questions.subtopic.name == @subtopic.name 
		questions_for_this_subtopic << questions
	end
end

if questions_for_this_subtopic.empty?
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
	
json.data  questions_for_this_subtopic do |questions|
	json.id questions.id
	json.text questions.title

	
end

