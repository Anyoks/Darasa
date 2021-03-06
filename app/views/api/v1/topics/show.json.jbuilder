questions_for_this_topic = []

@topic.subtopics.each do |subtopic|
	subtopic.questions.order(:created_at).each do |question|
		questions_for_this_topic << question
	end
end



if questions_for_this_topic.empty?
	@status = "OK"
	@error = "none"
	@message = "No questions"
end

if questions_for_this_topic
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load questions"
end

json.status @status
json.error  @error
json.current_page @questions.current_page
json.per_page  @questions.per_page
json.total_entries @questions.total_entries
	
json.data  @questions do |questions|
	json.subtopic questions.subtopic.title
	json.id questions.id
	json.text questions.question
end