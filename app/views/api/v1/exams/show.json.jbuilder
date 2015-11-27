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
	json.Question question.question

	if question.response.nil?
		json.text "false"
		json.video "false"
	else if question.response.video.nil?
		json.video "false"
	else
		json.text "true"
		json.video "true"
		json.paid @paid
	end
	end
end

