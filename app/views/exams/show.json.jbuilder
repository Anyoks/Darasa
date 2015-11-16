@paid = @current_user.has_paid? @exam.unit.id, @exam.unit.semester.id

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
		json.text_answer "false"
	else
		json.text_answer "true"
		json.paid @paid
	end
end

