@paid = @resource.has_paid? @exam.unit.id



if @exam.questions
      @status = "OK"
      @error = "none"
    else
      @status = "bad"
      @error = " can't load questions"
end

json.status @status
json.error  @error
	
json.data  @exam.questions do |question|
	json.id question.id
	json.question question.question

	if question.response.nil?
		@text = "false"
		@video = "false"
	else if question.response.video.nil?
		@video = "false"
		json.video "false"
	else
		@text = "true"
		@video = "true"
	end

	json.text @text
	json.video @video
	json.paid @paid


	end
end

