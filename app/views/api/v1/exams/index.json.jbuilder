if @exams.nil?
	@status = "bad"
	@error = " can't load questions"
else
	@status = "OK"
	@error = "none"
end

json.status @status
json.error  @error
	
json.data  @exams.each do |exam|
	exam.questions.each do |question|
		json.id question.id
		json.Question question.question

		if question.response.nil?
			json.text "false"
		else if question.response.video.nil?
			json.video "false"
		else
			json.text "true"
			json.video "true"
			json.paid @paid
		end
		end
	end
end

